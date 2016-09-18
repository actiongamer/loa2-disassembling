package morn.customs.components
{
   import nslm2.modules.foundations.alerts.views.IAlertContent;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   
   public class AlertContent extends FadeView implements IAlertContent
   {
       
      
      public var alert:SimpleAlert;
      
      public function AlertContent()
      {
         super();
      }
      
      public function setAlert(param1:SimpleAlert) : void
      {
         this.alert = param1;
      }
   }
}
