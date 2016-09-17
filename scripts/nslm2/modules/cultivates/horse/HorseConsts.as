package nslm2.modules.cultivates.horse
{
   import flash.geom.Point;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorseConsts
   {
      
      public static const floatOffsetPoi:Point = new Point(-62,-72);
      
      public static const EVT_AURA_USING_CHANGE:String = "evtAuraUsingChange";
      
      public static const MSG_HORSE_CHANGE_MODULE_CLOSE:String = "MSG_HORSE_CHANGE_MODULE_CLOSE";
      
      public static const MSG_HORSE_MASTER_MODULE_CLOSE:String = "MSG_HORSE_MASTER_MODULE_CLOSE";
      
      public static const SUBID_INFO:int = 1;
      
      public static const SUBID_CHANGE:int = 2;
      
      public static const SUBID_MASTER:int = 3;
      
      public static const SUBID_ARR:Array = [1,2,3];
      
      public static const HORSE_CHANGE_MASTER_PAGE:String = "horse_change_master_page";
      
      public static const EVT_AURA_SKILL_SELECT:String = "evtAuraSkillSelect";
      
      public static const HORSE_SELECT_CHANGE_USING:int = 1;
      
      public static const HORSE_SELECT_CHANGE_ACTIVATED:int = 2;
      
      public static const HORSE_SELECT_CHANGE_CANACTIVATE:int = 3;
      
      public static const HORSE_SELECT_CHANGE_NEEDMASTER:int = 4;
      
      public static const HORSE_SELECT_CHANGE_NEEDITEM:int = 5;
      
      public static const HORSE_SELECT_CHANGE_NEEDPRE:int = 6;
      
      public static const HORSE_JINGTONG_TYPE_LEVEL:int = 1;
      
      public static const HORSE_JINGTONG_TYPE_RANK:int = 2;
      
      public static const HORSE_SELECT_CHANGE_NEEDALL:int = 7;
      
      public static const HORSE_MASTER_ICON_ID:int = 0;
      
      public static const AVATAR3D_POS:Point = new Point(-63,-130);
      
      private static var _MASTER_COST_ITEM_ID:int;
       
      
      public function HorseConsts()
      {
         super();
      }
      
      public static function get MASTER_COST_ITEM_ID() : int
      {
         var _loc1_:* = null;
         if(_MASTER_COST_ITEM_ID == 0)
         {
            _loc1_ = StcMgr.ins.getHorsejingtongVo(1).singlecost;
            _MASTER_COST_ITEM_ID = WealthVo.parseCostStr(_loc1_).sid;
         }
         return _MASTER_COST_ITEM_ID;
      }
      
      public static function getStateName(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return LocaleMgr.ins.getStr(30300036);
            case 1:
               return LocaleMgr.ins.getStr(30200013);
            case 2:
               return LocaleMgr.ins.getStr(30200014);
         }
      }
      
      public static function getStateColor(param1:int) : uint
      {
         switch(int(param1) - 1)
         {
            case 0:
               return 16046112;
            case 1:
               return 16046112;
            case 2:
               return 458496;
         }
      }
   }
}
