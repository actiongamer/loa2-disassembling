package game.ui.horseModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   
   public class HorseMainModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg width="800" height="550" showTabLine="true" x="1" y="1"/>
			  <Tab labels="\l30300012,\l30300010" x="24" y="41" style="TAB长" var="tabBar" selectedIndex="0"/>
			  <Image skin="png.uiHorse.img_bg" x="3" y="68" var="img_bg" width="796" height="479"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_bg:Image = null;
      
      public function HorseMainModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
