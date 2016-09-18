package nslm2.modules.funnies.busyActivity.towers.funnys
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   
   public class TowerFunnySuccessEffCtrl implements IDispose
   {
       
      
      private var callBack:Function;
      
      private var panel:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyPanel;
      
      public var addWealthArr:Array;
      
      public var selectedLv:int;
      
      public var selectedPos:int;
      
      private var curRewardCell:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender;
      
      private var curEffLvIndex:int;
      
      private var curEffCellIndex:int;
      
      private var selectedLayerCell:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
      
      private var loopCount:int;
      
      private var mulMaxTimes:int = 40;
      
      public function TowerFunnySuccessEffCtrl(param1:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyPanel)
      {
         super();
         this.panel = param1;
      }
      
      public function play(param1:int) : void
      {
         ObserverMgr.ins.sendNotice("TowerService.MSG_SWITCH_MOUSE_FORBIT",true);
         reset();
         if(param1 == 1)
         {
            this.playOne();
         }
         else
         {
            this.playMulti();
         }
      }
      
      private function playMulti() : void
      {
         selectedLayerCell = panel.list_layer.cells[panel.list_layer.cells.length - selectedLv - 1] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
         this.curEffCellIndex = -1;
         if(this.selectedLv == this.panel.curLv)
         {
            this.avatar2d_doMove();
         }
         else
         {
            this.avatar2d_doMoveUpDown(this.selectedLv,0.3 * Math.abs(this.panel.curLv - this.selectedLv),this.avatar2d_doMove);
         }
         TimerManager.ins.doFrameLoop(3,playOneLoop);
      }
      
      private function playMultiLoop() : void
      {
         if(loopCount <= mulMaxTimes)
         {
            curEffLvIndex = MathUtil.randomInt(panel.list_layer.cells.length - 1,0);
         }
         else
         {
            curEffLvIndex = panel.list_layer.cells.length - selectedLv - 1;
         }
         selectedLayerCell = panel.list_layer.cells[curEffLvIndex] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
         if(loopCount <= mulMaxTimes)
         {
            curEffCellIndex = MathUtil.randomInt(this.selectedLayerCell.list_reward.repeatX - 1,0);
         }
         else
         {
            this.curEffCellIndex++;
            if(curEffCellIndex >= this.selectedLayerCell.list_reward.repeatX)
            {
               curEffCellIndex = 0;
            }
         }
         if(curRewardCell)
         {
            curRewardCell.switchSelected(false);
         }
         curRewardCell = selectedLayerCell.list_reward.cells[curEffCellIndex] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender;
         curRewardCell.switchSelected(true);
         loopCount = Number(loopCount) + 1;
         if(loopCount == 24)
         {
            TimerManager.ins.doFrameLoop(6,playMultiLoop);
         }
         else if(loopCount == 36)
         {
            TimerManager.ins.doFrameLoop(16,playMultiLoop);
         }
         else if(loopCount > mulMaxTimes)
         {
            avatar2d_doMoveEnd();
            if(curEffLvIndex == panel.list_layer.cells.length - selectedLv - 1 && this.curEffCellIndex == this.selectedPos)
            {
               TimerManager.ins.clearTimer(playMultiLoop);
               this.playAllCpl();
            }
         }
      }
      
      private function avatar2d_doMove() : void
      {
         this.panel.playerMoveBss.visible = true;
         this.panel.playerMoveBss.scaleX = -1;
         this.panel.playerStandBss.visible = false;
         this.panel.playerMoveBss.gotoAndPlay(1,1,13);
      }
      
      private function avatar2d_doMoveUpDown(param1:int, param2:Number = 0.3, param3:Function = null) : void
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         this.panel.playerMoveBss.gotoAndPlay(1,1,13);
         this.panel.playerMoveBss.scaleX = -1;
         this.panel.playerMoveBss.visible = true;
         this.panel.playerStandBss.visible = false;
         var _loc7_:Point = this.panel.playerAvatar2dPosToLayer(param1);
         var _loc5_:Object = {};
         _loc5_.x = _loc7_.x;
         _loc5_.y = _loc7_.y;
         if(param3)
         {
            _loc5_.onComplete = param3;
         }
         if(this.panel.player2dBox.y < _loc7_.y)
         {
            _loc6_ = this.panel.playerAvatar2dPosToLayer(5);
            _loc4_ = this.panel.playerAvatar2dPosToLayer(0);
            TweenLite.to(this.panel.player2dBox,0.3,{
               "x":_loc6_.x,
               "y":_loc6_.y,
               "onComplete":onTweenComplete,
               "onCompleteParams":[_loc4_,_loc7_,param3]
            });
         }
         else
         {
            TweenLite.to(this.panel.player2dBox,0.3,_loc5_);
         }
      }
      
      private function onTweenComplete(param1:Point, param2:Point, param3:Function) : void
      {
         TimerManager.ins.doOnce(300,new Handler(onPlayTween2,[param1,param2,param3]));
      }
      
      private function onPlayTween2(param1:Point, param2:Point, param3:Function) : void
      {
         this.panel.player2dBox.x = param1.x;
         this.panel.player2dBox.y = param1.y;
         var _loc4_:Object = {};
         _loc4_.x = param2.x;
         _loc4_.y = param2.y;
         if(param3)
         {
            _loc4_.onComplete = param3;
         }
         TweenLite.to(this.panel.player2dBox,0.3,_loc4_);
      }
      
      private function avatar2d_doMoveEnd() : void
      {
         var _loc1_:int = TowerService.ins.infoRes.lvs[this.panel.funnyKind];
         if(_loc1_ == this.selectedLv)
         {
            this.panel.playerMoveBss.visible = false;
            this.panel.playerStandBss.visible = true;
         }
         else
         {
            this.avatar2d_doMoveUpDown(_loc1_);
         }
      }
      
      private function playOne() : void
      {
         selectedLayerCell = panel.list_layer.cells[panel.list_layer.cells.length - selectedLv - 1] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
         this.curEffCellIndex = -1;
         avatar2d_doMove();
         TimerManager.ins.doFrameLoop(3,playOneLoop);
      }
      
      private function playOneLoop() : void
      {
         this.curEffCellIndex++;
         if(curEffCellIndex >= this.selectedLayerCell.list_reward.repeatX)
         {
            curEffCellIndex = 0;
         }
         if(curRewardCell)
         {
            curRewardCell.switchSelected(false);
         }
         curRewardCell = selectedLayerCell.list_reward.cells[curEffCellIndex] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender;
         curRewardCell.switchSelected(true);
         loopCount = Number(loopCount) + 1;
         if(loopCount == 8)
         {
            TimerManager.ins.doFrameLoop(6,playOneLoop);
         }
         else if(loopCount == 12)
         {
            TimerManager.ins.doFrameLoop(16,playOneLoop);
         }
         else if(loopCount > 14)
         {
            this.avatar2d_doMoveEnd();
            if(this.curEffCellIndex == this.selectedPos)
            {
               TimerManager.ins.clearTimer(playOneLoop);
               this.playAllCpl();
            }
         }
      }
      
      private function playAllCpl() : void
      {
         var _loc1_:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender = selectedLayerCell.list_reward.cells[selectedPos] as nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender;
         if(curRewardCell && curRewardCell != _loc1_)
         {
            curRewardCell.switchSelected(false);
         }
         _loc1_.switchSelected(true);
         curRewardCell = _loc1_;
         ObserverMgr.ins.sendNotice("TowerService.MSG_SWITCH_MOUSE_FORBIT",false);
         panel.playEffCpl();
      }
      
      public function reset() : void
      {
         loopCount = 0;
         curEffCellIndex = -1;
         if(this.curRewardCell)
         {
            this.curRewardCell.switchSelected(false);
            this.curRewardCell = null;
         }
      }
      
      public function dispose() : void
      {
         TimerManager.ins.clearTimer(playOneLoop);
         TimerManager.ins.clearTimer(playMultiLoop);
         TimerManager.ins.clearTimer(onPlayTween2);
         callBack = null;
      }
   }
}
