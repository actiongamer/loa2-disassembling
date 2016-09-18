package morn.core.managers
{
   import flash.utils.Dictionary;
   import flash.events.Event;
   
   public class RenderManager
   {
       
      
      private var _methods:Dictionary;
      
      private var _isLister:Boolean = false;
      
      public function RenderManager()
      {
         _methods = new Dictionary();
         super();
      }
      
      private function invalidate() : void
      {
         if(App.stage)
         {
            if(_isLister == false)
            {
               App.stage.addEventListener("enterFrame",onValidate);
               App.stage.addEventListener("render",onValidate);
               _isLister = true;
            }
            App.stage.invalidate();
         }
      }
      
      private function onValidate(param1:Event) : void
      {
         if(_isLister)
         {
            App.stage.removeEventListener("render",onValidate);
            App.stage.removeEventListener("enterFrame",onValidate);
            _isLister = false;
         }
         renderAll();
         App.stage.dispatchEvent(new Event("renderCompleted"));
      }
      
      public function renderAll() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _methods;
         for(var _loc1_ in _methods)
         {
            exeCallLater(_loc1_ as Function);
         }
         var _loc5_:int = 0;
         var _loc4_:* = _methods;
         for each(_loc1_ in _methods)
         {
            return renderAll();
         }
      }
      
      public function callLater(param1:Function, param2:Array = null) : void
      {
         if(_methods[param1] == null)
         {
            _methods[param1] = param2 || [];
            invalidate();
         }
      }
      
      public function exeCallLater(param1:Function) : void
      {
         var _loc2_:* = null;
         if(_methods[param1] != null)
         {
            _loc2_ = _methods[param1];
            delete _methods[param1];
            param1.apply(null,_loc2_);
         }
      }
      
      public function cancelCallLater(param1:Function) : void
      {
         if(_methods[param1] != null)
         {
            delete _methods[param1];
         }
      }
   }
}
