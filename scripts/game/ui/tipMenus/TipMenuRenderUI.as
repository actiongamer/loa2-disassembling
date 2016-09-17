package game.ui.tipMenus
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TipMenuRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="150" height="23">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuSelectBoxBg" x="0" y="0" name="selectBox0" width="150" height="23"/>
			  <Image skin="png.a5.comps.img_block" x="5" y="0" width="20" height="20" var="img_icon"/>
			  <Label text="普通说明明" autoSize="none" x="24" y="1.5" style="普通说明" width="123" size="13" align="center" var="txt_content"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="142" y="11" var="img_redPoint" anchorX=".5" anchorY=".5" scaleX=".8" scaleY=".8"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_content:Label = null;
      
      public var img_redPoint:Image = null;
      
      public function TipMenuRenderUI()
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
