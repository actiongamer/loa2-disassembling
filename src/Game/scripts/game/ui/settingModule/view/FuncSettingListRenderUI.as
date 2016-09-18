package game.ui.settingModule.view
{
   import morn.core.components.View;
   import morn.core.components.CheckBox;
   
   public class FuncSettingListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="96" height="23">
			  <CheckBox selected="true" style="CheckBox普通" name="render" x="0" y="0" var="checkBox" skin="png.a5.btns.checkbox_S1" label="88888"/>
			</View>;
       
      
      public var checkBox:CheckBox = null;
      
      public function FuncSettingListRenderUI()
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
