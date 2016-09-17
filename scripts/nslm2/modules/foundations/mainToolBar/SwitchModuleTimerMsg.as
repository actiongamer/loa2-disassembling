package nslm2.modules.foundations.mainToolBar
{
   public class SwitchModuleTimerMsg
   {
       
      
      public var moduleId:int;
      
      public var startStamp:int;
      
      public var endStamp:int;
      
      public function SwitchModuleTimerMsg(param1:int, param2:int, param3:int)
      {
         super();
         this.moduleId = param1;
         this.startStamp = param2;
         this.endStamp = param3;
      }
   }
}
