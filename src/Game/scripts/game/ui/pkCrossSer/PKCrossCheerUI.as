package game.ui.pkCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   
   public class PKCrossCheerUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="430" height="552">
			  <PanelBgS3 x="0" y="0" width="430" height="552" frameStyle="2"/>
			  <Tab labels="标签标签,标签标签" x="28" y="44" style="TAB长" var="tabBar"/>
			  <Image skin="png.comp.image" x="12" y="69" var="img_bgg" width="406" height="435"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="93" y="41" var="red0"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="174" y="41" var="red1"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_bgg:Image = null;
      
      public var red0:Image = null;
      
      public var red1:Image = null;
      
      public function PKCrossCheerUI()
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
