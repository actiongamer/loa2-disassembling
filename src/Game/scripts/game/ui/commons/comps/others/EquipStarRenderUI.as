package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class EquipStarRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="44" height="42">
			  <Image skin="png.a5.commonImgs.upstar.star_dark" var="img_starD" x="4.5" y="3.5" smoothing="true"/>
			  <Image skin="png.a5.commonImgs.upstar.star_light" var="img_starL" x="4.5" y="3.5" smoothing="true"/>
			</View>;
       
      
      public var img_starD:Image = null;
      
      public var img_starL:Image = null;
      
      public function EquipStarRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
