package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class RoleMengYuePropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="155" height="20">
			  <Label text="攻击攻击" autoSize="left" x="22" y="1" color="0xffcc00" width="53" height="18" var="txt_name"/>
			  <Label text="999999999" autoSize="left" x="83" y="1" color="0xffcc00" width="69" height="18" var="txt_value"/>
			  <Label text="+" autoSize="left" x="74" y="2" color="0xffcc00" width="14" height="18" var="txt_addFlag"/>
			  <Image skin="png.uiRoleInfo.img_unionBg" x="0" y="0" var="img_icon_bg"/>
			  <Image skin="png.comp.image" x="2" y="2" width="16" height="16" var="img_iconMengYue"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_addFlag:Label = null;
      
      public var img_icon_bg:Image = null;
      
      public var img_iconMengYue:Image = null;
      
      public function RoleMengYuePropRenderUI()
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
