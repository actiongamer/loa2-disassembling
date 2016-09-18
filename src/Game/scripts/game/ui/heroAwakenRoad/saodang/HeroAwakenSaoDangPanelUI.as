package game.ui.heroAwakenRoad.saodang
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   
   public class HeroAwakenSaoDangPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="315" height="409">
			  <PanelBgS3 width="314" height="409" x="0" y="-1" frameStyle="2"/>
			  <List var="list_saodang" width="280" spaceY="16" repeatY="3" x="14" y="38" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="354">
			    <HeroAwakenSaoDangRender x="-4" y="-6" name="render" runtime="game.ui.heroAwakenRoad.saodang.HeroAwakenSaoDangRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_saodang:List = null;
      
      public function HeroAwakenSaoDangPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroAwakenRoad.saodang.HeroAwakenSaoDangRenderUI"] = HeroAwakenSaoDangRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
