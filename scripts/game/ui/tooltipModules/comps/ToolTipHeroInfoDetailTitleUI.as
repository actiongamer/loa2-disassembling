package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ToolTipHeroInfoDetailTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="150" height="32">
			  <Image skin="png.uiRoleTeam.黄光" x="-1" y="0"/>
			  <Label text="标题" autoSize="none" x="6" y="6" width="140" height="18" align="center" underline="false" selectable="false" buttonMode="true" bold="true" style="加底标题" var="lTitle"/>
			</View>;
       
      
      public var lTitle:Label = null;
      
      public function ToolTipHeroInfoDetailTitleUI()
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
