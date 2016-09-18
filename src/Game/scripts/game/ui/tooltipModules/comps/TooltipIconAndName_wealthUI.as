package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipIconAndName_wealthUI extends View
   {
      
      protected static var uiView:XML = <View width="249" height="52">
			  <Image skin="png.a5.comps.img_block" width="30" height="30" var="img_icon" x="8.5" y="-3.5"/>
			  <Label text="名称" x="37" y="3" var="txt_name" align="left" style="随品质变化"/>
			  <Label text="265" autoSize="left" x="12" y="34" bold="false" size="13" var="txt_desc" align="left" style="二级框标题" isHtml="true" width="275" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_desc:Label = null;
      
      public function TooltipIconAndName_wealthUI()
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
