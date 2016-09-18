package nslm2.modules.cultivates.roleTeam.tipMenuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class SwapYuanJunMenueHandler extends TipMenuHandlerBase
   {
       
      
      public function SwapYuanJunMenueHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         ObserverMgr.ins.sendNotice("role_team_show_select_yuanjun_panel");
      }
   }
}
