package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipTitleTxtUI extends View
   {
      
      protected static var uiView:XML = <View width="152" height="19">
			  <Label text="\l10220005\l" autoSize="left" x="17" y="1" bold="false" var="txt_name" align="left" style="普通说明" size="14"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="2" y="4"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function TooltipTitleTxtUI()
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
