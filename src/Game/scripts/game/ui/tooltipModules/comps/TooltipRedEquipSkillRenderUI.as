package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TooltipRedEquipSkillRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="210" height="41">
			  <Image skin="png.a5.prefabs.img_titlePoint" x="4" y="3"/>
			  <Label text="【神兵锋锐】攻击+1000\n （强化达到180级开启）" autoSize="none" bold="false" var="txt_value" style="普通说明" align="left" x="16" y="0" width="194" height="41" leading="5" color="0xdcdcdc" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var txt_value:Label = null;
      
      public function TooltipRedEquipSkillRenderUI()
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
