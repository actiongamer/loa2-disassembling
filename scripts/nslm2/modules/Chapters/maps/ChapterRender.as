package nslm2.modules.Chapters.maps
{
   import game.ui.chapters.ChapterRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import morn.core.components.Box;
   import nslm2.common.ui.components.comps2d.McS2;
   import nslm2.modules.Chapters.effectCtrl.ChapterSelectChangeCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import flash.display.DisplayObjectContainer;
   import nslm2.modules.Chapters.DungeonMapContentPanel;
   import flash.display.Stage;
   import nslm2.modules.Chapters.ChapterModel;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import morn.core.events.UIEvent;
   import nslm2.modules.Chapters.elite.EliteFlagBossRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class ChapterRender extends ChapterRenderUI implements IObserver, INewerGuideGetComp
   {
       
      
      private var _chapterId:int;
      
      private var _dungeonArr:Array;
      
      private var _flagBox:Box;
      
      private var _flagArr:Array;
      
      private var _route:McS2;
      
      private var _chapterSelectChangeCtrl:ChapterSelectChangeCtrl;
      
      public function ChapterRender()
      {
         super();
         img_bg.loadPriority = 2;
      }
      
      public function get flagArr() : Array
      {
         return _flagArr;
      }
      
      public function get route() : McS2
      {
         return _route;
      }
      
      public function get chapterId() : int
      {
         return _chapterId;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            if(_chapterSelectChangeCtrl)
            {
               _chapterSelectChangeCtrl.dispose();
               _chapterSelectChangeCtrl = null;
            }
            switchEventListeners(true);
            if(param1)
            {
               _chapterId = (param1 as StcChapterVo).id;
            }
            clearData();
            this._dungeonArr = StcMgr.ins.getVoArrByColumnValue("static_stage","chapter_id",_chapterId);
            this._dungeonArr.sortOn("sort",16);
            _route = new McS2();
            this.img_bg.skin = UrlLib.chapterMapBg(this._chapterId);
            this.img_bg.addChild(_route);
            if(ClientConfig.isRuLang())
            {
               _loc2_ = this.parent;
               while(_loc2_)
               {
                  if(_loc2_ is DungeonMapContentPanel)
                  {
                     _loc2_.addChildAt(this.img_bg,0);
                     break;
                  }
                  _loc2_ = _loc2_.parent;
                  if(!(_loc2_ is Stage))
                  {
                     continue;
                  }
                  break;
               }
            }
            if(ChapterModel.ins.nextDGVo.sort != 1 || ChapterModel.ins.nextChapterId != this._chapterId)
            {
               _route.stopAtLastFrame().init(40400000 + _chapterId);
            }
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = param1.split("_");
         var _loc6_:* = _loc3_[0];
         if("flag" !== _loc6_)
         {
            if("treasureBox" !== _loc6_)
            {
               if("all" === _loc6_)
               {
                  _loc5_ = param1.replace("all","flag");
                  _loc4_ = _flagBox.getChildByName(_loc5_) as ChapterFlagOnceRender;
                  if(_loc4_)
                  {
                     return _loc4_;
                  }
               }
            }
            else
            {
               _loc5_ = param1.replace("treasureBox","flag");
               _loc4_ = _flagBox.getChildByName(_loc5_) as ChapterFlagOnceRender;
               if(_loc4_)
               {
                  ModuleMgr.ins.closeModule(40401);
                  ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
                  return _loc4_.treasureBox;
               }
            }
            return NGUtil.getCompById(this,param1,param2);
         }
         if(_loc3_[1] == "saoDang")
         {
            return (_flagBox.getChildByName(getCanSaoDangBigestId()) as ChapterFlagOnceRender).ui;
         }
         _loc4_ = _flagBox.getChildByName(param1) as ChapterFlagOnceRender;
         if(_loc4_)
         {
            return _loc4_.ui;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function getCanSaoDangBigestId() : String
      {
         var _loc1_:* = null;
         var _loc2_:Array = ChapterModel.ins.cplIdArrDic.getValue(1);
         _loc2_.sort(2 | 16);
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(ChapterModel.ins.getStageInfoStar(_loc3_) >= DefindConsts.STAR_MAX)
            {
               _loc1_ = StcMgr.ins.getStageVo(_loc3_);
               return "flag_" + StcMgr.ins.getChapterVo(_loc1_.chapter_id).sort + "_" + _loc1_.sort;
            }
         }
         return "";
      }
      
      private function clearData() : void
      {
         if(_flagBox)
         {
            _flagBox.dispose();
            _flagBox = null;
         }
         if(_route)
         {
            _route.dispose();
            _route = null;
         }
         if(_flagArr && _flagArr.length > 0)
         {
            _flagArr = null;
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.img_bg.addEventListener("imageLoaded",onImageLoaded);
         }
         else
         {
            this.img_bg.removeEventListener("imageLoaded",onImageLoaded);
         }
      }
      
      private function onImageLoaded(param1:UIEvent) : void
      {
         switchEventListeners(false);
         addFlag();
      }
      
      private function addFlag() : void
      {
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = undefined;
         _flagBox = new Box();
         _flagArr = [];
         while(_loc4_ <= _dungeonArr.length - 1)
         {
            _loc1_ = _dungeonArr[_loc4_] as StcStageVo;
            if(_loc4_ == _dungeonArr.length - 1)
            {
               if(_loc1_.kind != 3)
               {
                  _loc3_ = new ChapterFlagBossRender(ChapterModel.ins.getStageState(_loc1_.id));
               }
               else
               {
                  _loc3_ = new EliteFlagBossRender(ChapterModel.ins.getStageState(_loc1_.id));
               }
            }
            else if(_loc1_.kind == 1)
            {
               _loc3_ = new ChapterFlagOnceRender(ChapterModel.ins.getStageState(_loc1_.id));
            }
            else if(_loc1_.kind != 3)
            {
               _loc3_ = new ChapterFlagNormalRender(ChapterModel.ins.getStageState(_loc1_.id));
            }
            else
            {
               _loc3_ = new EliteFlagBossRender(ChapterModel.ins.getStageState(_loc1_.id));
            }
            _loc3_.dataSource = _loc1_;
            if(_loc3_.state == 2)
            {
               _loc2_ = _loc3_;
            }
            _loc3_.x = _loc1_.offset_x;
            _loc3_.y = _loc1_.offset_y;
            _loc3_.name = "flag_" + StcMgr.ins.getChapterVo(_loc1_.chapter_id).sort + "_" + _loc1_.sort;
            _flagArr.push(_loc3_);
            _flagBox.addChild(_loc3_);
            _loc4_++;
         }
         if(_loc2_)
         {
            _flagBox.addChild(_loc2_);
         }
         this.addChild(_flagBox);
         if(ChapterModel.ins.nextDGVo.sort == 1 && ChapterModel.ins.nextChapterId == this.chapterId)
         {
            _chapterSelectChangeCtrl = new ChapterSelectChangeCtrl(this);
            this.parts.push(new ChapterSelectChangeCtrl(this));
            _chapterSelectChangeCtrl.init();
         }
         else if(_chapterSelectChangeCtrl)
         {
            _chapterSelectChangeCtrl.dispose();
            _chapterSelectChangeCtrl = null;
         }
         ObserverMgr.ins.sendNotice("showMapModule",this._chapterId);
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtNewDungeon","evtChapterSelectChanged"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("evtNewDungeon" !== _loc3_)
         {
            if("evtChapterSelectChanged" === _loc3_)
            {
               if(ChapterModel.ins.nextDGVo.sort == 1 && ChapterModel.ins.nextChapterId == this.chapterId)
               {
                  _chapterSelectChangeCtrl.exec();
               }
               else
               {
                  if(_chapterSelectChangeCtrl)
                  {
                     _chapterSelectChangeCtrl.dispose();
                     _chapterSelectChangeCtrl = null;
                  }
                  NGUtil.checkModuleShow(40400);
               }
            }
         }
         else
         {
            showNewStageEffect(param2 as uint);
         }
      }
      
      private function showNewStageEffect(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(ChapterModel.ins.isBossStage(param1) || _loc2_.kind == 2 || _loc2_.kind == 3)
         {
            _loc3_ = new BmcSpriteSheet();
            _loc3_.init(4040002);
            _loc3_.x = _loc2_.offset_x - 49;
            _loc3_.y = _loc2_.offset_y - 133;
            this.addChild(_loc3_);
         }
         else
         {
            _loc3_ = new BmcSpriteSheet();
            _loc3_.init(4040001);
            _loc3_.x = _loc2_.offset_x - 49;
            _loc3_.y = _loc2_.offset_y - 95;
            this.addChild(_loc3_);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
