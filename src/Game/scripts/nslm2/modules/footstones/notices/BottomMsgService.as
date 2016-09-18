package nslm2.modules.footstones.notices
{
   public class BottomMsgService
   {
      
      private static var _ins:nslm2.modules.footstones.notices.BottomMsgService;
       
      
      public var msgArr:Array;
      
      public function BottomMsgService()
      {
         msgArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.notices.BottomMsgService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.notices.BottomMsgService();
         }
         return _ins;
      }
   }
}
