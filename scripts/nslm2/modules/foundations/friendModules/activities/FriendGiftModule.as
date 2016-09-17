package nslm2.modules.foundations.friendModules.activities
{
   import game.ui.friendModules.activities.FriendGiftModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   import nslm2.modules.foundations.friendModules.FriendService;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import flash.events.MouseEvent;
   import proto.FriendDonateStaminaAllReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FriendDonateStaminaAllRes;
   import nslm2.modules.foundations.AlertUtil;
   import com.netease.protobuf.UInt64;
   import proto.FriendStaminaGetAllReq;
   import proto.FriendStaminaGetAllRes;
   
   public class FriendGiftModule extends FriendGiftModuleUI
   {
       
      
      private var tabIndexKindDict:Array;
      
      private var kind:int;
      
      public function FriendGiftModule()
      {
         tabIndexKindDict = [];
         super();
         tabIndexKindDict[0] = 1;
         tabIndexKindDict[1] = 2;
         FriendService.ins.addEventListener("evtGetGiftChange",serviceHandler);
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      public function get renPoiGift2() : RedPointNum
      {
         return this.redPoiGift2UI as RedPointNum;
      }
      
      private function validteGetGift2RedPoi() : void
      {
         renPoiGift2.count = FriendService.ins.canGetIds.length;
      }
      
      private function serviceHandler(param1:Event) : void
      {
         validteGetGift2RedPoi();
         if(ModuleMgr.ins.isShow(10621))
         {
            if(this.kind == 2)
            {
               this.showKind(this.kind);
            }
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         super.moduleServerStart(param1);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(10600029);
         this.pageBar.bindList(this.list_player);
         this.tab1.labels = LocaleMgr.ins.getStr(999000243);
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
         this.list_player.addEventListener("GET_CPL",getCplHandler);
         this.list_player.addEventListener("GIVE_CPL",giveCplHandler);
         this.validteGetGift2RedPoi();
         super.preShow(param1);
         ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(11,0,1));
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
               this.btn_doAll.label = LocaleMgr.ins.getStr(999000244);
               this.btn_doAll.disabled = true;
               this.list_player.array = FriendService.ins.friendArr;
               this.list_player.array.sort(FriendService.ins.sortFriendByFightPieceFun,16);
               this.list_player.commitMeasure();
               this.list_player.cells.forEach(function(param1:FriendGiftRender, ... rest):void
               {
                  param1.kind = 1;
               });
               if(FriendService.ins.friendArr.length > FriendService.ins.giveGiftIds.length)
               {
                  this.btn_doAll.disabled = false;
               }
               break;
            case 1:
               this.txt_prompt.visible = true;
               this.validateTxtPrompt();
               this.btn_doAll.label = LocaleMgr.ins.getStr(10600023);
               this.list_player.array = FriendService.ins.gettingGiftDataArr;
               this.list_player.array.sort(FriendService.ins.sortFriendByFightPieceFun,16);
               this.list_player.commitMeasure();
               this.list_player.cells.forEach(function(param1:FriendGiftRender, ... rest):void
               {
                  param1.kind = 2;
               });
               if(this.list_player.array.length == 0)
               {
                  this.btn_doAll.disabled = true;
                  break;
               }
               this.btn_doAll.disabled = false;
               break;
         }
         this.list_player.page = 0;
      }
      
      private function validateTxtPrompt() : void
      {
         var _loc1_:int = DefindConsts.FRIENDS_STAMINA_MAX - FriendService.ins.getGiftCount;
         this.txt_prompt.text = LocaleMgr.ins.getStr(10600019,[TextFieldUtil.htmlText2(_loc1_,_loc1_ <= 0?16723968:458496)]);
      }
      
      private function getCplHandler(param1:Event) : void
      {
         new ListCellTweenEffect(this.list_player,FriendService.ins.gettingGiftDataArr).exec();
         validateTxtPrompt();
         this.validteGetGift2RedPoi();
         if(FriendService.ins.canGetIds.length == 0)
         {
            this.btn_doAll.disabled = true;
         }
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
         switch(int(this.kind) - 1)
         {
            case 0:
               friendDonateStaminaAll();
               break;
            case 1:
               friendStaminaGetAll();
         }
      }
      
      public function friendDonateStaminaAll() : void
      {
         var _loc1_:FriendDonateStaminaAllReq = new FriendDonateStaminaAllReq();
         ServerEngine.ins.send(7308,_loc1_,server_staminaAll);
      }
      
      private function server_staminaAll(param1:FriendDonateStaminaAllRes) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         AlertUtil.float(LocaleMgr.ins.getStr(10600015));
         var _loc2_:int = param1.donatedids.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1.donatedids[_loc4_];
            FriendService.ins.setHadGiveGift(_loc3_);
            _loc4_++;
         }
         this.list_player.refresh();
         if(FriendService.ins.friendArr.length == FriendService.ins.giveGiftIds.length)
         {
            this.btn_doAll.disabled = true;
         }
      }
      
      public function friendStaminaGetAll() : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:Array = [];
         var _loc2_:int = Math.min(FriendService.ins.canGetIds.length,DefindConsts.FRIENDS_STAMINA_MAX - FriendService.ins.getGiftCount);
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = FriendService.ins.canGetIds[_loc5_];
            _loc1_.push(_loc3_);
            _loc5_++;
         }
         if(_loc1_.length > 0)
         {
            _loc4_ = new FriendStaminaGetAllReq();
            ServerEngine.ins.send(7307,_loc4_,server_getAll);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10600025));
         }
      }
      
      private function server_getAll(param1:FriendStaminaGetAllRes) : void
      {
         FriendService.ins.canGetIds = [];
         FriendService.ins.getGiftCount = param1.hasGetstaminas;
         FriendService.ins.removeStaminaAll();
         AlertUtil.float(LocaleMgr.ins.getStr(10600026,[param1.staminas * DefindConsts.FRIENDS_STAMINA_EACHTIME]));
         validateTxtPrompt();
         this.validteGetGift2RedPoi();
         new ListCellTweenEffect(this.list_player,FriendService.ins.gettingGiftDataArr).exec();
         this.btn_doAll.disabled = true;
         this.dispatchEvent(new Event("GET_CPL",true));
      }
   }
}
