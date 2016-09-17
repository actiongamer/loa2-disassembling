package nslm2.modules.Chapters.video
{
   import game.ui.chapters.video.VideoInfoRenderUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import proto.StageBtlReport;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import morn.customs.expands.MornExpandUtil;
   
   public class VideoInfoRender extends VideoInfoRenderUI
   {
       
      
      public function VideoInfoRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_video === _loc2_)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds(vo.reportId));
         }
      }
      
      public function get vo() : StageBtlReport
      {
         return dataSource as StageBtlReport;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_rank.text = (this.listCellVo.listIndex + 1).toString();
            this.txt_name.text = LinkUtils.playerNameSmart(this.vo.playerId,this.vo.name,0,16769442);
            this.txt_fight.text = LocaleConsts.getNumberAbbr2(this.vo.zhanli.toString());
            this.toolTip = this.vo;
         }
      }
   }
}
