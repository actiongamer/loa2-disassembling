package nslm2.modules.foundations.mainToolBar
{
   public class SwitchModuleRedPointMsg
   {
       
      
      public var moduleId:int;
      
      public var vis:Boolean;
      
      public var count:int;
      
      public function SwitchModuleRedPointMsg(param1:int, param2:Boolean, param3:int = 0)
      {
         super();
         this.moduleId = param1;
         this.vis = param2;
         this.count = param3;
      }
   }
}
