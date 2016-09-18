package game.ui.reinforceTrain
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class ReinforcePropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="92" height="18">
			  <HBox>
			    <Label text="\l30815017" autoSize="none" color="0xf9bd77" var="txt_name" align="right" x="0" y="0" width="80" height="18"/>
			    <Label text="+99999" autoSize="left" color="0x3cff00" x="55" y="0" var="txt_value"/>
			  </HBox>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function ReinforcePropRenderUI()
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
