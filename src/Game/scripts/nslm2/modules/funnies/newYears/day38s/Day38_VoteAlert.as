package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_VoteAlertUI;
   import nslm2.modules.foundations.alerts.views.IAlertContent;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class Day38_VoteAlert extends Day38_VoteAlertUI implements IAlertContent
   {
       
      
      public var stcNpcId:int;
      
      public var alert:SimpleAlert;
      
      public function Day38_VoteAlert(param1:int)
      {
         super();
         this.stcNpcId = param1;
         this.txt_content.text = LocaleMgr.ins.getStr(13333012);
         this.txt_tip.text = "";
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      public function setAlert(param1:SimpleAlert) : void
      {
         this.alert = param1;
         param1.contentYesHandler = contentYesHandler;
         var _loc2_:int = BagModel.ins.getStcCount(83110);
         if(_loc2_ < DefindConsts.GODDESS_SEND)
         {
            this.numBarRef.init(0,_loc2_,_loc2_,DefindConsts.GODDESS_SEND);
            param1.box_ok.disabled = true;
         }
         else
         {
            this.numBarRef.init(DefindConsts.GODDESS_SEND,Math.min(_loc2_,DefindConsts.GODDESS_LIMIT),DefindConsts.GODDESS_SEND,DefindConsts.GODDESS_SEND);
         }
      }
      
      private function contentYesHandler() : void
      {
         if(NpcFuncService.ins.isOpenTime(13334))
         {
            this.service.server_goddessVote(this.stcNpcId,this.numBarRef.nowNum);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(13333016,[TimeUtils.getFullTimeStr(service.panelRes.voteStartStamp,false,false),TimeUtils.getFullTimeStr(service.panelRes.voteEndStamp,false,false)]));
         }
         ModuleMgr.ins.closeModule(alert.moduleId);
      }
   }
}
