package nslm2.modules.cultivates.militaryInfos
{
   import flash.events.EventDispatcher;
   import com.netease.protobuf.UInt64;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import morn.core.utils.StringUtils;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class MilitaryModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.militaryInfos.MilitaryModel;
       
      
      public var totalFightValue:UInt64;
      
      public function MilitaryModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.militaryInfos.MilitaryModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.militaryInfos.MilitaryModel();
         }
         return _ins;
      }
      
      public function getMilitaryGradeTitleById(param1:int) : String
      {
         return StcMgr.ins.getMilitarygradeVo(StcMgr.ins.getMilitaryrankVo(param1).grade).name;
      }
      
      public function getMilitaryNameById(param1:int) : String
      {
         return StcMgr.ins.getMilitaryrankVo(param1).name;
      }
      
      public function getMilitaryCostCountByIndex(param1:int) : int
      {
         if(param1 <= 0)
         {
            return null;
         }
         var _loc2_:WealthVo = WealthVo.parseCostStr(StcMgr.ins.getMilitaryrankVo(param1).cond);
         return _loc2_.count;
      }
      
      public function hasUpgraded(param1:int) : Boolean
      {
         if(param1 <= 0 || PlayerModel.ins.playerInfo.militaryrank <= 0)
         {
            return false;
         }
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(PlayerModel.ins.playerInfo.militaryrank);
         return StcMgr.ins.getMilitaryrankVo(param1).seq <= _loc2_.seq;
      }
      
      public function canUpgrade(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         var _loc3_:WealthVo = WealthVo.parseCostStr(_loc2_.cond);
         return PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.count;
      }
      
      public function nextCanUpgrade() : Boolean
      {
         return canUpgrade(getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank));
      }
      
      public function getNextMilitaryId(param1:int) : int
      {
         if(param1 <= 0)
         {
            return 100;
         }
         var _loc3_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         var _loc2_:int = _loc3_.seq;
         var _loc4_:StcMilitaryrankVo = StcMgr.ins.getVoByColumnValue("static_militaryrank","seq",_loc2_ + 1);
         if(_loc4_)
         {
            return _loc4_.id;
         }
         return 0;
      }
      
      public function getPreMilitaryId(param1:int) : int
      {
         var _loc3_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         var _loc2_:int = _loc3_.seq;
         var _loc4_:StcMilitaryrankVo = StcMgr.ins.getVoByColumnValue("static_militaryrank","seq",_loc2_ - 1);
         if(_loc4_)
         {
            return _loc4_.id;
         }
         return 0;
      }
      
      public function isTopMilitary(param1:int) : Boolean
      {
         if(StringUtils.isNull(param1 as String))
         {
            return false;
         }
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         var _loc3_:StcMilitaryrankVo = StcMgr.ins.getVoByColumnValue("static_militaryrank","seq",_loc2_.seq + 1);
         return _loc3_ == null;
      }
      
      public function hasMilitaryRank() : Boolean
      {
         return PlayerModel.ins.playerInfo.militaryrank != 0;
      }
      
      public function getAddPropSingle(param1:int) : Array
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         if(_loc4_.seq == 1)
         {
            _loc2_ = getAddPropAll(param1);
            var _loc9_:int = 0;
            var _loc8_:* = _loc2_;
            for each(var _loc6_ in _loc2_)
            {
               _loc6_.preFix = "+";
            }
            return _loc2_;
         }
         _loc5_ = NpcPropVo.minusStr(getAddPropAll(param1),getAddPropAll(getPreMilitaryId(param1)));
         _loc3_ = [];
         var _loc11_:int = 0;
         var _loc10_:* = _loc5_;
         for each(var _loc7_ in _loc5_)
         {
            _loc3_.push(_loc7_);
         }
         return _loc3_;
      }
      
      public function getAddPropAll(param1:int) : Array
      {
         var _loc4_:* = null;
         if(param1 <= 0)
         {
            return NpcPropVo.getEmptyPopArr(1,5,0);
         }
         var _loc3_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         switch(int(_loc3_.kind) - 1)
         {
            case 0:
               _loc4_ = NpcPropVo.parseArrStr(_loc3_.prop);
            case 1:
               return getAddPropAll(getPreMilitaryId(param1));
         }
      }
      
      public function getPlayerQuality(param1:int) : int
      {
         var _loc5_:int = StcMgr.ins.getNpcVo(DefindConsts.MALE_ZHUJUE_ID).quality;
         if(param1 == 0)
         {
            return _loc5_;
         }
         var _loc4_:Array = StcMgr.ins.getVoArrByColumnValue("static_militaryrank","kind",2);
         var _loc2_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(_loc2_.seq >= _loc3_.seq && _loc5_ <= int(_loc3_.prop))
            {
               _loc5_ = _loc3_.prop;
            }
         }
         return _loc5_;
      }
      
      public function checkWhenChange() : void
      {
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30400,canUpgrade(getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank))));
      }
   }
}
