package game.ui.arenas.scores
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class ArenaScoreModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="469" height="600">
			  <PanelBgS3 left="0" right="0" top="0" bottom="0" frameStyle="2" x="0" y="0" width="469" height="600"/>
			  <Label text="当前积分:" autoSize="left" x="19" y="46" style="小标题" height="18"/>
			  <Label text="139" autoSize="left" x="100" y="43" style="渐变1" var="txt_scoreValue" size="20" font="SimSun" height="20" width="333" language="en" lgx="115,75" lgy="43,43"/>
			  <List x="13" y="79" repeatY="5" spaceY="8" var="list" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="437" height="437">
			    <ArenaScoreRender name="render" x="0" y="0" runtime="game.ui.arenas.scores.ArenaScoreRenderUI"/>
			  </List>
			  <Image skin="png.uiArenas.scores.{4B2FB5F2-CA33-46F1-A952-E73DA6EF0A7B}" x="18" y="76"/>
			  <Button label="一键领取" x="335" y="540" style="按钮中绿" var="btn_get" width="100"/>
			  <Image skin="png.uiArenas.scores.{4B2FB5F2-CA33-46F1-A952-E73DA6EF0A7B}" x="18" y="515"/>
			  <List x="26" y="525" var="list_oneClick" repeatX="4" spaceX="2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_scoreValue:Label = null;
      
      public var list:List = null;
      
      public var btn_get:Button = null;
      
      public var list_oneClick:List = null;
      
      public function ArenaScoreModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.scores.ArenaScoreRenderUI"] = ArenaScoreRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
