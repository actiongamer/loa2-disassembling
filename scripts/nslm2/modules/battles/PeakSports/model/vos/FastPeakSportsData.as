package nslm2.modules.battles.PeakSports.model.vos
{
   import com.netease.protobuf.UInt64;
   import proto.PlayerBaseInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   
   public class FastPeakSportsData
   {
       
      
      public var name:String;
      
      public var playerId:UInt64;
      
      public var miliRank:int;
      
      public var npcID:int;
      
      public var level:int;
      
      public var fightValue:UInt64;
      
      public var side:int;
      
      public var conDeathNum:int;
      
      public var sideKillNpcNum:int;
      
      public function FastPeakSportsData()
      {
         super();
      }
      
      public function parsePlayerBaseInfo(param1:PlayerBaseInfo) : void
      {
         if(param1)
         {
            name = param1.name;
            playerId = param1.id;
            miliRank = param1.militaryRank;
            npcID = param1.npcId;
            level = param1.lv;
            fightValue = param1.ability;
         }
      }
      
      public function initToSelf() : void
      {
         this.name = PlayerModel.ins.getSelfFullNameWithDistName(false);
         this.level = PlayerModel.ins.level;
         this.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         this.playerId = PlayerModel.ins.playerInfo.id;
         this.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         this.miliRank = PlayerModel.ins.playerInfo.militaryrank;
      }
   }
}
