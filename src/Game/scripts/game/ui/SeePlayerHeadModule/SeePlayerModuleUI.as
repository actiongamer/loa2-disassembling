package game.ui.SeePlayerHeadModule
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class SeePlayerModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="282" height="159">
			  <Image skin="png.uiSeePlayer.框" x="2" y="1"/>
			  <Image skin="png.a5.comps.img_block" y="59" x="43" var="img_headerIcon" anchorX=".5" anchorY="1"/>
			  <Image skin="png.uiSeePlayer.等级" x="67" y="35"/>
			  <Button label="详细菜单" skin="png.uiSeePlayer.btn_menu" x="92" y="31" stateNum="1" var="btn_detail"/>
			  <Button skin="png.uiSeePlayer.btn_see" x="161" y="31" stateNum="1" var="btn_see"/>
			  <Button skin="png.uiSeePlayer.btn_msg" x="184" y="31" stateNum="1" var="btn_msg"/>
			  <Button skin="png.uiSeePlayer.btn_add" x="184" y="31" stateNum="1" var="btn_add"/>
			  <Label text="2" autoSize="none" x="62" y="41" style="普通说明" align="center" width="35" height="18" font="SimSun" var="txt_level"/>
			  <Label text="12" autoSize="none" x="93" y="11" style="人名1不随品质变化" align="center" width="156" height="18" var="txt_name"/>
			</StaticModuleView>;
       
      
      public var img_headerIcon:Image = null;
      
      public var btn_detail:Button = null;
      
      public var btn_see:Button = null;
      
      public var btn_msg:Button = null;
      
      public var btn_add:Button = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public function SeePlayerModuleUI()
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
