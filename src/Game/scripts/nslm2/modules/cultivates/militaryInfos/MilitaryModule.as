package nslm2.modules.cultivates.militaryInfos
{
   import game.ui.militaryRankInfos.MilitaryModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.common.compsEffects.ListHChangeOneEffect;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.mgrs.stcMgrs.vos.StcTitleVo;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.ActiveTitleReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.WearTitleReq;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.WearTitleRes;
   import proto.TitleContentInfo;
   import nslm2.utils.Uint64Util;
   import proto.ActiveTitleRes;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.HeroModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.playerTitles.vo.PlayerTitleListVo;
   import morn.core.components.List;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import game.ui.roleInfos.NpcPropVo;
   import flash.geom.Point;
   import game.ui.roleInfos.NpcProp2Vo;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import proto.TitlePanelRes;
   import morn.core.events.UIEvent;
   import proto.HeroInfo;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import flash.events.Event;
   import away3d.events.MouseEvent3D;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   import game.ui.militaryRankInfos.render.MilitaryRenderUI;
   import morn.core.components.Component;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.components.Image;
   import nslm2.modules.cultivates.militaryInfos.render.MilitaryRender;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.common.uiEffects.FlyTarget;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   
   public class MilitaryModule extends MilitaryModuleUI implements INewerGuideCheckHandler
   {
       
      
      private var _listChangeEffect:ListHChangeOneEffect;
      
      private var _listCtrl:ListPageBarCtrl;
      
      private var _lvlUpEff:BmcSpriteSheet;
      
      private var _btnEff:BmcS1;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var curVo:StcTitleVo;
      
      private var prevVo:StcTitleVo;
      
      private var subArr:Array;
      
      private var titleInfoArr:Array;
      
      private var status:int;
      
      private const CAN_ACTIVE:int = 1;
      
      private const CAN_WEAR:int = 2;
      
      private const HAVE_WEAR:int = 3;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      private var eff:BmcSpriteSheet;
      
      public function MilitaryModule()
      {
         subArr = [];
         super();
         _listChangeEffect = new ListHChangeOneEffect(this.list_icons);
         this.parts.push(new ListHChangeOneEffect(this.list_icons));
         this.parts.push(new BtnLongBarCtrl(this.btn_leftArrow,img_leftBg));
         this.parts.push(new BtnLongBarCtrl(this.btn_rightArrow,img_rightBg));
         _listCtrl = new ListPageBarCtrl(this.list_icons,null,this.btn_leftArrow,this.btn_rightArrow,null,null);
         this.parts.push(new ListPageBarCtrl(this.list_icons,null,this.btn_leftArrow,this.btn_rightArrow,null,null));
         this.list_icons.renderHandler = validate;
         DisplayUtils.addChildBelow(this.img_bg,this.panelBg.img_rim);
         this.img_bg.x = this.img_bg.x + this.box_military.x;
         this.img_bg.y = this.img_bg.y + this.box_military.y;
         var _loc1_:Array = [LocaleMgr.ins.getStr(9000000 + 30400)];
         if(FuncOpenAutoCtrl.checkOpen(30900))
         {
            _loc1_.push(LocaleMgr.ins.getStr(9000000 + 30900));
         }
         this.tabBar.labels = _loc1_.join(",");
         this.tabBar.selectHandler = tabHandler;
         this.img_curTitle.mouseEvent = false;
         acc_title.addEventListener("accordion_change_sub_selected_data",selectTitleHandler);
         this.box_military.visible = false;
         this.box_title.visible = false;
         img_funBg.visible = false;
         this.box_fightValue.visible = false;
         this.img_fightBg.visible = false;
         switchEventListeners(true);
      }
      
      private function tabHandler() : void
      {
         if(tabBar.selectedIndex == 0)
         {
            this.box_military.visible = true;
            this.img_bg.visible = true;
            this.box_title.visible = false;
            this.panel3D.visible = false;
            if(this.eff)
            {
               this.eff.visible = false;
            }
         }
         else
         {
            this.box_military.visible = false;
            this.img_bg.visible = false;
            this.box_title.visible = true;
            this.panel3D.visible = true;
            if(this.eff)
            {
               this.eff.visible = true;
            }
         }
      }
      
      private function get model() : MilitaryModel
      {
         return MilitaryModel.ins;
      }
      
      private function get service() : MilitaryService
      {
         return MilitaryService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.getMilitaryInfo();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         var _loc2_:Array = StcMgr.ins.getMilitaryrankTable().array.sortOn("seq",16);
         this.list_icons.dataSource = _loc2_;
         refresh(false);
         initListPos();
         this.validate();
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         this.btn_active.clickHandler = activeHandler;
         var _loc3_:* = UrlLib.getPlayerTitleFuncImg("img_bg");
         img_funBg.skin = _loc3_;
         new GetResTask(1,_loc3_).addCompleteHandler(bgLoaded).exec();
      }
      
      private function activeHandler() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(status == 1)
         {
            _loc2_ = new ActiveTitleReq();
            _loc2_.id = this.curVo.id;
            ServerEngine.ins.send(6701,_loc2_,titleAddCpl,titleAddErr);
         }
         else if(status == 2)
         {
            this.prevVo = this.curVo;
            _loc1_ = new WearTitleReq();
            _loc1_.showTitleId = this.curVo.id;
            ServerEngine.ins.send(6704,_loc1_,titleWearCpl);
         }
         else
         {
            ServerEngine.ins.send(6705,_loc1_,titleWearOutCpl());
         }
      }
      
      private function titleWearOutCpl() : void
      {
         (this.box_fightValue as FightValueBox).tweenValue = 0;
         this.avatar.tag3DVBox.showTitle(0);
         this.btn_active.label = LocaleMgr.ins.getStr(30400206);
         status = 2;
      }
      
      private function titleWearCpl(param1:WearTitleRes) : void
      {
         this.avatar.tag3DVBox.showTitle(this.curVo.id);
         this.btn_active.label = LocaleMgr.ins.getStr(30400210);
         status = 3;
         var _loc4_:int = 0;
         var _loc3_:* = titleInfoArr;
         for each(var _loc2_ in titleInfoArr)
         {
            if(_loc2_.id == this.curVo.id)
            {
               (this.box_fightValue as FightValueBox).tweenValue = Uint64Util.toNumber(_loc2_.fightProp);
            }
         }
      }
      
      private function titleAddCpl(param1:ActiveTitleRes) : void
      {
         titleInfoArr = param1.title;
         refreshTimeAndBtn();
      }
      
      private function titleAddErr(param1:ProtocolStatusRes) : void
      {
         AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000073),16723968));
      }
      
      private function bgLoaded() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc5_:int = 0;
         this.panelBg.bgCustom.addChild(this.img_funBg);
         img_funBg.x = img_funBg.x + 15;
         img_funBg.y = img_funBg.y + 60;
         img_grid.mouseEnabled = false;
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         this.createAvatar3D(HeroModel.ins.playerHero);
         var _loc3_:Array = [];
         var _loc4_:int = StcMgr.ins.getTitleTable().array.length;
         while(_loc5_ < 50)
         {
            _loc1_ = StcMgr.ins.getVoArrByMultiColumnValue("static_title",["titilekind","platform"],[_loc5_ + 1,0.toString()]);
            if(EnvConfig.ins.ptId > 0)
            {
               _loc1_ = _loc1_.concat(StcMgr.ins.getVoArrByMultiColumnValue("static_title",["titilekind","platform"],[_loc5_ + 1,EnvConfig.ins.ptId.toString()]));
            }
            if(_loc1_.length > 0)
            {
               _loc2_ = new PlayerTitleListVo();
               _loc2_.id = _loc5_;
               _loc2_.kind = _loc5_ + 1;
               subArr.push(_loc1_);
               _loc3_.push(_loc2_);
            }
            _loc5_++;
         }
         this.acc_title.repeatY = _loc3_.length;
         this.acc_title.dataSource = _loc3_;
         this.acc_title.subArray = subArr;
         acc_title.selectHandler = changeSelectedTitle;
         acc_title.selectedIndex = 0;
         (acc_title.subCells[0] as List).selectedIndex = 0;
         this.curVo = subArr[0][0];
         this.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         tabBar.selectedIndex = 0;
         tabHandler();
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function refresh(param1:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         var _loc4_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank));
         var _loc3_:Array = model.getAddPropAll(PlayerModel.ins.playerInfo.militaryrank);
         if(param1)
         {
            _loc6_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc5_ = _loc3_[_loc7_];
               _loc5_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50 + 30));
               _loc7_++;
            }
         }
         this.list_militaryProp.dataSource = NpcProp2Vo.parseTwoPropArr(_loc3_,[]);
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
      }
      
      private function initListPos() : void
      {
         var _loc1_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank));
         if(_loc2_)
         {
            _listCtrl.goToSelectIndex(_loc2_.seq - 1);
         }
         else
         {
            _listCtrl.goToSelectIndex(_loc1_.seq - 1);
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            service.addEventListener("evtUpgradeCpl",onUpgradeCpl);
            service.addEventListener("evtGetInfoCpl",onGetInfoCpl);
         }
         else
         {
            service.removeEventListener("evtUpgradeCpl",onUpgradeCpl);
            service.removeEventListener("evtGetInfoCpl",onGetInfoCpl);
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("evtMilitaryRollIn" !== _loc4_)
         {
            if("evtMilitaryRollOut" === _loc4_)
            {
               this.list_militaryProp.dataSource = NpcProp2Vo.parseTwoPropArr(model.getAddPropAll(PlayerModel.ins.playerInfo.militaryrank),[]);
            }
         }
         else
         {
            _loc3_ = param2 as StcMilitaryrankVo;
            if(_loc3_.kind == 2)
            {
               return;
            }
            this.list_militaryProp.dataSource = NpcProp2Vo.parseTwoPropArr(model.getAddPropAll(PlayerModel.ins.playerInfo.militaryrank),model.getAddPropSingle(_loc3_.id));
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["evtMilitaryRollIn","evtMilitaryRollOut"]);
      }
      
      private function validate() : void
      {
         this.btn_leftArrow.visible = this.list_icons.page > 0;
         this.btn_rightArrow.visible = this.list_icons.page < this.list_icons.totalPage - 1;
      }
      
      private function onGetInfoCpl(param1:MzEvent) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(30900))
         {
            ServerEngine.ins.send(6702,null,infoCpl);
         }
         else
         {
            this.moduleServerCpl();
         }
      }
      
      private function infoCpl(param1:TitlePanelRes) : void
      {
         if(param1)
         {
            titleInfoArr = param1.title;
         }
         this.moduleServerCpl();
      }
      
      private function changeSelectedTitle() : void
      {
         var _loc1_:int = acc_title.selectedIndex;
         (acc_title.subCells[acc_title.selectedIndex] as List).selectedIndex = 0;
         this.prevVo = this.curVo;
         this.curVo = subArr[acc_title.selectedIndex][0];
         refreshPanel();
      }
      
      private function selectTitleHandler(param1:UIEvent) : void
      {
         this.prevVo = this.curVo;
         this.curVo = param1.data as StcTitleVo;
         refreshPanel();
      }
      
      private function refreshPanel() : void
      {
         if(this.curVo && this.curVo == this.prevVo)
         {
            return;
         }
         this.label_desc.text = LocaleMgr.ins.getStr(curVo.describe);
         if(curVo.activeId)
         {
            this.label_needitem.text = LocaleMgr.ins.getStr(30400205,[curVo.activeId]);
            this.label_needitem.visible = true;
         }
         else
         {
            this.label_needitem.visible = false;
         }
         if(curVo.activeId > 0)
         {
            this.label_needLvl.text = LocaleMgr.ins.getStr(30400204,[StcMgr.ins.getItemVo(curVo.activeId).need_level]);
         }
         else
         {
            this.label_needLvl.text = "";
         }
         this.list_prop.dataSource = NpcPropVo.parseArrStr(curVo.attribute,"+");
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
         if(this.curVo.isEffect > 0)
         {
            this.eff = new BmcSpriteSheet();
            eff.setAnchor(0.5,0.5);
            eff.init(this.curVo.titileicon,1,"all",true);
            this.addChild(eff);
            eff.x = 678;
            eff.y = 113;
            if(tabBar.selectedIndex != 1)
            {
               this.eff.visible = false;
            }
            this.addChild(eff);
            this.img_curTitle.visible = false;
         }
         else
         {
            this.img_curTitle.skin = UrlLib.getPlayerTitleImg(this.curVo.titileicon);
            this.img_curTitle.visible = true;
         }
         refreshTimeAndBtn();
      }
      
      private function createAvatar3D(param1:HeroInfo) : void
      {
         if(this.avatar)
         {
            this.avatar.visible = true;
            this.avatar.initByStcNpcId(param1.baseInfo.baseId,false,param1.baseInfo.skin);
            this.avatar.pos2d = new Point(-100,-130);
            this.avatar.rotation = -90;
            avatar.avatar.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
            if(PlayerModel.ins.playerInfo.showTitleId > 0)
            {
               avatar.tag3DVBox.showTitle(PlayerModel.ins.playerInfo.showTitleId);
            }
         }
      }
      
      private function refreshTimeAndBtn() : void
      {
         if(PlayerModel.ins.playerInfo.showTitleId == 0)
         {
            (this.box_fightValue as FightValueBox).tweenValue = 0;
         }
         if(titleInfoArr && titleInfoArr.length > 0)
         {
            var _loc3_:int = 0;
            var _loc2_:* = titleInfoArr;
            for each(var _loc1_ in titleInfoArr)
            {
               if(_loc1_.id == PlayerModel.ins.playerInfo.showTitleId && _loc1_.hasFightProp)
               {
                  (this.box_fightValue as FightValueBox).tweenValue = Uint64Util.toNumber(_loc1_.fightProp);
               }
               if(_loc1_.id == this.curVo.id)
               {
                  if(_loc1_.id == PlayerModel.ins.playerInfo.showTitleId)
                  {
                     this.btn_active.label = LocaleMgr.ins.getStr(30400210);
                     status = 3;
                  }
                  else
                  {
                     this.btn_active.label = LocaleMgr.ins.getStr(30400206);
                     status = 2;
                  }
                  if(textCdCtrl)
                  {
                     textCdCtrl.stop();
                     textCdCtrl = null;
                  }
                  if(Uint64Util.toInt(_loc1_.endTm) > 0)
                  {
                     textCdCtrl = new TextCDCtrlS2(this.label_availperiod,textCDFormat,txtCDCtrl_cpl);
                     textCdCtrl.start(Uint64Util.toUint(_loc1_.endTm));
                  }
                  else
                  {
                     this.label_availperiod.text = LocaleMgr.ins.getStr(30400211);
                  }
                  break;
               }
               this.btn_active.label = LocaleMgr.ins.getStr(30300013);
               status = 1;
               if(textCdCtrl)
               {
                  textCdCtrl.stop();
                  textCdCtrl = null;
               }
               if(this.curVo.validity == 0)
               {
                  this.label_availperiod.text = LocaleMgr.ins.getStr(30400211);
               }
               else
               {
                  this.label_availperiod.text = LocaleMgr.ins.getStr(30400208,[this.curVo.validity]);
               }
            }
         }
         else
         {
            this.btn_active.label = LocaleMgr.ins.getStr(30300013);
            status = 1;
            if(this.curVo.validity == 0)
            {
               this.label_availperiod.text = LocaleMgr.ins.getStr(30400211);
            }
            else
            {
               this.label_availperiod.text = LocaleMgr.ins.getStr(30400208,[this.curVo.validity]);
            }
         }
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.label_availperiod.text = LocaleMgr.ins.getStr(30400208,[this.curVo.validity]);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(30400208).split("@")[0] + TextFieldUtil.htmlText2(TimeUtils.oneCN(param1),LabelUtils.cdColor(true));
      }
      
      protected function avatarAsset_onCpl(param1:Event) : void
      {
         avatar.avatar.removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         this.avatar.dispatchEvent(new MouseEvent3D("unitMouseClick"));
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.panel3D.dispose();
         this.panel3D = null;
         super.preClose(param1);
      }
      
      private function onUpgradeCpl(param1:MzEvent) : void
      {
         this.mouseEvent = false;
         playUpEff(1);
      }
      
      private function playUpEff(param1:int = 1) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Point = getEffectPos();
         switch(int(param1) - 1)
         {
            case 0:
               _lvlUpEff = new BmcSpriteSheet();
               _lvlUpEff.setAnchor(0.5,0.5);
               _lvlUpEff.init(30300001);
               addChild(_lvlUpEff);
               _lvlUpEff.x = _loc4_.x + 54;
               _lvlUpEff.y = _loc4_.y + 148;
               TweenLite.to(_lvlUpEff,0.3,{
                  "onComplete":this.playUpEff,
                  "onCompleteParams":[2]
               });
               break;
            case 1:
               _lvlUpEff = new BmcSpriteSheet();
               _lvlUpEff.setAnchor(0.5,0.5);
               _lvlUpEff.set_endHandler(new Handler(playUpEff,[3]));
               _lvlUpEff.init(30300002);
               addChild(_lvlUpEff);
               _lvlUpEff.x = _loc4_.x + 54;
               _lvlUpEff.y = _loc4_.y + 148 - 50;
               TweenLite.to(_lvlUpEff,0.3,{
                  "y":_loc4_.y + 62,
                  "x":_loc4_.x + 56
               });
               break;
            case 2:
               _lvlUpEff = new BmcSpriteSheet();
               _lvlUpEff.setAnchor(0.5,0.5);
               _lvlUpEff.set_endHandler(playUpEffCpl);
               _lvlUpEff.init(30300003);
               addChild(_lvlUpEff);
               _lvlUpEff.x = _loc4_.x + 56;
               _lvlUpEff.y = _loc4_.y + 62;
               _loc2_ = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
               _loc3_ = this.list_icons.getCell(_loc2_.seq - 1) as MilitaryRenderUI;
               _loc3_.box_icon.filters = null;
         }
      }
      
      private function getEffectPos() : Point
      {
         var _loc1_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         var _loc2_:Component = this.list_icons.getCell(_loc1_.seq - 1);
         return new Point(_loc2_.x + _loc2_.width / 2,_loc2_.y + _loc2_.height / 2);
      }
      
      private function playUpEffCpl() : void
      {
         var _loc1_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         if(!(int(_loc1_.kind) - 2))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30400000,[LocaleMgr.ins.getStr(6000 + int(_loc1_.prop))]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1);
            ObserverMgr.ins.sendNotice("evtChangePlayerNameColor");
         }
         AlertUtil.float(LocaleMgr.ins.getStr(30300028),DisplayUtils.globarCenter(this).add(new Point(0,-50 - 60)),-1);
         AlertUtil.float(LocaleMgr.ins.getStr(30400004,[LocaleMgr.ins.getStr(StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank).name)]),DisplayUtils.globarCenter(this).add(new Point(0,-50 - 30)),-1);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30400,model.canUpgrade(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank))));
         doIconFlyToHeader();
         refresh(true);
         TimerManager.ins.doOnce(600,listSlide);
      }
      
      private function doIconFlyToHeader() : void
      {
         var _loc1_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         var _loc2_:Image = new Image((this.list_icons.getCell(_loc1_.seq - 1) as MilitaryRender).img_icon.url);
         _loc2_.scale = 0.5;
         new IconFlyEff(_loc2_,this.list_icons.getCell(_loc1_.seq - 1),new FlyTarget(GlobalRef.playerHeader_icon_military,new Point())).addCompleteHandler(iconFlyCpl).exec();
      }
      
      private function iconFlyCpl() : void
      {
         ObserverMgr.ins.sendNotice("evtPlayerHeaderRefresh");
      }
      
      private function listSlide() : void
      {
         var _loc3_:* = null;
         var _loc1_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank));
         if((_loc1_.seq - 1) % 5 == 4 && _loc2_)
         {
            this.list_icons.page = Math.floor((_loc2_.seq - 1) / 5);
            _listChangeEffect.preChange();
            _listChangeEffect.afterChange(1);
         }
         else
         {
            _loc3_ = StcMgr.ins.getMilitaryrankTable().array.sortOn("seq",16);
            this.list_icons.dataSource = _loc3_;
         }
         validate();
         this.mouseEvent = true;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.dispose();
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:* = null;
         switch(int(param1) - 10121)
         {
            case 0:
               _loc4_ = NGUtil.getCompById(this,param3.comp_id,param3) as MilitaryRender;
               if(_loc4_)
               {
                  if(_loc4_.txt_cond.visible)
                  {
                     return 1;
                  }
                  return 2;
               }
               return 0;
            default:
            default:
            default:
               return 1;
            case 4:
               if(GlobalRef.chapterModuleShowAgainVo == null)
               {
                  GlobalRef.chapterModuleShowAgainVo = new ChapterModuleInitVo(ChapterModel.ins.lastOpenChapterId,0,false);
               }
         }
      }
   }
}
