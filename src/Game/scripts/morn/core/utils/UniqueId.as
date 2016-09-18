package morn.core.utils
{
   public class UniqueId
   {
      
      private static var _startId:uint;
       
      
      public function UniqueId()
      {
         super();
      }
      
      public static function get next() : uint
      {
         _startId = _startId + 1;
         return _startId + 1;
      }
   }
}
