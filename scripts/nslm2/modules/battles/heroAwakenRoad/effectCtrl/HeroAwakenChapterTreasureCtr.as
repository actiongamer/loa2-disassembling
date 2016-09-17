package nslm2.modules.battles.heroAwakenRoad.effectCtrl
{
   import nslm2.modules.Chapters.treasureBox.TreasureBoxCtrlBase;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenRoadChapterVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import game.ui.chapters.BoxAlertRenderUI;
   import nslm2.modules.Chapters.TreasureBoxModuleVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.JueRoadGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.JueRoadGetRewardRes;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   
   public class HeroAwakenChapterTreasureCtr extends TreasureBoxCtrlBase
   {
       
      
      private var _chapterId:int;
      
      private var _index:int;
      
      private var _treasureBoxName:Vector.<int>;
      
      private var $chapterVo:StcConstellationPageVo;
      
      private var $starNeededArr:Array;
      
      private var crtChapterVo:HeroAwakenRoadChapterVo;
      
      public function HeroAwakenChapterTreasureCtr(param1:*, param2:*)
      {
         _treasureBoxName = new <int>[40400028,40400045,40400046,30121026];
         super(param1,param2);
      }
      
      public function setChapterId(param1:int) : HeroAwakenChapterTreasureCtr
      {
         this._chapterId = param1;
         crtChapterVo = HeroAwakenRoadModel.ins.currentChapterData;
         $chapterVo = StcMgr.ins.getConstellationPageVo(_chapterId);
         var _loc2_:Array = $chapterVo.star_lv.split("|");
         this.box.toolTip = LocaleMgr.ins.getStr(_treasureBoxName[_index]) + "\r\n" + LocaleMgr.ins.getStr(40400033,[TextFieldUtil.htmlText(_loc2_[_index],new TextFormat(null,null,458496))]);
         return this;
      }
      
      public function setIndex(param1:int) : HeroAwakenChapterTreasureCtr
      {
         this._index = param1;
         return this;
      }
      
      override protected function onBoxClick(param1:MouseEvent) : void
      {
         var _loc4_:StcConstellationPageVo = StcMgr.ins.getConstellationPageVo(_chapterId);
         $starNeededArr = _loc4_.star_lv.split("|");
         var _loc2_:BoxAlertRenderUI = new BoxAlertRenderUI();
         _loc2_.txt_des.text = LocaleMgr.ins.getStr(40400026,[TextFieldUtil.htmlText($starNeededArr[_index],new TextFormat(null,null,458496))]);
         this.vo.optionData = _loc2_;
         var _loc3_:TreasureBoxModuleVo = new TreasureBoxModuleVo(this.vo,moduleCloseHandler,rewardHandler,30121);
         ModuleMgr.ins.showModule(40401,_loc3_,30121);
         super.onBoxClick(param1);
      }
      
      override protected function rewardHandler() : void
      {
         var _loc1_:JueRoadGetRewardReq = new JueRoadGetRewardReq();
         _loc1_.chapterid = this._chapterId;
         _loc1_.boxnum = $starNeededArr[_index];
         ServerEngine.ins.send(7433,_loc1_,serverCpl_playerDataNotify);
      }
      
      private function serverCpl_playerDataNotify(param1:JueRoadGetRewardRes) : void
      {
         var _loc2_:int = $chapterVo.reward_drop_id.split("|")[_index];
         (this.vo as TreasureBoxVo).state = 3;
         this.moduleCloseState = 3;
         refreshBox();
         refreshModule();
         crtChapterVo.gottedRewardIndex.push(int($starNeededArr[_index]));
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.dropGroupIDToWealthVoArr(_loc2_),null,null,30121);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
