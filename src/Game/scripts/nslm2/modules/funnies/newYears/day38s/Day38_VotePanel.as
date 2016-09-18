package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_VotePanelUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import proto.GoddessVotePanelRes.GoddessTicket;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import proto.StaticGoddesDropModel;
   import nslm2.utils.WealthUtil;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class Day38_VotePanel extends Day38_VotePanelUI
   {
       
      
      public function Day38_VotePanel()
      {
         super();
         switchEvents(true);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_tip1.text = LocaleMgr.ins.getStr(13333004,[""]);
         this.txt_tip2.text = LocaleMgr.ins.getStr(13333005);
         this.txt_tip4.text = LocaleMgr.ins.getStr(13333007);
         this.btn_gift.label = LocaleMgr.ins.getStr(13333008);
         this.img_icon.url = UrlLib.itemIcon(9900002);
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_gift !== _loc4_)
         {
            if(this.btn_add === _loc4_)
            {
               if(NpcFuncService.ins.isOpenTime(13334))
               {
                  _loc3_ = StcMgr.ins.getShopVo(int(DefindConsts.GODDESS_BUY));
                  if(_loc3_)
                  {
                     ModuleMgr.ins.showModule(60320,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
                  }
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(13333016,[TimeUtils.getFullTimeStr(service.panelRes.voteStartStamp,false,false),TimeUtils.getFullTimeStr(service.panelRes.voteEndStamp,false,false)]));
               }
            }
         }
         else
         {
            ModuleMgr.ins.showModule(13335,null,13333);
         }
      }
      
      public function init() : void
      {
         this.refreshUI(false);
      }
      
      private function refreshUI(param1:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         this.txt_tipTime.text = LocaleMgr.ins.getStr(13333011,[TimeUtils.getFullTimeStr(service.panelRes.voteStartStamp,false,false),TimeUtils.getFullTimeStr(service.panelRes.voteEndStamp,false,false)]);
         refreshRedPoi();
         this.service.panelRes.tickets.sortOn([GoddessTicket.TICKETS.name,GoddessTicket.ID.name],16 | 2);
         if(param1)
         {
            new ListCellTweenEffect(this.list_vote,this.service.panelRes.tickets).exec();
         }
         else
         {
            this.list_vote.array = this.service.panelRes.tickets;
         }
         this.txt_tip3.text = LocaleMgr.ins.getStr(13333006) + ": " + this.service.panelRes.myScore;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < service.stcItemId_reward.length)
         {
            _loc3_ = service.stcItemId_reward[_loc5_];
            _loc4_.push(WealthUtil.createWealthVo(_loc3_.dropType,_loc3_.dropId,_loc3_.number));
            _loc5_++;
         }
         var _loc2_:Day38GiftVo = new Day38GiftVo(_loc4_);
         this.img_icon.toolTip = _loc2_;
         this.render_need.wealthVo = WealthUtil.countVo(20,83110);
      }
      
      public function refreshRedPoi() : void
      {
         this.redPoi_gift.visible = NpcFuncService.ins.getVo(13335).count > 0;
      }
      
      private function switchEvents(param1:Boolean) : void
      {
         if(param1)
         {
            this.service.addEventListener("EVT_VOTE_CPL",refreshUI);
         }
         else
         {
            this.service.removeEventListener("EVT_VOTE_CPL",refreshUI);
         }
      }
      
      private function onVoteCpl(param1:Event) : void
      {
         this.refreshUI(true);
      }
      
      override public function dispose() : void
      {
         this.switchEvents(false);
         super.dispose();
      }
   }
}
