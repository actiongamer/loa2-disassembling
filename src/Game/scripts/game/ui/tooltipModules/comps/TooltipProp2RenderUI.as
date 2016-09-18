package game.ui.tooltipModules.comps
{
   import morn.customs.components.NpcPropTwoRender;
   import morn.core.components.HBox;
   import morn.core.components.Label;
   
   public class TooltipProp2RenderUI extends NpcPropTwoRender
   {
      
      protected static var uiView:XML = <NpcPropTwoRender width="126" height="16">
			  <HBox align="top" var="hbox" space="4">
			    <Label text="属性名称" autoSize="none" y="4" color="0xdcdcdc" bold="false" size="12" var="txt_name" align="left"/>
			    <Label text="VALUE" autoSize="none" x="85" y="2" color="0xdcdcdc" bold="false" size="12" var="txt_value" align="left"/>
			    <Label text="VALUE2" autoSize="none" x="215" color="0xdcdcdc" bold="false" size="12" var="txt_value2" align="left"/>
			  </HBox>
			</NpcPropTwoRender>;
       
      
      public var hbox:HBox = null;
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_value2:Label = null;
      
      public function TooltipProp2RenderUI()
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
