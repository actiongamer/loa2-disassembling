package nslm2.modules.foundations.guildModule.util
{
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.FamilyMember;
   import nslm2.utils.Uint64Util;
   
   public class GuildUtil
   {
      
      public static const JOIN_CD:int = 43200;
      
      private static var clearCDCallBack:Function;
       
      
      public function GuildUtil()
      {
         super();
      }
      
      public static function checkJoinGuildCD(param1:Function) : Boolean
      {
         clearCDCallBack = param1;
         if(GuildModel.ins.exitTimeStamp)
         {
            if(getApplyCD() > 0)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(999000273,[TimeUtils.getSimpleTimeStr(getApplyCD()),getClearJoinCDCost()]),doClearApplyCD);
               return true;
            }
         }
         return false;
      }
      
      private static function getClearJoinCDCost() : int
      {
         return 100;
      }
      
      private static function getApplyCD() : int
      {
         var _loc1_:Number = ServerTimer.ins.second;
         return 43200 - (_loc1_ - GuildModel.ins.exitTimeStamp);
      }
      
      private static function doClearApplyCD() : void
      {
         GuildServiceHandler.ins.clearCD(clearCDCallBack);
      }
      
      public static function getPostName(param1:int) : String
      {
         return LocaleMgr.ins.getStr(StcMgr.ins.getGonghuiZhiweiVo(param1).name);
      }
      
      public static function getFlagBgUrl(param1:int) : String
      {
         if(param1 == 0)
         {
            param1 = 1;
         }
         return UrlLib.guildFlagBg(StcMgr.ins.getGonghuiFlagVo(param1).icon);
      }
      
      public static function getFlagIconUrl(param1:int) : String
      {
         if(param1 == 0)
         {
            param1 = 4;
         }
         return UrlLib.guildFlagPattern(StcMgr.ins.getGonghuiFlagVo(param1).icon);
      }
      
      public static function sortMemberList(param1:FamilyMember, param2:FamilyMember) : int
      {
         if(param1.online && !param2.online)
         {
            return 1;
         }
         if(!param1.online && param2.online)
         {
            return -1;
         }
         if(param1.highPost > param2.highPost)
         {
            return -1;
         }
         if(param1.highPost < param2.highPost)
         {
            return 1;
         }
         if(param1.post > param2.post)
         {
            return -1;
         }
         if(param1.post < param2.post)
         {
            return 1;
         }
         if(Uint64Util.toInt(param1.ability) > Uint64Util.toInt(param2.ability))
         {
            return -1;
         }
         return 1;
      }
   }
}
