package nslm2.modules.footstones.notices
{
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BottomMsgConsts
   {
      
      public static const KIND_FRIEND_APPLY:int = 10;
      
      public static const KIND_FRIEND_GET_GIFT:int = 11;
      
      public static const KIND_MAIL:int = 2;
      
      public static const KIND_PRIVATE_CHAT:int = 5;
      
      public static const KIND_GUAJI_TEAM_INVITE:int = 7;
      
      public static const KIND_BATTLEFIELD_INVITE:int = 12;
      
      public static const KIND_TPKC_INVITE:int = 13;
      
      private static var _ins:nslm2.modules.footstones.notices.BottomMsgConsts;
       
      
      private var configLib:Object;
      
      public function BottomMsgConsts()
      {
         configLib = {};
         super();
         configLib[10] = new BottomMsgConfigVo(10,1,LocaleMgr.ins.getStr(999000120),true);
         configLib[5] = new BottomMsgConfigVo(5,1,LocaleMgr.ins.getStr(999000121),true);
         configLib[11] = new BottomMsgConfigVo(11,2,LocaleMgr.ins.getStr(999000122),true);
         configLib[2] = new BottomMsgConfigVo(2,5,LocaleMgr.ins.getStr(999000123),true);
         configLib[7] = new BottomMsgConfigVo(7,5,LocaleMgr.ins.getStr(999000124),true);
         configLib[12] = new BottomMsgConfigVo(12,5,LocaleMgr.ins.getStr(999000125),true);
         configLib[13] = new BottomMsgConfigVo(13,5,LocaleMgr.ins.getStr(999902582),true);
      }
      
      public static function get ins() : nslm2.modules.footstones.notices.BottomMsgConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.notices.BottomMsgConsts();
         }
         return _ins;
      }
      
      public function getConfigVo(param1:int) : BottomMsgConfigVo
      {
         return configLib[param1];
      }
   }
}
