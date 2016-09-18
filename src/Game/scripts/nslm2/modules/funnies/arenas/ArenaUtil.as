package nslm2.modules.funnies.arenas
{
   import nslm2.common.vo.PlayerVo;
   import proto.PlayerArenaInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import proto.PlayerShenYuanInfo;
   import proto.FamilyStageRank;
   import proto.ArenaChallengeRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.common.model.ChangePlayerWealthVo;
   import proto.ArenaReport;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.arenas.mains.ArenaSigatueModule;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ArenaClearCdDiamondRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ArenaUtil
   {
      
      private static var _ins:nslm2.modules.funnies.arenas.ArenaUtil;
       
      
      public function ArenaUtil()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.arenas.ArenaUtil
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.arenas.ArenaUtil();
         }
         return _ins;
      }
      
      public static function playerArenaInfoToPlayerVo(param1:PlayerArenaInfo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.uid;
         _loc2_.baseId = param1.stcNpcId;
         _loc2_.fightValue = Uint64Util.toNumber(param1.ability);
         _loc2_.level = param1.level;
         _loc2_.name = param1.name;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.uid,param1.stcNpcId);
         _loc2_.militaryRank = param1.militaryRank;
         _loc2_.disID = param1.dist;
         return _loc2_;
      }
      
      public static function playerSYInfoToPlayerVo(param1:PlayerShenYuanInfo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.uid;
         _loc2_.baseId = param1.stcNpcId;
         _loc2_.fightValue = Uint64Util.toNumber(param1.ability);
         _loc2_.level = param1.level;
         _loc2_.name = param1.name;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.uid,param1.stcNpcId);
         return _loc2_;
      }
      
      public static function playerGuildDungeonToPlayerVo(param1:FamilyStageRank) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.playerid;
         _loc2_.baseId = param1.baseid;
         _loc2_.name = param1.name;
         _loc2_.level = param1.playerlevel;
         _loc2_.militaryRank = param1.militaryrank;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.playerid,param1.baseid);
         return _loc2_;
      }
      
      public static function initArenaChallengeResultVo(param1:uint, param2:ArenaChallengeRes, param3:ServerEvent) : void
      {
         var _loc4_:* = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2.isWin)
         {
            _loc4_ = ArenaService.ins.infoRes.histTopRank - param2.histTopRank > 0;
            var _loc9_:int = 0;
            var _loc8_:* = param3.dataNotifyCacheVo.change.wealthArr;
            for each(var _loc7_ in param3.dataNotifyCacheVo.change.wealthArr)
            {
               if(_loc7_.kind == 3)
               {
                  _loc5_ = _loc7_.count;
                  break;
               }
            }
            _loc6_ = ArenaService.ins.infoRes.rank - param1;
            ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO = new ArenaChallengeResultVo(param1,_loc6_,_loc5_,_loc4_,param2.isWin);
         }
         else
         {
            ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO = new ArenaChallengeResultVo(0,0,0,false,param2.isWin);
         }
      }
      
      public static function eventContent(param1:ArenaReport) : String
      {
         var _loc2_:int = 0;
         if(param1.isAttacker)
         {
            if(param1.isWin)
            {
               if(param1.isRankChange)
               {
                  _loc2_ = 50200602;
               }
               else
               {
                  _loc2_ = 50200605;
               }
            }
            else
            {
               _loc2_ = 50200601;
            }
         }
         else if(param1.isWin)
         {
            _loc2_ = 50200604;
         }
         else if(param1.isRankChange)
         {
            _loc2_ = 50200603;
         }
         else
         {
            _loc2_ = 50200606;
         }
         return LocaleMgr.ins.getStr(_loc2_,[param1.player,param1.rank]);
      }
      
      public function showChangeSigatue() : void
      {
         AlertUtil.comfirm(new ArenaSigatueModule());
      }
      
      public function toClearCD() : void
      {
         ServerEngine.ins.send(4033,null,server_clearCDDiamond_cpl);
      }
      
      private function server_clearCDDiamond_cpl(param1:ArenaClearCdDiamondRes) : void
      {
         AlertUtil.comfirm(LocaleMgr.ins.getStr(50200013,[param1.diamond]),clearCD_yes,null,null,null,null,null);
      }
      
      private function clearCD_yes() : void
      {
         ServerEngine.ins.send(4032,null,server_clearCD_cpl);
      }
      
      private function server_clearCD_cpl() : void
      {
         ArenaService.ins.changeCD(0);
         AlertUtil.float(LocaleMgr.ins.getStr(50200026));
      }
      
      public function showBattleResult() : void
      {
         var _loc1_:ArenaChallengeResultVo = ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO;
         if(_loc1_)
         {
            if(_loc1_.isWin)
            {
               if(_loc1_.isFirstToRank && _loc1_.rewardDiamond > 0)
               {
                  ModuleMgr.ins.showModule(50230,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
               }
               else if(_loc1_.upedRank > 0)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50200703,[_loc1_.challengeRank]));
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50200701));
               }
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50200702));
            }
            ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO = null;
         }
      }
   }
}
