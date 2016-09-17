package nslm2.modules.foundations.friendModules.searches
{
   import game.ui.friendModules.searches.FriendApplyModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.friendModules.FriendService;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import proto.GameFriendData;
   import nslm2.utils.Uint64Util;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import com.netease.protobuf.UInt64;
   import proto.PlayerApplyAgreePiLiangReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import proto.PlayerApplyAgreePiLiangRes;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import proto.PlayerApplyRefusePiLiangReq;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   
   public class FriendApplyModule extends FriendApplyModuleUI
   {
       
      
      public function FriendApplyModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(10600031);
         this.txt_propmt.text = LocaleMgr.ins.getStr(10601001);
         this.list_player.array = FriendService.ins.applyFriendDataArr;
         this.list_player.addEventListener("done",applyRender_done);
         this.pageBar.bindList(this.list_player);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_agreeAll !== _loc3_)
         {
            if(this.btn_refuseAll === _loc3_)
            {
               server_applyRefuseAll();
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
         else
         {
            server_applyAgreeAll();
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function applyRender_done(param1:Event) : void
      {
         var _loc2_:GameFriendData = (param1.target as FriendApplyRender).gameFriendData;
         var _loc3_:Array = this.list_player.array;
         Uint64Util.removeItemByAttr(_loc3_,GameFriendData.ID.name,_loc2_.id);
         new ListCellTweenEffect(this.list_player,_loc3_).exec();
         if(this.list_player.array.length == 0)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      public function server_applyAgreeAll() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < FriendService.ins.applyFriendDataArr.length)
         {
            if(FriendService.ins.applyFriendDataArr[_loc4_] is GameFriendData)
            {
               _loc2_ = (FriendService.ins.applyFriendDataArr[_loc4_] as GameFriendData).id;
               _loc1_.push(_loc2_);
            }
            _loc4_++;
         }
         if(_loc1_.length > 0)
         {
            _loc3_ = new PlayerApplyAgreePiLiangReq();
            _loc3_.targetids = _loc1_;
            ServerEngine.ins.send(7056,_loc3_,server_applyAgreeAllCpl,server_applyAgreeAllErr);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(LocaleMgr.ins.getStr(999000249)));
            this.btn_agreeAll.disabled = true;
         }
      }
      
      private function server_applyAgreeAllErr() : void
      {
         FriendService.ins.applyFriendDataArr = [];
         this.btn_agreeAll.disabled = true;
      }
      
      private function server_applyAgreeAllCpl(param1:PlayerApplyAgreePiLiangRes) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(param1.targetids.length > 0)
         {
            _loc3_ = param1.targetids.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = Uint64Util.indexByAttr(FriendService.ins.applyFriendDataArr,GameFriendData.ID.name,param1.targetids[_loc4_]);
               if(_loc2_ > -1)
               {
                  ArrayUtil.append(FriendService.ins.friendArr,[FriendService.ins.applyFriendDataArr[_loc2_]]);
                  ArrayUtil.removeItemAt(FriendService.ins.applyFriendDataArr,_loc2_);
               }
               _loc4_++;
            }
            this.dispatchEvent(new MzEvent("evtAddFriend"));
            AlertUtil.float(LocaleMgr.ins.getStr(10603009));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(LocaleMgr.ins.getStr(999000250)));
         }
         FriendService.ins.applyFriendDataArr = [];
         this.btn_agreeAll.disabled = true;
      }
      
      public function server_applyRefuseAll() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < FriendService.ins.applyFriendDataArr.length)
         {
            if(FriendService.ins.applyFriendDataArr[_loc4_] is GameFriendData)
            {
               _loc2_ = (FriendService.ins.applyFriendDataArr[_loc4_] as GameFriendData).id;
               _loc1_.push(_loc2_);
            }
            _loc4_++;
         }
         if(_loc1_.length > 0)
         {
            _loc3_ = new PlayerApplyRefusePiLiangReq();
            _loc3_.targetids = _loc1_;
            ServerEngine.ins.send(7058,_loc3_,server_applyRefuseAllCpl,server_applyAgreeAllErr);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(LocaleMgr.ins.getStr(999000251)));
            this.btn_refuseAll.disabled = true;
         }
         FriendService.ins.applyFriendDataArr = [];
      }
      
      private function server_applyRefuseAllCpl(param1:*) : void
      {
         FriendUtils.floatMsg_applyRefuseAll();
      }
   }
}
