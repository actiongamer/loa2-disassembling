package nslm2.modules.dungeons.scripts
{
   import flash.geom.Point;
   
   public class TweenToData
   {
       
      
      public var target:Object;
      
      public var result:Point;
      
      public var oriXY:Point;
      
      public var aimXY:Point;
      
      public var totalFrame:int;
      
      public function TweenToData()
      {
         result = new Point();
         super();
      }
      
      public function countXY(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 <= this.totalFrame)
         {
            _loc2_ = (aimXY.x - oriXY.x) / this.totalFrame * param1 + oriXY.x;
            _loc3_ = (aimXY.y - oriXY.y) / this.totalFrame * param1 + oriXY.y;
            result.x = _loc2_;
            result.y = _loc3_;
            if(target)
            {
               target.x = _loc2_;
               target.y = _loc3_;
            }
         }
      }
   }
}
