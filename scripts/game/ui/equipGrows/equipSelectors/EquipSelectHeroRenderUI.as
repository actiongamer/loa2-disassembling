package game.ui.equipGrows.equipSelectors
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class EquipSelectHeroRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="201" height="45" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS6" x="0" var="selectBox0"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgOverS6" var="selectBox1"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="5" y="4" sizeGrid="6,6,6,6" width="36" height="36" var="img_quality"/>
			  <Label text="普罗米" autoSize="left" x="48" y="15" var="txt_name" width="119" height="18" mouseEnabled="false" mouseChildren="false" style="人名1不随品质变化"/>
			  <Image skin="png.comp.image" x="8" y="7" width="31" height="31" var="img_icon"/>
			  <Image skin="png.a5.commonImgs.img_leftArrow" x="178" y="24" anchorX="0.5" anchorY="0.5" var="img_arrow" rotation="-90" smoothing="true"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="183" var="img_redPoint" y="0"/>
			</View>;
       
      
      public var selectBox0:Image = null;
      
      public var selectBox1:Image = null;
      
      public var img_quality:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_icon:Image = null;
      
      public var img_arrow:Image = null;
      
      public var img_redPoint:Image = null;
      
      public function EquipSelectHeroRenderUI()
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
