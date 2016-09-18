package nslm2.modules.cultivates.lotteryHeroModules.results
{
   import game.ui.lotteryHeroModules.results.LotteryHeroResultPageUI;
   import nslm2.common.ctrls.TSM;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.common.ui.components.comps2d.others.ClickToNext;
   import nslm2.common.ui.components.comps2d.ClickToNextButtonTime;
   import flash.events.Event;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.configs.EnvConfig;
   import morn.customs.expands.MornExpandUtil;
   
   public class LotteryHeroResultPage extends LotteryHeroResultPageUI
   {
       
      
      private var tsmName:TSM;
      
      private var btn_okInitX:int;
      
      public function LotteryHeroResultPage()
      {
         super();
         MornExpandUtil.setLayout(this);
         tsmName = new TSM(playerTitleRender,0);
         tsmName.addState(1,{"centerY":playerTitleRender.centerY + 100});
         this.clickToNext.commitMeasure();
         clickToNextUI.visible = false;
         clickToNextButtonTimeUI.visible = true;
      }
      
      private function get playerTitleRender() : PlayerTitleRender
      {
         return this.box_heroName as PlayerTitleRender;
      }
      
      public function get clickToNext() : ClickToNext
      {
         return this.clickToNextUI as ClickToNext;
      }
      
      public function get clickToNextButtonTime() : ClickToNextButtonTime
      {
         return this.clickToNextButtonTimeUI as ClickToNextButtonTime;
      }
      
      private function onClickToNext() : void
      {
         clickToNextButtonTime.hide();
         this.dispatchEvent(new Event("evtResultClose",true));
      }
      
      public function show(param1:Array, param2:int, param3:int, param4:Array) : void
      {
         var _loc5_:HeroInfo = param1[0];
         if(param3 == 0)
         {
            playerTitleRender.visible = false;
            playerTitleRender.heroInfo = _loc5_;
            if(StcMgr.ins.getNpcVo(_loc5_.baseInfo.baseId).quality >= 4)
            {
               tsmName.toState(0);
            }
            else
            {
               tsmName.toState(1);
            }
         }
         else if(param3 == 1000 || param3 == 2000)
         {
            playerTitleRender.visible = false;
            playerTitleRender.heroInfo = param1[0];
            if(StcMgr.ins.getNpcVo(_loc5_.baseInfo.baseId).quality >= 4)
            {
               tsmName.toState(0);
            }
            else
            {
               tsmName.toState(1);
            }
         }
         else
         {
            playerTitleRender.visible = false;
         }
         this.clickToNext.addHandler(onClickToNext);
         NGUtil.checkModuleShow(11900,null);
         if(EnvConfig.ins.ptId != 2306)
         {
            clickToNextButtonTime.show();
         }
      }
      
      public function tweenCpl() : void
      {
         NGUtil.checkModuleShow(11900,null);
      }
   }
}
