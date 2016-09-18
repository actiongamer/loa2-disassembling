package game.ui.commons.props
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RolePropBaseRenderS2UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="93" height="18">
			  <Label text="生 命：" autoSize="left" x="1" y="0" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <Label text="256" autoSize="left" height="18" var="txt_value" letterSpacing="1" align="left" x="53" y="0" style="重要提示绿" language="en" lgx="60,53" lgy="0,0"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RolePropBaseRenderS2UI()
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
