package game.ui.driverInfoModules
{
   import morn.customs.components.TopModuleView;
   import morn.customs.components.GRect;
   import morn.core.components.Button;
   
   public class DriverInfoModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="679" height="407">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" left="0" right="0" top="0" bottom="0" var="cover"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" var="box" x="479" y="74" fillColor="0xFF9900"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" x="653" y="0" var="btn_close"/>
			</TopModuleView>;
       
      
      public var cover:GRect = null;
      
      public var box:GRect = null;
      
      public var btn_close:Button = null;
      
      public function DriverInfoModuleUI()
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
