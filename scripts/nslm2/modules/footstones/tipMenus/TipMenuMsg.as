package nslm2.modules.footstones.tipMenus
{
   public class TipMenuMsg
   {
      
      public static const MSG_TIP_MENU_SHOW:String = "MSG_TIP_MENU_SHOW";
      
      public static const MSG_TIP_MENU_CLICK:String = "MSG_TIP_MENU_CLICK";
      
      public static const MSG_TIP_MENU_CLOSE:String = "MSG_TIP_MENU_CLOSE";
       
      
      public var kind:int;
      
      public var data;
      
      public var handlerExec;
      
      public var handlerCpl;
      
      public function TipMenuMsg(param1:int, param2:*)
      {
         super();
         this.kind = param1;
         this.data = param2;
      }
      
      public function addHandlers(param1:* = null, param2:* = null) : TipMenuMsg
      {
         this.handlerExec = param1;
         this.handlerCpl = param2;
         return this;
      }
   }
}
