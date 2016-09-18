package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import nslm2.common.vo.PlayerVo;
   
   public class AddFriendTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function AddFriendTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         if(SceneModel.ins.isCrossScene)
         {
            AlertUtil.float("跨服主城暂时不支持添加好友,敬请期待");
         }
         else
         {
            FriendUtils.friendApply(vo.playerId,vo.name);
         }
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
   }
}
