package nslm2.modules.battles.heroAwakenRoad
{
   import game.ui.heroAwakenRoad.HeroAwakenRoadModuleUI;
   import nslm2.modules.battles.heroAwakenRoad.view.HeroAwakenMapContentPanel;
   import nslm2.modules.battles.heroAwakenRoad.view.HeroAwakenMonsterInfoPanel;
   import nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenInfoPanelCtrl;
   import nslm2.common.compsEffects.ChapterListPageBarCtrl;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService;
   import morn.core.components.Component;
   import morn.core.components.List;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.configs.EnvConfig;
   import proto.JueRoadInfoRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenModuleEffectCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.battles.heroAwakenRoad.view.render.HeroAwakenNpcRender;
   import morn.customs.expands.MornExpandUtil;
   
   public class HeroAwakenRoadModule extends HeroAwakenRoadModuleUI
   {
       
      
      private var _chapterId:uint;
      
      private var _dungeonMapContent:HeroAwakenMapContentPanel;
      
      private var _dungeonInfoPanel:HeroAwakenMonsterInfoPanel;
      
      private var _firstShowed:Boolean;
      
      private var _dungeonInfoPanelCtrl:HeroAwakenInfoPanelCtrl;
      
      private var _chapterListPageBarCtrl:ChapterListPageBarCtrl;
      
      private var model:HeroAwakenRoadModel;
      
      private var service:HeroAwakenRoadService;
      
      private var _initVo:ChapterModuleInitVo;
      
      private var _showIndex:int;
      
      public function HeroAwakenRoadModule()
      {
         _dungeonInfoPanel = new HeroAwakenMonsterInfoPanel();
         model = HeroAwakenRoadModel.ins;
         service = HeroAwakenRoadService.ins;
         super();
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.setCenter(this);
         switchEventListeners(true);
         _dungeonMapContent = new HeroAwakenMapContentPanel();
         model.initChaptersData();
      }
      
      protected function get content() : Component
      {
         return _dungeonMapContent;
      }
      
      protected function get listMap() : List
      {
         return _dungeonMapContent.list_map;
      }
      
      private function checkNg() : void
      {
         NGUtil.checkModuleShow(30121,this);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(EnvConfig.ins.useServer)
         {
            service.getjueRoadInfo(server_roadInfo_cpl);
         }
         else
         {
            moduleServerCpl();
         }
      }
      
      private function server_roadInfo_cpl(param1:JueRoadInfoRes) : void
      {
         model.updateChapterInfo(param1.infos);
         model.leftCount = param1.freetimes;
         moduleServerCpl();
      }
      
      private function resetList() : void
      {
         this.listGotoSelectIndex(model.currentChapterIndex);
         this.setListCanGoPage(model.activateLastChapterIndex);
         var _loc1_:StcConstellationPageVo = StcMgr.ins.getVoByMultiColumnValue("static_constellation_page",["sort"],[model.activateLastChapterIndex + 1]);
         if(_loc1_ && PlayerModel.ins.level >= int(_loc1_.player_lv))
         {
            this.setLevelCanGoPage(model.activateLastChapterIndex + 1);
         }
         else
         {
            this.setLevelCanGoPage(model.activateLastChapterIndex);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(param1 != null)
         {
            _initVo = param1 as ChapterModuleInitVo;
            this._chapterId = _initVo.chapterId;
            model.currentChapterId = _initVo.chapterId;
            if(_initVo.showFade == false)
            {
               this.moduleFadeInType = 0;
            }
         }
         this.panelBg.bgCustom.addChild(content);
         this.panelBg.img_rim.mouseEnabled = false;
         this.panelBg.img_rim.mouseChildren = false;
         _chapterListPageBarCtrl = new ChapterListPageBarCtrl(listMap,null,this.btn_left.btn_arrow,this.btn_right.btn_arrow);
         this.parts.push(new ChapterListPageBarCtrl(listMap,null,this.btn_left.btn_arrow,this.btn_right.btn_arrow));
         this.parts.push(new BtnLongBarCtrl(this.btn_left.btn_arrow,this.btn_left.img_bg));
         this.parts.push(new BtnLongBarCtrl(this.btn_right.btn_arrow,this.btn_right.img_bg));
         this.panelBg.titleImgId = this.moduleId;
         _dungeonInfoPanelCtrl = new HeroAwakenInfoPanelCtrl(_dungeonInfoPanel,this);
         this.parts.push(new HeroAwakenInfoPanelCtrl(_dungeonInfoPanel,this));
         _dungeonMapContent.init();
         _dungeonMapContent.y = 25;
         this.setChangeHandler(showChapterSelectEffect);
         _chapterId = model.currentChapterId;
         resetList();
      }
      
      override public function show(param1:Object = null) : void
      {
         $param = param1;
         super.show($param);
         checkNg();
         TimerManager.ins.doOnce(700,function():void
         {
            HeroAwakenModuleEffectCtrl.ins.exec();
         });
         TimerManager.ins.doOnce(100,function():void
         {
            ObserverMgr.ins.sendNotice("evtChapterSelectChanged");
         });
      }
      
      private function showChapterSelectEffect() : void
      {
         ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
         ObserverMgr.ins.sendNotice("evtChapterSelectChanged");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("showMapModule" !== _loc4_)
         {
            if("evtChapterCpl" !== _loc4_)
            {
               if("evtChapterSelectEffectCpl" !== _loc4_)
               {
                  if("PLAYER_LEVEL_UP" !== _loc4_)
                  {
                  }
               }
               else
               {
                  checkNg();
               }
               _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[ChapterModel.ins.nextChapterVo.id,1]);
               if(PlayerModel.ins.level > int(_loc3_.unlock_level))
               {
                  this.setLevelCanGoPage(ChapterModel.ins.nextChapterVo.sort - 1);
               }
               else
               {
                  this.setLevelCanGoPage(ChapterModel.ins.nextChapterVo.sort - 2);
               }
            }
            else
            {
               showChapterCplEffect();
            }
         }
         else
         {
            if(_firstShowed == false)
            {
               _firstShowed = true;
               this.preShowCpl();
               if(_initVo && _initVo.stageId)
               {
                  ObserverMgr.ins.sendNotice("evtShowTargetStage",_initVo.stageId);
               }
            }
            this.preShowCpl();
         }
      }
      
      private function showChapterCplEffect() : void
      {
         showLight();
      }
      
      private function showLight() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(4040007);
         _loc1_.x = this.width / 2 - 226;
         _loc1_.y = this.height / 2 - 231;
         this.addChild(_loc1_);
         this.mouseEvent = true;
         TweenLite.delayedCall(1,autoGoToNextChapter);
      }
      
      private function autoGoToNextChapter() : void
      {
         var nextIndex:int = model.currentChapterIndex + 1;
         var $stageVo:StcConstellationPageVo = StcMgr.ins.getVoByMultiColumnValue("static_constellation_page",["sort"],[nextIndex]);
         if(PlayerModel.ins.level >= int($stageVo.player_lv))
         {
            this.listGotoSelectIndex(nextIndex);
            TimerManager.ins.doOnce(100,function():void
            {
               ObserverMgr.ins.sendNotice("evtChapterSelectChanged");
            });
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["showMapModule","evtChapterCpl","evtChapterSelectEffectCpl","PLAYER_LEVEL_UP"];
      }
      
      protected function setListCanGoPage(param1:uint) : void
      {
         _chapterListPageBarCtrl.canGoPage = param1;
      }
      
      protected function setLevelCanGoPage(param1:uint) : void
      {
         _chapterListPageBarCtrl.setLevelCanGoPage = param1;
      }
      
      protected function listGotoSelectIndex(param1:uint) : void
      {
         _chapterListPageBarCtrl.goToSelectIndex(param1);
      }
      
      protected function setChangeHandler(param1:*) : void
      {
         _chapterListPageBarCtrl.setChangeHandler(param1);
      }
      
      public function getCompParentById(param1:StcGuideVo) : Component
      {
         var _loc2_:* = null;
         var _loc3_:String = param1.comp_id;
         if(_loc3_ && _loc3_.indexOf("flag") != -1)
         {
            _loc2_ = _loc3_.replace("flag","all");
            return NGUtil.getCompById(this._dungeonMapContent,_loc2_,param1) as HeroAwakenNpcRender;
         }
         return this;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         switchEventListeners(false);
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(autoGoToNextChapter);
         if(content)
         {
            content.dispose();
         }
         super.dispose();
      }
   }
}
