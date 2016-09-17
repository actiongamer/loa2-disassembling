package nslm2.common.scene.multiLayer.configs
{
   public class BgCtrlKindVo
   {
      
      public static const CTRL_KIND_0:int = 0;
      
      public static const CTRL_KIND_BOSS31:int = 31;
      
      public static const CTRL_KIND_BOSS311:int = 311;
      
      public static const CTRL_KIND_BOSS32:int = 32;
      
      public static const CTRL_KIND_ELEVATOR_UP:int = 21;
      
      public static const CTRL_KIND_ELEVATOR_DOWN:int = 22;
      
      public static const CTRL_KIND_ELEVATOR_RIGHT:int = 23;
      
      public static const CTRL_KIND_ELEVATOR_LEFT:int = 24;
      
      public static const CTRL_KIND_SWEAR_SEABEACH_SHIP:int = 51;
       
      
      public var id:int;
      
      public var speed:int;
      
      public var pauseAndShake:int;
      
      public function BgCtrlKindVo(param1:XML)
      {
         super();
         if(param1)
         {
            this.id = int(param1.id);
            this.speed = int(param1.speed);
            this.pauseAndShake = int(param1.pauseAndShake);
         }
      }
   }
}
