package nslm2.common.ui.components.comp3ds
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import com.mz.core.utils.MathUtil;
   
   public class CountCWPoiNext
   {
       
      
      public var center:Point;
      
      public var range:Rectangle;
      
      protected var curPoi:Point;
      
      protected var curDir:Point;
      
      protected var curDirLeaveStep:int;
      
      protected var curLvStartPoi:Point;
      
      protected var curLv:int;
      
      public var maxLv:int;
      
      public function CountCWPoiNext()
      {
         curDir = new Point();
         super();
      }
      
      public function init() : void
      {
         maxLv = MathUtil.max([center.x - range.x,range.width - range.x - center.x,center.y - range.y,range.height - range.y - center.y]);
         curDir.x = 0;
         curDir.y = -1;
         curLv = 0;
         curLvStartPoi = this.center;
         curPoi = this.center;
      }
      
      public function next() : Point
      {
         if(curPoi.equals(this.curLvStartPoi) && curDir.x == 0 && curDir.y == -1)
         {
            curLv = Number(curLv) + 1;
            if(curLv > maxLv)
            {
               return null;
            }
            curDirLeaveStep = curLv * 2;
            curLvStartPoi.x = curPoi.x - 1;
            curLvStartPoi.y = curPoi.y - 1;
            curPoi = curLvStartPoi.clone();
            curDir.x = 1;
            curDir.y = 0;
            if(range.containsPoint(curPoi))
            {
               return this.curPoi;
            }
            return next();
         }
         if(curDirLeaveStep <= 0)
         {
            countNextDir();
            curDirLeaveStep = curLv * 2;
         }
         curPoi = curPoi.add(curDir);
         curDirLeaveStep = Number(curDirLeaveStep) - 1;
         if(range.containsPoint(curPoi) && curPoi.equals(this.curLvStartPoi) == false)
         {
            return curPoi;
         }
         return next();
      }
      
      protected function countNextDir() : void
      {
         if(curDir.x == 1 && curDir.y == 0)
         {
            curDir.x = 0;
            curDir.y = 1;
         }
         else if(curDir.x == 0 && curDir.y == 1)
         {
            curDir.x = -1;
            curDir.y = 0;
         }
         else if(curDir.x == -1 && curDir.y == 0)
         {
            curDir.x = 0;
            curDir.y = -1;
         }
         else
         {
            curDir.x = 1;
            curDir.y = 0;
         }
      }
   }
}
