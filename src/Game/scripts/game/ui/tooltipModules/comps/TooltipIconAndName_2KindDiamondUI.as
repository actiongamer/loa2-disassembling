package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class TooltipIconAndName_2KindDiamondUI extends View
   {
      
      protected static var uiView:XML = <View width="249" height="52">
			  <Label text="265" autoSize="left" x="12" y="34" bold="false" size="13" var="txt_desc" align="left" style="二级框标题" isHtml="true" width="275" multiline="true" wordWrap="true"/>
			  <HBox x="8" y="-3">
			    <Image skin="png.a5.comps.img_block" width="30" height="30" var="img_icon1"/>
			    <Label text="名称" x="29" y="6" var="txt_name1" align="left" style="随品质变化"/>
			    <Image skin="png.a5.comps.img_block" width="18" height="18" var="img_icon2" x="58" y="5"/>
			    <Label text="名称" x="143" y="6" var="txt_name2" align="left" style="随品质变化"/>
			  </HBox>
			</View>;
       
      
      public var txt_desc:Label = null;
      
      public var img_icon1:Image = null;
      
      public var txt_name1:Label = null;
      
      public var img_icon2:Image = null;
      
      public var txt_name2:Label = null;
      
      public function TooltipIconAndName_2KindDiamondUI()
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
