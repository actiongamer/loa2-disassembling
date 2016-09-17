package nslm2.common.ui.components.comp3ds
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import com.mz.core.utils.MathUtil;
   
   public class CountCWPoi
   {
       
      
      public var center:Point;
      
      public var range:Rectangle;
      
      public var rs:Vector.<Point>;
      
      protected var curPoi:Point;
      
      protected var curDir:Point;
      
      protected var curDirLeaveStep:int;
      
      protected var curLvStartPoi:Point;
      
      protected var curLv:int;
      
      public var maxLv:int;
      
      public function CountCWPoi()
      {
         rs = new Vector.<Point>();
         super();
      }
      
      public function count() : void
      {
         maxLv = MathUtil.max([center.x - range.x,range.width - range.x - center.x,center.y - range.y,range.height - range.y - center.y]);
         curLv = 0;
         curLvStartPoi = this.center;
         curPoi = this.center;
         if(range.containsPoint(center))
         {
            rs.push(center);
         }
         step();
      }
      
      private function step() : void
      {
         if(curPoi.equals(this.curLvStartPoi))
         {
            curLv = Number(curLv) + 1;
            if(curLv > maxLv)
            {
               return;
            }
            curDirLeaveStep = curLv * 2;
            curLvStartPoi = curPoi.add(new Point(-1,-1));
            if(range.containsPoint(curLvStartPoi))
            {
               rs.push(curLvStartPoi);
            }
            curDir = new Point(1,0);
            curPoi = curLvStartPoi.add(curDir);
            step();
         }
         else
         {
            if(range.containsPoint(curPoi))
            {
               rs.push(curPoi);
            }
            curDirLeaveStep = Number(curDirLeaveStep) - 1;
            if(curDirLeaveStep <= 0)
            {
               this.curDir = nextDir();
               curDirLeaveStep = curLv * 2;
            }
            curPoi = curPoi.add(curDir);
            step();
         }
      }
      
      protected function nextDir() : Point
      {
         if(curDir.x == 1 && curDir.y == 0)
         {
            return new Point(0,1);
         }
         if(curDir.x == 0 && curDir.y == 1)
         {
            return new Point(-1,0);
         }
         if(curDir.x == -1 && curDir.y == 0)
         {
            return new Point(0,-1);
         }
         return new Point(1,0);
      }
   }
}
