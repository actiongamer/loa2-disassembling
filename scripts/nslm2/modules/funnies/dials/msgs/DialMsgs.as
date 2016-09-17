package nslm2.modules.funnies.dials.msgs
{
   import flash.events.EventDispatcher;
   
   public class DialMsgs extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.funnies.dials.msgs.DialMsgs;
      
      public static const STATIC_DATA_CPL:String = "static_data_cpl";
      
      public static const MODULE_DATA_CPL:String = "module_data_cpl";
      
      public static const COMMON_DIAL_CPL:String = "common_dial_cpl";
      
      public static const SUPER_DIAL_CPL:String = "super_dial_cpl";
      
      public static const SWITCH_MOUSE_EVENT:String = "switch_mouse_event";
      
      public static const SHOP_BUY_CPL:String = "shop_buy_cpl";
      
      public static const RANK_DATA_CPL:String = "rank_data_cpl";
      
      public static const RECORD_CPL:String = "record_cpl";
      
      public static const EFFECT_CPL:String = "effect_cpl";
       
      
      public function DialMsgs()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.dials.msgs.DialMsgs
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.dials.msgs.DialMsgs();
         }
         return _ins;
      }
   }
}
