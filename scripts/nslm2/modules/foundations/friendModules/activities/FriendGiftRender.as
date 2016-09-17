package nslm2.modules.foundations.friendModules.activities
{
   import game.ui.friendModules.activities.FriendGiftRenderUI;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import proto.FriendDonateStaminaReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FriendDonateStaminaRes;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.PlayerModel;
   import proto.FriendStaminaGetReq;
   import proto.FriendStaminaGetRes;
   
   public class FriendGiftRender extends FriendGiftRenderUI
   {
      
      public static const GIVE_CPL:String = "GIVE_CPL";
      
      public static const GET_CPL:String = "GET_CPL";
       
      
      private var _kind:int;
      
      private var $oldStamina:int;
      
      public function FriendGiftRender()
      {
         super();
         this.btn_do.addEventListener("click",btn_click);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.validateBtn();
         this.img_line.visible = !this.listCellVo.isLastLineInCurPage;
      }
      
      public function get kind() : int
      {
         return _kind;
      }
      
      public function set kind(param1:int) : void
      {
         if(_kind != param1)
         {
            _kind = param1;
            validateBtn();
         }
      }
      
      public function validateBtn() : void
      {
         if(this.gameFriendData == null)
         {
            return;
         }
         switch(int(_kind) - 1)
         {
            case 0:
               if(FriendService.ins.hadDonate(this.gameFriendData.id))
               {
                  this.btn_do.label = LocaleMgr.ins.getStr(10600040);
                  this.btn_do.disabled = true;
               }
               else
               {
                  this.btn_do.label = LocaleMgr.ins.getStr(10600018);
                  this.btn_do.disabled = false;
               }
               break;
            case 1:
               if(FriendService.ins.hadGotStamina(this.gameFriendData.id))
               {
                  this.btn_do.label = LocaleMgr.ins.getStr(10700013);
                  this.btn_do.disabled = true;
                  break;
               }
               this.btn_do.label = LocaleMgr.ins.getStr(10600020);
               this.btn_do.disabled = false;
               break;
         }
      }
      
      private function btn_click(param1:MouseEvent) : void
      {
         switch(int(kind) - 1)
         {
            case 0:
               this.friendDonateStamina();
               break;
            case 1:
               this.friendStaminaGet();
         }
      }
      
      public function friendDonateStamina() : void
      {
         var _loc1_:FriendDonateStaminaReq = new FriendDonateStaminaReq();
         _loc1_.id = this.gameFriendData.id;
         ServerEngine.ins.send(7302,_loc1_,server_donateStamina);
      }
      
      private function server_donateStamina(param1:FriendDonateStaminaRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10600015));
         FriendService.ins.setHadGiveGift(param1.targetplayerid);
         this.dispatchEvent(new Event("GIVE_CPL",true));
         validateBtn();
      }
      
      public function friendStaminaGet() : void
      {
         if(DefindConsts.FRIENDS_STAMINA_MAX - FriendService.ins.getGiftCount <= 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10600025));
            return;
         }
         $oldStamina = PlayerModel.ins.stamina;
         var _loc1_:FriendStaminaGetReq = new FriendStaminaGetReq();
         _loc1_.playerid = this.gameFriendData.id;
         ServerEngine.ins.send(7306,_loc1_,server_staminaGet);
      }
      
      private function server_staminaGet(param1:FriendStaminaGetRes) : void
      {
         var _loc2_:int = PlayerModel.ins.stamina - $oldStamina;
         FriendService.ins.setHadGetGift(this.gameFriendData.id,true);
         if(FriendService.ins.getGiftCount >= DefindConsts.FRIENDS_STAMINA_MAX)
         {
            FriendService.ins.canGetIds = [];
         }
         AlertUtil.float(LocaleMgr.ins.getStr(10600026,[_loc2_]));
         this.dispatchEvent(new Event("GET_CPL",true));
      }
   }
}
