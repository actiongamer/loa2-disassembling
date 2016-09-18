package game.ui.guildModules.setting
{
   import morn.core.components.View;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   
   public class AuthorityListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="133" height="23">
			  <CheckBox x="0" y="0" selected="true" style="CheckBox普通" var="selectBox"/>
			  <Label text="普通说明" autoSize="left" x="29" y="2" style="普通说明" var="txt_name"/>
			</View>;
       
      
      public var selectBox:CheckBox = null;
      
      public var txt_name:Label = null;
      
      public function AuthorityListRenderUI()
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
