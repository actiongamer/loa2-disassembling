package nslm2.mgrs
{
   import flash.external.ExternalInterface;
   
   public class ExternalMgr
   {
      
      private static var _ins:nslm2.mgrs.ExternalMgr;
       
      
      public function ExternalMgr()
      {
         super();
      }
      
      public static function get ins() : nslm2.mgrs.ExternalMgr
      {
         if(_ins == null)
         {
            _ins = new nslm2.mgrs.ExternalMgr();
         }
         return _ins;
      }
      
      private function callJs(param1:String, ... rest) : Object
      {
         var _loc3_:* = null;
         if(ExternalInterface.available)
         {
            try
            {
               rest.unshift(param1);
               _loc3_ = ExternalInterface.call.apply(null,rest);
            }
            catch(error:SecurityError)
            {
            }
            catch(error:Error)
            {
            }
         }
         return _loc3_;
      }
      
      public function refreshBrowzer() : void
      {
         callJs("location.reload");
      }
   }
}
