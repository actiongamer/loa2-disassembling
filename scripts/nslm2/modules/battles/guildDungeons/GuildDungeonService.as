package nslm2.modules.battles.guildDungeons
{
   import proto.FamilyStageChapterSelectReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyStageChapterSelectRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyStageGetRewardReq;
   import proto.FamilyStageGetRewardRes;
   import proto.FamilyStageEnterChapterReq;
   import proto.FamilyStageEnterChapterRes;
   import proto.FamilyStageRewardInfoReq;
   import proto.FamilyStageRewardInfoRes;
   import proto.FamilyStageHurtRankReq;
   import proto.FamilyStageHurtRankRes;
   import proto.FamilyStageFightStartReq;
   import proto.FamilyStageFightStartRes;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyStageYuKouStartReq;
   import proto.FamilyStageYuKouStartRes;
   
   public class GuildDungeonService
   {
      
      private static var _ins:nslm2.modules.battles.guildDungeons.GuildDungeonService;
       
      
      private var _treasurePos:uint;
      
      private var _sendNodeId:int;
      
      public function GuildDungeonService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.guildDungeons.GuildDungeonService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.guildDungeons.GuildDungeonService();
         }
         return _ins;
      }
      
      public function familyStageChapterSelect(param1:int) : void
      {
         var _loc2_:FamilyStageChapterSelectReq = new FamilyStageChapterSelectReq();
         _loc2_.chapterId = param1;
         ServerEngine.ins.send(7144,_loc2_,server_chapterSelect_cpl);
      }
      
      private function server_chapterSelect_cpl(param1:FamilyStageChapterSelectRes, param2:ServerEvent) : void
      {
         var _loc3_:* = null;
         if(param1.mingrichapterid)
         {
            _loc3_ = StcMgr.ins.getFamilyStageChapterVo(param1.mingrichapterid);
            AlertUtil.float(LocaleMgr.ins.getStr(40710502) + LocaleMgr.ins.getStr(_loc3_.name));
            GuildDungeonModel.ins.tomorrowChapterId = param1.mingrichapterid;
         }
      }
      
      public function familyStageGetReward(param1:uint) : void
      {
         var _loc2_:FamilyStageGetRewardReq = new FamilyStageGetRewardReq();
         _loc2_.position = param1;
         _treasurePos = param1;
         ServerEngine.ins.send(7145,_loc2_,server_getReward_cpl);
      }
      
      private function server_getReward_cpl(param1:FamilyStageGetRewardRes, param2:ServerEvent) : void
      {
         GuildDungeonModel.ins.onTreasureChangeOne(param1.reward);
      }
      
      public function familyStageEnterChapter() : void
      {
         var _loc1_:FamilyStageEnterChapterReq = new FamilyStageEnterChapterReq();
         ServerEngine.ins.send(7150,_loc1_,server_enterChapter_cpl);
      }
      
      private function server_enterChapter_cpl(param1:FamilyStageEnterChapterRes, param2:ServerEvent) : void
      {
         GuildDungeonModel.ins.parse(param1);
      }
      
      public function familyStageRewardInfo() : void
      {
         var _loc1_:FamilyStageRewardInfoReq = new FamilyStageRewardInfoReq();
         ServerEngine.ins.send(7148,_loc1_,server_rewardInfo_cpl);
      }
      
      private function server_rewardInfo_cpl(param1:FamilyStageRewardInfoRes, param2:ServerEvent) : void
      {
         if(param1)
         {
            GuildDungeonModel.ins.parseTreasure(param1.rewardinfo);
         }
         else
         {
            GuildDungeonModel.ins.parseTreasure([]);
         }
      }
      
      public function familyDamageRank() : void
      {
         var _loc1_:FamilyStageHurtRankReq = new FamilyStageHurtRankReq();
         ServerEngine.ins.send(7155,_loc1_,server_damageRank_cpl);
      }
      
      private function server_damageRank_cpl(param1:FamilyStageHurtRankRes) : void
      {
         if(param1)
         {
            GuildDungeonModel.ins.parseRank(param1.rank);
         }
         else
         {
            GuildDungeonModel.ins.parseRank([]);
         }
      }
      
      public function normalFightStart(param1:int) : void
      {
         var _loc2_:FamilyStageFightStartReq = new FamilyStageFightStartReq();
         _loc2_.nodeid = param1;
         ServerEngine.ins.send(7151,_loc2_,serverCpl_familyStageFightStart);
      }
      
      private function serverCpl_familyStageFightStart(param1:FamilyStageFightStartRes) : void
      {
         var _loc2_:* = null;
         GlobalRef.mainCityReshowParam.needShowGuildDungeon = true;
         _loc2_ = new GuildDungeonVo(param1.nodeid);
         _loc2_.res = param1;
         ModuleMgr.ins.showModule(40721,{"vo":_loc2_});
      }
      
      public function yukouFightStart(param1:int) : void
      {
         var _loc2_:FamilyStageYuKouStartReq = new FamilyStageYuKouStartReq();
         _loc2_.nodeid = param1;
         _sendNodeId = param1;
         ServerEngine.ins.send(7153,_loc2_,serverCpl_familyYukouStageFightStart);
      }
      
      private function serverCpl_familyYukouStageFightStart(param1:FamilyStageYuKouStartRes) : void
      {
         var _loc2_:* = null;
         GlobalRef.mainCityReshowParam.needShowGuildDungeon = true;
         _loc2_ = new GuildDungeonVo(_sendNodeId);
         _loc2_.res = param1;
         ModuleMgr.ins.showModule(40725,{"vo":_loc2_});
      }
   }
}
