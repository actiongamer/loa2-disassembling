package nslm2.modules.cultivates.fashion
{
   import game.ui.fashionModules.FashionModuleUI;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import morn.core.components.ViewStack;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.events.UIEvent;
   import nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.mz.core.event.MzEvent;
   import morn.core.components.List;
   import flash.display.DisplayObject;
   import nslm2.modules.cultivates.fashion.interfaces.IAvatarPanel;
   import nslm2.modules.cultivates.fashion.vos.FashionInfoSubConfigVo;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   
   public class FashionModule extends FashionModuleUI
   {
      
      {
         if(RoleLevelUpUtil.chekHasNeedPromptLevelUpHero())
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30701,true));
         }
      }
      
      private var _avatar:UIUnit3D;
      
      private var _panel3D:UIPanel3D;
      
      private var _subView:ViewStack;
      
      private var _curSubIdArr:Array;
      
      public function FashionModule()
      {
         super();
      }
      
      private function get service() : FashionService
      {
         return FashionService.ins;
      }
      
      private function get model() : FashionModel
      {
         return FashionModel.ins;
      }
      
      public function get curSubIdArr() : Array
      {
         return _curSubIdArr;
      }
      
      public function set curSubIdArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(_curSubIdArr == null || ArrayUtil.equal(_curSubIdArr,param1) == false)
         {
            _curSubIdArr = param1;
            _loc4_ = _curSubIdArr.length;
            _loc2_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _curSubIdArr[_loc5_];
               _loc2_.push(FashionConsts.ins.getVo(_loc3_).nameCN);
               _loc5_++;
            }
            this.tabBar.labels = _loc2_.join(",");
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            accSelecter.addEventListener("accordion_change_sub_selected_data",selectItemHandler);
         }
         else
         {
            accSelecter.removeEventListener("accordion_change_sub_selected_data",selectItemHandler);
         }
      }
      
      private function selectItemHandler(param1:UIEvent) : void
      {
         FashionAccModel.ins.curFashionAccId = (param1.data as StcFashionSynVo).id;
         ObserverMgr.ins.sendNotice("refresh_acc");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc6_:int = 0;
         var _loc3_:DictHash = FashionAccModel.ins.getVoDict();
         this.box_acc.visible = false;
         var _loc2_:Array = _loc3_.keySet();
         this.accSelecter.repeatY = _loc2_.length;
         this.accSelecter.commitMeasure();
         this.accSelecter.dataSource = _loc3_.keySet();
         this.accSelecter.selectedIndex = 0;
         var _loc4_:int = _loc3_.keySet().length;
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push(_loc3_.getValue(_loc3_.keySet()[_loc6_]));
            _loc6_++;
         }
         this.accSelecter.subArray = _loc5_;
         changeType();
         RoleTeamModel.ins.blockFloatMsg = true;
         this.panelBg.bgCustom.addChild(this.img_bg);
         this._panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(_panel3D,this.img_bg);
         this._panel3D.initByImage(img_bg,this.panelBg);
         this._panel3D.visible = false;
         this._avatar = new UIUnit3D();
         this._panel3D.addChild3D(_avatar);
         this.createAvatar3D();
         this.panelBg.titleImgId = this.moduleId;
         _subView = new ViewStack();
         _subView.createSubViewCallBack = initSubView;
         _subView.subViewClasses = FashionConsts.PANEL_ARR;
         _subView.y = 110;
         this.addChild(_subView);
         this.tabBar.selectHandler = tabHandler;
         this.curSubIdArr = FashionConsts.showIdArr;
         FuncOpenAutoCtrl.checkFuncTabNew(FashionConsts.showIdArr,this.tabBar);
         refreshFashionAccRedPoint();
         refreshFashionAccMakeRedPoint();
         this.accSelecter.selectHandler = changeType;
         this.preShowCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["acc_make_cpl","MSG_SWITCH_MODULE_REN_POINT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" !== _loc4_)
         {
            if("acc_make_cpl" === _loc4_)
            {
               refreshFashionAccMakeRedPoint();
            }
         }
         else
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 31220)
            {
               refreshFashionAccRedPoint();
            }
         }
      }
      
      private function serviceHandler(param1:MzEvent) : void
      {
         var _loc2_:* = param1.type;
         if("evtFashionUsingChange" === _loc2_)
         {
            refreshFashionAccRedPoint();
         }
      }
      
      private function refreshFashionAccRedPoint() : void
      {
         if(FashionModel.ins.hasNewUnequipedFashionAcc())
         {
            this.img_redPoint.visible = true;
         }
         else
         {
            this.img_redPoint.visible = false;
         }
      }
      
      private function refreshFashionAccMakeRedPoint() : void
      {
         if(FashionModel.ins.hasNewAccCanSyn())
         {
            this.img_redPoint2.visible = true;
         }
         else
         {
            this.img_redPoint2.visible = false;
         }
      }
      
      private function changeType() : void
      {
         var _loc3_:int = this.accSelecter.selectedIndex;
         var _loc1_:DictHash = FashionAccModel.ins.getVoDict();
         var _loc2_:Array = _loc1_.getValue(_loc1_.keySet()[_loc3_]);
         (this.accSelecter.subSelection as List).selectedIndex = 0;
         FashionAccModel.ins.curFashionAccId = (_loc2_[0] as StcFashionSynVo).id;
         ObserverMgr.ins.sendNotice("refresh_acc");
      }
      
      private function initSubView(param1:DisplayObject) : void
      {
         if(param1 is IAvatarPanel)
         {
            (param1 as IAvatarPanel).avatar3D = _avatar;
         }
      }
      
      private function tabHandler(param1:int) : void
      {
         var _loc3_:int = curSubIdArr[param1];
         _subView.selectedIndex = FashionConsts.ID_ARR.indexOf(_loc3_);
         var _loc2_:FashionInfoSubConfigVo = FashionConsts.ins.getVo(_loc3_);
         if(this._avatar)
         {
            _avatar.visible = _loc2_.avatarVisible;
         }
         var _loc4_:* = _loc2_.showAccList;
         this.box_acc.visible = _loc4_;
         this.img_frame.visible = _loc4_;
         this.panelBg.img_tabLine.visible = !_loc2_.showAccList;
         this.img_bg.url = _loc2_.bgUrl;
         _panel3D.changeBgImg(this.img_bg.bitmapData);
      }
      
      private function createAvatar3D() : void
      {
         if(_avatar)
         {
            this._avatar.x = -119;
            this._avatar.y = -150;
            this._avatar.stcNpcId = HeroModel.ins.playerHero.baseInfo.baseId;
            PlayerModel.ins.changePlayerViewByPlayerInfo(this._avatar,PlayerModel.ins.playerInfo);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         this._panel3D.visible = true;
         super.show(param1);
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         this.tabBar.selectedIndex = 0;
         super.moduleFadeInTypeCpl();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("evtSkillUsingChange");
         if(this._panel3D)
         {
            this._panel3D.dispose();
            this._panel3D = null;
         }
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preClose(param1);
      }
   }
}
