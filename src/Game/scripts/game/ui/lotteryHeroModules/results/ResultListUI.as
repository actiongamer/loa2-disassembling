package game.ui.lotteryHeroModules.results
{
   import morn.customs.components.PanelView;
   import morn.customs.components.WealthList;
   
   public class ResultListUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="236" height="516">
			  <PanelBgS3 panelDragEnabled="false" width="230" height="516" x="0" y="0" showImgTitle2="true"/>
			  <WealthList y="63" repeatX="2" repeatY="6" spaceX="16" var="list_rewards" x="54">
			    <LotteryHeroResultRender name="render" runtime="game.ui.lotteryHeroModules.results.LotteryHeroResultRenderUI"/>
			  </WealthList>
			</PanelView>;
       
      
      public var list_rewards:WealthList = null;
      
      public function ResultListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.results.LotteryHeroResultRenderUI"] = LotteryHeroResultRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
