package game.ui.newYears.day51s.panels
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   
   public class Day51HelpModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="700" height="540">
			  <PanelBg x="0" y="0" left="0" right="0" top="0" bottom="0"/>
			  <Image skin="png.a5.comps.img_block" x="60" y="71" autoSize="true" var="img_pic"/>
			  <Label autoSize="none" x="443" y="71" style="渐变2" align="left" width="233" height="412" text="\l133550020" bold="false" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var img_pic:Image = null;
      
      public function Day51HelpModuleUI()
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
