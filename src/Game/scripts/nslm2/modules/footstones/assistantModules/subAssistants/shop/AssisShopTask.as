package nslm2.modules.footstones.assistantModules.subAssistants.shop
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShopSetVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.RestrictiveConditionUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.foundations.shop.service.ShopService;
   import proto.ShopBuyInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.ProtocolStatusRes;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.modules.footstones.assistantModules.AssistantTimerManager;
   import nslm2.modules.footstones.assistantModules.vos.AssistantTimerVo;
   import nslm2.utils.ServerTimer;
   
   public class AssisShopTask extends TaskBase implements IObserver
   {
       
      
      protected var _shopSetVo:AssistantShopSetVo;
      
      private var _funcIdArr:Array;
      
      private var _currentShopType:int;
      
      private var _needBuyShopList:Object;
      
      private var _stcShopVoArr:Array;
      
      private var _shopNum:int;
      
      public function AssisShopTask(param1:Object = null)
      {
         _stcShopVoArr = [];
         super(param1);
      }
      
      public function getFocusNotices() : Array
      {
         return [];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      override public function stop() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.stop();
      }
      
      override public function exec() : void
      {
         super.exec();
         ObserverMgr.ins.regObserver(this);
         switchEventListeners(true);
         init();
         initSetting();
         requestInitData();
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ShopModel.ins.addEventListener("evtShopGetListOver",onGetListOver);
            ShopModel.ins.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopGetListOver",onGetListOver);
            ShopModel.ins.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      private function onGetListOver(param1:MzEvent) : void
      {
         stcShopVoArr();
      }
      
      private function stcShopVoArr() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         _stcShopVoArr = [];
         if(_needBuyShopList.length <= 0)
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(" [" + LocaleMgr.ins.getStr(9000000 + 41600) + "] " + LocaleMgr.ins.getStr(999002100)),41600);
            requestInitData();
            return;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _needBuyShopList;
         for each(var _loc2_ in _needBuyShopList)
         {
            _loc1_ = ShopModel.ins.getStcShopVo(_currentShopType,_loc2_.id);
            if(_loc1_)
            {
               _loc3_ = {};
               _loc3_.shopPropVo = _loc2_;
               _loc3_.stcShopVo = _loc1_;
               _loc3_.position = _loc1_.position;
               _loc3_.id = _loc1_.id;
               _loc3_.page = _loc1_.page.split("|")[0];
               _stcShopVoArr.push(_loc3_);
            }
         }
         _stcShopVoArr.sortOn(["page","position","id"],16);
         whileStcShopVoArr();
      }
      
      private function whileStcShopVoArr() : void
      {
         if(_stcShopVoArr.length > 0)
         {
            autoBuy(_stcShopVoArr.shift());
         }
         else
         {
            requestInitData();
         }
      }
      
      private function autoBuy(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:StcShopVo = param1.stcShopVo;
         var _loc6_:Object = param1.shopPropVo;
         if(_loc6_.num > _loc5_.limit_num)
         {
            _loc6_.num = _loc5_.limit_num;
         }
         if(RestrictiveConditionUtils.condSatisfied(_loc5_.condi) == false)
         {
            whileStcShopVoArr();
            return;
         }
         var _loc8_:Array = WealthUtil.costStrToArr(_loc5_.curr_res);
         var _loc7_:WealthVo = WealthVo.parseCostStr(_loc5_.sell_res);
         if(_loc7_.stcItemVo && (_loc7_.stcItemVo.kind == 8 || _loc7_.stcItemVo.kind == 9))
         {
            if(TreasureModel.ins.getALLTreausreData().length >= 400)
            {
               whileStcShopVoArr();
               return;
            }
         }
         var _loc9_:int = ShopModel.ins.getCanBuyMaxCount(_loc5_.id);
         var _loc3_:int = ShopModel.ins.getBuyedTimes(_loc5_.id);
         if(_loc9_ > 0)
         {
            if(_loc6_.num > _loc3_)
            {
               _shopNum = Math.min(_loc6_.num - _loc3_,_loc9_);
               ShopService.ins.buy(_loc5_.id,_shopNum,errHandler);
               if(_loc5_.shop_type != 50504)
               {
                  if(_loc6_.num - _loc3_ > _loc9_ && _loc3_ < _loc5_.limit_num)
                  {
                     _loc2_ = WealthUtil.parseCostStr(_loc5_.sell_res);
                     _loc4_ = WealthUtil.parseCostStr(_loc5_.curr_res);
                     AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200090,[_loc4_.showName,_loc2_.showName]),41600);
                  }
               }
            }
            else
            {
               whileStcShopVoArr();
            }
         }
         else
         {
            if(_loc6_.num - _loc3_ > 0)
            {
               _loc2_ = WealthUtil.parseCostStr(_loc5_.sell_res);
               _loc4_ = WealthUtil.parseCostStr(_loc5_.curr_res);
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200090,[_loc4_.showName,_loc2_.showName]),41600);
            }
            whileStcShopVoArr();
         }
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         var _loc3_:ShopBuyInfo = param1.data as ShopBuyInfo;
         var _loc5_:StcShopVo = StcMgr.ins.getShopVo(_loc3_.id);
         var _loc2_:WealthVo = WealthUtil.parseCostStr(_loc5_.sell_res);
         var _loc4_:WealthVo = WealthUtil.parseCostStr(_loc5_.curr_res);
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200072,[_loc4_.showName + "*" + _loc4_.showCount * _shopNum,_loc2_.showName + "*" + _shopNum]),41600);
         _shopNum = 0;
         whileStcShopVoArr();
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         whileStcShopVoArr();
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(param1.errCode),41600);
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200089),41600);
         var _loc2_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(108);
         var _loc4_:Array = _loc2_.subFuncIdArr;
         _funcIdArr = [];
         var _loc3_:int = _loc4_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = NpcFuncService.ins.getVo(_loc4_[_loc5_]);
            if(_loc1_ && StcMgr.ins.getFunctionVo(_loc4_[_loc5_]).canOpen)
            {
               _funcIdArr.push(_loc1_.funcId);
            }
            _loc5_++;
         }
      }
      
      private function initSetting() : void
      {
         _shopSetVo = AssistantModel.ins.assistantShopSetVo;
      }
      
      private function requestInitData() : void
      {
         var _loc1_:* = null;
         if(_funcIdArr.length > 0)
         {
            _currentShopType = _funcIdArr.shift();
            _loc1_ = _shopSetVo.shopVoObj[_currentShopType];
            if(_loc1_ == null)
            {
               requestInitData();
               return;
            }
            _needBuyShopList = _loc1_.assistantShopVoObj;
            ShopService.ins.requestList(_currentShopType);
         }
         else
         {
            switchEventListeners(false);
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(999002101),41600);
            addNextCheckTime();
            onComplete();
         }
      }
      
      private function addNextCheckTime() : void
      {
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200075),41600);
         AssistantTimerManager.ins.addTimer(new AssistantTimerVo(ServerTimer.ins.second + 1800,41600));
      }
   }
}
