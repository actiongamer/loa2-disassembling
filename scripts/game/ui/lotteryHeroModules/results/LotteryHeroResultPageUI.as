package game.ui.lotteryHeroModules.results
{
   import morn.customs.components.PanelView;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import game.ui.commons.comps.others.ClickToNextUI;
   import game.ui.lotteryHeroModules.ClickToNextButtonTimeUI;
   
   public class LotteryHeroResultPageUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="900" height="800">
			  <PlayerTitleRender y="163" centerX="0" var="box_heroName" centerY="-240" x="307" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <ClickToNext var="clickToNextUI" centerX="0" centerY="162" x="414.5" y="551" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			  <ClickToNextButtonTime x="605" y="611" var="clickToNextButtonTimeUI" runtime="game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"/>
			</PanelView>;
       
      
      public var box_heroName:PlayerTitleRenderUI = null;
      
      public var clickToNextUI:ClickToNextUI = null;
      
      public var clickToNextButtonTimeUI:ClickToNextButtonTimeUI = null;
      
      public function LotteryHeroResultPageUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"] = ClickToNextButtonTimeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
