package nslm2.modules.battles.PeakSports.view.renders
{
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportTabRenderUI;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.mediators.RollMediator;
   
   public class PeakSportsReportTabRender extends PeakSportsReportTabRenderUI
   {
       
      
      private var _nowShowSide:int;
      
      public function PeakSportsReportTabRender()
      {
         super();
         this.parts.push(new RollMediator(this,rollHandler));
         PeakSportsMsgs.ins.addEventListener("msgPeakSportsReportTabChanged",onSideChanged);
      }
      
      private function get side() : int
      {
         return this.dataSource as int;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(_nowShowSide == this.side)
         {
            return;
         }
         if(param1)
         {
            this.img_bg.scale = 1;
            this.img_icon.scale = 1;
            this.filters = [FilterUtil.getLightFilter(0.2)];
         }
         else
         {
            this.img_bg.scale = 0.9;
            this.img_icon.scale = 0.9;
            this.filters = [];
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.img_bg.skin = UrlLib.peakSportsSideBg(side);
            this.img_icon.skin = UrlLib.peakSportsSideIcon(side);
            this.txt_teamName.text = LocaleMgr.ins.getStr(50500900 + side);
         }
      }
      
      private function onSideChanged(param1:MzEvent) : void
      {
         if(dataSource)
         {
            _nowShowSide = param1.data as int;
            if(_nowShowSide == this.side)
            {
               this.img_bg.scale = 1;
               this.img_icon.scale = 1;
               this.filters = [FilterUtil.getLightFilter(0.2)];
            }
            else
            {
               this.img_bg.scale = 0.9;
               this.img_icon.scale = 0.9;
               this.filters = [];
            }
         }
      }
      
      override public function dispose() : void
      {
         PeakSportsMsgs.ins.removeEventListener("msgPeakSportsReportTabChanged",onSideChanged);
         super.dispose();
      }
   }
}
