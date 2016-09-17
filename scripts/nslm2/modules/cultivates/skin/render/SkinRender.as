package nslm2.modules.cultivates.skin.render
{
   import game.ui.skinModule.render.SkinRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.skin.SkinModel;
   import nslm2.modules.cultivates.skin.service.SkinService;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class SkinRender extends SkinRenderUI
   {
       
      
      private var _canActivateEffect:BmcSpriteSheet;
      
      private var _isShowingEffect:Boolean;
      
      public function SkinRender()
      {
         super();
         switchEventListeners(true);
      }
      
      private function get model() : SkinModel
      {
         return SkinModel.ins;
      }
      
      private function get service() : SkinService
      {
         return SkinService.ins;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onClick);
         }
         else
         {
            this.removeEventListener("click",onClick);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo)
         {
            ObserverMgr.ins.regObserver(this);
            this.img_equiped.visible = model.isUsed(wealthVo.sid);
            if(model.isActive(wealthVo.sid) || model.isUsed(wealthVo.sid))
            {
               this.filters = null;
               if(_canActivateEffect)
               {
                  DisplayUtils.removeSelf(_canActivateEffect);
               }
            }
            else if(model.canActive(wealthVo.sid))
            {
               this.filters = [FilterUtil.grayFilter()];
               if(_canActivateEffect == null)
               {
                  _canActivateEffect = new BmcSpriteSheet();
                  _canActivateEffect.init(1152,1,"all",true);
                  _canActivateEffect.x = this.x + 8;
                  _canActivateEffect.y = this.y;
               }
               this.parent.parent.addChild(_canActivateEffect);
            }
            else
            {
               this.filters = [FilterUtil.grayFilter()];
               if(_canActivateEffect)
               {
                  DisplayUtils.removeSelf(_canActivateEffect);
               }
            }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(_isShowingEffect)
         {
            return;
         }
         if(model.canActive(wealthVo.sid))
         {
            _isShowingEffect = true;
            if(_canActivateEffect)
            {
               DisplayUtils.removeSelf(_canActivateEffect);
            }
            _loc2_ = new BmcSpriteSheet();
            _loc2_.x = this.x - 36 + 8;
            _loc2_.y = this.y - 34;
            this.parent.parent.addChild(_loc2_);
            _loc2_.addEndHandler(doActivate).init(3020001);
            return;
         }
         if(wealthVo.stcItemVo.kind == 14)
         {
            ObserverMgr.ins.sendNotice("evtSkinSelect",new FashionEffectVO(this.img_icon,wealthVo.sid));
         }
      }
      
      private function doActivate() : void
      {
         TimerManager.ins.doOnce(1000,function():void
         {
            _isShowingEffect = false;
         });
         service.activateClothes(wealthVo.sid);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["evtFashionUsingChange"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("evtFashionUsingChange" === _loc3_)
         {
            this.img_equiped.visible = model.isUsed(wealthVo.sid);
         }
      }
      
      override public function dispose() : void
      {
         if(_canActivateEffect)
         {
            _canActivateEffect.dispose();
         }
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
