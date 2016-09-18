package nslm2.modules.funnies.playerTitles
{
   import game.ui.playerTitle.PlayerTitleModuleUI;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.mgrs.stcMgrs.vos.StcTitleVo;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.nets.sockets.ServerEngine;
   import proto.TitlePanelRes;
   import morn.core.components.List;
   import morn.core.events.UIEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.TitleContentInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import proto.ActiveTitleReq;
   import proto.WearTitleReq;
   import proto.WearTitleRes;
   import proto.ActiveTitleRes;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.HeroModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.playerTitles.vo.PlayerTitleListVo;
   import proto.HeroInfo;
   import flash.geom.Point;
   import flash.events.Event;
   import away3d.events.MouseEvent3D;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.debug3d.DebugBloomFilterBox;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   
   public class PlayerTitleModule extends PlayerTitleModuleUI
   {
       
      
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
      
      public function PlayerTitleModule()
      {
         subArr = [];
         super();
         this.img_curTitle.mouseEvent = false;
         acc_title.addEventListener("accordion_change_sub_selected_data",selectTitleHandler);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(6702,null,infoCpl);
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
         this.label_desc.text = LocaleMgr.ins.getStr(curVo.describe);
         this.label_needitem.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000447),[curVo.activeId]);
         if(curVo.activeId > 0)
         {
            this.label_needLvl.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000448),[StcMgr.ins.getItemVo(curVo.activeId).need_level]);
         }
         else
         {
            this.label_needLvl.text = "";
         }
         this.list_prop.dataSource = NpcPropVo.parseArrStr(curVo.attribute,"+");
         this.label_propTitle.text = LocaleMgr.ins.getStr(this.curVo.titlename);
         if(this.curVo.isEffect > 0)
         {
            if(!eff)
            {
               this.eff = new BmcSpriteSheet();
               eff.setAnchor(0.5,0.5);
               eff.init(this.curVo.titileicon,1,"all",true);
               this.addChild(eff);
            }
            else
            {
               eff.dispose();
               eff = null;
               this.eff = new BmcSpriteSheet();
               eff.setAnchor(0.5,0.5);
               eff.init(this.curVo.titileicon,1,"all",true);
            }
            eff.x = 683;
            eff.y = 113;
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
      
      private function refreshTimeAndBtn() : void
      {
         if(titleInfoArr && titleInfoArr.length > 0)
         {
            var _loc3_:int = 0;
            var _loc2_:* = titleInfoArr;
            for each(var _loc1_ in titleInfoArr)
            {
               if(_loc1_.id == this.curVo.id)
               {
                  if(_loc1_.id == PlayerModel.ins.playerInfo.showTitleId)
                  {
                     this.btn_active.label = LocaleMgr.ins.getStr(30400207);
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
                  textCdCtrl = new TextCDCtrlS2(this.label_availperiod,textCDFormat,txtCDCtrl_cpl);
                  textCdCtrl.start(Uint64Util.toUint(_loc1_.endTm));
                  break;
               }
               this.btn_active.label = LocaleMgr.ins.getStr(30300013);
               status = 1;
               if(textCdCtrl)
               {
                  textCdCtrl.stop();
                  textCdCtrl = null;
               }
               if(this.curVo.validity)
               {
                  this.label_availperiod.text = LocaleMgr.ins.getStr(30400208,[this.curVo.validity]);
               }
               else
               {
                  this.label_availperiod.text = LocaleMgr.ins.getStr(30400211);
               }
            }
         }
         else
         {
            this.btn_active.label = LocaleMgr.ins.getStr(30300013);
            status = 1;
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
      
      override public function preShow(param1:Object = null) : void
      {
         this.btn_active.clickHandler = activeHandler;
         var _loc2_:* = UrlLib.getPlayerTitleFuncImg("img_bg");
         img_funBg.skin = _loc2_;
         new GetResTask(1,_loc2_).addCompleteHandler(bgLoaded).exec();
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
      }
      
      private function titleWearCpl(param1:WearTitleRes) : void
      {
         this.avatar.tag3DVBox.showTitle(this.curVo.id);
      }
      
      private function titleAddCpl(param1:ActiveTitleRes) : void
      {
         titleInfoArr = param1.title;
         refreshTimeAndBtn();
      }
      
      private function titleAddErr(param1:ProtocolStatusRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000449));
      }
      
      private function bgLoaded() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         this.panelBg.bgCustom.addChild(this.img_funBg);
         img_grid.mouseEnabled = false;
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         this.createAvatar3D(HeroModel.ins.playerHero);
         var _loc3_:Array = [];
         while(_loc4_ < StcMgr.ins.getTitleTable().array.length)
         {
            _loc1_ = StcMgr.ins.getVoArrByMultiColumnValue("static_title",["titilekind","platform"],[_loc4_ + 1,0]);
            if(EnvConfig.ins.ptId > 0)
            {
               _loc1_.concat(StcMgr.ins.getVoArrByMultiColumnValue("static_title",["titilekind","platform"],[_loc4_ + 1,EnvConfig.ins.ptId]));
            }
            if(_loc1_.length > 0)
            {
               _loc2_ = new PlayerTitleListVo();
               _loc2_.id = _loc4_;
               subArr.push(_loc1_);
               _loc3_.push(_loc2_);
            }
            _loc4_++;
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
         PlayerModel.ins.autoUpdateHeroInfo = true;
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         panel3D.visible = true;
         if(EnvConfig.ins.showDebugModule)
         {
            if(panel3D.useBloom)
            {
               _loc2_ = new DebugBloomFilterBox();
               _loc2_.bind(panel3D.bloomFilter);
               ModuleMgr.ins.debugBox.addChild(_loc2_);
            }
         }
         box_fightValue.visible = true;
         PlayerModel.ins.autoUpdateHeroInfo = false;
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
   }
}
