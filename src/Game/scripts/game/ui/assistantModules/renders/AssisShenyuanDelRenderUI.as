package game.ui.assistantModules.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class AssisShenyuanDelRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="325" height="38">
			  <Label text="buff名" autoSize="none" x="119" y="11" style="普通说明" width="85" height="20" var="txt_buffName" align="center"/>
			  <Button label="\l60200080" x="235" y="9" style="按钮小红" var="btn_delete"/>
			  <Label text="1" autoSize="none" x="33" y="11" style="普通说明" width="43" height="20" var="txt_sort" align="center"/>
			</View>;
       
      
      public var txt_buffName:Label = null;
      
      public var btn_delete:Button = null;
      
      public var txt_sort:Label = null;
      
      public function AssisShenyuanDelRenderUI()
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
