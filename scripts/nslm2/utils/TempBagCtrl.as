package nslm2.utils
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.DictHash;
   import proto.Reward;
   import nslm2.common.vo.WealthVo;
   
   public class TempBagCtrl implements IDispose
   {
       
      
      public var tempSuperBagDict:DictHash;
      
      public function TempBagCtrl()
      {
         tempSuperBagDict = new DictHash();
         super();
      }
      
      public function addToTempBag(param1:Array) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         _loc3_ = null;
         var _loc5_:DictHash = tempSuperBagDict;
         var _loc2_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc2_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc4_.dropId != 0)
            {
               _loc3_ = _loc5_.getValue(_loc4_.dropId);
               if(_loc3_)
               {
                  _loc3_.count = _loc3_.count + Uint64Util.toInt(_loc4_.count);
               }
               else
               {
                  _loc5_.put(_loc4_.dropId,WealthUtil.rewardToVo(_loc4_));
               }
            }
            else
            {
               _loc3_ = _loc5_.getValue(_loc4_.dropType);
               if(_loc3_)
               {
                  _loc3_.count = _loc3_.count + Uint64Util.toInt(_loc4_.count);
               }
               else
               {
                  _loc5_.put(_loc4_.dropType,WealthUtil.rewardToVo(_loc4_));
               }
            }
            _loc6_++;
         }
      }
      
      public function addToTempBagWealthVo(param1:Array) : void
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:DictHash = tempSuperBagDict;
         var _loc3_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc2_ = param1[_loc6_];
            _loc4_ = _loc5_.getValue(_loc2_.sid);
            if(_loc4_)
            {
               _loc4_.count = _loc4_.count + _loc2_.count;
            }
            else
            {
               _loc5_.put(_loc2_.sid,_loc2_);
            }
            _loc6_++;
         }
      }
      
      public function getTempBagData(param1:Boolean) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:DictHash = tempSuperBagDict;
         var _loc3_:Array = _loc4_.array;
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc3_.sort(sortFunc);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function sortFunc(param1:WealthVo, param2:WealthVo) : int
      {
         if(param1.kind == 20 && param2.kind != 20)
         {
            return 1;
         }
         if(param1.kind != 20 && param2.kind == 20)
         {
            return -1;
         }
         if(param1.quality > param2.quality)
         {
            return -1;
         }
         if(param1.quality < param2.quality)
         {
            return 1;
         }
         return 0;
      }
      
      public function dispose() : void
      {
         if(tempSuperBagDict)
         {
            tempSuperBagDict = null;
         }
      }
   }
}
