package game.ui.roleTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TeamRoleViewRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="128" height="167">
			  <Image skin="png.comp.image" x="63" y="85" var="img_icon" width="120" height="160" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.uiRoleTeam.img_panel1" x="0" var="img_frame"/>
			  <Label text="普通绿色啦啦+1" autoSize="none" x="2.5" y="130" style="普通绿色" width="123" height="18" align="center" var="txt_name" mouseEnabled="false"/>
			  <Label text="\l30100049\l" autoSize="none" style="人名1不随品质变化" width="82" height="18" mouseEnabled="false" x="3" y="147" align="right"/>
			  <Label text="5/4" autoSize="none" x="79" style="普通绿色" width="30" height="18" align="center" mouseEnabled="false" var="txt_num" y="147"/>
			  <Image skin="png.a5.comps.img_block" x="18" y="18" anchorX="0.5" anchorY="0.5" var="img_group" autoSize="false" smoothing="true" mouseEnabled="true" mouseChildren="false" width="30" height="30"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var img_frame:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_num:Label = null;
      
      public var img_group:Image = null;
      
      public function TeamRoleViewRenderUI()
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
