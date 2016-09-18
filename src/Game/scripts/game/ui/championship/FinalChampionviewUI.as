package game.ui.championship
{
   import morn.customs.components.FadeView;
   import game.ui.championship.comp.ProgressLine4UI;
   import game.ui.championship.comp.ProgressLine5UI;
   import morn.core.components.List;
   import game.ui.championship.comp.CompePlayerShowViewBigUI;
   import morn.core.components.Button;
   import game.ui.championship.comp.CompePlayerShowViewUI;
   
   public class FinalChampionviewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="1500" height="900">
			  <ProgressLine4 x="504" y="545" scaleX="1.2" var="line_1" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <ProgressLine4 x="833" y="545" scaleX="1.2" var="line_2" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <ProgressLine5 x="405" y="387" var="line_3" runtime="game.ui.championship.comp.ProgressLine5UI"/>
			  <List x="254" y="117" var="list_players">
			    <CompePlayerShowView x="3" y="1" name="item0" runtime="game.ui.championship.comp.CompePlayerShowViewUI"/>
			    <CompePlayerShowView y="319" name="item1" runtime="game.ui.championship.comp.CompePlayerShowViewUI"/>
			    <CompePlayerShowView x="807" name="item2" runtime="game.ui.championship.comp.CompePlayerShowViewUI"/>
			    <CompePlayerShowView x="807" y="318" name="item3" runtime="game.ui.championship.comp.CompePlayerShowViewUI"/>
			  </List>
			  <ProgressLine5 x="405" y="705" scaleY="-1" var="line_4" runtime="game.ui.championship.comp.ProgressLine5UI"/>
			  <ProgressLine5 x="1095" y="386" scaleX="-1" var="line_5" runtime="game.ui.championship.comp.ProgressLine5UI"/>
			  <ProgressLine5 x="1095" y="705" scaleX="-1" scaleY="-1" var="line_6" runtime="game.ui.championship.comp.ProgressLine5UI"/>
			  <CompePlayerShowViewBig x="614" y="191" var="championRender" runtime="game.ui.championship.comp.CompePlayerShowViewBigUI"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="678" y="509" stateNum="1" var="btn_small" name="btnSmall_0"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="476" y="529" stateNum="1" var="btn_1" name="btn_1"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="989" y="530" stateNum="1" var="btn_2" name="btn_2"/>
			  <Button skin="png.uiChampionship.btn_gambleBig" x="703" y="460" stateNum="1" var="btn_0" name="btn_0"/>
			</FadeView>;
       
      
      public var line_1:ProgressLine4UI = null;
      
      public var line_2:ProgressLine4UI = null;
      
      public var line_3:ProgressLine5UI = null;
      
      public var list_players:List = null;
      
      public var line_4:ProgressLine5UI = null;
      
      public var line_5:ProgressLine5UI = null;
      
      public var line_6:ProgressLine5UI = null;
      
      public var championRender:CompePlayerShowViewBigUI = null;
      
      public var btn_small:Button = null;
      
      public var btn_1:Button = null;
      
      public var btn_2:Button = null;
      
      public var btn_0:Button = null;
      
      public function FinalChampionviewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.CompePlayerShowViewBigUI"] = CompePlayerShowViewBigUI;
         viewClassMap["game.ui.championship.comp.CompePlayerShowViewUI"] = CompePlayerShowViewUI;
         viewClassMap["game.ui.championship.comp.ProgressLine4UI"] = ProgressLine4UI;
         viewClassMap["game.ui.championship.comp.ProgressLine5UI"] = ProgressLine5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
