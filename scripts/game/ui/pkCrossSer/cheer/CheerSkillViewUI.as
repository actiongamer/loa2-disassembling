package game.ui.pkCrossSer.cheer
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class CheerSkillViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="392" height="460">
			  <List x="0" y="0" repeatY="5" spaceY="8" var="list">
			    <CheerSkillRender name="render" runtime="game.ui.pkCrossSer.cheer.CheerSkillRenderUI"/>
			  </List>
			  <Label text="助威本服选手帮助他们取得更好成绩" autoSize="none" x="9" y="431" style="普通说明" width="233" height="20"/>
			  <Label text="助威次数 10/10" autoSize="none" x="202" y="432" style="小标题" width="148" height="20" var="txt_times" align="right"/>
			  <Button skin="png.a5.comps.numBars.btn_plus" x="353" y="430" stateNum="1" var="btn_addTimes"/>
			</FadeView>;
       
      
      public var list:List = null;
      
      public var txt_times:Label = null;
      
      public var btn_addTimes:Button = null;
      
      public function CheerSkillViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.pkCrossSer.cheer.CheerSkillRenderUI"] = CheerSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
