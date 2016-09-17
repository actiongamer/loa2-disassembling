package nslm2.modules.foundations.mainToolBar
{
   public class MainToolBarBackMsg
   {
      
      public static const MAIN_TOOL_BAR_BACK_ADD:String = "main_tool_bar_back_add";
      
      public static const MAIN_TOOL_BAR_BACK_DELETE:String = "main_tool_bar_back_delete";
       
      
      public var moduleId:int;
      
      public var fun:Function;
      
      public var param:Array;
      
      public function MainToolBarBackMsg(param1:int, param2:Function, param3:Array)
      {
         super();
         this.moduleId = param1;
         this.fun = param2;
         this.param = param3;
      }
   }
}
