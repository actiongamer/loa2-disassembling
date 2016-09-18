package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class TeamGuajiInviteFriendHandler extends TipMenuHandlerBase
   {
       
      
      public function TeamGuajiInviteFriendHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(41216,null,10624);
      }
   }
}
