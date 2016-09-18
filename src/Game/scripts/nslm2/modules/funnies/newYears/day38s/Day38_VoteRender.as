package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_VoteRenderUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.GoddessVotePanelRes.GoddessTicket;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.expands.MornExpandUtil;
   
   public class Day38_VoteRender extends Day38_VoteRenderUI
   {
      
      public static const MSG_DAY38_VOTE_DETAIL:String = "MSG_DAY38_VOTE_DETAIL";
       
      
      public function Day38_VoteRender()
      {
         super();
         this.btn_vote.label = LocaleMgr.ins.getStr(13333002);
         this.img_detail.toolTip = LocaleMgr.ins.getStr(13333003);
         this.img_detail.buttonMode = true;
         img_detail.addEventListener("click",img_detail_click);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_vote === _loc3_)
         {
            if(NpcFuncService.ins.isOpenTime(13334))
            {
               AlertUtil.comfirm(new Day38_VoteAlert(this.vo.id));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(13333016,[TimeUtils.getFullTimeStr(service.panelRes.voteStartStamp,false,false),TimeUtils.getFullTimeStr(service.panelRes.voteEndStamp,false,false)]));
            }
         }
      }
      
      private function img_detail_click(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("MSG_DAY38_VOTE_DETAIL",this.vo.id);
      }
      
      public function get vo() : GoddessTicket
      {
         return this.dataSource as GoddessTicket;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(vo.id);
            this.img_icon.url = UrlLib.npcDialogIcon(_loc2_.head_id + "");
            this.txt_count.text = LocaleMgr.ins.getStr(13333001,[this.vo.tickets]);
            var _loc3_:* = this.listCellVo.dataIndex + 1;
            if(1 !== _loc3_)
            {
               if(2 !== _loc3_)
               {
                  if(3 !== _loc3_)
                  {
                     img_rank.visible = false;
                     txt_rank.text = LocaleMgr.ins.getStr(50200020,[this.listCellVo.dataIndex + 1]);
                  }
                  else
                  {
                     img_rank.visible = true;
                     img_rank.skin = "png.a5.commonImgs.3RD";
                     txt_rank.text = "";
                  }
               }
               else
               {
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.2ND";
                  txt_rank.text = "";
               }
            }
            else
            {
               img_rank.visible = true;
               img_rank.skin = "png.a5.commonImgs.1ST";
               txt_rank.text = "";
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
