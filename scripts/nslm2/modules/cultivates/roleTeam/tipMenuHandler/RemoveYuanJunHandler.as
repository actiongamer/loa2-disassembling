package nslm2.modules.cultivates.roleTeam.tipMenuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.modules.cultivates.roleTeam.service.RoleTeamService;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   
   public class RemoveYuanJunHandler extends TipMenuHandlerBase
   {
       
      
      public function RemoveYuanJunHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:YuanJunVo = data as YuanJunVo;
         RoleTeamService.ins.changeYuanJun(RoleTeamModel.ins.selectedYuanJunPos,null);
      }
   }
}
