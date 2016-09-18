package game.ui.busyActivity.dragonBoats.funnys
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DragonBoatFunnyMaterialRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="90">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_4" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50" x="0" y="0"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="突破时" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" x="-8" y="55" width="64" align="center" style="普通说明" height="20" wordWrap="false" multiline="false"/>
			  <Label text="1000" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" backgroundColor="0xcfbeaf" x="-14" y="72" width="78" style="重要提示绿" align="center" height="20"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function DragonBoatFunnyMaterialRenderUI()
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
