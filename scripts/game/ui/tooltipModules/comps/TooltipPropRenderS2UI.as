package game.ui.tooltipModules.comps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class TooltipPropRenderS2UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="90" height="16">
			  <Label text="属性名称" bold="false" var="txt_name" style="普通说明" autoSize="left" align="left" x="0" y="0" color="0xdcdcdc"/>
			  <Label text="VALUE" autoSize="left" bold="false" var="txt_value" style="普通说明" align="left" x="56" y="0" color="0xdcdcdc"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function TooltipPropRenderS2UI()
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
