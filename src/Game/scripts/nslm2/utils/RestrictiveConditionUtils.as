package nslm2.utils
{
   import morn.core.utils.StringUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenNodeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RestrictiveConditionUtils
   {
       
      
      public function RestrictiveConditionUtils()
      {
         super();
      }
      
      public static function condSatisfied(param1:String) : Boolean
      {
         var _loc2_:* = null;
         if(StringUtils.isNull(param1) == true)
         {
            return true;
         }
         var _loc3_:Array = param1.split(":");
         var _loc4_:int = _loc3_[0];
         if(11200101 !== _loc4_)
         {
            if(11200102 !== _loc4_)
            {
               if(11200103 !== _loc4_)
               {
                  if(11200104 !== _loc4_)
                  {
                     if(11200105 !== _loc4_)
                     {
                        if(40700100 !== _loc4_)
                        {
                           if(11200199 !== _loc4_)
                           {
                              return true;
                           }
                           _loc2_ = HeroAwakenRoadModel.ins.getNodeByNodeId(_loc3_[1]);
                           if(_loc2_)
                           {
                              return _loc2_.gotStar >= 3;
                           }
                        }
                        else
                        {
                           if(GuildModel.ins.guildInfo == null)
                           {
                              return false;
                           }
                           return GuildModel.ins.guildInfo.lv >= _loc3_[1];
                        }
                     }
                     else if(ShenYuanModel.ins.hisTopStar >= _loc3_[1])
                     {
                        return true;
                     }
                  }
               }
               else
               {
                  return ArenaService.ins.histTopRank <= _loc3_[1];
               }
            }
            else if(ChapterModel.ins.getStarGetTotalCnt(1) >= _loc3_[1])
            {
               return true;
            }
         }
         else if(PlayerModel.ins.level >= _loc3_[1])
         {
            return true;
         }
         return false;
      }
      
      public static function getLocaleStr(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(StringUtils.isNull(param1) == true)
         {
            return "";
         }
         var _loc3_:Array = param1.split(":");
         if(_loc3_[0] == 11200199)
         {
            _loc2_ = HeroAwakenRoadModel.ins.getNodeByNodeId(_loc3_[1]);
            _loc4_ = StcMgr.ins.getConstellationPageVo(_loc2_.stcVo.map_id);
            if(_loc2_)
            {
               return LocaleMgr.ins.getStr(_loc3_[0],[_loc4_.sort,_loc2_.sort]);
            }
            return "";
         }
         return LocaleMgr.ins.getStr(_loc3_[0],[_loc3_[1]]);
      }
      
      public static function getParamValue(param1:String) : int
      {
         if(StringUtils.isNull(param1) == true)
         {
            return 0;
         }
         var _loc2_:Array = param1.split(":");
         return _loc2_[1];
      }
   }
}
