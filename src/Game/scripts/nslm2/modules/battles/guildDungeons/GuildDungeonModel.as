package nslm2.modules.battles.guildDungeons
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import proto.FamilyStageEnterChapterRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.FamilyStageNodeInfo;
   import com.mz.core.event.MzEvent;
   import proto.FamilyStageRecordRes;
   import proto.FamilyStageFightEndNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.GetReward;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class GuildDungeonModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.battles.guildDungeons.GuildDungeonModel;
       
      
      public var todayChapterId:int;
      
      public var tomorrowChapterId:int;
      
      public var damageRankArr:Array;
      
      public var nextResetTime:int;
      
      public var maxClearChapterId:int;
      
      public var maxCanFightChapterId:int;
      
      public var treasureCnt:int;
      
      public var treasureDic:DictHash;
      
      public var hasRewarded:Boolean;
      
      public var panel3D:UIPanel3D;
      
      private var _nodeDic:DictHash;
      
      private var _stcChapterVoArr:Array;
      
      private var _initTreasureDic:DictHash;
      
      private var stageBtlGuideInfos:DictHash;
      
      public function GuildDungeonModel()
      {
         stageBtlGuideInfos = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.guildDungeons.GuildDungeonModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.guildDungeons.GuildDungeonModel();
         }
         return _ins;
      }
      
      public function parse(param1:FamilyStageEnterChapterRes) : void
      {
         _nodeDic = new DictHash();
         todayChapterId = param1.chapterinfo.curchapter;
         tomorrowChapterId = param1.chapterinfo.mingrichapter;
         maxClearChapterId = param1.chapterinfo.highchapter;
         maxCanFightChapterId = maxClearChapterId == 0?todayChapterId:int(this.getNextChapterId(maxClearChapterId));
         nextResetTime = param1.chapterinfo.nextresettime;
         treasureCnt = param1.maxrewardcount;
         hasRewarded = param1.hasgotreward;
         NpcFuncService.ins.changeCount(40720,param1.freetimes);
         var _loc4_:int = 0;
         var _loc3_:* = param1.chapterinfo.nodeinfos;
         for each(var _loc2_ in param1.chapterinfo.nodeinfos)
         {
            _nodeDic.put(_loc2_.nodeid,_loc2_);
         }
         this.dispatchEvent(new MzEvent("evtGetInfoCpl"));
      }
      
      public function getStageBtlGuideInfo(param1:int) : FamilyStageRecordRes
      {
         var _loc2_:FamilyStageRecordRes = stageBtlGuideInfos.getValue(param1);
         if(_loc2_ == null)
         {
            _loc2_ = new FamilyStageRecordRes();
            return new FamilyStageRecordRes();
         }
         return _loc2_;
      }
      
      public function addStageBtlGuideInfo(param1:int, param2:FamilyStageRecordRes) : void
      {
         stageBtlGuideInfos.put(param1,param2);
      }
      
      public function getFlagState(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_ = 1;
               break;
            case 1:
               _loc2_ = 1;
               break;
            case 2:
               _loc2_ = 3;
         }
         return _loc2_;
      }
      
      public function isAllCleared() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = _nodeDic.array;
         for each(var _loc1_ in _nodeDic.array)
         {
            if(_loc1_.state != 3)
            {
               return false;
            }
         }
         return true;
      }
      
      public function getNodeInfo(param1:int) : FamilyStageNodeInfo
      {
         return _nodeDic.getValue(param1);
      }
      
      public function changeNodeState(param1:int, param2:int) : void
      {
         var _loc3_:FamilyStageNodeInfo = _nodeDic.getValue(param1);
         _loc3_.state = param2;
      }
      
      public function onNodeInfoChange(param1:FamilyStageFightEndNotify) : void
      {
         var _loc2_:FamilyStageNodeInfo = _nodeDic.getValue(param1.nodeid);
         changeNodeState(param1.nodeid,param1.state);
         _loc2_.hps = param1.hps;
         ObserverMgr.ins.sendNotice("evtNodeInfoChanged");
      }
      
      public function get stcChapterVoArr() : Array
      {
         var _loc1_:* = null;
         if(_stcChapterVoArr == null)
         {
            _loc1_ = StcMgr.ins.getFamilyStageChapterTable().array;
            return _loc1_;
         }
         return _stcChapterVoArr;
      }
      
      public function parseRank(param1:Array) : void
      {
         damageRankArr = param1.sortOn("hurt",2 | 16);
         this.dispatchEvent(new MzEvent("evtGetRankCpl"));
      }
      
      public function parseTreasure(param1:Array) : void
      {
         treasureDic = initTreasureDic;
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            treasureDic.put(_loc2_.position,_loc2_);
         }
         this.dispatchEvent(new MzEvent("evtGetTreasureInfoCpl"));
      }
      
      public function getAceRewardArr() : Array
      {
         var _loc5_:* = null;
         var _loc1_:* = null;
         var _loc3_:Array = [];
         var _loc4_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(this.todayChapterId);
         var _loc7_:Array = WealthUtil.costStrToArr(_loc4_.showreward);
         var _loc6_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_;
         for each(var _loc2_ in _loc7_)
         {
            _loc5_ = getRewardInfoByWealthVo(_loc2_,_loc6_);
            if(_loc5_ != null && Uint64Util.indexOfArray(_loc6_,_loc5_.playerid) == -1)
            {
               _loc6_.push(_loc5_.playerid);
               _loc3_.push(_loc5_);
            }
            else
            {
               _loc1_ = new GetReward();
               _loc1_.count = _loc2_.showCount;
               _loc1_.id = _loc2_.sid;
               _loc1_.kind = _loc2_.kind;
               _loc3_.push(_loc1_);
            }
         }
         return _loc3_;
      }
      
      public function onTreasureChangeOne(param1:GetReward) : void
      {
         treasureDic.put(param1.position,param1);
         this.dispatchEvent(new MzEvent("evtGetTreasureCpl",param1));
      }
      
      public function get initTreasureDic() : DictHash
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(_initTreasureDic == null)
         {
            _initTreasureDic = new DictHash();
            while(_loc3_ < this.treasureCnt)
            {
               _loc1_ = new GetReward();
               _loc1_.position = _loc3_;
               _initTreasureDic.put(_loc3_,_loc1_);
               _loc3_++;
            }
         }
         _loc2_ = _initTreasureDic.size;
         while(_loc2_ <= treasureCnt)
         {
            _loc1_ = new GetReward();
            _loc1_.position = _loc2_;
            _initTreasureDic.put(_loc2_,_loc1_);
            _loc2_++;
         }
         return _initTreasureDic;
      }
      
      public function getRewardInfoByWealthVo(param1:WealthVo, param2:Array = null) : GetReward
      {
         var _loc5_:int = 0;
         var _loc4_:* = treasureDic.array;
         for each(var _loc3_ in treasureDic.array)
         {
            if(_loc3_.id == param1.sid && _loc3_.kind == param1.kind && _loc3_.count == param1.count)
            {
               if(!(param2 && Uint64Util.indexOfArray(param2,_loc3_.playerid) != -1))
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function canRewardTreasure() : Boolean
      {
         return this.isAllCleared() && !hasRewarded;
      }
      
      public function getNodeLeftHpPer(param1:int) : Number
      {
         return getNodeLeftHp(param1) / getNodeTotalHp(param1);
      }
      
      public function getNodeTotalHp(param1:int) : Number
      {
         var _loc4_:* = 0;
         var _loc2_:FamilyStageNodeInfo = this.getNodeInfo(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.maxhps;
         for each(var _loc3_ in _loc2_.maxhps)
         {
            _loc4_ = uint(_loc4_ + _loc3_);
         }
         return _loc4_;
      }
      
      public function getNodeLeftHp(param1:int) : Number
      {
         var _loc3_:* = 0;
         var _loc2_:FamilyStageNodeInfo = this.getNodeInfo(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.hps;
         for each(var _loc4_ in _loc2_.hps)
         {
            _loc3_ = uint(_loc3_ + _loc4_);
         }
         return _loc3_;
      }
      
      public function getNextChapterId(param1:int) : int
      {
         var _loc3_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(param1);
         var _loc2_:StcFamilyStageChapterVo = StcMgr.ins.getVoByColumnValue("static_family_stage_chapter","sort",_loc3_.sort + 1);
         if(_loc2_)
         {
            return _loc2_.id;
         }
         return param1;
      }
      
      public function getTomorrowTargetId() : int
      {
         return !!tomorrowChapterId?tomorrowChapterId:int(maxClearChapterId == 0?todayChapterId:int(maxClearChapterId));
      }
      
      public function chapterCanFight(param1:int) : Boolean
      {
         return this.guildLevelSatisfied(param1) && this.preChapterCleared(param1);
      }
      
      public function guildLevelSatisfied(param1:int) : Boolean
      {
         var _loc2_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(param1);
         return GuildModel.ins.guildInfo.lv >= _loc2_.reqlevel;
      }
      
      public function preChapterCleared(param1:int) : Boolean
      {
         var _loc2_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(param1);
         var _loc3_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(this.maxCanFightChapterId);
         if(_loc3_ == null)
         {
            return true;
         }
         return _loc2_.sort <= _loc3_.sort;
      }
      
      public function chapterCondStr(param1:int) : String
      {
         var _loc2_:String = "";
         var _loc3_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(param1);
         if(this.chapterCanFight(param1) == false)
         {
            if(preChapterCleared(param1) == false)
            {
               _loc2_ = _loc2_ + (LocaleMgr.ins.getStr(40710513,[LocaleMgr.ins.getStr(StcMgr.ins.getFamilyStageChapterVo(_loc3_.prechapter).name)]) + "\r\n");
            }
            if(guildLevelSatisfied(param1) == false)
            {
               _loc2_ = _loc2_ + (LocaleMgr.ins.getStr(40710514,[LocaleConsts.lvStr(_loc3_.reqlevel)]) + "\r\n");
            }
            return _loc2_;
         }
         return null;
      }
      
      public function nowBuffArr() : Array
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _nodeDic.array;
         for each(var _loc1_ in _nodeDic.array)
         {
            if(_loc1_.state == 3 && _loc1_.buffid)
            {
               _loc2_.push(_loc1_.buffid);
            }
         }
         return _loc2_;
      }
      
      public function allBuffArr() : Array
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _nodeDic.array;
         for each(var _loc1_ in _nodeDic.array)
         {
            if(_loc1_.buffid)
            {
               _loc2_.push(_loc1_.buffid);
            }
         }
         return _loc2_;
      }
   }
}
