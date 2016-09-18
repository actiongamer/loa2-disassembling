package game.ui.battleResults
{
   import morn.core.components.View;
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class BattleBtnsRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="524" height="80">
			  <BtnFaceBook x="405" var="faceBookView" y="-1" runtime="game.ui.commons.comps.btns.BtnFaceBookUI"/>
			  <Button label="\l40220010" stateNum="1" buttonMode="true" x="270" var="btn_quit" style="按钮大黄" y="-1"/>
			  <Button label="\l40220009" stateNum="1" buttonMode="true" x="135" var="btn_review" style="按钮大绿" y="-1"/>
			  <Button label="\l40220008" stateNum="1" buttonMode="true" var="btn_statistic" style="按钮大绿" x="0" y="-1"/>
			  <Label text="\l40220011" autoSize="none" y="33" color="0xffffff" stroke="0x333333" size="12" bold="false" width="220" height="18" x="169" var="txt_autoExit" align="right"/>
			</View>;
       
      
      public var faceBookView:BtnFaceBookUI = null;
      
      public var btn_quit:Button = null;
      
      public var btn_review:Button = null;
      
      public var btn_statistic:Button = null;
      
      public var txt_autoExit:Label = null;
      
      public function BattleBtnsRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnFaceBookUI"] = BtnFaceBookUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
