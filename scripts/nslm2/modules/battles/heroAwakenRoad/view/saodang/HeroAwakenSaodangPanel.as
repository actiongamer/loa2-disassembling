package nslm2.modules.battles.heroAwakenRoad.view.saodang
{
   import game.ui.heroAwakenRoad.saodang.HeroAwakenSaoDangPanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import com.greensock.TweenLite;
   import proto.JueRoadSaoDangRes;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import proto.JueRoadSaoDangReq;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.MouseEvent;
   
   public class HeroAwakenSaodangPanel extends HeroAwakenSaoDangPanelUI
   {
      
      public static const CAN_SAODANG_MAXTIMES:int = 10;
       
      
      private var _stageId:int;
      
      private var _leftTimes:int;
      
      private var _saodangCnt:int;
      
      private var _saodangArr:Array;
      
      private var _vo:StcConstellationVo;
      
      private var _initX:Number;
      
      private var _doTimes:int;
      
      public function HeroAwakenSaodangPanel()
      {
         _saodangArr = [];
         super();
      }
      
      public function show(param1:Object = null) : void
      {
         _vo = param1 as StcConstellationVo;
         _saodangArr = [];
         _stageId = _vo.id;
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
      
      private function onServerCpl_playerDataNotify(param1:JueRoadSaoDangRes) : void
      {
         HeroAwakenRoadModel.ins.leftCount--;
         NpcFuncService.ins.changeCount(30121,HeroAwakenRoadModel.ins.leftCount);
         _saodangArr[_saodangArr.length - 1].addExp = _vo.exp;
         _saodangArr[_saodangArr.length - 1].addItemsArr = param1.rewards;
         _saodangArr[_saodangArr.length - 1].stageId = this._stageId;
         this.list_saodang.refreshItem(_saodangArr.length - 1);
         var _loc2_:SaodangVo = new SaodangVo();
         _loc2_.stageId = this._stageId;
         _loc2_.index = _saodangCnt + 1;
         _saodangArr.push(_loc2_);
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
            ObserverMgr.ins.sendNotice("msg_role_awake_number_changed");
            resetSaoDangTimes();
         }
      }
      
      private function getNeedArr() : Array
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc2_:Array = WealthUtil.dropGroupIDToWealthVoArr(_vo.drop_id);
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
         var _loc1_:JueRoadSaoDangReq = new JueRoadSaoDangReq();
         _loc1_.chapterid = HeroAwakenRoadModel.ins.currentChapterId;
         _loc1_.nodeid = _vo.id;
         ServerEngine.ins.send(7432,_loc1_,server_saoDangCpl);
      }
      
      private function server_saoDangCpl(param1:JueRoadSaoDangRes) : void
      {
         onServerCpl_playerDataNotify(param1);
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
         _leftTimes = Math.min(HeroAwakenRoadModel.ins.leftCount,_doTimes,10);
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
