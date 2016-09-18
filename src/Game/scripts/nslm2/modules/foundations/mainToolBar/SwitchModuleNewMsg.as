package nslm2.modules.foundations.mainToolBar
{
   public class SwitchModuleNewMsg
   {
       
      
      public var moduleId:int;
      
      public var vis:Boolean;
      
      public function SwitchModuleNewMsg(param1:int, param2:Boolean)
      {
         super();
         this.moduleId = param1;
         this.vis = param2;
      }
   }
}
