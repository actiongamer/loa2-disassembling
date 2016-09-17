package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.skin.PetSkinEquipRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.PetSkinModule;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class PetSkinEquipRender extends PetSkinEquipRenderUI
   {
       
      
      public var kind:uint;
      
      private var eff:BmcSpriteSheet;
      
      public function PetSkinEquipRender()
      {
         super();
         this.buttonMode = true;
         this.parts.push(new RollHighLightMediator(this));
         switchEventListeners(true);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.txt_get.addEventListener("click",onGetClick);
         }
         else
         {
            this.txt_get.removeEventListener("click",onGetClick);
         }
      }
      
      private function onGetClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(wealthVo),32032);
      }
      
      override protected function validateQuality() : void
      {
         if(this.ref_img_quality)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,wealthVo.quality);
               ref_img_quality.visible = true;
            }
            else
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,1);
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(!wealthVo)
         {
            this.txt_get.visible = false;
            if(PetModel.ins.haveItemToActive())
            {
               if(!eff)
               {
                  eff = new BmcSpriteSheet();
                  eff.x = -14;
                  eff.y = -14;
                  eff.init(1050,1,"all",true);
                  addChild(eff);
               }
               else
               {
                  eff.gotoAndPlay(1);
               }
            }
            else
            {
               removeEff();
            }
         }
         else
         {
            removeEff();
            if(PetModel.ins.isActive((this.parent as PetSkinModule)._clothSelectedId) || PetModel.ins.isUsed((this.parent as PetSkinModule)._clothSelectedId))
            {
               this.txt_get.visible = false;
               this.box_wealth.filters = null;
            }
            else
            {
               this.txt_get.visible = true;
               this.box_wealth.filters = [FilterUtil.grayFilter()];
            }
         }
      }
      
      private function removeEff() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
