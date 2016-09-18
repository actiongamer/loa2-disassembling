package nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.assistantModules.vos.AssistantMysterySettingVo;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import proto.GetShenYuanInfoReq;
   import nslm2.modules.foundations.shop.service.ShopService;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.ServerTimer;
   import proto.ShopBuyInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.assistantModules.AssistantTimerManager;
   import nslm2.modules.footstones.assistantModules.vos.AssistantTimerVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   
   public class AssisMysteryShopTask extends TaskBase implements IObserver
   {
       
      
      protected var setting:AssistantMysterySettingVo;
      
      private var mysteryWealthVo:WealthVo;
      
      public function AssisMysteryShopTask(param1:Object = null)
      {
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
         TweenLite.killDelayedCallsTo(refreshShop);
         super.stop();
      }
      
      override public function exec() : void
      {
         super.exec();
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
         initSetting();
         requestInitData();
      }
      
      private function get funId() : int
      {
         return 60310;
      }
      
      private function get shopType() : int
      {
         return funId + 100000;
      }
      
      private function initSetting() : void
      {
         this.setting = AssistantModel.ins.getSetting(funId);
         AssisMysteryShopModel.ins.tempNeedBuyShopList = this.setting.needBuyItemArr;
      }
      
      private function requestInitData(param1:GetShenYuanInfoReq = null) : void
      {
         ShopService.ins.requestList(shopType);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ShopModel.ins.addEventListener("evtShopGetListOver",onGetListOver);
            ShopModel.ins.addEventListener("evtShopRefresh",onRefresh);
            ShopModel.ins.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopGetListOver",onGetListOver);
            ShopModel.ins.removeEventListener("evtShopRefresh",onRefresh);
            ShopModel.ins.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      private function onGetListOver(param1:MzEvent) : void
      {
         autoBuy();
      }
      
      private function onRefresh(param1:MzEvent) : void
      {
         var _loc2_:Boolean = param1.data as Boolean;
         if(_loc2_ == false)
         {
            this.setting.lastItemRefreshStamp = ServerTimer.ins.second;
            this.setting.todayUseItemRefreshTimes = this.setting.todayUseItemRefreshTimes + 1;
         }
         AssistantModel.ins.saveSetting(funId,this.setting,false);
         autoBuy();
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         var _loc3_:ShopBuyInfo = param1.data as ShopBuyInfo;
         var _loc5_:StcShopVo = StcMgr.ins.getShopVo(_loc3_.id);
         var _loc2_:WealthVo = WealthUtil.parseCostStr(_loc5_.sell_res);
         var _loc4_:WealthVo = WealthUtil.parseCostStr(_loc5_.curr_res);
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200072,[_loc4_.showName + "*" + _loc4_.showCount + (mysteryWealthVo != null?", " + mysteryWealthVo.showName + "*" + mysteryWealthVo.showCount:""),_loc2_.showName + "*" + _loc2_.showCount]),funId);
         autoBuy();
      }
      
      private function autoBuy() : void
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc1_:* = null;
         var _loc6_:int = 0;
         _loc3_ = null;
         mysteryWealthVo = null;
         if(AssisMysteryShopModel.ins.tempNeedBuyShopList.length <= 0 && (!setting.buyLockHero || ShopModel.ins.lockItem && !ShopModel.ins.lockItem.value))
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200073),funId);
            return;
         }
         var _loc7_:Array = ShopModel.ins.getMysteryItemListByPage(funId,1);
         var _loc2_:int = _loc7_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc2_)
         {
            _loc4_ = _loc7_[_loc8_];
            if(setting.buyLockHero && ShopModel.ins.freshLockItem && ShopModel.ins.lockBuyedItems && ShopModel.ins.lockBuyedItems.length <= 0 && ShopModel.ins.lockItem.key == _loc4_.id && _loc8_ == 1)
            {
               _loc3_ = WealthUtil.parseCostStr(_loc4_.curr_res);
               if(PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.showCount)
               {
                  _loc5_ = WealthVo.parseCostStr(_loc4_.sell_res);
                  _loc1_ = StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_QUALITY").define_value.split("|");
                  _loc6_ = 0;
                  while(_loc6_ < _loc1_.length)
                  {
                     if(_loc1_[_loc6_] == _loc5_.quality)
                     {
                        mysteryWealthVo = WealthVo.parseCostStr(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_COST").define_value.split("|")[_loc6_]);
                        break;
                     }
                     _loc6_++;
                  }
                  if(PlayerModel.ins.getCountByWealthVo(mysteryWealthVo) >= mysteryWealthVo.showCount)
                  {
                     ShopService.ins.buy(_loc7_[_loc8_].id,1,null,null,_loc8_);
                  }
                  else
                  {
                     AssistantModel.ins.addLog(LocaleMgr.ins.getStr(999902524),funId);
                     addNextCheckTime();
                     this.onComplete();
                  }
               }
               else
               {
                  AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200074),funId);
                  addNextCheckTime();
                  this.onComplete();
               }
               return;
            }
            if(!(ShopModel.ins.freshLockItem && _loc8_ == 1))
            {
               if(ShopModel.ins.mysteryItemHasBuyed(_loc4_.id) == false && AssisMysteryShopModel.ins.isSelected(_loc4_.id))
               {
                  _loc3_ = WealthUtil.parseCostStr(_loc4_.curr_res);
                  if(PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.showCount)
                  {
                     ShopService.ins.buy(_loc7_[_loc8_].id,1,null,null,_loc8_);
                  }
                  else
                  {
                     AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200074),funId);
                     addNextCheckTime();
                     this.onComplete();
                  }
                  return;
               }
            }
            _loc8_++;
         }
         delayRefreshShop();
      }
      
      private function addNextCheckTime() : void
      {
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200075),funId);
         AssistantTimerManager.ins.addTimer(new AssistantTimerVo(ServerTimer.ins.second + 1800,funId));
      }
      
      private function delayRefreshShop() : void
      {
         TweenLite.delayedCall(0.5,refreshShop);
      }
      
      private function refreshShop() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         if(ShopModel.ins.getLeftFreeRefreshTimes(shopType) > 0)
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200079),funId);
            ShopService.ins.refresh(shopType,ShopModel.ins.getRefreshItemType(20));
         }
         else
         {
            _loc2_ = BagModel.ins.getStcCount(23100);
            _loc3_ = ShopModel.ins.getLeftRefreshTimes(60310 + 100000);
            _loc1_ = this.setting.useItemRefreshTimes - this.setting.todayUseItemRefreshTimes;
            if(this.setting.needUseItemRefresh)
            {
               if(_loc2_ <= 0)
               {
                  AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200076),funId);
                  addNextCheckTime();
                  this.onComplete();
                  return;
               }
               if(_loc3_ <= 0)
               {
                  AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200077),funId);
                  addNextCheckTime();
                  this.onComplete();
                  return;
               }
               if(_loc1_ <= 0)
               {
                  AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200078),funId);
                  addNextCheckTime();
                  this.onComplete();
                  return;
               }
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200079),funId);
               ShopService.ins.refresh(shopType,ShopModel.ins.getRefreshItemType(20));
            }
            else
            {
               addNextCheckTime();
               this.onComplete();
            }
         }
      }
   }
}
