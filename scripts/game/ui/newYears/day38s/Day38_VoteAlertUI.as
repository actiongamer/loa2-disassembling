package game.ui.newYears.day38s
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class Day38_VoteAlertUI extends View
   {
      
      protected static var uiView:XML = <View width="374" height="256">
			  <Label text="投票" autoSize="none" x="6" y="63" style="小标题" size="14" var="txt_content" width="361" height="20" align="center"/>
			  <Label text="说明" autoSize="none" x="46.5" y="131" style="普通说明" size="14" var="txt_tip" width="281" height="20" align="center"/>
			  <NumBarS1 x="108" y="97" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			</View>;
       
      
      public var txt_content:Label = null;
      
      public var txt_tip:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public function Day38_VoteAlertUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
