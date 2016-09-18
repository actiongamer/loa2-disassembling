package nslm2.modules.funnies.secretExplore
{
   import game.ui.arenas.scores.ArenaScoreModuleUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import proto.GetSwapActionsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Button;
   import proto.SwapActionsInBatchRes;
   import nslm2.modules.funnies.arenas.scores.ArenaScoreVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class SEScoreModule extends ArenaScoreModuleUI implements IObserver
   {
       
      
      private var stcVoArr:Array;
      
      private var _ids:Array;
      
      public function SEScoreModule()
      {
         super();
         this.list.itemRender = SEScoreRender;
      }
      
      public function get service() : SEModel
      {
         return SEModel.ins;
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
         this.stcVoArr = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",8);
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
         _ids = param1;
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = param1;
         ServerEngine.ins.send(8007,_loc2_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc7_:* = _ids;
         for each(var _loc2_ in _ids)
         {
            _loc6_ = new SwapActionInfo();
            _loc6_.id = _loc2_;
            service.swapActionInfos.put(_loc6_.id,new SEScoreVo(_loc6_.id,_loc6_));
         }
         if(param1 && param1.info)
         {
            _loc4_ = param1.info.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = param1.info[_loc5_];
               SEScoreVo(service.swapActionInfos.getValue(_loc3_.id)).info.count = _loc3_.count;
               _loc5_++;
            }
         }
         service.swapActionInfos.array.sortOn("sid",16);
         super.moduleServerCpl();
      }
      
      private function refreshOneClickView(param1:Event = null) : void
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc5_:Array = [];
         var _loc10_:Array = service.swapActionInfos.array;
         _loc9_ = 0;
         while(_loc9_ < _loc10_.length)
         {
            _loc7_ = _loc10_[_loc9_] as SEScoreVo;
            if(_loc7_.canGetReward)
            {
               _loc4_ = _loc7_.stcVo;
               if(_loc7_.count < _loc4_.limit_count)
               {
                  if(PlayerModel.ins.level >= _loc4_.conditionLevel)
                  {
                     _loc5_ = _loc5_.concat(WealthUtil.dropGroupIDToWealthVoArr(_loc4_.drop_id));
                  }
               }
            }
            _loc9_++;
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
               for each(var _loc8_ in _loc2_)
               {
                  if(_loc8_.kind == _loc6_.kind && _loc8_.sid == _loc6_.sid)
                  {
                     _loc8_.count = _loc8_.count + _loc6_.count;
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
            btn_get.disabled = false;
         }
         else
         {
            this.list_oneClick.array = [];
            btn_get.disabled = true;
         }
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
         SEModel.ins.checkScoreCanGet();
         FloatUtil.showGetItemsDisplayPanel(list_oneClick.array);
         this.list.dataSource = [new ArenaScoreVo(0,null)].concat(service.swapActionInfos.array);
         refreshOneClickView();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9050241);
         var _loc2_:* = PlayerModel.ins.getWealthValue(34);
         this.txt_scoreValue.text = _loc2_ == null?"0":_loc2_ + "";
         this.list.dataSource = [new SEScoreVo(0,null)].concat(service.swapActionInfos.array);
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         refreshOneClickView();
         SEModel.ins.addEventListener("ArenaService.EVT_UPDATE_ONE_CLICK",refreshOneClickView);
         scroll(null);
         super.preShow(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         SEModel.ins.removeEventListener("ArenaService.EVT_UPDATE_ONE_CLICK",refreshOneClickView);
         super.preClose(param1);
      }
      
      private function scroll(param1:Event) : void
      {
         this.list.scrollTo(getCanRewardIndex());
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_SECRET_EXPLORE_RED_POINT_CHECK"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_SECRET_EXPLORE_RED_POINT_CHECK" === _loc3_)
         {
            scroll(null);
         }
      }
      
      private function getCanRewardIndex() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = service.swapActionInfos.array.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            if((service.swapActionInfos.array[_loc2_] as SEScoreVo).canGetReward)
            {
               return _loc2_ + 1;
            }
            _loc2_++;
         }
         return 0;
      }
   }
}
