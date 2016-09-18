package nslm2.modules.funnies.npcFuncLists
{
   import nslm2.utils.ServerTimer;
   
   public class FuncOpenTimeVo
   {
       
      
      public var funcId:uint;
      
      public var startTime:uint;
      
      public var endTime:uint;
      
      public function FuncOpenTimeVo(param1:int, param2:uint, param3:uint)
      {
         super();
         this.funcId = param1;
         this.startTime = param2;
         this.endTime = param3;
      }
      
      public function isOpen() : Boolean
      {
         return ServerTimer.ins.second >= this.startTime && ServerTimer.ins.second <= this.endTime;
      }
   }
}
