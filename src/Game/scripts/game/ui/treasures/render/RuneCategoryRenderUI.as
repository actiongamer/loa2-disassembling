package game.ui.treasures.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RuneCategoryRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="198" height="49" name="selectBox1" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS6" y="0"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgOverS6" var="selectBox1"/>
			  <Label text="闪避符文" autoSize="left" x="70" y="14" style="普通说明" var="txt_name" mouseEnabled="false" mouseChildren="false" size="14" language="en" lgx="53,70" lgy="14,14"/>
			  <Label text="(1000)" autoSize="left" x="127" y="15" style="普通说明" var="txt_num" mouseChildren="false" mouseEnabled="false" language="en" lgx="142,127" lgy="15,15"/>
			  <Image x="37" y="21" anchorX=".5" anchorY=".5" var="img_icon" smoothing="true" width="32" height="32" language="en" lgx="27,37" lgy="21,21"/>
			</View>;
       
      
      public var selectBox1:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function RuneCategoryRenderUI()
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
