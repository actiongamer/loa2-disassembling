package nslm2.modules.foundations.mainToolBar
{
   public class SwitchModuleEffMsg
   {
       
      
      public var moduleId:int;
      
      public var vis:Boolean;
      
      public function SwitchModuleEffMsg(param1:int, param2:Boolean)
      {
         super();
         this.moduleId = param1;
         this.vis = param2;
      }
   }
}
