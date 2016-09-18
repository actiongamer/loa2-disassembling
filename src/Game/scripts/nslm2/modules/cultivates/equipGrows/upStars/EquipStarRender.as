package nslm2.modules.cultivates.equipGrows.upStars
{
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class EquipStarRender extends EquipStarRenderUI
   {
       
      
      public function EquipStarRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.img_starL.visible = param1 == "StarLightOn";
      }
   }
}
