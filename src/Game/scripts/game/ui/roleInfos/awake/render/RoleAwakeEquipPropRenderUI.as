package game.ui.roleInfos.awake.render
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RoleAwakeEquipPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="109" height="25">
			  <Label text="+1500" autoSize="left" height="26" var="txt_value" align="left" x="36" style="重要提示绿" width="72" size="18" y="0"/>
			  <Label text="生命：" autoSize="left" height="18" var="txt_name" width="35" style="人名1不随品质变化" y="4" x="0"/>
			</NpcPropRender>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public function RoleAwakeEquipPropRenderUI()
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
