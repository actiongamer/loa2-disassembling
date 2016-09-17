package nslm2.modules.scenes.shenYuans.model
{
   import flash.events.EventDispatcher;
   import proto.GetShenYuanInfoRes;
   
   public class ShenYuanModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
       
      
      public var crtStarCnt:int;
      
      public var isNormalReward:Boolean;
      
      public var secretChestPrice:int;
      
      public var maxStarCnt:int;
      
      public var isDead:Boolean;
      
      public var canAutoFight:Boolean;
      
      public var needGetReward:Boolean;
      
      public var buffArr:Array;
      
      public var crtMonsterData:Array;
      
      public var reviveCnt:int;
      
      public var assistCnt:int;
      
      public var fiends:Array;
      
      public var crtFloor:int = 1;
      
      public var buffToBuyArr:Array;
      
      public var floorList:Array;
      
      public var selectedMonsterPos:int;
      
      public var canPass:Boolean;
      
      public var currRank:uint;
      
      public var lastRank:uint;
      
      public var canGetReward:Boolean;
      
      public var daibi:uint;
      
      public var currFloorType:int;
      
      public var monstersForNextLayers:Array;
      
      public var canRevive:int;
      
      public var helptimes:int;
      
      public var canReachLayer:int;
      
      public var hisTopStar:int;
      
      public var luckValue:int;
      
      public var boxOpenNum:int;
      
      public var addStar:int = 0;
      
      public var noShowAlert:int = 0;
      
      public function ShenYuanModel()
      {
         buffArr = [];
         crtMonsterData = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.scenes.shenYuans.model.ShenYuanModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.scenes.shenYuans.model.ShenYuanModel();
         }
         return _ins;
      }
      
      public function getShowdBuffArr() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         var _loc1_:int = buffArr.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            if(_loc3_.indexOf(buffArr[_loc2_]) < 0)
            {
               _loc3_.push(buffArr[_loc2_]);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function initFloorArr(param1:int) : void
      {
         var _loc2_:int = 0;
         floorList = [crtFloor];
         _loc2_ = 1;
         while(_loc2_ < param1)
         {
            floorList.unshift(crtFloor + _loc2_);
            _loc2_++;
         }
      }
      
      public function addNewFloorData(param1:int) : void
      {
         var _loc2_:int = floorList[0];
         while(true)
         {
            param1--;
            if(!param1)
            {
               break;
            }
            _loc2_ = _loc2_ + 1;
            floorList.unshift(_loc2_);
         }
      }
      
      public function get selectedMonsterID() : int
      {
         return crtMonsterData[selectedMonsterPos - 1].id;
      }
      
      public function isTopLayer(param1:GetShenYuanInfoRes) : Boolean
      {
         var _loc4_:Boolean = param1.monster && param1.monster.length > 0;
         var _loc5_:Boolean = param1.buff && param1.buff.length > 0;
         var _loc3_:Boolean = param1.box;
         var _loc2_:* = param1.currentlayer >= 100;
         return _loc2_ && !_loc4_ && !_loc5_ && !_loc3_;
      }
   }
}
