package nslm2.modules.foundations.mainToolBar
{
   import morn.customs.components.StaticModuleView;
   import com.mz.core.interFace.ILogger;
   import com.mz.core.logging.Log;
   import flash.events.MouseEvent;
   
   public class TopIconModule extends StaticModuleView
   {
      
      private static var _log:ILogger = Log.getClassLogger(TopIconModule);
       
      
      public function TopIconModule()
      {
         super();
         this.right = 0;
         this.top = 0;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
      }
   }
}
