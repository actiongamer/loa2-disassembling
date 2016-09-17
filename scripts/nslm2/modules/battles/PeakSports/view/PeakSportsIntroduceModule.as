package nslm2.modules.battles.PeakSports.view
{
   import game.ui.peakSports.peakSportsIntroduce.PeakSportsIntroduceModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class PeakSportsIntroduceModule extends PeakSportsIntroduceModuleUI
   {
       
      
      public function PeakSportsIntroduceModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.txt_battlefieldName.text = LocaleMgr.ins.getStr(999600100);
         this.img_miniMap.url = UrlLib.peakSportsMiniMap(1001);
         this.txt_introduce.text = LocaleMgr.ins.getStr(999600112);
         this.img_bg.skin = UrlLib.peakSportsUI("img_introduceBg");
         this.preShowCpl();
      }
   }
}
