package nslm2.common.compsEffects
{
   import com.mz.core.utils.DictHash;
   
   public class EffectQueue
   {
      
      public static var dict:DictHash = new DictHash();
       
      
      public function EffectQueue()
      {
         super();
      }
      
      public static function push(param1:int, param2:*) : void
      {
         var _loc3_:Array = dict.getValue(param1);
         if(_loc3_)
         {
            _loc3_.push(param2);
         }
         else
         {
            dict.put(param1,[param2]);
         }
      }
      
      public static function shift(param1:int) : *
      {
         var _loc2_:Array = dict.getValue(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return null;
         }
         return _loc2_.shift();
      }
      
      public static function clear(param1:int) : void
      {
         dict.remove(param1);
      }
      
      public static function hasEffect(param1:int) : Boolean
      {
         var _loc2_:Array = dict.getValue(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return false;
         }
         return true;
      }
      
      public static function getLastEffect(param1:int) : *
      {
         var _loc2_:Array = dict.getValue(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return null;
         }
         return _loc2_[1 - 1];
      }
   }
}
