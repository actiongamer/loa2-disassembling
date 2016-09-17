package nslm2.modules.roleInfos.levelUps
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchNewerAlertMsg;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.common.model.PlayerModel;
   
   public class RoleLevelUpUtil
   {
      
      public static var LEVEL_UP_ITEM:Array;
      
      public static const LVL_GAP:int = 3;
       
      
      public function RoleLevelUpUtil()
      {
         super();
      }
      
      public static function checkHasLevelUpItem() : Boolean
      {
         if(!LEVEL_UP_ITEM)
         {
            LEVEL_UP_ITEM = StcMgr.ins.getVoArrByColumnValue("static_item","kind",32).sortOn("quality",16);
         }
         var _loc3_:int = 0;
         var _loc2_:* = LEVEL_UP_ITEM;
         for each(var _loc1_ in LEVEL_UP_ITEM)
         {
            if(BagModel.ins.getStcCount(_loc1_.id) > 1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function chekHasNeedPromptLevelUpHero() : Boolean
      {
         if(!checkHasLevelUpItem())
         {
            ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(20010,false));
            return false;
         }
         var _loc2_:Array = HeroModel.ins.teamHeroInfoArr;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(checkNeedPromptLevelUp(_loc1_.baseInfo,true))
            {
               ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(20010,true));
               return true;
            }
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(20010,false));
         return false;
      }
      
      public static function checkNeedPromptLevelUp(param1:Object, param2:Boolean = false) : Boolean
      {
         if(param2 || checkHasLevelUpItem())
         {
            if(param1.level <= PlayerModel.ins.level - 3)
            {
               return true;
            }
            return false;
         }
         return false;
      }
   }
}
