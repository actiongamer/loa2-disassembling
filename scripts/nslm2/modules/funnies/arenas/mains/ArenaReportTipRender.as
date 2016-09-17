package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaReportTipRenderUI;
   import proto.ArenaReport;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   
   public class ArenaReportTipRender extends ArenaReportTipRenderUI
   {
       
      
      public function ArenaReportTipRender()
      {
         super();
      }
      
      public function get arenaReport() : ArenaReport
      {
         return dataSource as ArenaReport;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(arenaReport)
         {
            this.txt_time.text = "[ " + TimeUtils.getFullTimeStr(this.arenaReport.createTime) + " ]";
            this.txt_new.visible = this.arenaReport.isNew;
            this.txt_content.text = ArenaUtil.eventContent(arenaReport);
            this.txt_content.commitMeasure();
         }
      }
   }
}
