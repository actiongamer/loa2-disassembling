package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.common.vo.PlayerVo;
   
   public class RemoveBlockFriendHandler extends TipMenuHandlerBase
   {
       
      
      public function RemoveBlockFriendHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         FriendService.ins.server_removeBlock(vo.playerId);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
   }
}
