package game.ui.commons.props
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RolePropBaseRenderS1UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="93" height="18">
			  <Label text="生 命：" autoSize="left" x="0" y="1" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <Label text="25685" autoSize="left" x="50" y="1" height="18" var="txt_value" letterSpacing="1" style="重要提示橘黄"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RolePropBaseRenderS1UI()
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
