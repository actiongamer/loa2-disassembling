package nslm2.modules.Chapters.saodang
{
   import game.ui.chapters.saodang.DungeonSaoDangPanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import com.greensock.TweenLite;
   import proto.PlayerDataNotify;
   import nslm2.modules.Chapters.ChapterModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.Item;
   import nslm2.utils.ProtoUtils;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import proto.StageSaoDangReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.MouseEvent;
   
   public class DungeonSaoDangPanel extends DungeonSaoDangPanelUI
   {
       
      
      private var _stageId:int;
      
      private var _leftTimes:int;
      
      private var _saodangCnt:int;
      
      private var _saodangArr:Array;
      
      private var _vo:StcStageVo;
      
      private var _initX:Number;
      
      private var _doTimes:int;
      
      public function DungeonSaoDangPanel()
      {
         _saodangArr = [];
         super();
      }
      
      public function show(param1:Object = null) : void
      {
         _vo = param1 as StcStageVo;
         _saodangArr = [];
         _stageId = (param1 as StcStageVo).id;
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
      
      private function onServerCpl_playerDataNotify(param1:PlayerDataNotify) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         ChapterModel.ins.addStageInfoCount(this._vo.id,1);
         ObserverMgr.ins.sendNotice("evtStageCountChange");
         _saodangArr[_saodangArr.length - 1].addExp = _vo.reward_exp;
         _saodangArr[_saodangArr.length - 1].addGold = _vo.reward_coin;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < param1.addItems.length)
         {
            _loc4_ = new Item();
            ProtoUtils.copyParams(param1.addItems[_loc5_],_loc4_);
            _loc2_.push(_loc4_);
            _loc5_++;
         }
         _saodangArr[_saodangArr.length - 1].addItemsArr = _loc2_;
         _saodangArr[_saodangArr.length - 1].addHerosArr = param1.addHeroes;
         _saodangArr[_saodangArr.length - 1].stageId = this._stageId;
         this.list_saodang.refreshItem(_saodangArr.length - 1);
         var _loc3_:SaodangVo = new SaodangVo();
         _loc3_.stageId = this._stageId;
         _loc3_.index = _saodangCnt + 1;
         _saodangArr.push(_loc3_);
         TimerManager.ins.doOnce(100,doNext);
      }
      
      private function doNext() : void
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
            (_saodangArr[_saodangArr.length - 1] as SaodangVo).hasArr = getNeedArr();
            this.list_saodang.dataSource = _saodangArr;
            this.list_saodang.scrollTo(_saodangArr.length);
            ObserverMgr.ins.sendNotice("evtSaodangCpl");
            resetSaoDangTimes();
         }
      }
      
      private function getNeedArr() : Array
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc2_:Array = WealthUtil.dropGroupIDToWealthVoArr(_vo.front_end_drop_id);
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_];
            switch(int(_loc3_.kind) - 20)
            {
               case 0:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               default:
                  if(_loc3_.stcItemVo.kind == 51 || _loc3_.stcItemVo.kind == 21)
                  {
                     _loc1_.push(WealthUtil.createItemVo(_loc3_.sid,int(_loc3_.stcItemVo.extend_1)));
                  }
                  break;
               case 10:
                  _loc1_.push(WealthUtil.createNpcVo(_loc3_.sid));
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function saoDangAction() : void
      {
         _saodangCnt = Number(_saodangCnt) + 1;
         var _loc1_:StageSaoDangReq = new StageSaoDangReq();
         _loc1_.count = 1;
         _loc1_.stageId = _stageId;
         ServerEngine.ins.send(8058,_loc1_,server_saoDangCpl);
      }
      
      private function server_saoDangCpl(param1:*, param2:ServerEvent) : void
      {
         onServerCpl_playerDataNotify(param2.dataNotifyCacheVo.playerDataNotify);
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
      
      private function resetSaoDangTimes() : void
      {
         _leftTimes = Math.min(Math.floor(PlayerModel.ins.stamina / StcMgr.ins.getStageVo(_stageId).drain_stamina),_doTimes,10);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(TimerManager.ins.hasTimer(saoDangAction) || TimerManager.ins.hasTimer(doNext))
         {
            stop();
         }
         super.btnCloseHandler(param1);
      }
   }
}
