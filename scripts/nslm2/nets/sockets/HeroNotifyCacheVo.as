package nslm2.nets.sockets
{
   import proto.HeroInfoNotify;
   
   public class HeroNotifyCacheVo
   {
      
      public static const CMD:String = "cmd";
       
      
      public var cmd:int;
      
      public var heroInfoNotify:HeroInfoNotify;
      
      public function HeroNotifyCacheVo(param1:HeroInfoNotify = null)
      {
         super();
         this.heroInfoNotify = param1;
      }
   }
}
