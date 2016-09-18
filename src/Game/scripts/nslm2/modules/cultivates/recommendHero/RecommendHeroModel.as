package nslm2.modules.cultivates.recommendHero
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcRecommendHeroVo;
   import proto.PanelBaseInfo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   
   public class RecommendHeroModel
   {
      
      private static var _ins:nslm2.modules.cultivates.recommendHero.RecommendHeroModel;
       
      
      private var _groupDict:DictHash;
      
      private var _tabArr:Array;
      
      private var _teamHeroDict:DictHash;
      
      public function RecommendHeroModel()
      {
         _tabArr = [];
         super();
         _groupDict = new DictHash();
         _teamHeroDict = new DictHash();
      }
      
      public static function get ins() : nslm2.modules.cultivates.recommendHero.RecommendHeroModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.recommendHero.RecommendHeroModel();
         }
         return _ins;
      }
      
      public function getRecommendTeamList(param1:int) : Array
      {
         var _loc2_:Array = _groupDict.getValue(param1);
         if(!_loc2_)
         {
            _loc2_ = initVoListByGroup(param1);
         }
         return _loc2_;
      }
      
      public function getRecLabel() : String
      {
         var _loc4_:* = null;
         var _loc1_:Array = StcMgr.ins.getRecommendHeroTable().array;
         var _loc2_:Array = [];
         if(_loc1_ != null)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loc1_;
            for each(var _loc3_ in _loc1_)
            {
               _loc4_ = _loc3_.group.split("|");
               if(_loc2_.indexOf("\\l" + _loc4_[1]) == -1)
               {
                  _loc2_[_loc4_[0] - 1] = "\\l" + _loc4_[1];
               }
            }
         }
         return _loc2_.join(",");
      }
      
      public function getRecommendTeamArr(param1:StcRecommendHeroVo) : Array
      {
         var _loc2_:Array = _teamHeroDict.getValue(param1.id);
         if(!_loc2_)
         {
            _loc2_ = initTeamListByGroupId(param1);
         }
         return _loc2_;
      }
      
      public function getTotalYuanfenCount(param1:StcRecommendHeroVo) : int
      {
         var _loc4_:int = 0;
         var _loc2_:Array = getRecommendTeamArr(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            _loc4_ = _loc4_ + _loc3_.mengyue.length;
         }
         return _loc4_;
      }
      
      public function getRecommendYuanjunArr(param1:StcRecommendHeroVo) : Array
      {
         var _loc3_:* = null;
         var _loc4_:Array = [];
         var _loc2_:Array = param1.support.split("|");
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_;
         for each(var _loc5_ in _loc2_)
         {
            _loc3_ = WealthUtil.createNpcVo(_loc5_);
            _loc4_.push(_loc3_);
         }
         return _loc4_;
      }
      
      public function initTeamListByGroupId(param1:StcRecommendHeroVo) : Array
      {
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc10_:Array = [];
         var _loc4_:Array = param1.battle.split("|");
         var _loc6_:Array = param1.support.split("|");
         var _loc3_:Array = _loc4_.concat(_loc6_);
         var _loc18_:int = 0;
         var _loc17_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            _loc9_ = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroInfoUtil.createFakeHeroInfoByNpcVo(StcMgr.ins.getNpcVo(_loc5_)).baseInfo);
            _loc12_ = StcMgr.ins.getVoArrByMultiColumnValue("static_mengyue",["node","kind"],[_loc9_.baseId,1]);
            _loc8_ = [];
            var _loc16_:int = 0;
            var _loc15_:* = _loc12_;
            loop1:
            for each(var _loc7_ in _loc12_)
            {
               if(_loc7_.condition.indexOf("|") != -1)
               {
                  _loc2_ = _loc7_.condition.split("|");
                  var _loc14_:int = 0;
                  var _loc13_:* = _loc2_;
                  for each(var _loc11_ in _loc2_)
                  {
                     if(_loc3_.indexOf(_loc11_.toString()) != -1)
                     {
                        continue;
                     }
                     continue loop1;
                  }
                  _loc8_.push(_loc7_.id);
               }
               else if(_loc3_.indexOf(_loc7_.condition) != -1)
               {
                  _loc8_.push(_loc7_.id);
               }
            }
            _loc9_.mengyue = _loc8_;
            _loc10_.push(_loc9_);
         }
         return _loc10_;
      }
      
      private function initVoListByGroup(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc4_:Array = StcMgr.ins.getRecommendHeroTable().array;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(_loc3_.group.split("|")[0] == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         _groupDict.put(param1,_loc2_);
         return _loc2_;
      }
   }
}
