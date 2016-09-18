package nslm2.modules.battles.resourceDungeons
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObjectContainer;
   import nslm2.common.vo.WealthVo;
   import flash.geom.Point;
   import game.ui.commons.icons.WealthRenderS2UI;
   import com.mz.core.utils.MathUtil;
   import com.greensock.TweenLite;
   
   public class GainEff extends TaskBase
   {
       
      
      public var parent:DisplayObjectContainer;
      
      public var delay:Number;
      
      public var vo:WealthVo;
      
      public var gain:int;
      
      public var from:Point;
      
      public var to:Point;
      
      private var ui:WealthRenderS2UI;
      
      public function GainEff()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ui = new WealthRenderS2UI();
         ui.wealthVo = this.vo;
         ui.scale = 0.1;
         ui.x = from.x;
         ui.y = from.y;
         this.parent.addChild(ui);
         var _loc1_:Point = new Point(MathUtil.randomRadii((to.x - from.x) / 2 + from.x,20),(to.y - from.y) / 2 + from.y);
         TweenLite.to(ui,MathUtil.random(0.8,0.3),{
            "delay":delay,
            "x":_loc1_.x,
            "y":_loc1_.y,
            "scale":1,
            "onComplete":playCpl
         });
      }
      
      private function playCpl() : void
      {
         TweenLite.to(ui,MathUtil.random(0.8,0.3),{
            "delay":delay,
            "x":to.x,
            "y":to.y,
            "scale":0.01,
            "onComplete":playCpl2
         });
      }
      
      private function playCpl2() : void
      {
         ui.dispose();
         this.onComplete();
      }
   }
}
