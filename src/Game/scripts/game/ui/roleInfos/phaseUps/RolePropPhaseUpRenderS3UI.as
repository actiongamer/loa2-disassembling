package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RolePropPhaseUpRenderS3UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="102" height="18">
			  <Image skin="png.uiRoleInfo.角色-属性条" x="5" y="20" width="95" height="1" var="img_propLine"/>
			  <Label text="攻击加成:" autoSize="left" height="18" var="txt_name" width="55" style="人名1不随品质变化" x="2" y="1"/>
			  <Label text="256" autoSize="left" height="18" var="txt_value" letterSpacing="1" align="left" x="59" style="重要提示绿" y="1"/>
			</NpcPropRender>;
       
      
      public var img_propLine:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RolePropPhaseUpRenderS3UI()
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
