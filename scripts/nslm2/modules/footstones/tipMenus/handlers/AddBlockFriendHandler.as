package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.common.vo.PlayerVo;
   
   public class AddBlockFriendHandler extends TipMenuHandlerBase
   {
       
      
      public function AddBlockFriendHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         if(SceneModel.ins.isCrossScene)
         {
            AlertUtil.float("跨服主城暂时不支持此功能,敬请期待");
            return;
         }
         FriendService.ins.server_addBlock(vo.playerId);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
   }
}
