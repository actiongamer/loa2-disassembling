package nslm2.common.ui.components.comps2d
{
   import com.mz.core.utils.ArrayUtil;
   
   public class StarUtil
   {
       
      
      public function StarUtil()
      {
         super();
      }
      
      public static function starData(param1:int, param2:int) : Array
      {
         var _loc3_:Array = [];
         if(param1 == param2)
         {
            _loc3_ = ArrayUtil.fillBySameItem([],param1,2);
         }
         else
         {
            _loc3_ = ArrayUtil.fillBySameItem([],param1,1);
            _loc3_ = ArrayUtil.fillBySameItem(_loc3_,param2 - param1,0);
         }
         return _loc3_;
      }
   }
}
