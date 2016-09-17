package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RolePropPhaseUpRenderS1UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="103" height="18">
			  <Image skin="png.uiRoleInfo.角色-属性条" x="8" y="20" width="95" height="1" var="img_propLine"/>
			  <Label text="生 命：" autoSize="left" x="2" y="1" height="18" var="txt_name" style="普通说明"/>
			  <Label text="25685" autoSize="left" x="52" y="1" height="18" var="txt_value" letterSpacing="1" style="普通说明" align="left"/>
			</NpcPropRender>;
       
      
      public var img_propLine:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RolePropPhaseUpRenderS1UI()
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
