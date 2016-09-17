package game.ui.fashionModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FashionSuitSkillRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="131" height="20" buttonMode="true">
			  <Label autoSize="left" width="97" height="20" x="36" y="0" var="txt_skillName" underline="true" style="重要提示橘黄"/>
			  <Label autoSize="left" width="35" height="20" x="0" y="0" var="txt_skillNum" underline="false" style="重要提示橘黄"/>
			</View>;
       
      
      public var txt_skillName:Label = null;
      
      public var txt_skillNum:Label = null;
      
      public function FashionSuitSkillRenderUI()
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
