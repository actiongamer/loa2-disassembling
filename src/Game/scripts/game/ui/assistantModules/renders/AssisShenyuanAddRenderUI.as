package game.ui.assistantModules.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class AssisShenyuanAddRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="325" height="38">
			  <Label text="buff名" autoSize="none" x="31" y="11" style="普通说明" width="103" height="20" var="txt_buffName" align="center"/>
			  <Button label="添加" x="235" y="9" style="按钮小红" var="btn_add"/>
			</View>;
       
      
      public var txt_buffName:Label = null;
      
      public var btn_add:Button = null;
      
      public function AssisShenyuanAddRenderUI()
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
