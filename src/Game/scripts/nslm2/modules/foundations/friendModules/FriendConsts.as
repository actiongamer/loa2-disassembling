package nslm2.modules.foundations.friendModules
{
   public class FriendConsts
   {
      
      public static const MAIN_TAB_RECENTLY:int = 11;
      
      public static const MAIN_TAB_FRIEND:int = 22;
      
      public static const MAIN_TAB_BLOCK:int = 33;
      
      public static const GROUP_FRIEND:int = 1;
      
      public static const GROUP_GUILD:int = 2;
      
      public static const GROUP_CS:int = 3;
      
      public static const GROUP_BLOCK:int = 4;
      
      public static const GIFT_KIND_GIVE:int = 1;
      
      public static const GIFT_KIND_GET:int = 2;
      
      private static var _ins:nslm2.modules.foundations.friendModules.FriendConsts;
       
      
      public var mainTab:Array;
      
      public function FriendConsts()
      {
         mainTab = [];
         super();
         mainTab[0] = 22;
         mainTab[1] = 11;
         mainTab[2] = 33;
      }
      
      public static function get ins() : nslm2.modules.foundations.friendModules.FriendConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.friendModules.FriendConsts();
         }
         return _ins;
      }
   }
}
