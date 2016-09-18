package nslm2.modules.cultivates.treasure.vo
{
   import flash.geom.Point;
   
   public class TreasureInfoSubConfigVo
   {
       
      
      public var subId:int;
      
      public var name:String;
      
      public var needShow3D:Boolean;
      
      public var offset:Point;
      
      public function TreasureInfoSubConfigVo(param1:int, param2:String, param3:Boolean = false, param4:Point = null)
      {
         super();
         subId = param1;
         name = param2;
         needShow3D = param3;
         offset = param4;
      }
   }
}
