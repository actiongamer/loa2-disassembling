package nslm2.modules.foundations.signIn
{
   import game.ui.signInModules.FSignInRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.customs.FilterLib;
   import flash.filters.GlowFilter;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.SignInRes;
   import com.mz.core.utils.ListUtil;
   import morn.core.components.List;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.core.utils.ObjectUtils;
   import flash.events.Event;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.WealthUtil;
   import flash.display.Sprite;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class FSignInRender extends FSignInRenderUI implements IObserver
   {
       
      
      private var _isRoll:Boolean;
      
      private var filterMed:RoleGrowFilterMed;
      
      private var canSignEffect:BmcSpriteSheet;
      
      private var specialEffect:BmcSpriteSheet;
      
      public function FSignInRender()
      {
         super();
         filterMed = new RoleGrowFilterMed(this.list_source,null);
         this.parts.push(new RoleGrowFilterMed(this.list_source,null));
         this.addEventListener("click",onIconClick);
      }
      
      private function onRoll(param1:Boolean) : void
      {
         _isRoll = param1;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         if(_isRoll)
         {
            return;
         }
         if(this.signinutl.getCanSignIn() == false || this.signinutl.getSignState() == true)
         {
            return;
         }
         var _loc4_:* = param1;
         if("signTextFilterChange" !== _loc4_)
         {
            if("signinbeenclicked" === _loc4_)
            {
               this.signinutl.setCanSignIn();
               this.signinutl.setSignInState();
               this.filters = [];
               this.removeChild(canSignEffect);
            }
         }
         else
         {
            _loc3_ = FilterLib.ins.getRollGrowByColor(16542720);
            _loc3_.strength = param2;
            this.filters = [_loc3_];
            this.addChild(canSignEffect);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["signTextFilterChange","signinbeenclicked"];
      }
      
      private function onIconClick(param1:MouseEvent) : void
      {
         if(this.signinutl.getCanSignIn() == false && this.signinutl.getCurrOrder() == true)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11500002));
            return;
         }
         if(this.signinutl.getCanSignIn() == false || this.signinutl.getSignState() == true)
         {
            return;
         }
         ServerEngine.ins.send(6301,null,onSignIn);
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
         this.img_gou.visible = true;
         this.img_sanjiao.disabled = true;
         this.img_backframe.disabled = true;
         var _loc3_:List = ListUtil.clone(this.list_source);
         if(this.signinutl.getVipNum() <= PlayerModel.ins.vip)
         {
            _loc2_ = [];
            var _loc6_:int = 0;
            var _loc5_:* = _loc3_.dataSource as Array;
            for each(var _loc4_ in _loc3_.dataSource as Array)
            {
               _loc4_.count = _loc4_.count * this.signinutl.getVipMulti();
               _loc2_.push(_loc4_);
            }
         }
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         this.signinutl.setCanSignIn();
         this.signinutl.setSignInState();
         ObjectUtils.gray(this.list_source,true);
         this.dispatchEvent(new Event("iconbeenclicked",true));
         AlertUtil.float(LocaleMgr.ins.getStr(11500004));
         this.filters = [];
         this.removeChild(canSignEffect);
         NpcFuncService.ins.changeCount(11500,0);
      }
      
      public function get signinutl() : SignInUtl
      {
         return this.dataSource as SignInUtl;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         .super.dataSource = param1;
         this.list_source.dataSource = [WealthUtil.parseCostStr(this.signinutl.getStcReward())];
         if(this.signinutl.getSignState() == true)
         {
            this.img_backframe.disabled = true;
            ObjectUtils.gray(this.list_source,true);
            this.img_gou.visible = true;
         }
         else
         {
            this.img_backframe.disabled = false;
            ObjectUtils.gray(this.list_source,false);
            this.img_gou.visible = false;
         }
         if(this.signinutl.getVipNum() == 0)
         {
            this.img_sanjiao.visible = false;
         }
         else
         {
            this.img_sanjiao.visible = true;
            this.txt_vip.cacheAsBitmap = true;
            this.txt_vip2.cacheAsBitmap = true;
            this.txt_vip.text = "V" + String(this.signinutl.getVipNum());
            this.txt_vip2.text = LocaleMgr.ins.getStr(11500000);
         }
         if(this.signinutl.effect)
         {
            if(specialEffect == null)
            {
               specialEffect = new BmcSpriteSheet();
               specialEffect.init(800000,1,"all",true);
               specialEffect.scaleAll = 0.8;
               specialEffect.x = -5;
               specialEffect.y = 0;
               _loc2_ = new Sprite();
               _loc2_.x = this.x;
               _loc2_.y = this.y;
               this.parent.addChild(_loc2_);
               _loc2_.mouseChildren = false;
               _loc2_.mouseEnabled = false;
               _loc2_.addChild(specialEffect);
            }
         }
         if(this.signinutl.getCanSignIn() && this.signinutl.getCurrOrder())
         {
            if(canSignEffect == null)
            {
               canSignEffect = new BmcSpriteSheet();
               canSignEffect.init(115001,1,"all",true);
            }
            canSignEffect.x = -12;
            canSignEffect.y = -12;
            this.addChild(canSignEffect);
         }
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
