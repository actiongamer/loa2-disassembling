package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanHelpPanelUI;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.ShenYuanRequestFriendRes;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.ShenYuanRequestFriendRes.FriendInfo;
   import proto.GameFriendData;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ShenYuanHelpPanel extends ShenYuanHelpPanelUI
   {
       
      
      public function ShenYuanHelpPanel()
      {
         super();
         this.list_player.dataSource = [];
         PageBarS1(this.pageBar).bindList(list_player);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         errorRet();
         super.preShow(param1);
         ServerEngine.ins.send(6077,null,friendRet,errorRet);
         this.addChild(new VipHintBox(10510,90,57));
      }
      
      private function errorRet(param1:* = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500029,[0]);
         this.txt_no_friend.text = LocaleMgr.ins.getStr(41500012);
      }
      
      private function friendRet(param1:ShenYuanRequestFriendRes) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500029,[param1.helptime]);
         var _loc4_:Array = [];
         var _loc3_:Array = FriendService.ins.friendArr;
         var _loc9_:int = 0;
         var _loc8_:* = param1.friend;
         for each(var _loc5_ in param1.friend)
         {
            var _loc7_:int = 0;
            var _loc6_:* = _loc3_;
            for each(var _loc2_ in _loc3_)
            {
               if(Uint64Util.equal(_loc2_.id,_loc5_.id))
               {
                  _loc4_.push(_loc2_);
                  break;
               }
            }
         }
         _loc4_.sort(assitSort);
         this.list_player.dataSource = _loc4_;
         txt_no_friend.visible = _loc4_.length <= 0;
         txt_no_friend.text = LocaleMgr.ins.getStr(41500041) + LinkUtils.openFriendCommend();
         PageBarS1(this.pageBar).bindList(list_player);
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
         return ["SHENYUAN_CHOOSE_ASSIT"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("SHENYUAN_CHOOSE_ASSIT" === _loc3_)
         {
            ModuleMgr.ins.closeModule(41502);
         }
      }
   }
}
