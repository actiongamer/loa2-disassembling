package nslm2.modules.foundations.fund
{
   import game.ui.fundModule.FundModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.nets.sockets.ServerEngine;
   import proto.OpenFundInfoRes;
   import nslm2.modules.foundations.fund.service.FundService;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.fund.consts.FundConsts;
   import nslm2.modules.foundations.fund.view.FundView;
   import nslm2.modules.foundations.fund.view.FundBenefitView;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   
   public class FundModule extends FundModuleUI
   {
       
      
      private var vs:ViewStack;
      
      public function FundModule()
      {
         super();
         vs = new ViewStack();
         vs.subViewClasses = [FundView,FundBenefitView];
         vs.x = 75;
         vs.y = 163;
         addChild(vs);
         this.tabBar.selectHandler = tabHandler;
         var _loc2_:UInt64 = new UInt64(4294967295,4294967295);
         var _loc1_:Number = Uint64Util.toNumber(_loc2_);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(7415,null,fundInfoCplHandler);
      }
      
      private function fundInfoCplHandler(param1:OpenFundInfoRes) : void
      {
         FundService.ins.infoCplHandler(param1);
         super.moduleServerCpl();
      }
      
      private function tabHandler(param1:int) : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.img_bg.skin = UrlLib.getFundImg("img_bg");
         this.img_bg2.skin = UrlLib.getFundImg("img_bg2");
         this.img_person.skin = UrlLib.getFundImg("img_person");
         DisplayUtils.addChildAbove(this.img_bg,this.panelBg.img_rimBg);
         tabBar.selectedIndex = 0;
         vs.selectedIndex = 0;
         super.preShow();
      }
      
      override public function getFocusNotices() : Array
      {
         return [FundConsts.JUMP_TO_FUND_VIEW];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if(FundConsts.JUMP_TO_FUND_VIEW === _loc3_)
         {
            tabBar.selectedIndex = 0;
            vs.selectedIndex = 0;
         }
      }
   }
}
