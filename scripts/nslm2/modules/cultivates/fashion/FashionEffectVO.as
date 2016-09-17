package nslm2.modules.cultivates.fashion
{
   import morn.core.components.Image;
   import flash.geom.Point;
   
   public class FashionEffectVO
   {
       
      
      public var image:Image;
      
      public var startPoint:Point;
      
      public var id:int;
      
      public var petSkinId:int;
      
      public function FashionEffectVO(param1:Image = null, param2:int = 0, param3:Point = null, param4:int = 0)
      {
         super();
         image = param1;
         id = param2;
         petSkinId = param4;
         if(param3 == null && param1 != null)
         {
            startPoint = param1.parent.localToGlobal(new Point(image.x,image.y));
         }
         else
         {
            startPoint = param3;
         }
      }
   }
}
