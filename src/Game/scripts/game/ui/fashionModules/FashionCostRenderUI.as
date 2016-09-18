package game.ui.fashionModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FashionCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="120" height="49" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="-1" y="-1" var="img_quality" sizeGrid="6,6,6,6" scale="1.1"/>
			  <Image skin="png.comp.image" x="2" y="2" var="img_icon" width="45" height="45" scale="1.1"/>
			  <Label text="突破时突破时突破时" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" x="59" y="0" width="64" align="left" style="普通说明" height="38" wordWrap="true" multiline="true"/>
			  <Label text="100000000" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" backgroundColor="0xcfbeaf" x="60" y="34" style="重要提示绿" align="left"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function FashionCostRenderUI()
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
