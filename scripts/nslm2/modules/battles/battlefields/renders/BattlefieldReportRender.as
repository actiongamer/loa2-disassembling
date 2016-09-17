package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportRenderUI;
   import nslm2.modules.battles.battlefields.vos.BattlefieldStageReportVo;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   
   public class BattlefieldReportRender extends BattlefieldReportRenderUI
   {
       
      
      public function BattlefieldReportRender()
      {
         super();
      }
      
      public function get vo() : BattlefieldStageReportVo
      {
         return this.dataSource as BattlefieldStageReportVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(BattlefieldModel.ins.isFinished)
            {
               if(BattlefieldModel.ins.winSide == this.vo.bgStageReportInfo.side)
               {
                  this.txt_score.text = "+" + TextFieldUtil.htmlText2(this.vo.bgStageReportInfo.score,458496);
                  this.txt_honor.text = this.vo.bgStageReportInfo.assistHonor + this.vo.bgStageReportInfo.gatherHonor + this.vo.bgStageReportInfo.killHonor + "+" + TextFieldUtil.htmlText2(this.vo.bgStageReportInfo.resultHonor,458496);
                  this.img_result.skin = "png.uiBattlefieldScenes.battlefieldReportModule.img_win";
               }
               else
               {
                  this.txt_score.text = "+" + TextFieldUtil.htmlText2(this.vo.bgStageReportInfo.score,458496);
                  this.txt_honor.text = this.vo.bgStageReportInfo.assistHonor + this.vo.bgStageReportInfo.gatherHonor + this.vo.bgStageReportInfo.killHonor + "+" + TextFieldUtil.htmlText2(this.vo.bgStageReportInfo.resultHonor,458496);
                  this.img_result.skin = "png.uiBattlefieldScenes.battlefieldReportModule.img_loss";
               }
               this.img_result.visible = true;
            }
            else
            {
               this.txt_score.num = 0;
               this.txt_honor.text = int(this.vo.bgStageReportInfo.assistHonor + this.vo.bgStageReportInfo.gatherHonor + this.vo.bgStageReportInfo.killHonor) + "+" + 0;
               this.img_result.visible = false;
            }
            this.txt_rank.num = this.vo.rank;
            this.txt_name.text = this.vo.bgStageReportInfo.baseInfo.name;
            this.txt_server.text = PlayerModel.ins.getDistName(this.vo.bgStageReportInfo.baseInfo);
            this.txt_level.num = this.vo.bgStageReportInfo.baseInfo.lv;
            this.txt_fightValue.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(this.vo.bgStageReportInfo.baseInfo.ability));
            this.txt_gathered.num = this.vo.bgStageReportInfo.gatherNum;
            this.txt_killed.num = this.vo.bgStageReportInfo.killNum;
            this.txt_assisted.num = this.vo.bgStageReportInfo.assistNum;
            this.img_bg.skin = "png.uiBattlefieldScenes.battlefieldReportModule.img_renderBg" + this.vo.bgStageReportInfo.side;
         }
      }
   }
}
