package nslm2.modules.battles.guildDungeons
{
   import com.mz.core.interFace.IDispose;
   import flash.geom.Point;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonTreasureRender;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.MathUtil;
   
   public class GuildDungeonTreasureEffectCtrl implements IDispose
   {
       
      
      private var _minPoint:Point;
      
      private var _maxPoint:Point;
      
      private var _render:GuildDungeonTreasureRender;
      
      public function GuildDungeonTreasureEffectCtrl(param1:GuildDungeonTreasureRender)
      {
         _minPoint = new Point(10,-20);
         _maxPoint = new Point(50,30);
         super();
         _render = param1;
         TimerManager.ins.doOnce(randomDelay(),start,false);
      }
      
      public function start() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = randomCount();
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            TimerManager.ins.doOnce(randomGap(),showEffect,false);
            _loc2_++;
         }
         TimerManager.ins.doOnce(randomDelay(),start,false);
      }
      
      public function showEffect() : void
      {
         var _loc1_:Point = randomPos();
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.init(40702001);
         _loc2_.x = _loc1_.x;
         _loc2_.y = _loc1_.y;
         if(_render)
         {
            _render.addChild(_loc2_);
         }
      }
      
      public function randomPos() : Point
      {
         var _loc2_:Number = MathUtil.random(_maxPoint.x,_minPoint.x);
         var _loc1_:Number = MathUtil.random(_maxPoint.y,_minPoint.y);
         return new Point(_loc2_,_loc1_);
      }
      
      public function randomCount() : int
      {
         return int(MathUtil.random(1,4));
      }
      
      public function randomDelay() : int
      {
         return int(MathUtil.random(2000,6000));
      }
      
      public function randomGap() : int
      {
         return int(MathUtil.random(200,500));
      }
      
      public function dispose() : void
      {
         TimerManager.ins.clearTimer(showEffect);
         TimerManager.ins.clearTimer(start);
      }
   }
}
