package nslm2.modules.Chapters
{
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetCompParent;
   import morn.core.components.Component;
   import morn.core.components.List;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetStageInfosRes;
   import proto.GetChapterInfosRes;
   import nslm2.common.globals.GlobalRef;
   import proto.GetStageInfoReq;
   import proto.EliteInvadeNotify;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.modules.Chapters.maps.ChapterFlagOnceRender;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class DungeonMapModule extends DungeonMapBaseModule implements INewerGuideCheckHandler, INewerGuideGetComp, INewerGuideGetCompParent
   {
       
      
      private var _chapterId:uint;
      
      private var _dungeonMapContent:nslm2.modules.Chapters.DungeonMapContentPanel;
      
      private var _dungeonInfoPanel:nslm2.modules.Chapters.DungeonInfoPanel;
      
      private var _firstShowed:Boolean;
      
      private var _dungeonInfoPanelCtrl:nslm2.modules.Chapters.DungeonInfoPanelCtrl;
      
      private var _tabChanged:Boolean;
      
      private var _initVo:nslm2.modules.Chapters.ChapterModuleInitVo;
      
      private var _showIndex:int;
      
      public function DungeonMapModule()
      {
         _dungeonInfoPanel = new nslm2.modules.Chapters.DungeonInfoPanel();
         _dungeonMapContent = new nslm2.modules.Chapters.DungeonMapContentPanel();
         super();
      }
      
      override protected function get content() : Component
      {
         return _dungeonMapContent;
      }
      
      override protected function get listMap() : List
      {
         return _dungeonMapContent.list_map;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(EnvConfig.ins.useServer)
         {
            ServerEngine.ins.send(8056,null,serverCpl_getChapterInfos);
         }
         else
         {
            moduleServerCpl();
         }
      }
      
      private function serverCpl_getStageInfos(param1:GetStageInfosRes) : void
      {
         if(param1)
         {
            ChapterModel.ins.parse(param1.infos);
         }
         else
         {
            ChapterModel.ins.parse([]);
         }
         this.moduleServerCpl();
      }
      
      private function serverCpl_getChapterInfos(param1:GetChapterInfosRes) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            ChapterModel.ins.parseReward(param1.infos);
         }
         else
         {
            ChapterModel.ins.parseReward([]);
         }
         if(GlobalRef.mainCityReshowParam.lastAttackChapterId != 0)
         {
            _loc2_ = new GetStageInfoReq();
            _loc2_.chapterId = GlobalRef.mainCityReshowParam.lastAttackChapterId;
            ServerEngine.ins.send(8055,_loc2_,serverCpl_getStageInfos);
            GlobalRef.mainCityReshowParam.lastAttackChapterId = 0;
         }
         else
         {
            this.moduleServerCpl();
         }
      }
      
      private function onServerCpl_eliteInvadeNotify(param1:EliteInvadeNotify) : void
      {
         if(param1)
         {
            EliteInvadeModel.ins.onAddNew(param1.elites);
         }
         else
         {
            EliteInvadeModel.ins.onAddNew([]);
         }
      }
      
      override protected function moduleServerCpl() : void
      {
         super.moduleServerCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this._dungeonMapContent.addEventListener("evtChapterTabChanged",onTabChanged);
            ServerEngine.ins.addAlwayHandler(8064,onServerCpl_eliteInvadeNotify);
         }
         else
         {
            this._dungeonMapContent.removeEventListener("evtChapterTabChanged",onTabChanged);
            ServerEngine.ins.removeAlwayHandler(8064,onServerCpl_eliteInvadeNotify);
         }
      }
      
      private function onTabChanged(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(_firstShowed == true)
         {
            _tabChanged = true;
         }
         if(_firstShowed || _chapterId == 0)
         {
            _loc3_ = ChapterModel.ins.nextChapterVo;
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc3_.id,1]);
            if(PlayerModel.ins.level >= int(_loc2_.unlock_level))
            {
               this._chapterId = _loc3_.id;
            }
            else
            {
               _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_chapter",["sort","kind"],[_loc3_.sort - 1,_loc3_.kind]);
               this._chapterId = _loc3_.id;
            }
            ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
         }
         resetList();
      }
      
      private function resetList() : void
      {
         var _loc2_:StcChapterVo = StcMgr.ins.getChapterVo(_chapterId);
         this.listGotoSelectIndex(_loc2_.sort - 1);
         this.setListCanGoPage(ChapterModel.ins.nextChapterVo.sort - 1);
         var _loc1_:StcStageVo = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[ChapterModel.ins.nextChapterVo.id,1]);
         if(PlayerModel.ins.level >= int(_loc1_.unlock_level))
         {
            this.setLevelCanGoPage(ChapterModel.ins.nextChapterVo.sort - 1);
         }
         else
         {
            this.setLevelCanGoPage(ChapterModel.ins.nextChapterVo.sort - 2);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         _dungeonInfoPanelCtrl = new nslm2.modules.Chapters.DungeonInfoPanelCtrl(_dungeonInfoPanel,this);
         this.parts.push(new nslm2.modules.Chapters.DungeonInfoPanelCtrl(_dungeonInfoPanel,this));
         if(param1 != null)
         {
            _initVo = param1 as nslm2.modules.Chapters.ChapterModuleInitVo;
            this._chapterId = _initVo.chapterId;
            ChapterModel.ins.chapterType = StcMgr.ins.getChapterVo(_initVo.chapterId).kind;
            if(_initVo.showFade == false)
            {
               this.moduleFadeInType = 0;
            }
         }
         _dungeonMapContent.init();
         _dungeonMapContent.y = 25;
         _dungeonMapContent.tab_change.selectedIndex = ChapterConsts.CHAPTER_TYPELIB.indexOf(ChapterModel.ins.chapterType);
         this.setChangeHandler(showChapterSelectEffect);
      }
      
      override public function show(param1:Object = null) : void
      {
         $param = param1;
         super.show($param);
         if(ChapterModel.ins.newChapterId == 0)
         {
            checkNg();
         }
         else
         {
            this.mouseEvent = false;
         }
         TimerManager.ins.doOnce(700,function():void
         {
            ChapterModuleEffectCtrl.ins.exec();
         });
         TimerManager.ins.doOnce(100,function():void
         {
            ObserverMgr.ins.sendNotice("evtChapterSelectChanged");
         });
      }
      
      private function checkNg() : void
      {
         NGUtil.checkModuleShow(40400,this);
      }
      
      private function showChapterSelectEffect() : void
      {
         ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
         ObserverMgr.ins.sendNotice("evtChapterSelectChanged");
      }
      
      override public function getFocusNotices() : Array
      {
         return ["showMapModule","evtChapterCpl","evtChapterSelectEffectCpl","PLAYER_LEVEL_UP"];
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
         else if(_firstShowed == false)
         {
            _firstShowed = true;
            this.preShowCpl();
            if(_initVo && _initVo.stageId)
            {
               ObserverMgr.ins.sendNotice("evtShowTargetStage",_initVo.stageId);
            }
         }
         else if(_tabChanged)
         {
            showChapterSelectEffect();
            _tabChanged = false;
         }
      }
      
      private function showChapterCplEffect() : void
      {
         showLight();
      }
      
      private function showLight() : void
      {
         var _loc4_:* = 0;
         var _loc3_:* = null;
         var _loc2_:uint = StcMgr.ins.getStageVo(ChapterModel.ins.cplId).chapter_id;
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_stage","chapter_id",_loc2_);
         _loc1_.sortOn("sort",16);
         if(_showIndex < _loc1_.length)
         {
            _loc4_ = uint((_loc1_[_showIndex] as StcStageVo).id);
            if((_loc1_[_showIndex] as StcStageVo).kind != 1)
            {
               ObserverMgr.ins.sendNotice("evtNewDungeon",_loc4_);
               _showIndex = Number(_showIndex) + 1;
               TimerManager.ins.doOnce(130,showLight,false);
            }
            else
            {
               _showIndex = Number(_showIndex) + 1;
               showLight();
            }
         }
         else
         {
            _loc3_ = new BmcSpriteSheet();
            _loc3_.init(4040007);
            _loc3_.x = this.width / 2 - 226;
            _loc3_.y = this.height / 2 - 231;
            this.addChild(_loc3_);
            checkNg();
            this.mouseEvent = true;
         }
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:* = null;
         var _loc10_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc11_:* = param1;
         if(10080 !== _loc11_)
         {
            if(10061 !== _loc11_)
            {
               if(10126 !== _loc11_)
               {
                  if(20028 !== _loc11_)
                  {
                     if(20041 === _loc11_)
                     {
                        _loc9_ = param3.comp_id.split("_");
                        _loc5_ = _loc9_[_loc9_.length - 1];
                        _loc6_ = StcMgr.ins.getStageVo(ChapterModel.ins.cplId).sort;
                        if(_loc5_ != _loc6_ + 1)
                        {
                           return 0;
                        }
                     }
                  }
                  else if(VipModel.ins.haveGetVip0Gift() || VipModel.ins.firstCharge == true)
                  {
                     return 0;
                  }
               }
               else if(_chapterId != 100)
               {
                  NGUtil.gm_gotoId(param2[0]);
                  return 4;
               }
            }
            else
            {
               _loc8_ = param3.comp_id.replace("treasureBox","all");
               _loc7_ = NGUtil.getCompById(this._dungeonMapContent,_loc8_,param3) as ChapterFlagOnceRender;
               if(_loc7_)
               {
                  if(_loc7_.treasureCtrl)
                  {
                     if(_loc7_.treasureCtrl.state != 2)
                     {
                        return 0;
                     }
                  }
                  else
                  {
                     return 0;
                  }
               }
               else
               {
                  return 0;
               }
            }
         }
         else
         {
            _loc4_ = param3.comp_id.slice(0,param3.comp_id.length - 1);
            _loc4_ = _loc4_ + ChapterModel.ins.getRewardStep(this._dungeonMapContent.curChapterId);
            _loc10_ = NGUtil.getCompById(this,_loc4_,param3) as TreasureBoxBaseRender;
            if(_loc10_.nowState != 2)
            {
               return 0;
            }
         }
         return 1;
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!(int(param2.id) - 99363))
         {
            ModuleMgr.ins.closeModule(40401);
            ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
         }
         if(param1.indexOf("box") != -1)
         {
            _loc3_ = param2.comp_id.slice(0,param2.comp_id.length - 1);
            _loc3_ = _loc3_ + ChapterModel.ins.getRewardStep(this._dungeonMapContent.curChapterId);
            _loc4_ = NGUtil.getCompById(this,_loc3_,param2) as TreasureBoxBaseRender;
            if(_loc4_.nowState == 2)
            {
               return _loc4_;
            }
            return NGUtil.getCompById(this,param1,param2);
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function getCompParentById(param1:StcGuideVo) : Component
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:String = param1.comp_id;
         if(_loc4_ && _loc4_.indexOf("box") != -1)
         {
            _loc3_ = _loc4_.replace("box","all");
            _loc2_ = NGUtil.getCompById(this._dungeonMapContent,_loc3_,param1) as ChapterFlagOnceRender;
            if(_loc2_)
            {
               return _loc2_;
            }
         }
         if(_loc4_ && _loc4_.indexOf("flag") != -1)
         {
            _loc3_ = _loc4_.replace("flag","all");
            _loc2_ = NGUtil.getCompById(this._dungeonMapContent,_loc3_,param1) as ChapterFlagOnceRender;
            if(_loc2_)
            {
               return _loc2_;
            }
         }
         return this;
      }
      
      override public function dispose() : void
      {
         if(_dungeonMapContent)
         {
            _dungeonMapContent.dispose();
            _dungeonMapContent = null;
         }
         if(_dungeonInfoPanel)
         {
            _dungeonInfoPanel.dispose();
            _dungeonInfoPanel = null;
         }
         super.dispose();
      }
   }
}
