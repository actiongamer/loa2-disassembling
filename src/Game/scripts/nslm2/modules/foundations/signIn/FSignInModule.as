package nslm2.modules.foundations.signIn
{
   import game.ui.signInModules.FSignInModuleUI;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSignInInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSigninRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcSigninExtraRewardVo;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import proto.SignInExtraRes;
   import com.mz.core.utils.ListUtil;
   import morn.core.components.List;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.SignInRes;
   import nslm2.common.model.PlayerModel;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.compsEffects.NumberBreathCtrl;
   import morn.core.handlers.Handler;
   
   public class FSignInModule extends FSignInModuleUI
   {
      
      public static const SIGN_IN_LIST_RENDER_FILTER_CHANGE:String = "signTextFilterChange";
      
      public static const SIGNIN:int = 9111500;
      
      public static const ICON_BEEN_CLICKED:String = "iconbeenclicked";
      
      public static const SIGNIN_BEEN_CLICKED:String = "signinbeenclicked";
      
      public static var hasFirstShowed:Boolean = true;
       
      
      private var signindays:Array;
      
      private var turn:int;
      
      private var reward:Array;
      
      private var order:int;
      
      private var signInStae:Boolean;
      
      private var canSignEffect:BmcSpriteSheet;
      
      private var buttonSignEffect:BmcSpriteSheet;
      
      private var extraOrder:int;
      
      private var currNumRewardId:int;
      
      public function FSignInModule()
      {
         super();
         this.btn_close.addEventListener("click",btnCloseHandler);
         this.parts.push(new NumberBreathCtrl(6,0).addHandler(new Handler(filterSignInChanged)));
         this.btn_signIn.label = LocaleMgr.ins.getStr(11500003);
         this.btn_collect.label = LocaleMgr.ins.getStr(11900045);
         this.addEventListener("iconbeenclicked",dealIconBeenClicked);
      }
      
      private function dealIconBeenClicked(param1:Event) : void
      {
         this.list_signIn.selectedIndex = -1;
         this.signInStae = true;
         this.btn_signIn.removeChild(buttonSignEffect);
         btn_signIn.visible = !this.signInStae;
         txtCollected.visible = this.signInStae;
         updateExtraOrder();
      }
      
      private function filterSignInChanged(param1:Number) : void
      {
         ObserverMgr.ins.sendNotice("signTextFilterChange",param1);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(6300,null,onGetSignInReq);
      }
      
      private function onGetSignInReq(param1:GetSignInInfoRes) : void
      {
         var _loc10_:int = 0;
         var _loc6_:* = null;
         var _loc9_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc5_:Array = new Array(SignInUtl);
         turn = param1.month;
         this.txtTitle.text = LocaleMgr.ins.getStr(999000605 + param1.month) + LocaleMgr.ins.getStr(999000593);
         reward = StcMgr.ins.getVoArrByColumnValue("static_signin_reward","month",turn);
         var _loc3_:int = Math.min(param1.days,reward.length);
         _loc10_ = 0;
         while(_loc10_ < _loc3_)
         {
            _loc6_ = reward[_loc10_] as StcSigninRewardVo;
            _loc9_ = false;
            _loc7_ = 0;
            while(_loc7_ < param1.ids.length)
            {
               if(_loc6_.ID == param1.ids[_loc7_])
               {
                  _loc9_ = true;
               }
               _loc7_++;
            }
            _loc8_ = false;
            _loc2_ = false;
            if(_loc6_.order == param1.nowOrder)
            {
               if(param1.signIn == false)
               {
                  _loc8_ = true;
                  _loc2_ = true;
               }
            }
            _loc5_[_loc6_.order - 1] = new SignInUtl(_loc6_.reward,_loc9_,_loc6_.viplimit,_loc8_,_loc2_,_loc6_.vipmulti,_loc6_.effect);
            _loc10_++;
         }
         this.order = param1.nowOrder;
         this.list_signIn.dataSource = _loc5_;
         if(param1.signIn == false)
         {
            this.list_signIn.selectedIndex = param1.nowOrder - 1;
            if(buttonSignEffect == null)
            {
               buttonSignEffect = new BmcSpriteSheet();
               buttonSignEffect.init(115002,1,"all",true);
            }
            buttonSignEffect.x = -9;
            buttonSignEffect.y = -9;
            this.btn_signIn.addChild(buttonSignEffect);
         }
         else
         {
            this.list_signIn.selectedIndex = -1;
         }
         this.signInStae = param1.signIn;
         this.extraOrder = param1.extraOrder;
         this.currNumRewardId = param1.turn;
         var _loc4_:StcSigninExtraRewardVo = StcMgr.ins.getVo("static_signin_extra_reward",param1.turn) as StcSigninExtraRewardVo;
         this.list_numSignIn.dataSource = WealthUtil.parseComboSignInAward(_loc4_.reward);
         txtSignCombo.text = param1.extraOrder.toString() + "/" + _loc4_.order.toString();
         btn_collect.disabled = !param1.extraReward;
         if(btn_collect.disabled == false)
         {
            if(canSignEffect == null)
            {
               canSignEffect = new BmcSpriteSheet();
               canSignEffect.init(115002,1,"all",true);
            }
            canSignEffect.x = -9;
            canSignEffect.y = -9;
            this.btn_collect.addChild(canSignEffect);
         }
         if(!param1.extraReward)
         {
            txtSignCombo.color = 16723968;
         }
         else
         {
            txtSignCombo.color = 458496;
         }
         btn_signIn.visible = !this.signInStae;
         txtCollected.visible = this.signInStae;
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         super.preShow(param1);
      }
      
      private function onClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_signIn !== _loc2_)
         {
            if(this.btn_collect === _loc2_)
            {
               ServerEngine.ins.send(6303,null,onSignInExtra);
            }
         }
         else if(this.signInStae == true)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11500001));
         }
         else
         {
            ServerEngine.ins.send(6301,null,onSignIn);
         }
      }
      
      private function onSignInExtra(param1:SignInExtraRes) : void
      {
         if(param1 == null || !param1.success)
         {
            return;
         }
         var _loc4_:List = ListUtil.clone(list_numSignIn);
         var _loc3_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_.dataSource as Array;
         for each(var _loc5_ in _loc4_.dataSource as Array)
         {
            _loc3_.push(_loc5_);
         }
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         btn_collect.disabled = true;
         var _loc2_:StcSigninExtraRewardVo = StcMgr.ins.getVo("static_signin_extra_reward",this.currNumRewardId + 1) as StcSigninExtraRewardVo;
         if(_loc2_ != null)
         {
            this.currNumRewardId = this.currNumRewardId + 1;
         }
         else
         {
            this.extraOrder = this.extraOrder - (StcMgr.ins.getVo("static_signin_extra_reward",this.currNumRewardId) as StcSigninExtraRewardVo).order;
            _loc2_ = StcMgr.ins.getVo("static_signin_extra_reward",1) as StcSigninExtraRewardVo;
            this.currNumRewardId = 1;
         }
         this.list_numSignIn.dataSource = WealthUtil.parseComboSignInAward(_loc2_.reward);
         txtSignCombo.text = this.extraOrder.toString() + "/" + _loc2_.order.toString();
         if(this.extraOrder >= _loc2_.order)
         {
            txtSignCombo.color = 458496;
            btn_collect.disabled = false;
            if(canSignEffect == null)
            {
               canSignEffect = new BmcSpriteSheet();
               canSignEffect.init(115002,1,"all",true);
            }
            canSignEffect.x = -9;
            canSignEffect.y = -9;
            this.btn_collect.addChild(canSignEffect);
         }
         else
         {
            txtSignCombo.color = 16723968;
            btn_collect.disabled = true;
            this.btn_collect.removeChild(canSignEffect);
         }
      }
      
      private function onSignIn(param1:SignInRes) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(!param1.success)
         {
            return;
         }
         this.list_signIn.selectedIndex = -1;
         var _loc3_:FSignInRender = this.getSignInRender(this.order - 1);
         _loc3_.img_gou.visible = true;
         _loc3_.img_sanjiao.disabled = true;
         _loc3_.img_backframe.disabled = true;
         var _loc4_:List = ListUtil.clone(_loc3_.list_source);
         if(_loc3_.signinutl.getVipNum() <= PlayerModel.ins.vip)
         {
            _loc2_ = [];
            var _loc7_:int = 0;
            var _loc6_:* = _loc4_.dataSource as Array;
            for each(var _loc5_ in _loc4_.dataSource as Array)
            {
               _loc5_.count = _loc5_.count * _loc3_.signinutl.getVipMulti();
               _loc2_.push(_loc5_);
            }
         }
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         this.signInStae = true;
         ObjectUtils.gray(_loc3_.list_source,true);
         this.btn_signIn.removeChild(buttonSignEffect);
         ObserverMgr.ins.sendNotice("signinbeenclicked");
         AlertUtil.float(LocaleMgr.ins.getStr(11500004));
         NpcFuncService.ins.changeCount(11500,0);
         btn_signIn.visible = !this.signInStae;
         txtCollected.visible = this.signInStae;
         updateExtraOrder();
      }
      
      private function updateExtraOrder() : void
      {
         this.extraOrder++;
         var _loc1_:StcSigninExtraRewardVo = StcMgr.ins.getVo("static_signin_extra_reward",currNumRewardId) as StcSigninExtraRewardVo;
         if(!btn_collect.disabled)
         {
            txtSignCombo.text = this.extraOrder.toString() + "/" + _loc1_.order.toString();
         }
         else
         {
            txtSignCombo.text = this.extraOrder.toString() + "/" + _loc1_.order.toString();
            if(this.extraOrder >= _loc1_.order)
            {
               txtSignCombo.color = 458496;
               btn_collect.disabled = false;
               if(canSignEffect == null)
               {
                  canSignEffect = new BmcSpriteSheet();
                  canSignEffect.init(115002,1,"all",true);
               }
               canSignEffect.x = -9;
               canSignEffect.y = -9;
               this.btn_collect.addChild(canSignEffect);
            }
         }
      }
      
      private function getSignInRender(param1:int) : FSignInRender
      {
         return this.list_signIn.getCell(param1) as FSignInRender;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.removeEventListener("iconbeenclicked",dealIconBeenClicked);
      }
   }
}
