package nslm2.modules.battles.guildDungeons
{
   import game.ui.chapters.saodang.DungeonSaoDangPanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import com.greensock.TweenLite;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import proto.FamilyStageYuKouSaoDangReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyStageYuKouSaoDangRes;
   
   public class GuildDungeonSaoDangPanel extends DungeonSaoDangPanelUI
   {
       
      
      private var _stageId:int;
      
      private var _leftTimes:int;
      
      private var _saodangCnt:int;
      
      private var _saodangArr:Array;
      
      private var _stcFamilyStageVo:StcFamilyStageNodeVo;
      
      private var _initX:Number;
      
      protected var _doTimes:int;
      
      public function GuildDungeonSaoDangPanel()
      {
         _saodangArr = [];
         super();
      }
      
      public function show(param1:Object = null) : void
      {
         _stcFamilyStageVo = param1 as StcFamilyStageNodeVo;
         _saodangArr = [];
         _stageId = (param1 as StcFamilyStageNodeVo).id;
         _saodangCnt = 0;
         resetSaoDangTimes();
         this.panelBg.titleImgId = 40403;
         this.list_saodang.dataSource = [];
      }
      
      override public function panelFadeIn() : void
      {
         _initX = this.x;
         TweenLite.killTweensOf(this);
         this.x = _initX - 150;
         this.alpha = 0;
         TweenLite.to(this,0.2,{
            "x":_initX,
            "alpha":1
         });
      }
      
      override public function panelFadeOut() : void
      {
         TweenLite.killTweensOf(this);
         TweenLite.to(this,0.2,{
            "x":_initX - 150,
            "alpha":0
         });
      }
      
      protected function changeTimes() : void
      {
         NpcFuncService.ins.countReduceOne(40720);
      }
      
      protected function doNext() : void
      {
         if(_saodangCnt < _leftTimes)
         {
            this.list_saodang.dataSource = _saodangArr;
            this.list_saodang.scrollTo(_saodangArr.length);
            TimerManager.ins.doOnce(100,saoDangAction);
         }
         else
         {
            TimerManager.ins.clearTimer(saoDangAction);
            (_saodangArr[_saodangArr.length - 1] as SaodangVo).isComplete = true;
            this.list_saodang.dataSource = _saodangArr;
            this.list_saodang.scrollTo(_saodangArr.length);
            ObserverMgr.ins.sendNotice("evtSaodangCpl");
            resetSaoDangTimes();
         }
      }
      
      protected function saoDangAction() : void
      {
         _saodangCnt = Number(_saodangCnt) + 1;
         doSaoDang();
      }
      
      public function stop() : void
      {
         TimerManager.ins.clearTimer(saoDangAction);
         TimerManager.ins.clearTimer(doNext);
         this._leftTimes = this._saodangCnt;
         doNext();
      }
      
      public function start(param1:int) : void
      {
         var _loc2_:* = null;
         _doTimes = param1;
         resetSaoDangTimes();
         if(_leftTimes > 0)
         {
            _loc2_ = new SaodangVo();
            _saodangArr.push(_loc2_);
            _loc2_.index = _saodangCnt + 1;
            this.list_saodang.dataSource = _saodangArr;
            this.list_saodang.scrollTo(_saodangArr.length);
            TimerManager.ins.doOnce(100,saoDangAction);
         }
      }
      
      protected function resetSaoDangTimes() : void
      {
         _leftTimes = Math.min(NpcFuncService.ins.getVo(40720).count,_doTimes);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(TimerManager.ins.hasTimer(saoDangAction) || TimerManager.ins.hasTimer(doNext))
         {
            stop();
         }
         super.btnCloseHandler(param1);
      }
      
      protected function doSaoDang() : void
      {
         var _loc1_:FamilyStageYuKouSaoDangReq = new FamilyStageYuKouSaoDangReq();
         _loc1_.nodeid = _stageId;
         ServerEngine.ins.send(7163,_loc1_,onSaoDangCpl);
      }
      
      protected function onSaoDangCpl(param1:FamilyStageYuKouSaoDangRes) : void
      {
         changeTimes();
         ObserverMgr.ins.sendNotice("evtStageCountChange");
         var _loc2_:Array = [];
         _saodangArr[_saodangArr.length - 1].addItemsArr = param1.rewards;
         _saodangArr[_saodangArr.length - 1].stageId = this._stageId;
         this.list_saodang.refreshItem(_saodangArr.length - 1);
         var _loc3_:SaodangVo = new SaodangVo();
         _loc3_.stageId = this._stageId;
         _loc3_.index = _saodangCnt + 1;
         _loc3_.isRobDungeon = true;
         _saodangArr.push(_loc3_);
         TimerManager.ins.doOnce(100,doNext);
      }
   }
}
