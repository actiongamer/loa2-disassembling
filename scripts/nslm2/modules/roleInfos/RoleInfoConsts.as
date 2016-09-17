package nslm2.modules.roleInfos
{
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.roleInfos.vo.RoleInfoSubConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RoleInfoConsts
   {
      
      public static const subId_base:int = 30100;
      
      public static const subId_levelUp:int = 20010;
      
      public static const subId_phaseUp:int = 30109;
      
      public static const subId_tupo:int = 30110;
      
      public static const subId_awake:int = 30120;
      
      public static var AVATAR_Y:int;
      
      public static const TUPO_AVATAR_X:int = 300;
      
      public static const AVATAR_X_OUT_OFFSET:int = 1600;
      
      public static const TUPO_AVATAR_OFFSET_Y:int = 65;
      
      public static const FLOAT_OFFSET_Y:int = -100;
      
      public static const YUANJUN_POS_BASE:int = 20;
      
      private static const _playerHeroSubIdArr:Array = [30100,30110,30109,30120];
      
      private static const _heroSubIdArr:Array = [30100,20010,30110,30109,30120];
      
      public static const subViewStackIdArr:Array = [30100,20010,30110,30109,30120];
      
      public static const previewSubIdArr:Array = [30100];
      
      public static const MSG_ROLE_INFO_CHANGE_EQUIP:String = "msgRoleInfo_ChangeEquip";
      
      public static const MSG_ROLE_INFO_CHANGE_TREASURE:String = "msg_role_info_change_treasure";
      
      public static const MSG_ROLE_INFO_CHANGE_MENGYUE:String = "msg_role_info_change_mengyue";
      
      public static const MSG_ROLE_INFO_CHANGE_PET:String = "msg_role_info_change_pet";
      
      public static const MSG_ROLE_AWAKE_CHANGE_BG:String = "msg_role_awake_change_bg";
      
      public static const MSG_ROLE_INFO_SHOW_CHANGE_EQUIP_PANEL:String = "msg_role_info_show_change_equip_panel";
      
      public static const MSG_ROLE_INFO_SHOW_LVLUP_PANEL:String = "msg_role_info_show_lvlup_panel";
      
      public static const MSG_ROLE_INFO_CHANGE_PAGE_TURNING:String = "msg_role_info_show_change_page_turning";
      
      public static const MSG_STOP_AUTO_PHASE_UP:String = "msg_stop_auto_phase_up";
      
      public static const MSG_INIT_PHASE_UP_HORSE_LAMP:String = "msg_init_phase_up_horse_lamp";
      
      public static const MSG_ROLE_GODHOOD_EQUIP_CPL:String = "msg_role_godhood_equip_cpl";
      
      public static const MSG_ROLE_AWAKE_EQUIP_CPL:String = "msg_role_awake_equip_cpl";
      
      public static const MSG_ROLE_AWAKE_REFRESH_PANEL:String = "msg_role_awake_refresh_panel";
      
      public static const MSG_SHOW_TUJIAN:String = "msg_show_tujian";
      
      public static const ROLE_TABLE:String = "img_roleInfoTable";
      
      public static const ROLE_HERO_SELECT_CHANGED:String = "msg_role_select_changed";
      
      public static const ROLE_AWAKE_NUMBER_CHANGED:String = "msg_role_awake_number_changed";
      
      public static const STATE_GODHOOD_EQUIPED:int = 1;
      
      public static const STATE_GODHOOD_NEED_LEVEL:int = 2;
      
      public static const STATE_GODHOOD_CAN_EQUIP:int = 3;
      
      public static const STATE_GODHOOD_NEED_ITEM:int = 4;
      
      public static const STATE_NEED_HERO:int = 5;
      
      public static const TSM_TUPO_STATE_NOTCOSTHERO:int = 1;
      
      public static const TSM_TUPO_STATE_COSTHERO:int = 2;
      
      private static var _ins:nslm2.modules.roleInfos.RoleInfoConsts;
       
      
      private var lib:DictHash;
      
      public function RoleInfoConsts()
      {
         var _loc1_:* = null;
         lib = new DictHash();
         super();
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 30100;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11700003);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 20010;
         _loc1_.nameCN = LocaleMgr.ins.getStr(30100004);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 30109;
         _loc1_.nameCN = LocaleMgr.ins.getStr(30100005);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 30110;
         _loc1_.nameCN = LocaleMgr.ins.getStr(30100006);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 30120;
         _loc1_.nameCN = LocaleMgr.ins.getStr(999000515);
         lib.put(_loc1_.subId,_loc1_);
      }
      
      public static function get playerHeroSubIdArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _playerHeroSubIdArr;
         for each(var _loc2_ in _playerHeroSubIdArr)
         {
            if(FuncOpenAutoCtrl.checkOpen(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function get heroSubIdArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _heroSubIdArr;
         for each(var _loc2_ in _heroSubIdArr)
         {
            if(FuncOpenAutoCtrl.checkOpen(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function get ins() : nslm2.modules.roleInfos.RoleInfoConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.roleInfos.RoleInfoConsts();
         }
         return _ins;
      }
      
      public function getVo(param1:int) : RoleInfoSubConfigVo
      {
         return lib.getValue(param1);
      }
   }
}
