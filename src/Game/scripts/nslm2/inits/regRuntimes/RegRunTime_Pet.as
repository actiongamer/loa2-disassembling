package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.petModule.comps.PetListRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetListRendr;
   import game.ui.commons.comps.others.PetPosBuffListRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetPosBuffListRender;
   import game.ui.petModule.comps.PetStarPreViewListRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetStarPreviewListRender;
   import game.ui.petModule.comps.PetComposeCostRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetComposeCostRender;
   import game.ui.roleTeam.render.RoleTeamPetEquipRenderUI;
   import nslm2.modules.cultivates.roleTeam.view.render.RoleTeamPetEquipRender;
   import game.ui.petModule.skin.PetSkinListRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetSkinListRender;
   import game.ui.petModule.skin.PetSkinRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetSkinRender;
   import game.ui.petModule.skin.PetSkinEquipRenderUI;
   import nslm2.modules.cultivates.pet.view.render.PetSkinEquipRender;
   
   public class RegRunTime_Pet
   {
       
      
      public function RegRunTime_Pet()
      {
         super();
         View.runtimeClassMap[PetListRenderUI] = PetListRendr;
         View.runtimeClassMap[PetPosBuffListRenderUI] = PetPosBuffListRender;
         View.runtimeClassMap[PetStarPreViewListRenderUI] = PetStarPreviewListRender;
         View.runtimeClassMap[PetComposeCostRenderUI] = PetComposeCostRender;
         View.runtimeClassMap[RoleTeamPetEquipRenderUI] = RoleTeamPetEquipRender;
         View.runtimeClassMap[PetSkinListRenderUI] = PetSkinListRender;
         View.runtimeClassMap[PetSkinRenderUI] = PetSkinRender;
         View.runtimeClassMap[PetSkinEquipRenderUI] = PetSkinEquipRender;
      }
   }
}
