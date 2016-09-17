package nslm2.modules.battles.heroAwakenRoad.view.render
{
   import game.ui.heroAwakenRoad.HeroAwakenChapterRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import morn.core.components.Box;
   import nslm2.common.ui.components.comps2d.McS2;
   import nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenChapterSelectChangeCtrl;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenRoadChapterVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.events.UIEvent;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenNodeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class HeroAwakenChapterRender extends HeroAwakenChapterRenderUI implements IObserver, INewerGuideGetComp
   {
       
      
      private var _chapterId:int;
      
      private var _dungeonArr:Array;
      
      private var _flagBox:Box;
      
      private var _flagArr:Array;
      
      private var _route:McS2;
      
      private var _chapterSelectChangeCtrl:HeroAwakenChapterSelectChangeCtrl;
      
      private var model:HeroAwakenRoadModel;
      
      private var _chapterVo:HeroAwakenRoadChapterVo;
      
      public function HeroAwakenChapterRender()
      {
         model = HeroAwakenRoadModel.ins;
         super();
         img_bg.loadPriority = 2;
         img_line.loadPriority = 2;
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
         .super.dataSource = param1;
         _chapterVo = param1 as HeroAwakenRoadChapterVo;
         if(_chapterVo)
         {
            _chapterId = _chapterVo.stcVo.id;
            HeroAwakenRoadModel.ins.currentChapterId = _chapterId;
            ObserverMgr.ins.regObserver(this);
            if(_chapterSelectChangeCtrl)
            {
               _chapterSelectChangeCtrl.dispose();
               _chapterSelectChangeCtrl = null;
            }
            switchEventListeners(true);
            clearData();
            this._dungeonArr = _chapterVo.nodesData;
            this._dungeonArr.sortOn("sort",16);
            this.img_bg.skin = UrlLib.heroAwakenRoadChapterMapBg(_chapterVo.stcVo.sort);
            this.img_line.skin = UrlLib.heroAwakenRoadChapterMapLine(_chapterVo.stcVo.sort);
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc4_ = null;
         var _loc3_:Array = param1.split("_");
         var _loc6_:* = _loc3_[0];
         if("flag" !== _loc6_)
         {
            if("all" === _loc6_)
            {
               _loc5_ = param1.replace("all","flag");
               _loc4_ = _flagBox.getChildByName(_loc5_) as HeroAwakenNpcRender;
               if(_loc4_)
               {
                  return _loc4_;
               }
            }
            return NGUtil.getCompById(this,param1,param2);
         }
         _loc4_ = _flagBox.getChildByName(param1) as HeroAwakenNpcRender;
         if(_loc4_)
         {
            return _loc4_.ui;
         }
         return NGUtil.getCompById(this,param1,param2);
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
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = undefined;
         _flagBox = new Box();
         _flagArr = [];
         while(_loc3_ <= _dungeonArr.length - 1)
         {
            _loc2_ = _dungeonArr[_loc3_] as HeroAwakenNodeVo;
            _loc1_ = new HeroAwakenNpcRender();
            _loc1_.dataSource = _loc2_;
            _loc1_.x = _loc2_.offset_x;
            _loc1_.y = _loc2_.offset_y;
            _loc1_.name = "flag_" + _chapterVo.stcVo.sort + "_" + _loc2_.stcVo.sort;
            _flagArr.push(_loc1_);
            _flagBox.addChild(_loc1_);
            _loc3_++;
         }
         this.addChild(_flagBox);
         if(model.activateLastChapterId == chapterId && model.currentChapterData.gotStar == 0)
         {
            _chapterSelectChangeCtrl = new HeroAwakenChapterSelectChangeCtrl(this);
            this.parts.push(new HeroAwakenChapterSelectChangeCtrl(this));
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
               if(model.activateLastChapterId == chapterId && model.currentChapterData.gotStar == 0)
               {
                  _chapterSelectChangeCtrl.exec();
               }
               else if(_chapterSelectChangeCtrl)
               {
                  _chapterSelectChangeCtrl.dispose();
                  _chapterSelectChangeCtrl = null;
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
         var _loc2_:StcConstellationVo = StcMgr.ins.getConstellationVo(param1);
         if(_loc2_.map_id == this.chapterId && !model.isFirstOpen)
         {
            _loc3_ = new BmcSpriteSheet();
            _loc3_.init(4040002);
            _loc3_.x = _loc2_.offset.split("|")[0] - 50;
            _loc3_.y = _loc2_.offset.split("|")[1] - 122;
            this.addChild(_loc3_);
         }
         model.isFirstOpen = false;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
