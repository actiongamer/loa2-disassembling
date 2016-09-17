package nslm2.modules.funnies.abilityRankModule.model
{
   import proto.OpenChallengeData;
   import nslm2.modules.funnies.abilityRankModule.vo.AbilityRankVo;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class AbilityRankModel
   {
      
      private static var _ins:nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
      
      public static const MAX_RANK:int = 51;
       
      
      private var rankRewardArr:Array;
      
      private var rankSuperRewardArr:Array;
      
      public var rankListArr:Array;
      
      public var canGetReward:Boolean;
      
      public var hasGotReward:Boolean;
      
      public var myInfo:OpenChallengeData;
      
      public var activityStartTime:uint;
      
      public function AbilityRankModel()
      {
         super();
         rankListArr = [];
         rankRewardArr = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",9);
         initRankListData();
      }
      
      public static function get ins() : nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel();
         }
         return _ins;
      }
      
      public function updateRankList(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         param1.sortOn("rank",16);
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            (rankListArr[_loc4_] as AbilityRankVo).rankData = _loc2_;
            _loc4_++;
         }
      }
      
      private function initRankListData() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         _loc1_ = 1;
         while(_loc1_ <= 51)
         {
            _loc2_ = new AbilityRankVo();
            _loc2_.rank = _loc1_;
            initRewardByRank(_loc2_);
            rankListArr.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function initRewardByRank(param1:AbilityRankVo) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = rankRewardArr.length;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = rankRewardArr[_loc5_];
            if(_loc3_.checkRank(param1.rank))
            {
               param1.reward = WealthUtil.costStrToArr(_loc3_.jibenjiangli);
               param1.superReward = WealthUtil.costStrToArr(_loc3_.chaojijiangli);
               break;
            }
            _loc5_++;
         }
      }
   }
}
