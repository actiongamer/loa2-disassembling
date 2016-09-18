package game.ui.equipGrows.strens
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class EquipStrenPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="92" height="20">
			  <HBox>
			    <Label text="当前强化：" autoSize="none" color="0xf9bd77" var="txt_name" align="right" x="-4" y="0" width="96" height="20"/>
			    <Label text="+99999" autoSize="left" color="0xffdf7b" x="55" y="0" var="txt_value"/>
			  </HBox>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function EquipStrenPropRenderUI()
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
