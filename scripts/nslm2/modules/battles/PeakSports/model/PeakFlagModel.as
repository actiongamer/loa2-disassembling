package nslm2.modules.battles.PeakSports.model
{
   import proto.BkGameStageInfoNotify;
   import com.mz.core.utils.DictHash;
   import proto.BkStageResInfo;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import proto.BkGameTeamInfo;
   
   public class PeakFlagModel
   {
      
      private static var _ins:nslm2.modules.battles.PeakSports.model.PeakFlagModel;
       
      
      private var _bkGameStageInfoNotify:BkGameStageInfoNotify;
      
      private var _flagOwnerIdArr:Array;
      
      public var flagOwnerDic:DictHash;
      
      public var playerFlagDic:DictHash;
      
      public var flagResetCDDic:DictHash;
      
      public var crtKillMonster:int;
      
      private var _leftMonsterCnt:int;
      
      public function PeakFlagModel()
      {
         _flagOwnerIdArr = [];
         flagOwnerDic = new DictHash();
         playerFlagDic = new DictHash();
         flagResetCDDic = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.PeakSports.model.PeakFlagModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.PeakSports.model.PeakFlagModel();
         }
         return _ins;
      }
      
      public function getStageResInfo(param1:int) : BkStageResInfo
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bkGameStageInfoNotify.resInfos;
         for each(var _loc2_ in this.bkGameStageInfoNotify.resInfos)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addMykilledByOne() : void
      {
         this.bkGameStageInfoNotify.myInfo.killNum++;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addMyAssistedByOne() : void
      {
         this.bkGameStageInfoNotify.myInfo.assistNum++;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addTeamKilled(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bkGameStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bkGameStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.killNum = Number(_loc2_.killNum) + 1;
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function addPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bkGameStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bkGameStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) + 1;
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function minusPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bkGameStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bkGameStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) - 1;
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function get flagOwnerIdArr() : Array
      {
         return _flagOwnerIdArr;
      }
      
      public function get bkGameStageInfoNotify() : BkGameStageInfoNotify
      {
         return _bkGameStageInfoNotify;
      }
      
      public function set bkGameStageInfoNotify(param1:BkGameStageInfoNotify) : void
      {
         if(_bkGameStageInfoNotify != param1 && param1.myInfo == null && _bkGameStageInfoNotify != null)
         {
            param1.myInfo = _bkGameStageInfoNotify.myInfo;
         }
         _bkGameStageInfoNotify = param1;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function dispose() : void
      {
         _flagOwnerIdArr = [];
         flagOwnerDic.clear();
         playerFlagDic.clear();
         flagResetCDDic.clear();
         _bkGameStageInfoNotify = null;
      }
   }
}
