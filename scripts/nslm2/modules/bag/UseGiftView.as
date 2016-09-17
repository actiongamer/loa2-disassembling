package nslm2.modules.bag
{
   import game.ui.BagModules.UseGiftViewUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import proto.CharmRankReceiveMessageRes;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.friendModules.activities.FriendGiftParam;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import nslm2.utils.PlayerVoUtils;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class UseGiftView extends UseGiftViewUI
   {
       
      
      private var tabIndexKindDict:Array;
      
      private var kind:int;
      
      public function UseGiftView()
      {
         tabIndexKindDict = [];
         super();
         tabIndexKindDict[0] = 1;
         tabIndexKindDict[1] = 2;
         this.label_hint.text = LocaleMgr.ins.getStr(13323013);
         btn_doAll.visible = false;
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         var _loc2_:CharmRankReceiveMessageRes = new CharmRankReceiveMessageRes();
         ServerEngine.ins.send(10012,_loc2_,cplHandler,errHandler);
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function cplHandler(param1:CharmRankReceiveMessageRes) : void
      {
         if(param1 && param1.receive)
         {
            this.list_log.dataSource = param1.receive;
         }
         else
         {
            this.list_log.dataSource = [];
         }
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.pageBar.bindList(this.list_player);
         this.tab1.labels = LocaleMgr.ins.getStr(13323007) + "," + LocaleMgr.ins.getStr(13323008);
         this.tab1.userChangeHandler = tab1_userChangeHandler;
         var _loc2_:FriendGiftParam = param1 as FriendGiftParam;
         if(_loc2_)
         {
            this.tab1.selectedIndex = tabIndexKindDict.indexOf(_loc2_.kind);
            this.showKind(_loc2_.kind);
         }
         else
         {
            this.showKind(1);
         }
         this.btn_doAll.addEventListener("click",btn_click);
         this.list_player.addEventListener("GIVE_CPL",giveCplHandler);
         this.btn_close.clickHandler = closeModule;
         super.preShow(param1);
         ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(11,0,1));
      }
      
      private function closeModule() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function tab1_userChangeHandler(param1:int) : void
      {
         showKind(tabIndexKindDict[this.tab1.selectedIndex]);
      }
      
      private function showKind(param1:int) : void
      {
         $kind = param1;
         this.kind = $kind;
         switch(int($kind) - 1)
         {
            case 0:
               this.txt_prompt.visible = false;
               this.list_player.array = [PlayerVoUtils.curPlayerVo()].concat(FriendService.ins.friendArr);
               this.list_player.commitMeasure();
               this.list_player.cells.forEach(function(param1:UseGiftRender, ... rest):void
               {
                  param1.kind = 1;
               });
               if(FriendService.ins.friendArr.length > FriendService.ins.giveGiftIds.length)
               {
                  this.btn_doAll.disabled = false;
               }
               this.list_player.visible = true;
               this.list_log.visible = false;
               this.pageBar.bindList(this.list_player);
               break;
            case 1:
               this.list_player.visible = false;
               this.list_log.visible = true;
               this.pageBar.bindList(this.list_log);
         }
         this.list_player.page = 0;
      }
      
      private function validateTxtPrompt() : void
      {
         var _loc1_:int = DefindConsts.FRIENDS_STAMINA_MAX - FriendService.ins.getGiftCount;
         this.txt_prompt.text = LocaleMgr.ins.getStr(10600019,[TextFieldUtil.htmlText2(_loc1_,_loc1_ <= 0?16723968:458496)]);
      }
      
      private function giveCplHandler(param1:Event) : void
      {
         if(FriendService.ins.friendArr.length == FriendService.ins.giveGiftIds.length)
         {
            this.btn_doAll.disabled = true;
         }
      }
      
      private function btn_click(param1:MouseEvent) : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return ["GIVE_CPL"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("GIVE_CPL" === _loc4_)
         {
            _loc3_ = new CharmRankReceiveMessageRes();
            ServerEngine.ins.send(10012,_loc3_,cplHandler);
         }
      }
   }
}
