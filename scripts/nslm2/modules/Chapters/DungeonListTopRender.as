package nslm2.modules.Chapters
{
   import game.ui.chapters.DungeonListTopRenderUI;
   import com.mz.core.interFace.IObserver;
   import morn.customs.components.ClipList;
   import game.ui.chapters.StarRenderUI;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.uiEffects.IconFlyEff;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class DungeonListTopRender extends DungeonListTopRenderUI implements IObserver
   {
       
      
      private var _getStarCnt:int;
      
      private var _totalStarCnt:int;
      
      private var _chapterId:int;
      
      private var _clipListVec:Vector.<ClipList>;
      
      private var _starVec:Vector.<StarRenderUI>;
      
      private var _boxArr:Array;
      
      private var _boxType:Array;
      
      private var _ctrlArr:Array;
      
      public function DungeonListTopRender()
      {
         _boxArr = [];
         _boxType = [0,1,2];
         _ctrlArr = [];
         super();
         _clipListVec = new <ClipList>[this.clipList_rewardNeed0,this.clipList_rewardNeed1,this.clipList_rewardNeed2];
         _starVec = new <StarRenderUI>[this.starRender0,this.starRender1,this.starRender2];
         _boxArr = [this.box0,this.box1,this.box2];
         var _loc3_:int = 0;
         var _loc2_:* = _starVec;
         for each(var _loc1_ in _starVec)
         {
            _loc1_.toolTip = LocaleMgr.ins.getStr(40400024);
         }
         this.parts.push(new ProgressBarCtrl(this.progress_star).splitCnt(3));
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(param1 as int > 0)
         {
            _chapterId = param1 as int;
            _getStarCnt = ChapterModel.ins.getStarGetCnt(_chapterId) - ChapterModel.ins.chapterStarCntAdd();
            _totalStarCnt = ChapterModel.ins.getStarTotalCnt(_chapterId);
         }
         _loc2_ = 0;
         while(_loc2_ < this._boxArr.length)
         {
            (this._boxArr[_loc2_] as TreasureBoxBaseRender).treasureType = _boxType[_loc2_];
            _loc2_++;
         }
         this.clipList_rewardNow.value = _getStarCnt;
         this.clipList_rewardTotal.value = _totalStarCnt;
         setRewardShow();
      }
      
      private function clearTreasureCtrl() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _ctrlArr;
         for each(var _loc1_ in _ctrlArr)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         _ctrlArr = [];
      }
      
      private function setRewardShow() : void
      {
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(isDisposed)
         {
            return;
         }
         var _loc4_:StcChapterVo = StcMgr.ins.getChapterVo(_chapterId);
         var _loc8_:Array = _loc4_.star_level_needed.split("|");
         var _loc6_:Array = _loc4_.reward_drop_id.split("|");
         _loc7_ = 0;
         while(_loc7_ < _loc8_.length)
         {
            this._clipListVec[_loc7_].value = _loc8_[_loc7_];
            if(_getStarCnt >= _loc8_[_loc7_])
            {
               this._clipListVec[_loc7_].filters = null;
            }
            else
            {
               this._clipListVec[_loc7_].filters = [FilterUtil.grayFilter()];
            }
            _loc7_++;
         }
         var _loc1_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc8_.length)
         {
            if(_getStarCnt >= _loc8_[_loc7_])
            {
               if(_loc7_ > ChapterModel.ins.getRewardStep(_chapterId) - 1)
               {
                  if(_loc7_ == ChapterModel.ins.getRewardStep(_chapterId))
                  {
                     _loc1_.push(2);
                  }
                  else
                  {
                     _loc1_.push(1);
                  }
               }
               else
               {
                  _loc1_.push(3);
               }
            }
            else
            {
               _loc1_.push(1);
            }
            _loc7_++;
         }
         clearTreasureCtrl();
         _loc5_ = 0;
         while(_loc5_ < this._boxArr.length)
         {
            _loc2_ = new TreasureBoxVo(WealthUtil.dropGroupIDToWealthVoArr(_loc6_[_loc5_]),_loc1_[_loc5_]);
            _loc3_ = new ChapterTreasureCtrl(this._boxArr[_loc5_],_loc2_).setIndex(_loc5_).setChapterId(this._chapterId);
            this.parts.push(_loc3_);
            _ctrlArr.push(_loc3_);
            _loc5_++;
         }
         this.progress_star.value = _getStarCnt / _totalStarCnt;
         this.box_chapterStar.toolTip = LocaleMgr.ins.getStr(40400027,[_getStarCnt,_totalStarCnt]);
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtChapterStarGlobalPos"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         if("evtChapterStarGlobalPos" === _loc5_)
         {
            _loc3_ = param2 as Vector.<StarRenderUI>;
            while(_loc4_ < _loc3_.length)
            {
               new IconFlyEff(IconFlyEff.copyImage(_loc3_[_loc4_].img_star),_loc3_[_loc4_].localToGlobal(new Point()),this.progress_star.localToGlobal(new Point(150,0))).set_delayExec(150 * _loc4_).addHandlers(flyCpl).exec();
               _loc4_++;
            }
         }
      }
      
      private function flyCpl() : void
      {
         TweenLite.to(this.clipList_rewardNow,0.2,{"scale":1.4});
         TweenLite.to(this.clipList_rewardNow,0.2,{
            "scale":1,
            "delay":0.2
         });
         _getStarCnt = ChapterModel.ins.getStarGetCnt(_chapterId);
         TweenLite.to(this.progress_star,0.4,{
            "value":_getStarCnt / _totalStarCnt,
            "onComplete":setRewardShow
         });
         this.clipList_rewardNow.tweenValue = _getStarCnt;
         ChapterModel.ins.resetPreProcessInfos();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TweenLite.killTweensOf(this.progress_star);
         super.dispose();
      }
   }
}
