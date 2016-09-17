package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class BasePropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="120" height="19">
			  <Label autoSize="left" x="1" y="1" height="18" text="格挡等级：" var="txt_name" style="人名1不随品质变化"/>
			  <Label text="100/100" autoSize="left" x="60" y="1" height="18" var="txt_value" style="人名1不随品质变化" language="en" lgx="70,65" lgy="1,1"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function BasePropRenderUI()
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
