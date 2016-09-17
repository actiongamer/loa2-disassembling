package game.ui.newYears.day38s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   
   public class Day38_GiftPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="470" height="500">
			  <PanelBg y="0" width="470" height="500" x="0"/>
			  <Image skin="png.uiDay38.img_Bg2" x="8.5" y="28" alpha="0.5" sizeGrid="6,6,6,6" width="451" height="463"/>
			  <List x="17" y="34" repeatY="5" spaceY="1" var="list_reward" width="436" height="456">
			    <Day38_GiftPanelRender name="render" runtime="game.ui.newYears.day38s.Day38_GiftPanelRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_reward:List = null;
      
      public function Day38_GiftPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.day38s.Day38_GiftPanelRenderUI"] = Day38_GiftPanelRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
