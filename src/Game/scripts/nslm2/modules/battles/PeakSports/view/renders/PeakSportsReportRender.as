package nslm2.modules.battles.PeakSports.view.renders
{
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportRenderUI;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsStageReportVo;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   
   public class PeakSportsReportRender extends PeakSportsReportRenderUI
   {
       
      
      public function PeakSportsReportRender()
      {
         super();
      }
      
      public function get vo() : PeakSportsStageReportVo
      {
         return this.dataSource as PeakSportsStageReportVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(PeakSportsModel.ins.isFinished)
            {
               if(PeakSportsModel.ins.winSide == this.vo.bgStageReportInfo.side)
               {
                  imgResultTxt.text = LocaleMgr.ins.getStr(999900120);
                  imgResultTxt.style = "渐变蓝";
               }
               else
               {
                  imgResultTxt.text = LocaleMgr.ins.getStr(999900119);
                  imgResultTxt.style = "渐变红";
               }
               this.imgResultTxt.visible = true;
            }
            else
            {
               this.imgResultTxt.visible = false;
            }
            this.txt_rank.num = this.vo.rank;
            this.txt_name.text = this.vo.bgStageReportInfo.baseInfo.name;
            this.txt_server.text = PlayerModel.ins.getDistName(this.vo.bgStageReportInfo.baseInfo);
            this.txt_level.num = this.vo.bgStageReportInfo.baseInfo.lv;
            this.txt_fightValue.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(this.vo.bgStageReportInfo.baseInfo.ability));
            this.txt_killed.num = this.vo.bgStageReportInfo.killNum;
            this.txt_assisted.num = this.vo.bgStageReportInfo.assistNum;
            this.img_bg.skin = "png.uiPeakSports.img_renderBg" + this.vo.bgStageReportInfo.side;
         }
      }
   }
}
