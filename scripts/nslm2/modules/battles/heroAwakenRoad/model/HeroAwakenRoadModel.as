package nslm2.modules.battles.heroAwakenRoad.model
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenRoadChapterVo;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.JueRoadChapterInfo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenNodeVo;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.JueRoadRecordRes;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   
   public class HeroAwakenRoadModel
   {
      
      private static var _ins:nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
       
      
      private var _currentChapterId:int = 1;
      
      private var _activateLastChapterIndex:int;
      
      private var _leftCnt:int;
      
      public var chaptersData:Array;
      
      public var preStageId:uint = 0;
      
      private var stageBtlGuideInfos:DictHash;
      
      public var newOpenStageId:int;
      
      private var _currentStageId:int = 101;
      
      public var addStarCnt:int;
      
      public var preProcessInfos:DictHash;
      
      public var isFirstOpen:Boolean = true;
      
      public var newChapterIndex:int;
      
      private var preChapterIndex:int = -1;
      
      public function HeroAwakenRoadModel()
      {
         stageBtlGuideInfos = new DictHash();
         super();
         preProcessInfos = new DictHash();
      }
      
      public static function get ins() : nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel();
         }
         return _ins;
      }
      
      public function initChaptersData() : void
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         chaptersData = [];
         var _loc3_:Array = StcMgr.ins.getTabel("static_constellation_page").array;
         _loc3_.sortOn("sort",16);
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = _loc3_[_loc5_];
            _loc1_ = new HeroAwakenRoadChapterVo();
            _loc1_.stcVo = _loc4_;
            _loc1_.initNodeData();
            chaptersData.push(_loc1_);
            _loc5_++;
         }
      }
      
      public function get currentChapterId() : int
      {
         return _currentChapterId;
      }
      
      public function set currentChapterId(param1:int) : void
      {
         if(_currentChapterId != param1)
         {
            _currentChapterId = param1;
         }
      }
      
      public function preLoadBg(param1:int) : void
      {
         var _loc9_:* = undefined;
         var _loc8_:StcConstellationPageVo = StcMgr.ins.getConstellationPageVo(param1);
         var _loc7_:StcConstellationPageVo = StcMgr.ins.getVoByColumnValue("static_constellation_page","sort",_loc8_.sort - 1);
         var _loc5_:int = !!_loc7_?_loc7_.sort:0;
         var _loc2_:StcConstellationPageVo = StcMgr.ins.getVoByColumnValue("static_constellation_page","sort",_loc8_.sort + 1);
         var _loc4_:int = !!_loc2_?_loc2_.sort:0;
         var _loc6_:TaskPool = new TaskPool();
         var _loc3_:Array = [_loc5_,_loc8_.sort,_loc4_];
         var _loc12_:int = 0;
         var _loc11_:* = _loc3_;
         for each(var _loc10_ in _loc3_)
         {
            if(_loc10_ != 0)
            {
               _loc9_ = new Vector.<TaskBase>();
               _loc9_.push(new GetResTask(1,UrlLib.heroAwakenRoadChapterMapBg(_loc10_),2));
               _loc6_.addTaskArr(_loc9_);
            }
         }
         _loc6_.stopWhenError = false;
         _loc6_.exec();
      }
      
      public function get activateLastChapterIndex() : int
      {
         return _activateLastChapterIndex;
      }
      
      public function updateNodeInfo(param1:Array) : void
      {
         var _loc2_:HeroAwakenRoadChapterVo = chaptersData[_currentChapterId - 1];
         _loc2_.updateNodeData(param1);
      }
      
      public function updateChapterInfo(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            _loc2_ = ArrayUtil.findByAttr(chaptersData,"id",_loc5_.chapterid);
            if(_loc2_)
            {
               _loc2_.updateData(_loc5_);
            }
            _loc4_++;
         }
         updatePastChapter();
      }
      
      private function updatePastChapter() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _activateLastChapterIndex = 0;
         var _loc1_:int = chaptersData.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = chaptersData[_loc3_];
            _currentChapterId = _loc2_.id;
            if(_loc2_.isClear)
            {
               _activateLastChapterIndex = Number(_activateLastChapterIndex) + 1;
               _loc3_++;
               continue;
            }
            break;
         }
         _activateLastChapterIndex = Math.min(_activateLastChapterIndex,chaptersData.length - 1);
         if(preChapterIndex != -1 && preChapterIndex != _activateLastChapterIndex)
         {
            newChapterIndex = _activateLastChapterIndex;
         }
         preChapterIndex = _activateLastChapterIndex;
      }
      
      public function getNodeByNodeId(param1:int) : HeroAwakenNodeVo
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _loc5_ = 0;
         while(_loc5_ < chaptersData.length)
         {
            _loc2_ = chaptersData[_loc5_];
            _loc4_ = 0;
            while(_loc4_ < _loc2_.nodesData.length)
            {
               _loc3_ = _loc2_.nodesData[_loc4_];
               if(_loc3_.stcVo.id == param1)
               {
                  return _loc3_;
               }
               _loc4_++;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function get leftCount() : int
      {
         return _leftCnt;
      }
      
      public function set leftCount(param1:int) : void
      {
         if(_leftCnt != param1)
         {
            _leftCnt = param1;
            ObserverMgr.ins.sendNotice("update_fight_count");
         }
      }
      
      public function get currentChapterData() : HeroAwakenRoadChapterVo
      {
         return ArrayUtil.findByAttr(chaptersData,"id",_currentChapterId);
      }
      
      public function getStageBtlGuideInfo(param1:int) : JueRoadRecordRes
      {
         return stageBtlGuideInfos.getValue(param1);
      }
      
      public function addStageBtlGuideInfo(param1:int, param2:JueRoadRecordRes) : void
      {
         stageBtlGuideInfos.put(param1,param2);
      }
      
      public function get currentChapterIndex() : int
      {
         return ArrayUtil.indexByAttr(chaptersData,"id",_currentChapterId);
      }
      
      public function get activateLastChapterId() : int
      {
         return chaptersData[_activateLastChapterIndex].id;
      }
      
      public function get currentStageId() : int
      {
         return _currentStageId;
      }
      
      public function set currentStageId(param1:int) : void
      {
         var _loc2_:* = null;
         if(_currentStageId != 0 && _currentStageId != param1)
         {
            this.newOpenStageId = param1;
            _loc2_ = StcMgr.ins.getConstellationVo(_currentStageId);
         }
         _currentStageId = param1;
      }
      
      public function checkCanFight(param1:int) : Boolean
      {
         if(preProcessInfos.getValue(param1) > 0)
         {
            return true;
         }
         if(currentStageId == param1)
         {
            return true;
         }
         return false;
      }
   }
}
