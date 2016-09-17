package nslm2.modules.Chapters
{
   import nslm2.modules.Chapters.treasureBox.TreasureBoxCtrlBase;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import game.ui.chapters.BoxAlertRenderUI;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.GetChapterRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.PlayerDataNotify;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ChapterTreasureCtrl extends TreasureBoxCtrlBase implements IObserver
   {
       
      
      private var _chapterId:int;
      
      private var _index:int;
      
      private var _treasureBoxName:Vector.<int>;
      
      public function ChapterTreasureCtrl(param1:*, param2:*)
      {
         _treasureBoxName = new <int>[40400028,40400045,40400046];
         super(param1,param2);
         ObserverMgr.ins.regObserver(this);
      }
      
      public function setChapterId(param1:int) : ChapterTreasureCtrl
      {
         this._chapterId = param1;
         var _loc2_:StcChapterVo = StcMgr.ins.getChapterVo(_chapterId);
         var _loc3_:Array = _loc2_.star_level_needed.split("|");
         this.box.toolTip = LocaleMgr.ins.getStr(_treasureBoxName[_index]) + "\r\n" + LocaleMgr.ins.getStr(40400033,[TextFieldUtil.htmlText(_loc3_[_index],new TextFormat(null,null,458496))]);
         return this;
      }
      
      public function setIndex(param1:int) : ChapterTreasureCtrl
      {
         this._index = param1;
         return this;
      }
      
      override protected function onBoxClick(param1:MouseEvent) : void
      {
         var _loc4_:StcChapterVo = StcMgr.ins.getChapterVo(_chapterId);
         var _loc5_:Array = _loc4_.star_level_needed.split("|");
         var _loc2_:BoxAlertRenderUI = new BoxAlertRenderUI();
         _loc2_.txt_des.text = LocaleMgr.ins.getStr(40400026,[TextFieldUtil.htmlText(_loc5_[_index],new TextFormat(null,null,458496))]);
         this.vo.optionData = _loc2_;
         var _loc3_:TreasureBoxModuleVo = new TreasureBoxModuleVo(this.vo,moduleCloseHandler,rewardHandler,40400);
         if(!(int(_loc3_.data.state) - 2))
         {
            Handler.execute(rewardHandler1,[_loc3_]);
         }
         else
         {
            ModuleMgr.ins.showModule(40401,_loc3_,40400);
         }
         super.onBoxClick(param1);
      }
      
      private function rewardHandler1(param1:TreasureBoxModuleVo) : void
      {
         var _loc2_:GetChapterRewardReq = new GetChapterRewardReq();
         _loc2_.chapterId = this._chapterId;
         ServerEngine.ins.addOnceHandler(8004,serverCpl_playerDataNotify);
         ServerEngine.ins.send(8057,_loc2_,null);
         FloatUtil.showGetItemsDisplayPanel(param1.data.itemArr,null,null,param1.parentModuleId);
      }
      
      override protected function rewardHandler() : void
      {
         var _loc1_:GetChapterRewardReq = new GetChapterRewardReq();
         _loc1_.chapterId = this._chapterId;
         ServerEngine.ins.addOnceHandler(8004,serverCpl_playerDataNotify);
         ServerEngine.ins.send(8057,_loc1_,null);
      }
      
      private function serverCpl_playerDataNotify(param1:PlayerDataNotify) : void
      {
         (this.vo as TreasureBoxVo).state = 3;
         this.moduleCloseState = 3;
         ChapterModel.ins.chapterRewardCpl(this._chapterId);
         refreshBox();
         refreshModule();
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if("evtChapterRewardInfoCpl" === _loc5_)
         {
            _loc3_ = StcMgr.ins.getChapterVo(_chapterId);
            _loc4_ = _loc3_.star_level_needed.split("|");
            if(_index == ChapterModel.ins.getRewardStep(_chapterId) && ChapterModel.ins.getStarGetCnt(_chapterId) >= _loc4_[_index])
            {
               (this.vo as TreasureBoxVo).state = 2;
               refreshBox();
               refreshModule();
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtChapterRewardInfoCpl"];
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
