package game.ui.heroAwakenRoad
{
   import morn.customs.components.PopModuleView;
   
   public class HeroAwakenRoadModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="802" height="556">
			  <PanelBg width="803" height="560" panelDragEnabled="false" x="0" y="0"/>
			  <BtnLongBar x="745" y="28" var="btn_right" runtime="game.ui.heroAwakenRoad.BtnLongBarUI"/>
			  <BtnLongBar x="54" y="32" var="btn_left" scaleX="-1" runtime="game.ui.heroAwakenRoad.BtnLongBarUI"/>
			</PopModuleView>;
       
      
      public var btn_right:game.ui.heroAwakenRoad.BtnLongBarUI = null;
      
      public var btn_left:game.ui.heroAwakenRoad.BtnLongBarUI = null;
      
      public function HeroAwakenRoadModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroAwakenRoad.BtnLongBarUI"] = game.ui.heroAwakenRoad.BtnLongBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
