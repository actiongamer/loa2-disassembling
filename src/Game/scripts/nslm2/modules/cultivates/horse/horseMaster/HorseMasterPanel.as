package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorseMasterPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.horse.HorseConsts;
   import flash.geom.Point;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import morn.core.components.View;
   import nslm2.modules.cultivates.equipGrows.jinglians.ComponentFlickerEff;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import morn.core.utils.StringUtils;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.horse.vos.HorseSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.common.uiEffects.FlyTarget;
   import proto.PlayerSaddleHorseYanJiuOneKeyReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerSaddleHorseYanJiuOneKeyRes;
   import proto.PlayerSaddleHorseYanJiuReq;
   import proto.ProtocolStatusRes;
   import proto.PlayerSaddleHorseYanJiuRes;
   import nslm2.modules.foundations.AlertUtil;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DDragCtrl;
   import nslm2.common.ctrls.TSM;
   
   public class HorseMasterPanel extends HorseMasterPanelUI implements IRoleSubPanel, IViewStackPage
   {
       
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3DS2;
      
      private var tsms:TSMDict;
      
      private var _progressBarFlickerEff:ComponentFlickerEff;
      
      private var _tianfuPanel:nslm2.modules.cultivates.horse.horseMaster.HorseTianfuPanel;
      
      private var curShowHorseId:int;
      
      private var btnEff:BmcSpriteSheet;
      
      public function HorseMasterPanel()
      {
         avatar = new UIUnit3DS2();
         tsms = new TSMDict();
         super();
         var _loc1_:String = StcMgr.ins.getHorsejingtongVo(1).singlecost;
         this.renderHad.wealthVo = WealthUtil.countVo(20,WealthVo.parseCostStr(_loc1_).sid);
         DisplayUtils.addChildFromGlobal(this.btn_levelUp,this.renderCost);
         this.parts.push(new ProgressBarCtrl(this.progressBar));
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.lvNextRef.txt_lv.style = "普通绿色";
         BmcSpriteSheet.preload(new <int>[5002]);
         this.skillRender_cur.needShowValidBg = true;
         this.avatar.buttonMode = true;
         this.parts.push(new Avatar3DDragCtrl(this.avatar));
         _progressBarFlickerEff = new ComponentFlickerEff(this.progressBar);
         this.parts.push(new ComponentFlickerEff(this.progressBar));
         tsms.put(box_levelUp,new TSM(box_levelUp,0.3).copyState(1,0).addState(2,{
            "alpha":0,
            "y":150
         }));
         tsms.put(box_shengjie,new TSM(box_shengjie,0.3).addState(1,{
            "alpha":0,
            "y":150
         }).addState(2,{
            "alpha":1,
            "y":19
         }));
         tsms.put(renderHad,new TSM(renderHad,0.3).copyState(1,0).addState(2,{"x":445}));
         this.btn_tianfu.addEventListener("click",btn_skill_handler);
      }
      
      public function get lvBottomRef() : HorseMasterLvLabel
      {
         return this.lvBottom as HorseMasterLvLabel;
      }
      
      public function get lvCurRef() : HorseMasterLvLabel
      {
         return this.lvCur as HorseMasterLvLabel;
      }
      
      public function get lvNextRef() : HorseMasterLvLabel
      {
         return this.lvNext as HorseMasterLvLabel;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.avatar.pos2d = HorseConsts.AVATAR3D_POS.add(new Point(52));
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         if(avatar)
         {
            this.avatar.pos2d = HorseConsts.AVATAR3D_POS.add(new Point(800,0));
         }
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
      }
      
      public function get subBarRef() : View
      {
         return null;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
         panel3D = param1;
         this.panel3D.addChild3D(avatar);
      }
      
      private function btn_skill_handler(param1:Event) : void
      {
         param1.stopPropagation();
         if(_tianfuPanel)
         {
            disposeTianfuPanel();
         }
         else
         {
            _tianfuPanel = new nslm2.modules.cultivates.horse.horseMaster.HorseTianfuPanel();
            _tianfuPanel.show();
            _tianfuPanel.x = 343;
            _tianfuPanel.y = 96;
            _tianfuPanel.addEventListener("close",disposeTianfuPanel);
            _tianfuPanel.panelFadeIn();
            parent.parent.addChild(_tianfuPanel);
         }
      }
      
      private function disposeTianfuPanel(... rest) : void
      {
         if(_tianfuPanel)
         {
            _tianfuPanel.removeEventListener("close",disposeTianfuPanel);
            _tianfuPanel.panelFadeOutAndDispose();
            _tianfuPanel = null;
         }
      }
      
      private function showInfo(param1:int) : void
      {
         var _loc2_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         if(curShowHorseId != param1)
         {
            PlayerModel.ins.changePlayerViewByPlayerInfo(this.avatar,PlayerModel.ins.playerInfo);
            this.avatar.initHorseModel(int(_loc2_.model));
            this.avatar.pos2d = HorseConsts.AVATAR3D_POS.add(new Point(52));
            this.avatar.rotation = -145;
            curShowHorseId = param1;
         }
         var _loc3_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         this.progressBar.value = HorseService.ins.masterExp / _loc3_.exp;
         refresh();
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc11_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = 0;
         var _loc10_:* = null;
         var _loc8_:String = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel).singlecost;
         this.renderCost.wealthVo = WealthVo.parseCostStr(_loc8_);
         var _loc12_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         this.txt_progressValue.text = HorseService.ins.masterExp + "/" + _loc12_.exp;
         if(param1 == false)
         {
            this.lvCurRef.show(_loc12_.id,false);
            this.txt_levelName.text = HorseUtil.getLevelName(HorseService.ins.masterLevel);
         }
         this.lvBottomRef.show(_loc12_.id,false);
         if(StringUtils.isNull(_loc12_.prop))
         {
            this.listPropCur.array = NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List);
         }
         else if(param1)
         {
            _loc2_ = NpcPropVo.parseArrStr(_loc12_.prop,"",DisplayUtils.globarCenter(this).add(new Point(0,-50)));
            NpcPropVo.unshowAllPropColor(_loc2_);
            this.listPropCur.array = _loc2_;
         }
         else
         {
            _loc2_ = NpcPropVo.parseArrStr(_loc12_.prop);
            NpcPropVo.unshowAllPropColor(_loc2_);
            this.listPropCur.array = _loc2_;
         }
         var _loc5_:StcSkillVo = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[HorseService.ins.curAuraId,HorseUtil.getRank(HorseService.ins.masterLevel)]);
         if(_loc5_)
         {
            this.skillRender_cur.dataSource = _loc5_.id;
         }
         else
         {
            this.skillRender_cur.dataSource = 0;
            this.skillRender_cur.toolTip = LocaleMgr.ins.getStr(30300024);
         }
         var _loc9_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel + 1);
         if(_loc9_)
         {
            this.lvNextRef.show(_loc9_.id,false);
            this.listPropNext.array = NpcPropVo.parseArrStr(_loc9_.prop);
            this.skillRender_next.dataSource = new HorseSkillVo(_loc9_.id,HorseService.ins.curAuraId);
            this.skillRender_next.visible = true;
            this.box_nextLv.visible = true;
            this.renderHad.visible = true;
            this.box_subBar.visible = true;
            _loc7_ = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",HorseUtil.getRank(HorseService.ins.masterLevel) + 1);
            if(_loc12_.skilltype == 2)
            {
               tsms.toState(2);
               _loc3_ = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",_loc12_.rank);
               this.renderCost_shengjie.wealthVo = WealthVo.parseCostStr(_loc3_.cost);
               _loc11_ = LocaleMgr.ins.getStr(_loc7_.talentdesc).split("+");
               _loc6_ = _loc7_.talent.split(":")[0];
               _loc4_ = uint(NpcPropVo.getValueColorByPropId(_loc6_));
               _loc10_ = _loc11_[0] + TextFieldUtil.htmlText2("+" + _loc11_[1],_loc4_);
               this.txt_desc2.text = "[" + LocaleMgr.ins.getStr(_loc7_.talentname) + "] " + _loc10_;
               this.box_nextRank.visible = false;
            }
            else
            {
               tsms.toState(1);
               this.box_nextRank.visible = true;
            }
            if(_loc7_)
            {
               _loc11_ = LocaleMgr.ins.getStr(_loc7_.talentdesc).split("+");
               _loc6_ = _loc7_.talent.split(":")[0];
               _loc4_ = uint(NpcPropVo.getValueColorByPropId(_loc6_));
               _loc10_ = _loc11_[0] + TextFieldUtil.htmlText2("+" + _loc11_[1],_loc4_);
               this.txt_desc.text = "[" + LocaleMgr.ins.getStr(_loc7_.talentname) + "] " + _loc10_;
            }
            else
            {
               this.box_nextRank.visible = true;
            }
         }
         else
         {
            this.listPropNext.array = [];
            this.skillRender_next.visible = false;
            this.box_nextLv.visible = false;
            this.renderHad.visible = false;
            this.box_subBar.visible = false;
            this.box_nextRank.visible = false;
         }
         if(HorseService.ins.canShengjie())
         {
            switchBtnEffect(true);
         }
         else
         {
            switchBtnEffect(false);
         }
      }
      
      public function show(param1:Boolean = false) : void
      {
         panel3D.addChild3D(avatar);
         this.showInfo(!!HorseService.ins.curHorseId?HorseService.ins.curHorseId:int(HorseService.ins.firstId));
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_levelUp !== _loc3_)
         {
            if(btn_levelUpAll !== _loc3_)
            {
               if(btn_shengjie === _loc3_)
               {
                  doShengjie();
               }
            }
            else
            {
               doLevelUpOneKey();
            }
         }
         else if(EnvConfig.ins.showDevModule && param2.altKey)
         {
            doShengjie();
         }
         else
         {
            doLevelUpOne();
         }
      }
      
      private function doLevelUpOneKey() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(this.renderCost.wealthVo.count > this.renderHad.wealthVo.showCount)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this.renderCost.wealthVo),ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            IconFlyEff.createFlyTo(this.renderCost.img_icon,new FlyTarget(this.progressBar,new Point(progressBar.width / 2))).set_scaleTo().addHandlers(server_levelUpOneKey).exec();
         }
      }
      
      private function server_levelUpOneKey() : void
      {
         var _loc1_:PlayerSaddleHorseYanJiuOneKeyReq = new PlayerSaddleHorseYanJiuOneKeyReq();
         ServerEngine.ins.send(7087,_loc1_,server_levelUpOneKeyCpl);
      }
      
      private function server_levelUpOneKeyCpl(param1:PlayerSaddleHorseYanJiuOneKeyRes) : void
      {
         showLevelUpEffect(param1.exp,param1.star,param1.addexp,true);
      }
      
      private function doLevelUpOne() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(this.renderCost.wealthVo.count > this.renderHad.wealthVo.showCount)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this.renderCost.wealthVo),ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            IconFlyEff.createFlyTo(this.renderCost.img_icon,new FlyTarget(this.progressBar,new Point(progressBar.width / 2))).set_scaleTo().addHandlers(server_levelUpOne).exec();
         }
      }
      
      private function server_levelUpOne() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:PlayerSaddleHorseYanJiuReq = new PlayerSaddleHorseYanJiuReq();
         ServerEngine.ins.send(7085,_loc1_,onServerCpl_reserchOne,onServerCpl_reserchOneErr);
      }
      
      private function onServerCpl_reserchOneErr(param1:ProtocolStatusRes) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function onServerCpl_reserchOne(param1:PlayerSaddleHorseYanJiuRes) : void
      {
         showLevelUpEffect(param1.exp,param1.star,param1.addexp);
      }
      
      private function showLevelUpEffect(param1:int, param2:int, param3:int, param4:Boolean = false) : void
      {
         if(this.isDisposed)
         {
            HorseService.ins.masterExp = param1;
            HorseService.ins.masterLevel = param2;
            return;
         }
         var _loc5_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(3011) + "+" + param3,new TextFormat(Styles.fontName,24,458496)),DisplayUtils.globarCenter(this.progressBar),-150,null,null,21);
         HorseService.ins.masterExp = param1;
         if(param2 > HorseService.ins.masterLevel)
         {
            HorseService.ins.masterLevel = param2;
            if(param4)
            {
               this.mouseEvent = false;
               TweenLite.to(this.progressBar,0.5,{
                  "value":1,
                  "onComplete":levelUpOneKeyCpl,
                  "onCompleteParams":[true]
               });
            }
            else
            {
               this.progressBar.value = HorseService.ins.masterExp / _loc5_.exp;
               AlertUtil.float(LocaleMgr.ins.getStr(30300025,[HorseUtil.getLevelName(param2)]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,okFloatCpl,DisplayUtils.globarCenter(this.lvCurRef.txt_lv),1);
               playUpEff();
               this.refresh(true);
            }
         }
         else if(param4)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this.renderCost.wealthVo),ModuleMgr.ins.popLayer.curModuleId);
            TweenLite.to(this.progressBar,0.5,{
               "value":param1 / _loc5_.exp,
               "onComplete":levelUpOneKeyCpl,
               "onCompleteParams":[false]
            });
         }
         else
         {
            this.progressBar.value = HorseService.ins.masterExp / _loc5_.exp;
            this.refresh();
         }
         HorseService.ins.checkWhenChange();
      }
      
      private function levelUpOneKeyCpl(param1:Boolean) : void
      {
         if(isDisposed)
         {
            return;
         }
         _progressBarFlickerEff.showLight();
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         this.progressBar.value = HorseService.ins.masterExp / _loc2_.exp;
         this.mouseEvent = true;
         if(param1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30300025,[HorseUtil.getLevelName(HorseService.ins.masterLevel)]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,okFloatCpl,DisplayUtils.globarCenter(this.lvCurRef.txt_lv),1);
            playUpEff();
         }
         this.refresh(param1);
      }
      
      private function server_shengjieCpl(param1:PlayerSaddleHorseYanJiuRes) : void
      {
         if(this.isDisposed)
         {
            HorseService.ins.masterExp = param1.exp;
            HorseService.ins.masterLevel = param1.star;
            return;
         }
         this.mouseEvent = false;
         HorseService.ins.masterExp = param1.exp;
         HorseService.ins.masterLevel = param1.star;
         playUpEff();
         AlertUtil.float(LocaleMgr.ins.getStr(30300025,[HorseUtil.getLevelName(param1.star)]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,okFloatCpl,DisplayUtils.globarCenter(this.lvCurRef.txt_lv),1);
         this.refresh(true);
         HorseService.ins.checkWhenChange();
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         this.progressBar.value = HorseService.ins.masterExp / _loc2_.exp;
         TimerManager.ins.doOnce(1000,openShengjieCplModule);
      }
      
      private function openShengjieCplModule() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.mouseEvent = true;
         ModuleMgr.ins.showModule(30330,HorseUtil.getRank(HorseService.ins.masterLevel),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function doShengjie() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(HorseService.ins.masterLevel);
         var _loc1_:StcHorseupgradeVo = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",_loc2_.rank);
         if(PlayerModel.ins.level < _loc1_.playerlevel)
         {
            AlertUtil.lackLevel(_loc1_.playerlevel);
         }
         else if(this.renderCost_shengjie.wealthVo.count > this.renderHad.wealthVo.showCount)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this.renderCost_shengjie.wealthVo),ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            IconFlyEff.createFlyTo(this.renderCost.img_icon,new FlyTarget(this,new Point(this.width / 2,this.height / 2))).set_scaleTo().addHandlers(server_shengjieOne).exec();
         }
      }
      
      private function server_shengjieOne() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:PlayerSaddleHorseYanJiuReq = new PlayerSaddleHorseYanJiuReq();
         ServerEngine.ins.send(7085,_loc1_,server_shengjieCpl);
      }
      
      private function okFloatCpl() : void
      {
         this.lvCurRef.show(HorseService.ins.masterLevel,true);
         this.txt_levelName.text = HorseUtil.getLevelName(HorseService.ins.masterLevel);
      }
      
      private function playUpEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(5002);
         _loc1_.x = 157;
         _loc1_.y = 16;
         addChild(_loc1_);
         this.avatar.horseAvatar.action = "ride_3";
      }
      
      private function switchBtnEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(btnEff == null)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.x = -9;
               btnEff.y = -10;
               btnEff.init(115002,1,"all",true);
               this.btn_shengjie.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.server_levelUpOne);
         ObserverMgr.ins.sendNotice("MSG_HORSE_MASTER_MODULE_CLOSE");
         super.dispose();
      }
   }
}
