package nslm2.modules.funnies.teamGuajiScenes
{
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import flash.geom.Point;
   import org.specter3d.utils.RandomUtil;
   import com.greensock.TweenLite;
   
   public class BossRandomRun
   {
       
      
      public var boss:SceneUnit3D;
      
      private var isRun:Boolean = false;
      
      private var oriPos:Point;
      
      private var distance:int;
      
      private var moveDelay:int;
      
      public function BossRandomRun(param1:SceneUnit3D, param2:int = 200, param3:int = 4)
      {
         super();
         distance = param2;
         this.boss = param1;
         moveDelay = param3;
      }
      
      public function setOriPos(param1:Point) : void
      {
         if(isRun)
         {
            stop();
         }
         oriPos = param1;
      }
      
      public function start() : void
      {
         if(!oriPos)
         {
            return;
         }
         isRun = true;
         onLoop();
      }
      
      public function resume() : void
      {
         if(!isRun)
         {
            isRun = true;
            onLoop();
         }
      }
      
      private function onLoop() : void
      {
         var _loc2_:Number = RandomUtil.getBetween(-distance,distance);
         var _loc1_:Number = RandomUtil.getBetween(-distance,distance);
         boss.runTo(oriPos.x + _loc2_,oriPos.y + _loc1_,walkComp);
      }
      
      private function walkComp() : void
      {
         if(!isRun)
         {
            return;
         }
         TweenLite.delayedCall(moveDelay,onLoop);
      }
      
      public function stop() : void
      {
         TweenLite.killDelayedCallsTo(onLoop);
         boss.stopRun();
         isRun = false;
      }
      
      public function dispose() : void
      {
         stop();
         boss.userData = null;
      }
   }
}
