package nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob
{
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangPanelUI;
   import game.ui.teamGuajiScenes.pvp.saodang.AutoRobResultViewUI;
   import nslm2.common.vo.WealthVo;
   import proto.GJSaoDangReward;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.MouseEvent;
   
   public class FastRobPanel extends PvPSaoDangPanelUI
   {
       
      
      private var bobResultView:AutoRobResultViewUI;
      
      private var saodangRwdArr:Array;
      
      private var pieceCnt:int;
      
      private var pieceVo:WealthVo;
      
      private var list_source:Array;
      
      public function FastRobPanel()
      {
         list_source = [];
         super();
      }
      
      public function show(param1:Object = null) : void
      {
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         saodangRwdArr = [];
         var _loc2_:Array = param1 as Array;
         var _loc5_:int = _loc2_.length;
         this.list_saodang.dataSource = [];
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc4_ = _loc2_[_loc8_];
            _loc3_ = WealthUtil.rewardArrToWealthVoArr(_loc4_.rwd);
            var _loc10_:int = 0;
            var _loc9_:* = _loc3_;
            for each(var _loc7_ in _loc3_)
            {
               if(_loc7_.kind == 20)
               {
                  pieceVo = _loc7_;
                  pieceCnt = pieceCnt + _loc7_.count;
               }
            }
            _loc6_ = new SaodangVo();
            _loc6_.index = _loc8_ + 1;
            _loc6_.addItemsArr = _loc3_;
            saodangRwdArr.push(_loc6_);
            _loc8_++;
         }
         TeamGuajiModel.ins.robPieceCountToday = TeamGuajiModel.ins.robPieceCountToday + pieceCnt;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300285);
      }
      
      override protected function panelFadeInCpl() : void
      {
         super.panelFadeInCpl();
         if(isDisposed)
         {
            return;
         }
         start();
      }
      
      private function start() : void
      {
         TimerManager.ins.doLoop(200,showFightResult);
      }
      
      private function showFightResult() : void
      {
         if(saodangRwdArr.length > 0)
         {
            list_source.push(saodangRwdArr.shift());
            this.list_saodang.repeatY = list_source.length;
            this.list_saodang.dataSource = list_source;
            list_saodang.refreshSize();
            this.contentPanel.scrollTo(0,this.list_saodang.y + this.list_saodang.height);
         }
         else
         {
            stop();
            TimerManager.ins.clearTimer(showFightResult);
         }
      }
      
      public function stop() : void
      {
         if(!bobResultView)
         {
            bobResultView = new AutoRobResultViewUI();
         }
         if(pieceCnt > 0)
         {
            bobResultView.txt_result.text = LocaleMgr.ins.getStr(41300268,[pieceVo.qualityName + "x" + pieceCnt]);
         }
         else
         {
            bobResultView.txt_result.text = LocaleMgr.ins.getStr(41300269);
         }
         bobResultView.x = 2;
         bobResultView.y = list_saodang.y + list_saodang.height;
         contentPanel.addChild(bobResultView);
         contentPanel.scrollTo(0,bobResultView.y + bobResultView.height);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         TimerManager.ins.clearTimer(showFightResult);
         list_saodang.dataSource = [];
         super.btnCloseHandler(param1);
      }
   }
}
