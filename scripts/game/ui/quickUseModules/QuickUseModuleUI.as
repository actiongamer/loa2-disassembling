package game.ui.quickUseModules
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   
   public class QuickUseModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="285" height="163">
			  <Box x="-1" y="-20" var="box_content">
			    <Image skin="png.uiQuickUseModules.img_bg"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="13" x="267" var="btn_close"/>
			  </Box>
			</TopModuleView>;
       
      
      public var box_content:Box = null;
      
      public var btn_close:Button = null;
      
      public function QuickUseModuleUI()
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
