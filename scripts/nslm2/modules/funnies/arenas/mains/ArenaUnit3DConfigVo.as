package nslm2.modules.funnies.arenas.mains
{
   import flash.geom.Point;
   
   public class ArenaUnit3DConfigVo
   {
       
      
      public var pos:Point;
      
      public var scale:Number;
      
      public var roY:int;
      
      public function ArenaUnit3DConfigVo(param1:Point, param2:Number, param3:int)
      {
         super();
         this.pos = param1;
         this.scale = param2;
         this.roY = param3;
      }
   }
}
