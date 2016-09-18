package nslm2.utils
{
   import flash.geom.Point;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import com.mz.core.mgrs.UIMgr;
   
   public class LayerUtil
   {
       
      
      public function LayerUtil()
      {
         super();
      }
      
      public static function centerPoi(param1:DisplayObject, param2:DisplayObjectContainer = null) : Point
      {
         return new Point(centerX(param1,param2),centerY(param1,param2));
      }
      
      public static function centerX(param1:DisplayObject, param2:DisplayObjectContainer = null) : int
      {
         if(param2 == null)
         {
            return UIMgr.gameWidth - param1.width >> 1;
         }
         return param2.width - param1.width >> 1;
      }
      
      public static function centerY(param1:DisplayObject, param2:DisplayObjectContainer = null) : int
      {
         if(param2 == null)
         {
            return UIMgr.gameHeight - param1.height >> 1;
         }
         return param2.height - param1.height >> 1;
      }
      
      public static function toCenter(param1:DisplayObject, param2:DisplayObjectContainer = null) : void
      {
         param1.x = centerX(param1,param2);
         param1.y = centerY(param1,param2);
      }
      
      public static function toCenterYByHeight(param1:DisplayObject, param2:int) : void
      {
         param1.y = param2 - param1.height >> 1;
      }
   }
}
