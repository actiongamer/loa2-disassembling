package nslm2.modules.Chapters.reset
{
   import game.ui.chapters.reset.DungeonResetUI;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   
   public class DungeonReset extends DungeonResetUI
   {
       
      
      public function DungeonReset(param1:uint)
      {
         super();
         var _loc2_:uint = ChapterModel.ins.getStageInfo(param1).resetCount;
         var _loc3_:uint = ChapterModel.ins.getStageMaxResetTimes(param1) - _loc2_;
         this.img_diamond.skin = UrlLib.itemIcon(3);
         this.txt_reset.commitMeasure();
         this.txt_reset.text = LocaleMgr.ins.getStr(40400008,[TextFieldUtil.htmlText("     " + ChapterModel.ins.getStageResetDiamond(param1) + " ",new TextFormat(null,null,LabelUtils.getCountNeedColor(PlayerModel.ins.gold,20))),TextFieldUtil.htmlText(" " + _loc3_ + " ",new TextFormat(null,null,458496))]);
      }
   }
}
