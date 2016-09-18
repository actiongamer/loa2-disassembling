package nslm2.common.vo
{
   import flash.geom.Point;
   
   public class MouseCursorVo
   {
      
      public static const MOUSE_CUROSR_ASSET_IMG:int = 1;
      
      public static const MOUSE_CUROSR_ASSET_EFFECT:int = 2;
       
      
      public var assetType:int;
      
      public var assetUrlOrEffectID:String;
      
      public var hotPoint:Point;
      
      public function MouseCursorVo()
      {
         super();
      }
   }
}
