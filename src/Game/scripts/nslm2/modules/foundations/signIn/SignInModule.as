package nslm2.modules.foundations.signIn
{
   import game.ui.signInModules.SignInModuleUI;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSignInInfoRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSigninRewardVo;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.SignInRes;
   import com.mz.core.utils.ListUtil;
   import morn.core.components.List;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.compsEffects.NumberBreathCtrl;
   import morn.core.handlers.Handler;
   
   public class SignInModule extends SignInModuleUI
   {
      
      public static const SIGN_IN_LIST_RENDER_FILTER_CHANGE:String = "signTextFilterChange";
      
      public static const SIGNIN:int = 9111500;
      
      public static const ICON_BEEN_CLICKED:String = "iconbeenclicked";
      
      public static const SIGNIN_BEEN_CLICKED:String = "signinbeenclicked";
       
      
      private var signindays:Array;
      
      private var turn:int;
      
      private var reward:Array;
      
      private var order:int;
      
      private var signInStae:Boolean;
      
      private var canSignEffect:BmcSpriteSheet;
      
      private var buttonSignEffect:BmcSpriteSheet;
      
      public function SignInModule()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr("9111500");
         this.parts.push(new NumberBreathCtrl(6,0).addHandler(new Handler(filterSignInChanged)));
         this.btn_signIn.label = LocaleMgr.ins.getStr(11500003);
         this.addEventListener("iconbeenclicked",dealIconBeenClicked);
      }
      
      private function dealIconBeenClicked(param1:Event) : void
      {
         this.list_signIn.selectedIndex = -1;
         this.signInStae = true;
         this.btn_signIn.removeChild(buttonSignEffect);
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
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Array = new Array(SignInUtl);
         turn = param1.turn;
         reward = StcMgr.ins.getVoArrByColumnValue("static_signin_reward","month",turn);
         _loc8_ = 0;
         while(_loc8_ < reward.length)
         {
            _loc4_ = reward[_loc8_] as StcSigninRewardVo;
            _loc7_ = false;
            _loc5_ = 0;
            while(_loc5_ < param1.ids.length)
            {
               if(_loc4_.ID == param1.ids[_loc5_])
               {
                  _loc7_ = true;
               }
               _loc5_++;
            }
            _loc6_ = false;
            _loc2_ = false;
            if(_loc4_.order == param1.nowOrder)
            {
               if(param1.signIn == false)
               {
                  _loc6_ = true;
                  _loc2_ = true;
               }
            }
            _loc3_[_loc4_.order - 1] = new SignInUtl(_loc4_.reward,_loc7_,_loc4_.viplimit,_loc6_,_loc2_,_loc4_.vipmulti);
            _loc8_++;
         }
         this.order = param1.nowOrder;
         this.list_signIn.dataSource = _loc3_;
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
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         this.panelBg.titleImgId = this.moduleId;
         super.preShow(param1);
      }
      
      private function onClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_signIn === _loc2_)
         {
            if(this.signInStae == true)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(11500001));
            }
            else
            {
               ServerEngine.ins.send(6301,null,onSignIn);
            }
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
         var _loc3_:SignInRender = this.getSignInRender(this.order - 1);
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
         else
         {
            _loc2_ = _loc4_.dataSource as Array;
         }
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         this.signInStae = true;
         ObjectUtils.gray(_loc3_.list_source,true);
         this.btn_signIn.removeChild(buttonSignEffect);
         ObserverMgr.ins.sendNotice("signinbeenclicked");
         AlertUtil.float(LocaleMgr.ins.getStr(11500004));
         NpcFuncService.ins.changeCount(11500,0);
      }
      
      private function getSignInRender(param1:int) : SignInRender
      {
         return this.list_signIn.getCell(param1) as SignInRender;
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
