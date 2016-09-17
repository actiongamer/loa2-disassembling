package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.skin.PetSkinRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.service.PetService;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class PetSkinRender extends PetSkinRenderUI
   {
       
      
      private var parentVo:StcPetStatusVo;
      
      private var _canActivateEffect:BmcSpriteSheet;
      
      private var _isShowingEffect:Boolean;
      
      public function PetSkinRender()
      {
         super();
         switchEventListeners(true);
      }
      
      private function get model() : PetModel
      {
         return PetModel.ins;
      }
      
      private function get service() : PetService
      {
         return PetService.ins;
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
            parentVo = (DisplayUtils.findParentMatchingClass(this,PetSkinListRender) as PetSkinListRender).dataSource as StcPetStatusVo;
            ObserverMgr.ins.regObserver(this);
            this.img_equiped.visible = model.isUsed(parentVo.id);
            if(model.isActive(parentVo.id) || model.isUsed(parentVo.id))
            {
               this.filters = null;
               if(_canActivateEffect)
               {
                  DisplayUtils.removeSelf(_canActivateEffect);
               }
            }
            else if(!model.isActive(parentVo.id) && model.canActive(wealthVo.sid))
            {
               this.filters = [FilterUtil.grayFilter()];
               if(_canActivateEffect == null)
               {
                  _canActivateEffect = new BmcSpriteSheet();
                  _canActivateEffect.init(1152,1,"all",true);
                  _canActivateEffect.x = this.x + 5;
                  _canActivateEffect.y = this.y - 3;
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
         if(!model.isActive(parentVo.id) && model.canActive(wealthVo.sid))
         {
            _isShowingEffect = true;
            if(_canActivateEffect)
            {
               DisplayUtils.removeSelf(_canActivateEffect);
            }
            _loc2_ = new BmcSpriteSheet();
            _loc2_.x = this.x - 36 + 9;
            _loc2_.y = this.y - 34;
            this.parent.parent.addChild(_loc2_);
            _loc2_.addEndHandler(doActivate).init(3020001);
            return;
         }
         ObserverMgr.ins.sendNotice("evtSkinSelect",new FashionEffectVO(this.img_icon,wealthVo.sid,null,parentVo.id));
      }
      
      private function doActivate() : void
      {
         TimerManager.ins.doOnce(1000,function():void
         {
            _isShowingEffect = false;
         });
         service.activateClothes(parentVo.id);
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
            this.img_equiped.visible = model.isUsed(parentVo.id);
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
