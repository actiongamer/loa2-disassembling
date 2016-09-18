package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipGetPoinsDescUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="46">
			  <Label text="\l10220005\l" autoSize="none" x="18" y="1" var="txt_name" align="left" width="135" height="18" style="普通说明"/>
			  <Label text="获取途径内容" autoSize="left" x="18" y="24" var="txt_getPointsDesc" width="276" multiline="true" wordWrap="true" leading="6" letterSpacing="1" style="提示绿"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="3" y="3"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_getPointsDesc:Label = null;
      
      public function TooltipGetPoinsDescUI()
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
