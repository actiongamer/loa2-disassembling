package nslm2.modules.bag
{
   import game.ui.BagModules.GetGiftRenderUI;
   import proto.CharmRankReceiveMessageRes.ReceiveInfo;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   
   public class GetGiftRender extends GetGiftRenderUI
   {
       
      
      public function GetGiftRender()
      {
         super();
      }
      
      public function get vo() : ReceiveInfo
      {
         return this.dataSource as ReceiveInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            this.txt_time.text = TimeUtils.getFullTimeStr(Uint64Util.toInt(vo.stamp));
            if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,vo.id))
            {
               this.txt_content.text = LocaleMgr.ins.getStr(13323602,["",PlayerModel.ins.playerInfo.name,vo.num]);
               return;
            }
            _loc2_ = Uint64Util.findItemByAttr(FriendService.ins.friendArr,GameFriendData.ID.name,vo.id);
            if(_loc2_)
            {
               this.txt_content.text = LocaleMgr.ins.getStr(13323602,["",_loc2_.name,vo.num]);
            }
            else
            {
               this.txt_content.text = LocaleMgr.ins.getStr(13323035,[vo.num]);
            }
         }
      }
   }
}
