package nslm2.common.ctrls
{
   import com.mz.core.utils.DictHash;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.ArrayUtil;
   
   public class TSMDict extends DictHash
   {
       
      
      public var curStateAll:int = 0;
      
      private var cplDict:Vector.<nslm2.common.ctrls.TSM>;
      
      public function TSMDict()
      {
         cplDict = new Vector.<nslm2.common.ctrls.TSM>();
         super();
      }
      
      public function addTSM(param1:nslm2.common.ctrls.TSM) : TSMDict
      {
         this.put(param1.target,param1);
         return this;
      }
      
      public function getTSM(param1:*) : nslm2.common.ctrls.TSM
      {
         return this.getValue(param1) as nslm2.common.ctrls.TSM;
      }
      
      public function toState(param1:* = 0, param2:Number = NaN, param3:Object = null, param4:* = null) : void
      {
         var _loc7_:* = 0;
         curStateAll = param1;
         cplDict.length = 0;
         var _loc9_:int = 0;
         var _loc8_:* = dict;
         for each(var _loc5_ in dict)
         {
            if(_loc5_.stateLib.hasOwnProperty(param1))
            {
               cplDict.push(_loc5_);
            }
         }
         var _loc6_:int = cplDict.length;
         if(_loc6_ > 0)
         {
            _loc7_ = _loc6_;
            while(true)
            {
               _loc7_--;
               if(_loc7_ <= -1)
               {
                  break;
               }
               _loc5_ = cplDict[_loc7_];
               _loc5_.toState(param1,param2,param3,new Handler(handler_everyOne,[_loc5_,param4]));
            }
         }
         else if(param4 != null)
         {
            Handler.execute(param4);
         }
      }
      
      private function handler_everyOne(param1:nslm2.common.ctrls.TSM, param2:* = null) : void
      {
         ArrayUtil.removeItem(cplDict,param1);
         if(cplDict.length == 0 && param2 != null)
         {
            Handler.execute(param2);
         }
      }
   }
}
