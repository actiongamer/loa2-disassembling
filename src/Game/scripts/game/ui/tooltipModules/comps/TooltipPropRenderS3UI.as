package game.ui.tooltipModules.comps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.HBox;
   import morn.core.components.Label;
   
   public class TooltipPropRenderS3UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="90" height="16">
			  <HBox align="top" var="hbox" space="4" x="0" y="0">
			    <Label text="属性名称" autoSize="none" y="2" bold="false" var="txt_name" align="left" style="重要提示绿"/>
			    <Label text="VALUE" autoSize="left" x="85" bold="false" var="txt_value" align="left" style="重要提示绿"/>
			  </HBox>
			</NpcPropRender>;
       
      
      public var hbox:HBox = null;
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function TooltipPropRenderS3UI()
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
