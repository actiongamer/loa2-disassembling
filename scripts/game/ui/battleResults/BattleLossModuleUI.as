package game.ui.battleResults
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.customs.components.WealthList;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class BattleLossModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <Box x="-94" y="-150" var="box_main">
			    <Image skin="png.uiBattleResults.lossModule.img_titleLight" x="105" scaleX="2" scaleY="2" smoothing="true"/>
			    <Image skin="png.uiBattleResults.img_bg" y="242" x="788" scaleX="-1"/>
			    <Image skin="png.uiBattleResults.img_bg" y="242"/>
			    <Label text="获得奖励：" autoSize="none" x="1" y="413" style="加底标题" width="217" var="txt_item" size="13" align="right" multiline="true" wordWrap="true" height="21"/>
			    <WealthList x="229" y="413" repeatX="5" var="list_item" spaceX="20">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </WealthList>
			    <Label x="169" y="296" width="449" height="18" style="技能名标题" text="\l40220003" align="center" var="txt_text"/>
			    <List y="321" var="list_fun" repeatX="2" spaceX="20" x="280">
			      <BattleLossRender name="render" runtime="game.ui.battleResults.BattleLossRenderUI"/>
			    </List>
			  </Box>
			  <BattleBtnsRender x="37.5" y="341" var="render_btns" centerX="0" runtime="game.ui.battleResults.BattleBtnsRenderUI"/>
			</PopModuleView>;
       
      
      public var box_main:Box = null;
      
      public var txt_item:Label = null;
      
      public var list_item:WealthList = null;
      
      public var txt_text:Label = null;
      
      public var list_fun:List = null;
      
      public var render_btns:game.ui.battleResults.BattleBtnsRenderUI = null;
      
      public function BattleLossModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battleResults.BattleBtnsRenderUI"] = game.ui.battleResults.BattleBtnsRenderUI;
         viewClassMap["game.ui.battleResults.BattleLossRenderUI"] = BattleLossRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
