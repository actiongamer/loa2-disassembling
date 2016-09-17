package nslm2.nets.sockets
{
   import com.mz.core.utils.DictHash;
   import morn.core.utils.ObjectUtils;
   import proto.CMD;
   
   class CMDHash extends DictHash
   {
       
      
      function CMDHash()
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         super();
         var _loc5_:Array = ObjectUtils.constListOfClass(CMD);
         var _loc3_:int = _loc5_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc5_[_loc4_];
            _loc2_ = CMD[_loc1_];
            this.put(_loc2_,_loc1_);
            _loc4_++;
         }
      }
      
      public function getName(param1:int) : String
      {
         return this.getValue(param1);
      }
   }
}
