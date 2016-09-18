package nslm2.modules.foundations.friendModules.activities
{
   import game.ui.friendModules.activities.FriendLogRenderUI;
   import proto.TrendInfo;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ProtoUtils;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.AlertUtil;
   import proto.FriendCongratulateReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import flash.events.Event;
   
   public class FriendLogRender extends FriendLogRenderUI
   {
      
      public static const DONE:String = "done";
       
      
      public function FriendLogRender()
      {
         super();
         this.btn_do.label = LocaleMgr.ins.getStr(10600011);
         this.btn_do.addEventListener("click",btn_do_onClick);
      }
      
      public function get info() : TrendInfo
      {
         return this.dataSource as TrendInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(info)
         {
            this.txt_time.text = TimeUtils.getFullTimeStr(info.timestamp);
            this.txt_content.text = LocaleMgr.ins.getStr(info.kind,ProtoUtils.parseParaArr(info.contents));
            if(this.info.congratulateable)
            {
               if(this.info.iscongratulate)
               {
                  this.btn_do.visible = false;
                  this.txt_done.visible = true;
               }
               else
               {
                  this.btn_do.visible = true;
                  this.txt_done.visible = false;
               }
            }
            else
            {
               this.btn_do.visible = false;
               this.txt_done.visible = false;
            }
         }
      }
      
      private function btn_do_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(FriendService.ins.hasCongCount >= DefindConsts.CELEBRATE_SEND_MAX)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10600012));
         }
         else
         {
            _loc2_ = new FriendCongratulateReq();
            _loc2_.id = this.info.id;
            _loc2_.playerid = this.info.playerid;
            ServerEngine.ins.send(7069,_loc2_,server_friendCongratulate);
         }
      }
      
      private function server_friendCongratulate(param1:*, param2:ServerEvent) : void
      {
         this.btn_do.visible = false;
         this.txt_done.visible = true;
         FriendService.ins.setHadCong(this.info.id,true);
         this.dispatchEvent(new Event("done",true));
      }
   }
}
