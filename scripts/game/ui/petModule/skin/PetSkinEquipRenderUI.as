package game.ui.petModule.skin
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class PetSkinEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="55" height="66">
			  <Label text="前往获取" x="-30" y="54" width="115" height="18" var="txt_get" underline="true" style="重要提示绿" align="center" buttonMode="true" mouseChildren="false"/>
			  <Box var="box_wealth" mouseChildren="false">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" scale="1.1"/>
			    <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44" scale="1.1"/>
			  </Box>
			</WealthRender>;
       
      
      public var txt_get:Label = null;
      
      public var box_wealth:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function PetSkinEquipRenderUI()
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
