package nslm2.modules.funnies.arenas.scores
{
   import game.ui.arenas.scores.ArenaScoreModuleUI;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import proto.GetSwapActionsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import morn.core.components.Button;
   import proto.SwapActionsInBatchRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.event.MzEvent;
   
   public class ArenaScoreModule extends ArenaScoreModuleUI
   {
       
      
      private var stcVoArr:Array;
      
      public function ArenaScoreModule()
      {
         super();
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      public function get service() : ArenaService
      {
         return ArenaService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         server_getSwapActions(this.stcIdArr);
      }
      
      private function get stcIdArr() : Array
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         this.stcVoArr = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",1);
         var _loc3_:Array = countLevelArr(stcVoArr);
         if(PlayerModel.ins.level <= _loc3_[0])
         {
            _loc5_ = _loc3_[0];
            _loc3_[0];
         }
         else
         {
            _loc4_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc2_ = _loc3_[_loc7_];
               if(PlayerModel.ins.level >= _loc3_[_loc7_])
               {
                  _loc5_ = _loc3_[_loc7_];
                  _loc7_++;
                  continue;
               }
               break;
            }
         }
         var _loc6_:Array = [];
         _loc4_ = this.stcVoArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc1_ = stcVoArr[_loc7_];
            if(_loc1_.conditionLevel == _loc5_)
            {
               _loc6_.push(_loc1_.id);
            }
            _loc7_++;
         }
         return _loc6_;
      }
      
      private function countLevelArr(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = param1[_loc6_];
            _loc5_ = _loc2_.conditionLevel;
            if(_loc3_.indexOf(_loc5_) == -1)
            {
               _loc3_.push(_loc5_);
            }
            _loc6_++;
         }
         _loc3_.sort(16);
         return _loc3_;
      }
      
      private function server_getSwapActions(param1:Array) : void
      {
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = param1;
         ServerEngine.ins.send(8007,_loc2_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.info[_loc4_];
            service.swapActionInfos.put(_loc2_.id,new ArenaScoreVo(_loc2_.id,_loc2_));
            _loc4_++;
         }
         service.swapActionInfos.array.sortOn("sid",16);
         super.moduleServerCpl();
      }
      
      private function onClick(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            _loc2_ = new GetSwapActionsReq();
            _loc2_.ids = this.stcIdArr;
            ServerEngine.ins.send(8009,_loc2_,onSwapActionsInBatchCpl);
         }
      }
      
      private function onSwapActionsInBatchCpl(param1:SwapActionsInBatchRes) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = param1.rewardInfo.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.rewardInfo[_loc3_] as SwapActionInfo;
            if(_loc4_)
            {
               _loc5_ = service.swapActionInfos.getValue(_loc4_.id) as ArenaScoreVo;
               if(_loc5_)
               {
                  _loc5_.info.count = _loc4_.count;
               }
            }
            _loc3_++;
         }
         service.swapActionInfos.array.sortOn("sid",16);
         ArenaService.ins.checkScoreCanGet();
         FloatUtil.showGetItemsDisplayPanel(list_oneClick.array);
         this.list.dataSource = [new ArenaScoreVo(0,null)].concat(service.swapActionInfos.array);
         refreshOneClickView();
      }
      
      private function refreshOneClickView(param1:Event = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         btn_get.disabled = !infoRes.canGetScoreReward;
         var _loc5_:Array = [];
         var _loc10_:int = 0;
         var _loc9_:* = this.list.dataSource;
         for each(var _loc8_ in this.list.dataSource)
         {
            if(!(_loc8_ == null || _loc8_.stcVo == null))
            {
               _loc4_ = _loc8_.stcVo;
               if(_loc8_.count < _loc4_.limit_count)
               {
                  if(PlayerModel.ins.level >= _loc4_.conditionLevel)
                  {
                     if(ArenaService.ins.infoRes.scores >= _loc4_.condition1count)
                     {
                        _loc5_ = _loc5_.concat(WealthUtil.dropGroupIDToWealthVoArr(_loc4_.drop_id));
                     }
                  }
               }
            }
         }
         if(_loc5_.length > 0)
         {
            _loc2_ = [];
            _loc3_ = false;
            var _loc14_:int = 0;
            var _loc13_:* = _loc5_;
            for each(var _loc6_ in _loc5_)
            {
               _loc3_ = false;
               var _loc12_:int = 0;
               var _loc11_:* = _loc2_;
               for each(var _loc7_ in _loc2_)
               {
                  if(_loc7_.kind == _loc6_.kind && _loc7_.sid == _loc6_.sid)
                  {
                     _loc7_.count = _loc7_.count + _loc6_.count;
                     _loc3_ = true;
                     break;
                  }
               }
               if(!_loc3_)
               {
                  _loc2_.push(_loc6_);
               }
            }
            this.list_oneClick.array = _loc2_;
         }
         else
         {
            this.list_oneClick.array = [];
         }
         btn_get.disabled = this.list_oneClick.array.length <= 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.txt_scoreValue.text = String(infoRes.scores);
         this.list.dataSource = [new ArenaScoreVo(0,null)].concat(service.swapActionInfos.array);
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         refreshOneClickView();
         ArenaService.ins.addEventListener("ArenaService.EVT_UPDATE_ONE_CLICK",refreshOneClickView);
         service.addEventListener("updataInfoRes",updataInfoRes);
         super.preShow(param1);
      }
      
      protected function updataInfoRes(param1:MzEvent) : void
      {
         list.refresh();
         refreshOneClickView();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ArenaService.ins.removeEventListener("ArenaService.EVT_UPDATE_ONE_CLICK",refreshOneClickView);
         service.removeEventListener("updataInfoRes",updataInfoRes);
         super.preClose(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
   }
}
