package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.NpcPropTwoRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class RolePhaseUpTwoPropRenderUI extends NpcPropTwoRender
   {
      
      protected static var uiView:XML = <NpcPropTwoRender width="165" height="21">
			  <Label text="生 命：" autoSize="left" x="2" y="2" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <Label text="0" autoSize="left" height="18" var="txt_value" letterSpacing="1" style="人名1不随品质变化" x="57" y="2"/>
			  <Label text="50%" autoSize="left" height="18" var="txt_value2" letterSpacing="1" align="left" x="112" style="重要提示绿" y="2"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="112" y="7" var="img_arrowUp" rotation="90"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="143" y="4" var="img_up"/>
			</NpcPropTwoRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_value2:Label = null;
      
      public var img_arrowUp:Image = null;
      
      public var img_up:Image = null;
      
      public function RolePhaseUpTwoPropRenderUI()
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
