package nslm2.modules.battles.heroAwakenRoad.effectCtrl
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.battles.heroAwakenRoad.view.render.HeroAwakenChapterRender;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroAwakenChapterSelectChangeCtrl implements IDispose
   {
       
      
      public var _chapterRender:HeroAwakenChapterRender;
      
      private var _flagArr:Array;
      
      public function HeroAwakenChapterSelectChangeCtrl(param1:HeroAwakenChapterRender)
      {
         super();
         _chapterRender = param1;
      }
      
      public function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _chapterRender.mouseEvent = false;
         if(_chapterRender.flagArr)
         {
            _flagArr = _chapterRender.flagArr;
            _loc1_ = _flagArr.length;
            while(_loc2_ < _loc1_)
            {
               _flagArr[_loc2_].y = _flagArr[_loc2_].y - 20;
               _flagArr[_loc2_].alpha = 0;
               _loc2_++;
            }
         }
      }
      
      public function exec() : void
      {
         showRoute();
      }
      
      public function showRoute() : void
      {
         showFlag();
      }
      
      public function showFlag() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         if(_chapterRender.flagArr)
         {
            _loc1_ = _flagArr.length;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = 80 / Config.GAME_FPS / _loc1_ * _loc3_;
               if(_loc3_ != _loc1_ - 1)
               {
                  TweenLite.to(_flagArr[_loc3_],0.2,{
                     "y":_flagArr[_loc3_].y + 20,
                     "delay":_loc2_,
                     "alpha":1
                  });
               }
               else
               {
                  TweenLite.to(_flagArr[_loc3_],0.2,{
                     "y":_flagArr[_loc3_].y + 20,
                     "delay":_loc2_,
                     "alpha":1,
                     "onComplete":effectCpl
                  });
               }
               _loc3_++;
            }
         }
      }
      
      public function effectCpl() : void
      {
         ObserverMgr.ins.sendNotice("evtChapterSelectEffectCpl");
         _chapterRender.mouseEvent = true;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _chapterRender.mouseEvent = true;
         if(_flagArr)
         {
            _loc1_ = _flagArr.length;
            while(_loc2_ < _loc1_)
            {
               TweenLite.killTweensOf(_flagArr[_loc2_]);
               _loc2_++;
            }
         }
         if(_chapterRender && _chapterRender.route)
         {
            TweenLite.killTweensOf(_chapterRender.route);
         }
      }
   }
}
