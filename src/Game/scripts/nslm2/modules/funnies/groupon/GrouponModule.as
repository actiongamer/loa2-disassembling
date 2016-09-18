package nslm2.modules.funnies.groupon
{
   import game.ui.groupon.GrouponModuleUI;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.modules.funnies.groupon.service.GrouponService;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.groupon.vo.GrouponVo;
   import proto.TuanGouScoreInfoRes;
   import nslm2.utils.WealthUtil;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.funnies.groupon.view.GrouponInfoView;
   import nslm2.modules.funnies.groupon.view.rank.GrouponRewardView;
   import com.mz.core.utils.DisplayUtils;
   
   public class GrouponModule extends GrouponModuleUI
   {
       
      
      private var model:GrouponModel;
      
      private var gServeice:GrouponService;
      
      private var vs:ViewStack;
      
      private var cdCtr:TextCDCtrlS2;
      
      public function GrouponModule()
      {
         model = GrouponModel.ins;
         gServeice = GrouponService.ins;
         super();
         tab_title.labels = [LocaleMgr.ins.getStr(30000701),LocaleMgr.ins.getStr(30000702)].join(",");
         tab_title.selectHandler = changeTabHandler;
         vs = new ViewStack();
         vs.x = 28;
         vs.y = 75;
         vs.subViewClasses = [GrouponInfoView,GrouponRewardView];
         DisplayUtils.addChildBelow(vs,this.tab_title);
         img_redPoint.visible = false;
         cdCtr = new TextCDCtrlS2(txt_activityCD,getCdStr,null);
         parts.push(cdCtr);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(!GrouponModel.ins.groupnDataGot)
         {
            OpActivityStaticServiceHandler.ins.requestStaticData([1],new Handler(getStaticDataComp));
         }
         else
         {
            getStaticDataComp();
         }
      }
      
      private function getCdStr(param1:int) : String
      {
         return LocaleMgr.ins.getStr(30000725,[TimeUtils.hisCNWithDay(param1)]);
      }
      
      private function getStaticDataComp() : void
      {
         model.initGrouponData();
         model.crtGrouponId = (model.grouponDataList[0] as GrouponVo).id;
         gServeice.getGrouponInfo(0,getGrouponInfoHandler);
      }
      
      private function getGrouponInfoHandler() : void
      {
         if(model.needGetScoreInfo)
         {
            gServeice.getScoreInfo(getBaseInfoComplete);
         }
         else
         {
            super.moduleServerCpl();
         }
      }
      
      private function getBaseInfoComplete(param1:TuanGouScoreInfoRes) : void
      {
         if(param1)
         {
            model.hasGotSocreRewardIDArr = param1.receivedScoreId;
            model.myGrouponScore = param1.score;
         }
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         gServeice.activateListener(true);
         img_redPoint.visible = model.hasScoreRwd;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30000700);
         tab_title.selectedIndex = 0;
         vs.selectedIndex = 0;
         diamondRender.dataSource = WealthUtil.countVo(3,0);
         diamondRender.dataSource = WealthUtil.countVo(3,0);
         diamondRender2.dataSource = WealthUtil.countVo(4,0);
         couponRender.dataSource = WealthUtil.countVo(27,0).set_useMiniIcon(2);
         scoreRender.dataSource = WealthUtil.countVo(28,0).set_useMiniIcon(2);
         GrouponModel.ins.grouponIcon = couponRender;
         GrouponModel.ins.scoreIcon = scoreRender;
         cdCtr.start(model.activityEndTime);
         super.preShow(param1);
      }
      
      private function changeTabHandler() : void
      {
         vs.selectedIndex = tab_title.selectedIndex;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["groupon_notice_update_reward_status","op_activity_static_update"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("groupon_notice_update_reward_status" !== _loc3_)
         {
            if("op_activity_static_update" === _loc3_)
            {
               model.initGrouponStaticData();
            }
         }
         else
         {
            img_redPoint.visible = param2;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         gServeice.activateListener(false);
         ServerEngine.ins.send(8534);
         super.preClose();
      }
   }
}
