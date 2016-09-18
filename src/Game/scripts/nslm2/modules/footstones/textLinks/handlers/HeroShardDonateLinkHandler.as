package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class HeroShardDonateLinkHandler extends LinkHandlerBase
   {
       
      
      public function HeroShardDonateLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(40700,"heroShard");
      }
   }
}
