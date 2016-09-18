package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendListTileRenderUI;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.foundations.friendModules.vos.FriendGroupVo;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class FriendListTileRender extends FriendListTileRenderUI
   {
       
      
      public function FriendListTileRender()
      {
         super();
         this.parts.push(new RollHighLightMediator(this));
         this.g_bg.fillAlpha = 0;
      }
      
      public function get groupId() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(groupId)
         {
            _loc2_ = FriendService.ins.getGroupVoById(this.groupId);
            this.txt_name.text = _loc2_.name;
            switch(int(this.groupId) - 1)
            {
               case 0:
                  this.txt_count.text = "[" + FriendService.ins.friendOnlineCount + "/" + FriendService.ins.friendArr.length + "]";
                  break;
               case 1:
                  this.txt_count.text = "[" + FriendService.ins.gangfriendOnlineCount + "/" + FriendService.ins.gangfriendArr.length + "]";
                  break;
               default:
                  this.txt_count.text = "[" + FriendService.ins.gangfriendOnlineCount + "/" + FriendService.ins.gangfriendArr.length + "]";
                  break;
               case 3:
                  this.txt_count.text = "[0/0]";
            }
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         if(param1 == 3)
         {
            this.img_arrow.rotation = 0;
         }
         else
         {
            this.img_arrow.rotation = -90;
         }
      }
   }
}
