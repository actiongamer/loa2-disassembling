package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RolePropSuitRenderUI extends NpcPropRender
   {
      
      protected static var uiXML:XML = <NpcPropRender width="132" height="18">
			  <Label text="攻击攻击" autoSize="left" x="0" y="0" color="0xffcc00" width="53" height="18" var="txt_name" />
			  <Label text="999999999" autoSize="left" x="63" y="-1" color="0xffcc00" width="69" height="18" var="txt_value" />
			  <Label text="+" autoSize="left" x="52" y="0" color="0xffcc00" width="14" height="18" var="txt_addFlag" />
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_addFlag:Label = null;
      
      public function RolePropSuitRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiXML);
      }
   }
}
