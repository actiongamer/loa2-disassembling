package nslm2.mgrs.stcMgrs.consts
{
   import flash.geom.Point;
   
   public class StcNpcGroupConsts
   {
      
      public static const KIND_NORMAL:int = 1;
      
      public static const KIND_BOSS_CAMERA:int = 2;
      
      public static const KIND_CITY_SCENE_NPC:int = 3;
       
      
      public function StcNpcGroupConsts()
      {
         super();
      }
      
      public static function positionToPoi(param1:String) : Point
      {
         var _loc4_:Array = param1.split("|");
         var _loc3_:Array = _loc4_[0].split(":");
         var _loc2_:Array = _loc3_[0].split(",");
         return new Point(_loc2_[0],_loc2_[1]);
      }
      
      public static function positionToRo(param1:String) : int
      {
         var _loc3_:Array = param1.split("|");
         var _loc2_:Array = _loc3_[0].split(":");
         if(_loc2_.length > 1)
         {
            return _loc2_[1];
         }
         return 0;
      }
      
      public static function positionToPoi2(param1:String) : Point
      {
         var _loc2_:* = null;
         var _loc3_:Array = param1.split("|");
         if(_loc3_.length > 1)
         {
            _loc2_ = _loc3_[1].split(",");
            return new Point(_loc2_[0],_loc2_[1]);
         }
         return new Point();
      }
   }
}
