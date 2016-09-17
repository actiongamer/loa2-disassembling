package nslm2.modules.battles.heroAwakenRoad.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import proto.JueRoadChapterInfo;
   import proto.JueRoadNodeInfo;
   import com.mz.core.utils.ArrayUtil;
   
   public class HeroAwakenRoadChapterVo
   {
       
      
      public var nodesData:Array;
      
      public var gotStar:int;
      
      public var gottedRewardIndex:Array;
      
      private var _currentFihgtIndex:int;
      
      public var stcVo:StcConstellationPageVo;
      
      private var _isClear:Boolean;
      
      private var model:HeroAwakenRoadModel;
      
      public function HeroAwakenRoadChapterVo()
      {
         gottedRewardIndex = [];
         model = HeroAwakenRoadModel.ins;
         super();
         nodesData = [];
      }
      
      public function initNodeData() : void
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_constellation","map_id",stcVo.id);
         _loc2_.sortOn("sort",16);
         var _loc3_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc2_[_loc5_];
            _loc1_ = new HeroAwakenNodeVo();
            _loc1_.stcVo = _loc4_;
            if(_loc5_ == 0)
            {
               _loc1_.status = 2;
            }
            nodesData.push(_loc1_);
            _loc5_++;
         }
      }
      
      public function updateData(param1:JueRoadChapterInfo) : void
      {
         this.gotStar = param1.stars;
         this.gottedRewardIndex = param1.baoxiangs;
         updateNodeData(param1.nodes);
      }
      
      public function updateNodeData(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            _loc2_ = ArrayUtil.findByAttr(nodesData,"id",_loc5_.nodeid);
            if(_loc2_)
            {
               _loc2_.updateData(_loc5_);
            }
            _loc4_++;
         }
         _currentFihgtIndex = 0;
         _loc3_ = nodesData.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = nodesData[_loc4_];
            if(model.preStageId == _loc2_.id)
            {
            }
            if(_loc2_.gotStar == 0)
            {
               _loc2_.status = 2;
               model.currentStageId = _loc2_.id;
               break;
            }
            _currentFihgtIndex = Number(_currentFihgtIndex) + 1;
            _loc4_++;
         }
         _isClear = _currentFihgtIndex == nodesData.length;
      }
      
      public function get isClear() : Boolean
      {
         return _isClear;
      }
      
      public function get id() : int
      {
         return stcVo.id;
      }
      
      public function get currentFihgtIndex() : int
      {
         return _currentFihgtIndex;
      }
   }
}
