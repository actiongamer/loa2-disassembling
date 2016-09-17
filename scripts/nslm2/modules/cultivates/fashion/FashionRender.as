package nslm2.modules.cultivates.fashion
{
   import game.ui.fashionModules.FashionRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class FashionRender extends FashionRenderUI
   {
       
      
      private var _canActivateEffect:BmcSpriteSheet;
      
      private var _isShowingEffect:Boolean;
      
      public function FashionRender()
      {
         super();
         switchEventListeners(true);
      }
      
      private function get model() : FashionModel
      {
         return FashionModel.ins;
      }
      
      private function get service() : FashionService
      {
         return FashionService.ins;
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
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(this.ref_img_quality.visible == false)
         {
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.width = 50;
            this.ref_img_quality.height = 50;
            this.buttonMode = false;
            switchEventListeners(false);
            this.ref_img_quality.visible = true;
            this.img_equiped.visible = false;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo)
         {
            this.buttonMode = true;
            switchEventListeners(true);
            ObserverMgr.ins.regObserver(this);
            this.img_equiped.visible = model.fashionIsUsing(wealthVo.sid);
            if(wealthVo.stcItemVo && wealthVo.stcItemVo.kind != 15 && wealthVo.stcItemVo.kind != 16)
            {
               if(FashionModel.ins.hasActivatedFashion(wealthVo.sid))
               {
                  this.filters = null;
                  if(_canActivateEffect)
                  {
                     DisplayUtils.removeSelf(_canActivateEffect);
                  }
               }
               else if(FashionModel.ins.canActivate(wealthVo.sid))
               {
                  this.filters = [FilterUtil.grayFilter()];
                  if(_canActivateEffect == null)
                  {
                     _canActivateEffect = new BmcSpriteSheet();
                     _canActivateEffect.init(1152,1,"all",true);
                     _canActivateEffect.x = this.x - 3;
                     _canActivateEffect.y = this.y - 4;
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
            else
            {
               this.filters = null;
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
         if(FashionModel.ins.canActivate(wealthVo.sid))
         {
            _isShowingEffect = true;
            if(_canActivateEffect)
            {
               DisplayUtils.removeSelf(_canActivateEffect);
            }
            _loc2_ = new BmcSpriteSheet();
            _loc2_.x = this.x - 33;
            _loc2_.y = this.y - 34;
            this.parent.parent.addChild(_loc2_);
            _loc2_.addEndHandler(doActivate).init(3020001);
            return;
         }
         if(wealthVo.stcItemVo.kind == 10)
         {
            ObserverMgr.ins.sendNotice("evtClothSelect",new FashionEffectVO(this.img_icon,wealthVo.sid));
         }
         else if(wealthVo.stcItemVo.kind == 12)
         {
            ObserverMgr.ins.sendNotice("evtWingSelect",new FashionEffectVO(this.img_icon,wealthVo.sid));
         }
         else if(wealthVo.stcItemVo.kind == 15 || wealthVo.stcItemVo.kind == 16)
         {
            ObserverMgr.ins.sendNotice("evtAccSelect",new FashionEffectVO(this.img_icon,wealthVo.sid));
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
            this.img_equiped.visible = model.fashionIsUsing(wealthVo.sid);
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
