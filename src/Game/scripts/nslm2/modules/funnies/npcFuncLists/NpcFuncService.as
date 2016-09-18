package nslm2.modules.funnies.npcFuncLists
{
   import com.mz.core.utils.DictHash;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FunctionTimesNotify;
   import nslm2.nets.sockets.ServerEvent;
   import proto.FunctionTimesInfo;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class NpcFuncService
   {
      
      private static var _ins:nslm2.modules.funnies.npcFuncLists.NpcFuncService;
       
      
      public var funcVoDict:DictHash;
      
      private var openTimeDict:Object;
      
      public function NpcFuncService()
      {
         funcVoDict = new DictHash();
         openTimeDict = {};
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.npcFuncLists.NpcFuncService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.npcFuncLists.NpcFuncService();
         }
         return _ins;
      }
      
      public function setOpenTimeVo(param1:FuncOpenTimeVo) : void
      {
         openTimeDict[param1.funcId] = param1;
      }
      
      public function getOpenTimeVo(param1:int) : FuncOpenTimeVo
      {
         return openTimeDict[param1];
      }
      
      public function isOpenTime(param1:int) : Boolean
      {
         var _loc2_:* = null;
         _loc2_ = nslm2.modules.funnies.npcFuncLists.NpcFuncService.ins.getOpenTimeVo(param1);
         if(_loc2_)
         {
            return _loc2_.isOpen();
         }
         return false;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(4102,server_residualTimes_cpl);
      }
      
      private function server_residualTimes_cpl(param1:FunctionTimesNotify, param2:ServerEvent) : void
      {
         if(param1.timesInfos)
         {
            var _loc5_:int = 0;
            var _loc4_:* = param1.timesInfos;
            for each(var _loc3_ in param1.timesInfos)
            {
               this.changeCount(_loc3_.funcId,_loc3_.times);
            }
         }
         NewYear2016Service.ins.countNpcFuncCount_main();
      }
      
      public function changeCount(param1:int, param2:int, param3:* = null) : void
      {
         var _loc4_:NpcFuncVo = funcVoDict.getValue(param1);
         if(_loc4_)
         {
            _loc4_.count = param2;
         }
         else
         {
            _loc4_ = NpcFuncVo.createCount(param1,param2);
            funcVoDict.put(param1,NpcFuncVo.createCount(param1,param2));
         }
         if(param3 != null)
         {
            _loc4_.extra = param3;
         }
         ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE",param1);
      }
      
      public function countPlusOne(param1:int) : void
      {
         var _loc2_:NpcFuncVo = funcVoDict.getValue(param1);
         if(_loc2_)
         {
            _loc2_.count = Number(_loc2_.count) + 1;
         }
         else
         {
            funcVoDict.put(param1,NpcFuncVo.createCount(param1,1));
         }
         ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE",param1);
      }
      
      public function countReduceOne(param1:int) : void
      {
         var _loc2_:NpcFuncVo = funcVoDict.getValue(param1);
         if(_loc2_)
         {
            _loc2_.count = Number(_loc2_.count) - 1;
            _loc2_.count = _loc2_.count < 0?0:_loc2_.count;
         }
         ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE",param1);
      }
      
      public function changeVo(param1:NpcFuncVo) : void
      {
         funcVoDict.put(param1.funcId,param1);
         ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE",param1.funcId);
      }
      
      public function getVo(param1:*) : NpcFuncVo
      {
         if(param1 == 0)
         {
            return null;
         }
         var _loc2_:NpcFuncVo = funcVoDict.getValue(param1);
         if(_loc2_ == null)
         {
            _loc2_ = NpcFuncVo.createCount(param1,0);
            funcVoDict.put(param1,NpcFuncVo.createCount(param1,0));
         }
         return _loc2_;
      }
   }
}
