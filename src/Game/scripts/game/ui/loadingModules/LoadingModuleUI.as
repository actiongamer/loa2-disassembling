package game.ui.loadingModules
{
   import morn.customs.components.TopModuleView;
   import morn.customs.components.GRect;
   
   public class LoadingModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="1500" height="900">
			  <GRect radius="0,0,0,0" lineAlpha="0" x="0" y="0" fillColor="0" right="0" bottom="0" left="0" top="0" var="cover" fillAlpha="0"/>
			</TopModuleView>;
       
      
      public var cover:GRect = null;
      
      public function LoadingModuleUI()
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
