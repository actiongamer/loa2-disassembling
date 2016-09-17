package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoService;
   import nslm2.common.vo.PlayerVo;
   
   public class ViewOtherPlayerTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function ViewOtherPlayerTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         OtherRoleInfoService.ins.viewOtherPlayer((this.data as PlayerVo).playerId,(this.data as PlayerVo).disID);
      }
   }
}
