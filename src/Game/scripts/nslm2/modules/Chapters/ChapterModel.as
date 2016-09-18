package nslm2.modules.Chapters
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import proto.StageInfo;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import proto.ChapterInfo;
   import proto.StageBtlGuideRes;
   import nslm2.modules.foundations.worldMap.WorlMapUtil;
   import nslm2.common.ui.components.comps2d.McS2;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.LocalData;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.WealthUtil;
   
   public class ChapterModel
   {
      
      private static var _ins:nslm2.modules.Chapters.ChapterModel;
       
      
      public var chapterType:int = 1;
      
      public var nowShowinginfoId:int;
      
      private var _stcChapterVoDic:DictHash;
      
      private var _stcStageVoDic:DictHash;
      
      private var processInfos:DictHash;
      
      private var preProcessInfos:DictHash;
      
      public var preStageId:uint = 101;
      
      private var rewardInfos:DictHash;
      
      private var stageBtlGuideInfos:DictHash;
      
      private var openBoxInfos:DictHash;
      
      public var cplIdArrDic:DictHash;
      
      public var cplIdDic:DictHash;
      
      public var newOpenStageIdDic:DictHash;
      
      public var nextStageIdDic:DictHash;
      
      public var newChapterIdDic:DictHash;
      
      private var _lastOpenChapterIdDict:DictHash;
      
      public function ChapterModel()
      {
         _stcChapterVoDic = new DictHash();
         _stcStageVoDic = new DictHash();
         processInfos = new DictHash();
         stageBtlGuideInfos = new DictHash();
         openBoxInfos = new DictHash();
         cplIdArrDic = new DictHash();
         cplIdDic = new DictHash();
         newOpenStageIdDic = new DictHash();
         nextStageIdDic = new DictHash();
         newChapterIdDic = new DictHash();
         _lastOpenChapterIdDict = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.Chapters.ChapterModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.Chapters.ChapterModel();
         }
         return _ins;
      }
      
      public function get stcChapterVoArr() : Array
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Array = _stcChapterVoDic.getValue(chapterType);
         if(_loc3_ == null)
         {
            _loc3_ = [];
            _loc4_ = StcMgr.ins.getVoArrByColumnValue("static_chapter","kind",chapterType);
            _loc4_.sortOn("sort",16);
            var _loc6_:int = 0;
            var _loc5_:* = _loc4_;
            for each(var _loc1_ in _loc4_)
            {
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc1_.id,1]);
               if(_loc2_ != null)
               {
                  _loc3_.push(_loc1_);
               }
            }
            _stcChapterVoDic.put(chapterType,_loc3_);
            return _loc3_;
         }
         return _loc3_;
      }
      
      public function getStageInfo(param1:int) : StageInfo
      {
         return processInfos.getValue(param1);
      }
      
      public function resetPreProcessInfos() : void
      {
         this.preProcessInfos = this.processInfos;
      }
      
      public function getStageMaxResetTimes(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(!(int(_loc2_.kind) - 3))
         {
            _loc3_ = VipModel.ins.getVipValue(10110);
         }
         else
         {
            _loc3_ = VipModel.ins.getVipValue(10100);
         }
         return _loc3_;
      }
      
      public function addStageInfoCount(param1:int, param2:int) : void
      {
         (processInfos.getValue(param1) as StageInfo).count = (processInfos.getValue(param1) as StageInfo).count + param2;
      }
      
      public function addStageResetCount(param1:int) : void
      {
         (processInfos.getValue(param1) as StageInfo).resetCount++;
      }
      
      public function getStcStageVoArr(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc2_:* = _stcStageVoDic.getValue(param1);
         if(_loc2_ == null)
         {
            switch(int(param1) - 1)
            {
               case 0:
                  _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_stage","kind",1);
                  _loc3_ = _loc3_.concat(StcMgr.ins.getVoArrByColumnValue("static_stage","kind",2));
                  _loc3_.sortOn(["chapter_id","sort"],16);
                  _stcStageVoDic.put(param1,_loc3_);
                  _loc2_ = _loc3_;
                  break;
               case 1:
                  _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_stage","kind",3);
                  _loc3_.sortOn(["chapter_id","sort"],16);
                  _stcStageVoDic.put(param1,_loc3_);
                  _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public function getStageResetDiamond(param1:int) : int
      {
         var _loc5_:* = null;
         var _loc2_:uint = nslm2.modules.Chapters.ChapterModel.ins.getStageInfo(param1).resetCount;
         var _loc4_:uint = nslm2.modules.Chapters.ChapterModel.ins.getStageMaxResetTimes(param1) - _loc2_;
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(!(int(_loc3_.kind) - 3))
         {
            _loc5_ = DefindConsts.HEROSTAGE_RESET_COST.split("|");
         }
         else
         {
            _loc5_ = DefindConsts.STAGE_RESET_COST.split("|");
         }
         if(_loc2_ < _loc5_.length)
         {
            return WealthVo.parseCostStr(_loc5_[_loc2_]).count;
         }
         return WealthVo.parseCostStr(_loc5_[_loc5_.length - 1]).count;
      }
      
      public function minusStageInfoCount(param1:int, param2:int = 0) : void
      {
         if(param2 == 0)
         {
            (processInfos.getValue(param1) as StageInfo).count = 0;
         }
         else
         {
            (processInfos.getValue(param1) as StageInfo).count = (processInfos.getValue(param1) as StageInfo).count - param2;
         }
      }
      
      public function getStageInfoCount(param1:int) : int
      {
         var _loc2_:StageInfo = this.getStageInfo(param1);
         if(_loc2_)
         {
            return _loc2_.count;
         }
         return 0;
      }
      
      public function getLeftInfoCount(param1:int) : int
      {
         var _loc2_:StageInfo = this.getStageInfo(param1);
         var _loc3_:int = StcMgr.ins.getStageVo(param1).daily_free_time;
         if(_loc2_)
         {
            return _loc3_ - _loc2_.count;
         }
         return _loc3_;
      }
      
      public function getStageInfoStar(param1:int) : int
      {
         var _loc2_:StageInfo = this.getStageInfo(param1);
         if(_loc2_ && StcMgr.ins.getStageVo(param1).kind != 1)
         {
            return _loc2_.star;
         }
         return 0;
      }
      
      public function getPreStageInfoStar(param1:int) : int
      {
         var _loc2_:StageInfo = this.getPreStageInfo(param1);
         if(_loc2_ && StcMgr.ins.getStageVo(param1).kind != 1)
         {
            return _loc2_.star;
         }
         return 0;
      }
      
      public function getPreStageInfo(param1:int) : StageInfo
      {
         return preProcessInfos.getValue(param1);
      }
      
      public function chapterStarCntAdd() : uint
      {
         var _loc2_:uint = this.getPreStageInfoStar(this.preStageId);
         var _loc1_:uint = this.getStageInfoStar(this.preStageId);
         if(_loc1_ - _loc2_ > 0)
         {
            return _loc1_ - _loc2_;
         }
         return 0;
      }
      
      public function getChapterInfo(param1:int) : ChapterInfo
      {
         return rewardInfos.getValue(param1);
      }
      
      public function getStageBtlGuideInfo(param1:int) : StageBtlGuideRes
      {
         return stageBtlGuideInfos.getValue(param1);
      }
      
      public function addStageBtlGuideInfo(param1:int, param2:StageBtlGuideRes) : void
      {
         stageBtlGuideInfos.put(param1,param2);
      }
      
      public function getRewardStep(param1:int) : int
      {
         var _loc2_:ChapterInfo = this.getChapterInfo(param1);
         if(_loc2_)
         {
            return _loc2_.step;
         }
         return 0;
      }
      
      public function getOpenBoxInfo(param1:int) : Boolean
      {
         return openBoxInfos.getValue(param1);
      }
      
      public function setOpenBoxInfo(param1:int, param2:Boolean) : void
      {
         openBoxInfos.put(param1,param2);
      }
      
      public function get nextId() : int
      {
         return nextStageIdDic.getValue(this.chapterType);
      }
      
      public function get nextDGVo() : StcStageVo
      {
         if(this.nextId > 0)
         {
            return StcMgr.ins.getStageVo(this.nextId);
         }
         return StcMgr.ins.getStageVo(this.cplId);
      }
      
      public function get nextChapterId() : int
      {
         if(this.nextDGVo)
         {
            return this.nextDGVo.chapter_id;
         }
         return StcMgr.ins.getStageVo(this.cplId).chapter_id;
      }
      
      public function get nextChapterVo() : StcChapterVo
      {
         return StcMgr.ins.getChapterVo(this.nextChapterId);
      }
      
      public function get newChapterId() : int
      {
         return newChapterIdDic.getValue(this.chapterType);
      }
      
      public function set newChapterId(param1:int) : void
      {
         newChapterIdDic.put(this.chapterType,param1);
      }
      
      public function get newOpenStageId() : int
      {
         return newOpenStageIdDic.getValue(this.chapterType);
      }
      
      public function set newOpenStageId(param1:int) : void
      {
         newOpenStageIdDic.put(this.chapterType,param1);
      }
      
      public function get cplId() : int
      {
         return cplIdDic.getValue(this.chapterType);
      }
      
      public function get cplIdArr() : Array
      {
         return cplIdArrDic.getValue(this.chapterType);
      }
      
      public function get lastOpenChapterId() : int
      {
         var _loc1_:int = _lastOpenChapterIdDict.getValue(this.chapterType);
         return !!_loc1_?_loc1_:int(nextChapterId);
      }
      
      public function set lastOpenChapterId(param1:int) : void
      {
         _lastOpenChapterIdDict.put(this.chapterType,param1);
      }
      
      public function parse(param1:Array) : void
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         param1.sortOn(StageInfo.STAGEID.name,16);
         this.preProcessInfos = this.processInfos;
         var _loc7_:Array = cplIdArrDic.getValue(1);
         var _loc9_:Array = cplIdArrDic.getValue(2);
         if(_loc7_ == null)
         {
            _loc7_ = [];
         }
         if(_loc9_ == null)
         {
            _loc9_ = [];
         }
         var _loc6_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = param1[_loc8_];
            this.processInfos.put(_loc5_.stageId,_loc5_);
            if(_loc5_.star > 0)
            {
               _loc3_ = StcMgr.ins.getStageVo(_loc5_.stageId);
               if(_loc3_.kind == 3)
               {
                  if(_loc9_.indexOf(_loc5_.stageId) == -1)
                  {
                     _loc9_.push(_loc5_.stageId);
                  }
               }
               else if(_loc7_.indexOf(_loc5_.stageId) == -1)
               {
                  _loc7_.push(_loc5_.stageId);
               }
            }
            this.openBoxInfos.put(_loc5_.stageId,_loc5_.openBox);
            _loc8_++;
         }
         if(this.preProcessInfos == null)
         {
            this.preProcessInfos = this.processInfos;
         }
         _loc7_.sort(16);
         _loc9_.sort(16);
         var _loc4_:int = _loc7_.length > 0?_loc7_[_loc7_.length - 1]:0;
         var _loc2_:int = _loc9_.length > 0?_loc9_[_loc9_.length - 1]:0;
         WorlMapUtil.checkOpenNewCity(_loc4_);
         cplIdDic.put(1,_loc4_);
         cplIdDic.put(2,_loc2_);
         cplIdArrDic.put(1,_loc7_);
         cplIdArrDic.put(2,_loc9_);
         countNextStageId(1);
         countNextStageId(2);
      }
      
      private function countNextStageId(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc7_:uint = countNextId(cplIdDic.getValue(param1),param1);
         var _loc3_:int = nextStageIdDic.getValue(param1);
         if(_loc3_ != 0 && _loc3_ != _loc7_)
         {
            _loc5_ = _loc7_;
            _loc4_ = StcMgr.ins.getStageVo(_loc5_);
            _loc2_ = StcMgr.ins.getStageVo(cplIdDic.getValue(param1));
            if(_loc4_ && _loc2_ && _loc4_.chapter_id != _loc2_.chapter_id)
            {
               _loc6_ = _loc4_.chapter_id;
            }
         }
         else
         {
            _loc5_ = 0;
            _loc6_ = 0;
         }
         newChapterIdDic.put(param1,_loc6_);
         nextStageIdDic.put(param1,_loc7_);
         newOpenStageIdDic.put(param1,_loc5_);
         McS2.preload(40400000 + nextChapterId);
      }
      
      public function preLoadBg(param1:int) : void
      {
         var _loc9_:* = undefined;
         var _loc8_:StcChapterVo = StcMgr.ins.getChapterVo(param1);
         var _loc7_:StcChapterVo = StcMgr.ins.getVoByColumnValue("static_chapter","sort",_loc8_.sort - 1);
         var _loc5_:int = !!_loc7_?_loc7_.id:0;
         var _loc2_:StcChapterVo = StcMgr.ins.getVoByColumnValue("static_chapter","sort",_loc8_.sort + 1);
         var _loc4_:int = !!_loc2_?_loc2_.id:0;
         var _loc6_:TaskPool = new TaskPool();
         var _loc3_:Array = [_loc5_,param1,_loc4_];
         var _loc12_:int = 0;
         var _loc11_:* = _loc3_;
         for each(var _loc10_ in _loc3_)
         {
            if(_loc10_ != 0)
            {
               _loc9_ = new Vector.<TaskBase>();
               _loc9_.push(new GetResTask(1,UrlLib.chapterMapBg(_loc10_),2));
               _loc6_.addTaskArr(_loc9_);
            }
         }
         _loc6_.stopWhenError = false;
         _loc6_.exec();
      }
      
      public function parseReward(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         this.rewardInfos = new DictHash();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this.rewardInfos.put(_loc2_.id,_loc2_);
            _loc4_++;
         }
      }
      
      public function chapterRewardCpl(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = this.rewardInfos.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = new ChapterInfo();
            _loc3_.id = param1;
            this.rewardInfos.put(_loc3_.id,_loc3_);
            _loc2_ = _loc3_;
         }
         _loc2_.step = Number(_loc2_.step) + 1;
         ObserverMgr.ins.sendNotice("evtChapterRewardInfoCpl");
      }
      
      public function getStarTotalCnt(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         _loc2_ = StcMgr.ins.getVoArrByColumnValue("static_stage","chapter_id",param1);
         _loc2_.sortOn("sort",16);
         while(_loc4_ < _loc2_.length)
         {
            if((_loc2_[_loc4_] as StcStageVo).kind != 1)
            {
               _loc3_ = _loc3_ + DefindConsts.STAR_MAX;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getStarGetCnt(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         _loc2_ = StcMgr.ins.getVoArrByColumnValue("static_stage","chapter_id",param1);
         _loc2_.sortOn("sort",16);
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc3_ + nslm2.modules.Chapters.ChapterModel.ins.getStageInfoStar(_loc2_[_loc4_].id);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getStarGetTotalCnt(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Array = cplIdArrDic.getValue(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc2_ = _loc2_ + nslm2.modules.Chapters.ChapterModel.ins.getStageInfoStar(_loc4_);
         }
         return _loc2_;
      }
      
      public function get needPlayPrevScript() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.nextDGVo.prev_drama_id;
         if(_loc1_ == 0)
         {
            return false;
         }
         if(this.getStageInfo(nextDGVo.id))
         {
            return false;
         }
         _loc2_ = LocalData.getIns(ClientConfig.playId).load("LOCAL_DATA_DG_PREV_SCRIPT_ID",0);
         if(_loc2_ == _loc1_)
         {
            return false;
         }
         return true;
      }
      
      public function needPlayScript(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         if(param1 == 0)
         {
            return false;
         }
         var _loc2_:int = StcMgr.ins.getStageVo(param1).drama_script_1;
         if(_loc2_ == 0)
         {
            return false;
         }
         if(this.getStageInfo(param1) && this.getStageInfo(param1).count > 0)
         {
            return false;
         }
         _loc3_ = LocalData.getIns(ClientConfig.playId).load("LOCAL_DATA_DG_SCRIPT_ID",0);
         if(_loc3_ == _loc2_)
         {
            return false;
         }
         return true;
      }
      
      public function canEnterStage(param1:int, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(PlayerModel.ins.level < _loc6_.unlock_level)
         {
            if(param3)
            {
               AlertUtil.lackLevel(_loc6_.unlock_level);
            }
            return false;
         }
         if(PlayerModel.ins.stamina < _loc6_.drain_stamina && param2)
         {
            if(param3)
            {
               AlertUtil.lackStamina();
            }
            return false;
         }
         if(_loc6_.prev_stage_id != 0 && isStageCpl(_loc6_.prev_stage_id) == false)
         {
            _loc4_ = StcMgr.ins.getStageVo(_loc6_.prev_stage_id);
            _loc5_ = StcMgr.ins.getChapterVo(_loc4_.chapter_id);
            if(param3)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000039,[LocaleMgr.ins.getStr(_loc5_.name) + " " + LocaleMgr.ins.getStr(_loc4_.name)]));
            }
            return false;
         }
         var _loc7_:StcChapterVo = StcMgr.ins.getChapterVo(_loc6_.chapter_id);
         if(nslm2.modules.Chapters.ChapterModel.ins.cplIdArrDic.getValue(_loc7_.kind).indexOf(param1) == -1 && nslm2.modules.Chapters.ChapterModel.ins.nextStageIdDic.getValue(_loc7_.kind) != param1)
         {
            return false;
         }
         return true;
      }
      
      public function isStageCpl(param1:int) : Boolean
      {
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         var _loc4_:StcChapterVo = StcMgr.ins.getChapterVo(_loc2_.chapter_id);
         var _loc3_:Array = this.cplIdArrDic.getValue(_loc4_.kind);
         return _loc3_.indexOf(param1) != -1;
      }
      
      public function isBossStage(param1:int) : Boolean
      {
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_stage","chapter_id",_loc2_.chapter_id);
         _loc3_.sortOn("sort",16);
         if(_loc3_ && ArrayUtil.indexByAttr(_loc3_,"id",param1) == _loc3_.length - 1)
         {
            return true;
         }
         return false;
      }
      
      public function getStageState(param1:int) : int
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(_loc3_.kind == 1)
         {
            if(this.cplIdArr.indexOf(param1) != -1)
            {
               return 4;
            }
            if(this.nextId == param1)
            {
               return 2;
            }
            return 3;
         }
         _loc4_ = StcMgr.ins.getChapterVo(_loc3_.chapter_id);
         _loc2_ = this.cplIdArrDic.getValue(_loc4_.kind);
         if(_loc2_.indexOf(param1) != -1)
         {
            return 1;
         }
         if(this.nextId == param1)
         {
            return 2;
         }
         return 3;
      }
      
      public function getShowDropVoArr(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc5_:Array = WealthUtil.dropGroupIDToWealthVoArr(_loc2_.front_end_drop_id);
         var _loc4_:Array = [];
         var _loc3_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            if(_loc2_.kind == 3 && (_loc5_[_loc6_] as WealthVo).stcItemVo && ChapterConsts.ELITE_NEED_SHOW_DROP_KIND.indexOf((_loc5_[_loc6_] as WealthVo).stcItemVo.kind) != -1)
            {
               _loc4_.push(_loc5_[_loc6_]);
            }
            if(_loc2_.kind == 2 && (_loc5_[_loc6_] as WealthVo).stcItemVo && ChapterConsts.NORMAL_NEED_SHOW_DROP_KIND.indexOf((_loc5_[_loc6_] as WealthVo).stcItemVo.kind) != -1)
            {
               _loc4_.push(_loc5_[_loc6_]);
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      private function countNextId(param1:int, param2:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc7_:Array = getStcStageVoArr(param2);
         if(param1 == 0)
         {
            return (_loc7_[0] as StcStageVo).id;
         }
         _loc4_ = StcMgr.ins.getStageVo(param1);
         _loc8_ = StcMgr.ins.getChapterVo(_loc4_.chapter_id);
         _loc6_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc4_.chapter_id,_loc4_.sort + 1]);
         if(_loc6_)
         {
            return _loc6_.id;
         }
         _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_chapter",["kind","sort"],[_loc8_.kind,_loc8_.sort + 1]);
         if(_loc3_)
         {
            _loc6_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc3_.id,1]);
            if(_loc6_)
            {
               return _loc6_.id;
            }
            return 0;
         }
         return 0;
      }
   }
}
