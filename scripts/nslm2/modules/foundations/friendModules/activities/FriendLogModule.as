package nslm2.modules.foundations.friendModules.activities
{
   import game.ui.friendModules.activities.FriendLogModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import proto.FriendTrendsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FriendTrendsRes;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.vip.model.VipModel;
   import proto.TrendInfo;
   import flash.events.Event;
   import com.netease.protobuf.UInt64;
   import proto.FriendCongratulateAllReq;
   import morn.core.handlers.Handler;
   import nslm2.modules.foundations.AlertUtil;
   import proto.FriendCongratulateAllRes;
   
   public class FriendLogModule extends FriendLogModuleUI
   {
       
      
      public function FriendLogModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         var _loc2_:FriendTrendsReq = new FriendTrendsReq();
         ServerEngine.ins.send(7301,_loc2_,server_friendTrends);
      }
      
      private function server_friendTrends(param1:FriendTrendsRes) : void
      {
         FriendService.ins.logArr = param1.infos.sortOn("timestamp",2 | 16);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         this.list_log.addEventListener("done",render_doneCpl);
         validateCount();
         this.txt_propmt2.text = LocaleMgr.ins.getStr(999000245) + FriendService.ins.beenCongCount + "/" + DefindConsts.CELEBRATE_RECEIVE_MAX;
         this.txt_propmt3.text = LocaleMgr.ins.getStr(999000246) + FriendService.ins.friendArr.length + "/" + int(VipModel.ins.getVipValue(10030));
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(10600027);
         this.pageBar.bindList(this.list_log);
         this.list_log.array = FriendService.ins.logArr;
         this.btn_doAll.disabled = true;
         _loc2_ = 0;
         while(_loc2_ < FriendService.ins.logArr.length)
         {
            if((FriendService.ins.logArr[_loc2_] as TrendInfo).congratulateable)
            {
               if(!(FriendService.ins.logArr[_loc2_] as TrendInfo).iscongratulate)
               {
                  this.btn_doAll.disabled = false;
               }
            }
            _loc2_++;
         }
         this.btn_doAll.label = LocaleMgr.ins.getStr(999000247);
         this.btn_doAll.addEventListener("click",btn_doAllHandler);
         super.preShow(param1);
      }
      
      private function render_doneCpl(param1:Event) : void
      {
         this.validateCount();
         if(FriendService.ins.canCongIds.length == 0)
         {
            this.btn_doAll.disabled = true;
         }
      }
      
      private function validateCount() : void
      {
         this.txt_propmt1.text = LocaleMgr.ins.getStr(999000248) + FriendService.ins.hasCongCount + "/" + DefindConsts.CELEBRATE_SEND_MAX;
      }
      
      private function btn_doAllHandler(param1:Event) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:Array = [];
         var _loc3_:int = Math.min(FriendService.ins.canCongIds.length,DefindConsts.CELEBRATE_SEND_MAX - FriendService.ins.hasCongCount);
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = FriendService.ins.canCongIds[_loc6_];
            _loc2_.push(_loc4_);
            _loc6_++;
         }
         if(_loc2_.length > 0)
         {
            _loc5_ = new FriendCongratulateAllReq();
            _loc5_.ids = _loc2_;
            ServerEngine.ins.send(7309,_loc5_,new Handler(server_congratulateAll,[_loc2_]));
         }
         else
         {
            if(FriendService.ins.canCongIds.length > DefindConsts.CELEBRATE_SEND_MAX - FriendService.ins.hasCongCount)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10600012));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10600013));
            }
            this.btn_doAll.disabled = true;
         }
      }
      
      private function server_congratulateAll(param1:Array, param2:FriendCongratulateAllRes) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = param1[_loc5_];
            FriendService.ins.setHadCong(_loc4_,_loc5_ == _loc3_ - 1);
            _loc5_++;
         }
         validateCount();
         this.list_log.refresh();
         AlertUtil.float(LocaleMgr.ins.getStr(10600014,[_loc3_]));
         if(FriendService.ins.canCongIds.length == 0)
         {
            this.btn_doAll.disabled = true;
         }
      }
   }
}
