package nslm2.modules.funnies.secretExplore
{
   import game.ui.shenYuans.ShenYuanHelpPanelUI;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class SEHelpPanel extends ShenYuanHelpPanelUI
   {
       
      
      public function SEHelpPanel()
      {
         super();
         this.list_player.dataSource = [];
         PageBarS1(this.pageBar).bindList(list_player);
         list_player.itemRender = SEHelpRender;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         errorRet();
         super.preShow(param1);
         friendRet();
      }
      
      private function friendRet() : void
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = FriendService.ins.friendArr;
         for each(var _loc1_ in FriendService.ins.friendArr)
         {
            if(!isUsed(_loc1_.id))
            {
               _loc2_.push(_loc1_);
            }
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500029,[SEModel.ins.info.helpCount]);
         _loc2_.sort(assitSort);
         this.list_player.dataSource = _loc2_;
         txt_no_friend.visible = _loc2_.length <= 0;
         txt_no_friend.text = LocaleMgr.ins.getStr(41500041) + LinkUtils.openFriendCommend();
         PageBarS1(this.pageBar).bindList(list_player);
      }
      
      private function isUsed(param1:UInt64) : Boolean
      {
         var _loc3_:Array = SEModel.ins.info.usedFriendIds;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(Uint64Util.equal(_loc2_,param1))
            {
               return true;
            }
         }
         return false;
      }
      
      private function assitSort(param1:GameFriendData, param2:GameFriendData) : int
      {
         var _loc3_:int = -1 * Uint64Util.compareValue(param1.ability,param2.ability);
         if(_loc3_ == 0)
         {
            if(param1.level > param2.level)
            {
               return -1;
            }
            return 1;
         }
         return _loc3_;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_SECRET_EXPLORE_CHOOSE_FRIEND"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_SECRET_EXPLORE_CHOOSE_FRIEND" === _loc3_)
         {
            ModuleMgr.ins.closeModule(50703);
         }
      }
      
      private function errorRet(param1:* = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500029,[0]);
         this.txt_no_friend.text = LocaleMgr.ins.getStr(41500012);
      }
   }
}
