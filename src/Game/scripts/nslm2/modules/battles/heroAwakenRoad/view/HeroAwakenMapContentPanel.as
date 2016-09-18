package nslm2.modules.battles.heroAwakenRoad.view
{
   import game.ui.heroAwakenRoad.HeroAwakenMapContentUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenRoadChapterVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroAwakenMapContentPanel extends HeroAwakenMapContentUI implements IObserver
   {
       
      
      private var _chapterId:int;
      
      private var _chapterArr:Array;
      
      private var _summaryCtrl:SummaryZoomInEffCtrl;
      
      public function HeroAwakenMapContentPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         this.list_map.selectHandler = selectChapter;
         btn_addCnt.clickHandler = buyCnt;
         this.btn_heroAwakenShop.clickHandler = showHeroAwakenShop;
      }
      
      public function init() : void
      {
         _chapterArr = HeroAwakenRoadModel.ins.chaptersData;
         this.list_map.dataSource = _chapterArr;
      }
      
      public function get curChapterId() : int
      {
         return _chapterId;
      }
      
      public function show(param1:uint) : void
      {
         _chapterId = param1;
         HeroAwakenRoadModel.ins.currentChapterId = param1;
         var _loc2_:StcConstellationPageVo = StcMgr.ins.getConstellationPageVo(param1);
         this.txt_title.text = LocaleMgr.ins.getStr(_loc2_.name);
         this.ui_top.dataSource = param1;
         if(HeroAwakenRoadModel.ins.leftCount > 0)
         {
            txt_cnt.color = 458496;
         }
         else
         {
            txt_cnt.color = 16723968;
         }
         txt_cnt.text = HeroAwakenRoadModel.ins.leftCount + "/" + DefindConsts.JUEXINGZHILU_CISHU;
         HeroAwakenRoadModel.ins.preLoadBg(param1);
         txt_tip.text = LocaleMgr.ins.getStr(30120020,[DefindConsts.JUEXINGZHILU_CISHU]);
         FuncOpenAutoCtrl.checkFuncBtnNew(30124,btn_heroAwakenShop);
      }
      
      private function selectChapter(param1:int) : void
      {
         var _loc2_:HeroAwakenRoadChapterVo = _chapterArr[param1];
         show(_loc2_.id);
      }
      
      private function buyCnt() : void
      {
         AlertUtil.comfirm(new BuyFightCountView());
      }
      
      private function showHeroAwakenShop() : void
      {
         ModuleMgr.ins.showOrCloseModule(60300,new ShopOpenVo(30124),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["update_fight_count"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("update_fight_count" === _loc3_)
         {
            if(HeroAwakenRoadModel.ins.leftCount > 0)
            {
               txt_cnt.color = 458496;
            }
            else
            {
               txt_cnt.color = 16723968;
            }
            txt_cnt.text = HeroAwakenRoadModel.ins.leftCount + "/" + DefindConsts.JUEXINGZHILU_CISHU;
         }
      }
   }
}
