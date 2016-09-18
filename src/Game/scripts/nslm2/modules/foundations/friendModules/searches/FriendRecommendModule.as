package nslm2.modules.foundations.friendModules.searches
{
   import game.ui.friendModules.searches.FriendRecommendModuleUI;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import proto.PlayerFriendRecommendRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerFriendRecommendReq;
   import flash.events.Event;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.PlayerApplyPiLiangReq;
   import proto.PlayerFriendNextReq;
   import com.netease.protobuf.UInt64;
   import proto.GameFriendData;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import proto.PlayerFriendNextRes;
   
   public class FriendRecommendModule extends FriendRecommendModuleUI
   {
       
      
      public var labletest:String;
      
      public var count:int = 0;
      
      public var secondTimer:Timer;
      
      public function FriendRecommendModule()
      {
         labletest = LocaleMgr.ins.getStr(999000252);
         secondTimer = new Timer(1000,3);
         super();
         this.list_player.array = [];
         secondTimer.addEventListener("timer",onTick);
         secondTimer.addEventListener("timerComplete",onTimerComplete);
      }
      
      protected function onTimerComplete(param1:TimerEvent) : void
      {
         this.btn_next.disabled = false;
         secondTimer.reset();
      }
      
      protected function onTick(param1:TimerEvent) : void
      {
         count = Number(count) - 1;
         this.btn_next.label = labletest + "(" + count + ")";
      }
      
      private function server_getRecommandCpl(param1:PlayerFriendRecommendRes) : void
      {
         this.list_player.array = param1.friends;
         this.list_player.commitMeasure();
         this.btn_next.disabled = !param1.hasNext;
         this.validateApplyAll();
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(10600028);
         this.txt_propmt.text = LocaleMgr.ins.getStr(10601001);
         this.list_player.addEventListener("APPLIED",listPlayer_onApplied);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.btn_next.label = labletest + "(" + count + ")";
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         ServerEngine.ins.send(7014,new PlayerFriendRecommendReq(),server_getRecommandCpl);
      }
      
      private function listPlayer_onApplied(param1:Event) : void
      {
         validateApplyAll();
      }
      
      private function validateApplyAll() : void
      {
         var $noAppliedArr:Vector.<Box> = this.list_player.cells.filter(function(param1:FriendRecommendRender, ... rest):Boolean
         {
            if(param1.dataSource && param1.applied == false)
            {
               return true;
            }
            return false;
         });
         this.btn_applyAll.disabled = $noAppliedArr.length == 0;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         btn = param1;
         e = param2;
         var _loc4_:* = btn;
         if(this.btn_next !== _loc4_)
         {
            if(this.btn_applyAll === _loc4_)
            {
               var $reqApplayAll:PlayerApplyPiLiangReq = new PlayerApplyPiLiangReq();
               var $targetIds:Array = list_player.array.map(function(param1:GameFriendData, ... rest):UInt64
               {
                  return param1.id;
               });
               if($targetIds.length > 0)
               {
                  $reqApplayAll.targetids = $targetIds;
                  ServerEngine.ins.send(7068,$reqApplayAll,server_ApplyPiLiangCpl);
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(10600042));
               }
            }
         }
         else
         {
            ServerEngine.ins.send(7016,new PlayerFriendNextReq(),server_getRecommandNextCpl);
         }
      }
      
      private function server_ApplyPiLiangCpl(param1:*) : void
      {
         $res = param1;
         FriendUtils.floatMsg_applyAll();
         list_player.cells.forEach(function(param1:FriendRecommendRender, ... rest):void
         {
            param1.applied = true;
         });
         this.btn_applyAll.disabled = true;
      }
      
      private function server_getRecommandNextCpl(param1:PlayerFriendNextRes) : void
      {
         $res = param1;
         this.list_player.array = $res.friends;
         this.list_player.commitMeasure();
         this.btn_next.disabled = true;
         if($res.hasNext)
         {
            count = 3;
            this.btn_next.label = labletest + "(" + count + ")";
            secondTimer.start();
         }
         list_player.cells.forEach(function(param1:FriendRecommendRender, ... rest):void
         {
            param1.applied = false;
         });
         this.validateApplyAll();
      }
   }
}
