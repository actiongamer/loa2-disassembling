package game.ui.teamGuajiScenes.mains
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class RulePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="338" height="125">
			  <Image skin="png.uiTeamGuajis.规则透明底" x="0" y="0"/>
			  <Label text="1." autoSize="none" x="76" y="11" style="普通说明" var="txt_tip1" width="234" height="66" multiline="true" wordWrap="true"/>
			  <Button label="详细规则" x="120" y="80" style="按钮中黄" var="btn_rule"/>
			</FadeView>;
       
      
      public var txt_tip1:Label = null;
      
      public var btn_rule:Button = null;
      
      public function RulePanelUI()
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
