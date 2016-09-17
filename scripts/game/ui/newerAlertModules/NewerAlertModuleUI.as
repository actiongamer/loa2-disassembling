package game.ui.newerAlertModules
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Button;
   
   public class NewerAlertModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="311" height="229">
			  <PanelBgS3 x="1" y="2" width="311" height="229" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiNewerAlert.img_bg" x="12" y="34"/>
			  <Button label="按钮" x="90.5" style="按钮大绿" y="190" var="btn_confirm" width="130"/>
			</TopModuleView>;
       
      
      public var btn_confirm:Button = null;
      
      public function NewerAlertModuleUI()
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
