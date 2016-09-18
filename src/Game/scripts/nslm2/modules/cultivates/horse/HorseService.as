package nslm2.modules.cultivates.horse
{
   import flash.events.EventDispatcher;
   import proto.PlayerGetSaddleHorsesRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.cultivates.horse.vos.HorseStateVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeModel;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.PlayerChangeGloryReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerChangeGloryRes;
   import com.mz.core.event.MzEvent;
   
   public class HorseService extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.horse.HorseService;
       
      
      private var _allHorseList:Array;
      
      public var activatedHorseList:Array;
      
      private var _allAuraList:Array;
      
      public var activatedAuraList:Array;
      
      public var masterExp:int;
      
      private var _curHorseId:int;
      
      private var _curAuraId:int;
      
      private var _star:int;
      
      private var _masterLevel:int;
      
      private var _changeAuraId:uint;
      
      public function HorseService()
      {
         activatedHorseList = [];
         activatedAuraList = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.horse.HorseService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.horse.HorseService();
         }
         return _ins;
      }
      
      public function get curHorseId() : int
      {
         return _curHorseId;
      }
      
      public function set curHorseId(param1:int) : void
      {
         if(_curHorseId != param1)
         {
            _curHorseId = param1;
            this.sortAllHorseList();
         }
      }
      
      public function get curAuraId() : int
      {
         if(_curAuraId == 0)
         {
            return this.activatedAuraList[0];
         }
         return _curAuraId;
      }
      
      public function set curAuraId(param1:int) : void
      {
         if(_curAuraId != param1)
         {
            _curAuraId = param1;
         }
      }
      
      public function set masterLevel(param1:int) : void
      {
         if(_masterLevel != param1)
         {
            _masterLevel = param1;
         }
      }
      
      public function get masterLevel() : int
      {
         return _masterLevel;
      }
      
      public function init(param1:PlayerGetSaddleHorsesRes) : void
      {
         var _loc3_:int = 0;
         _allHorseList = [];
         _allAuraList = [];
         var _loc2_:DictHash = StcMgr.ins.getSaddlehorseTable();
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.array;
         for each(var _loc4_ in _loc2_.array)
         {
            _allHorseList.push(_loc4_.id);
            _allAuraList.push(_loc4_.glory);
         }
         this.activatedHorseList = param1.horseid;
         this.masterExp = param1.exp;
         this.masterLevel = param1.star;
         this.curHorseId = param1.curhorse;
         this.curAuraId = param1.curglory;
         while(_loc3_ < param1.horseid.length)
         {
            this.activatedAuraList.push(StcMgr.ins.getSaddlehorseVo(param1.horseid[_loc3_]).glory);
            _loc3_++;
         }
         sortAllHorseList();
      }
      
      public function checkWhenChange() : void
      {
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30300,hasCanActive || canShengjie() || canLevelUp()));
      }
      
      public function get hasCanActive() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < allHorseList.length)
         {
            if(this.getState(allHorseList[_loc1_]) == 3)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get firstId() : int
      {
         if(this.curHorseId)
         {
            return this.curHorseId;
         }
         return this.allHorseList[0];
      }
      
      public function get allHorseList() : Array
      {
         var _loc1_:* = null;
         if(_allHorseList.length <= 0)
         {
            _loc1_ = StcMgr.ins.getSaddlehorseTable();
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_.array;
            for each(var _loc2_ in _loc1_.array)
            {
               _allHorseList.push(_loc2_.id);
            }
         }
         sortAllHorseList();
         return _allHorseList;
      }
      
      public function sortAllHorseList() : void
      {
         var $stateArr:Array = _allHorseList.map(function(param1:int, ... rest):HorseStateVo
         {
            return new HorseStateVo(param1,getState(param1));
         });
         $stateArr.sort(sortHorseFunc);
         _allHorseList = ArrayUtil.distill($stateArr,"stcHorseId");
      }
      
      private function sortHorseFunc(param1:HorseStateVo, param2:HorseStateVo) : int
      {
         var _loc3_:int = param1.state;
         if(_loc3_ > 3)
         {
            _loc3_ = 6;
         }
         var _loc4_:int = param2.state;
         if(_loc4_ > 3)
         {
            _loc4_ = 6;
         }
         if(_loc3_ == _loc4_)
         {
            return int(param1.stcHorseId) < int(param2.stcHorseId)?-1:1;
         }
         return _loc3_ < _loc4_?-1:1;
      }
      
      public function get allAuraList() : Array
      {
         return _allAuraList;
      }
      
      public function addActivateHorse(param1:int) : void
      {
         activatedHorseList.push(param1);
         activatedAuraList.push(StcMgr.ins.getSaddlehorseVo(param1).glory);
         SkillChangeModel.ins.newAuraVec.push(StcMgr.ins.getSaddlehorseVo(param1).glory);
         this.sortAllHorseList();
         checkWhenChange();
      }
      
      public function horseAddAllProp() : Array
      {
         var _loc2_:Array = [];
         if(activatedHorseList.length == 0)
         {
            return NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List);
         }
         var _loc4_:int = 0;
         var _loc3_:* = activatedHorseList;
         for each(var _loc1_ in activatedHorseList)
         {
            NpcPropVo.addProp(_loc2_,NpcPropVo.parseArrStr(StcMgr.ins.getSaddlehorseVo(_loc1_).prop));
         }
         return _loc2_;
      }
      
      public function masterAddAllProp() : Array
      {
         if(this.masterLevel == 1)
         {
            return NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List);
         }
         var _loc1_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(nslm2.modules.cultivates.horse.HorseService.ins.masterLevel);
         return NpcPropVo.parseArrStr(_loc1_.prop);
      }
      
      public function addAllProp() : Array
      {
         var _loc1_:Array = [];
         NpcPropVo.addProp(_loc1_,horseAddAllProp());
         NpcPropVo.addProp(_loc1_,masterAddAllProp());
         return _loc1_;
      }
      
      public function canShengjie() : Boolean
      {
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(nslm2.modules.cultivates.horse.HorseService._ins.masterLevel);
         if(_loc2_ == null || _loc2_.skilltype == 1)
         {
            return false;
         }
         var _loc3_:StcHorseupgradeVo = StcMgr.ins.getHorseupgradeVo((_loc2_.rank + 1) * 100);
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.playerlevel > PlayerModel.ins.level)
         {
            return false;
         }
         _loc3_ = StcMgr.ins.getHorseupgradeVo(_loc2_.rank * 100);
         var _loc1_:WealthVo = WealthVo.parseCostStr(_loc3_.cost);
         if(PlayerModel.ins.getCountByWealthVo(_loc1_) >= _loc1_.count)
         {
            return true;
         }
         return false;
      }
      
      public function canLevelUp() : Boolean
      {
         var _loc3_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(nslm2.modules.cultivates.horse.HorseService._ins.masterLevel);
         if(_loc3_.exp == 0)
         {
            return false;
         }
         var _loc2_:WealthVo = WealthVo.parseCostStr(_loc3_.singlecost);
         var _loc1_:int = PlayerModel.ins.getCountByWealthVo(_loc2_);
         _loc1_ = _loc1_ - int(_loc1_ % _loc2_.count);
         var _loc5_:int = _loc3_.exp - nslm2.modules.cultivates.horse.HorseService._ins.masterExp;
         var _loc4_:int = _loc5_ / _loc3_.singleexp;
         return _loc4_ <= _loc1_;
      }
      
      public function getState(param1:int) : int
      {
         var _loc2_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         if(nslm2.modules.cultivates.horse.HorseService.ins.curHorseId == param1)
         {
            return 1;
         }
         if(nslm2.modules.cultivates.horse.HorseService.ins.activatedHorseList.indexOf(param1) != -1)
         {
            return 2;
         }
         if(_loc2_.prev > 0 && this.activatedHorseList.indexOf(_loc2_.prev) == -1)
         {
            return 6;
         }
         if(HorseUtil.getRank(nslm2.modules.cultivates.horse.HorseService.ins.masterLevel) < _loc2_.rank)
         {
            return 4;
         }
         if(BagModel.ins.getStcCount(WealthVo.parseCostStr(_loc2_.item).sid) < WealthVo.parseCostStr(_loc2_.item).count)
         {
            return 5;
         }
         return 3;
      }
      
      public function isActived(param1:int) : Boolean
      {
         return this.activatedHorseList.indexOf(param1) > -1;
      }
      
      public function changeAura(param1:uint) : void
      {
         _changeAuraId = param1;
         var _loc2_:PlayerChangeGloryReq = new PlayerChangeGloryReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(7075,_loc2_,onServerCpl_onChangeAura);
      }
      
      private function onServerCpl_onChangeAura(param1:PlayerChangeGloryRes) : void
      {
         if(param1.ok == true)
         {
            this.curAuraId = _changeAuraId;
            this.dispatchEvent(new MzEvent("evtAuraUsingChange",_changeAuraId));
         }
      }
   }
}
