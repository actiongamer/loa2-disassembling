package nslm2.modules.foundations.guildModule.view.panel.donate
{
   import game.ui.guildModules.donate.DonateListRenderUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   
   public class GuildDonateListRender extends DonateListRenderUI
   {
      
      private static const BG_SKIN:String = "png.uiGuildModule.donate.img_donateBg";
      
      private static const TITLE_SKIN:String = "png.uiGuildModule.donate.img_donateTitle";
      
      private static const COMFIRM_BASE:int = 11000500;
       
      
      private var type:int;
      
      public function GuildDonateListRender()
      {
         super();
         btn_donate.clickHandler = doDonate;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:GuildModel = GuildModel.ins;
         .super.dataSource = param1;
         type = int(param1);
         var _loc2_:int = type - 1;
         txt_exp.text = "+" + _loc3_.donateExpArr[_loc2_];
         txt_contr.text = "+" + _loc3_.donateHornorArr[_loc2_];
         txt_score.text = "+" + _loc3_.donateScoreArr[_loc2_];
         txt_guildCoin.text = "+" + _loc3_.donateGuildCoinArr[_loc2_];
         txt_fund.text = "+" + _loc3_.donateGuildFundArr[_loc2_];
         var _loc4_:String = _loc3_.donateCostyArr[_loc2_];
         costRender.dataSource = WealthUtil.parseCostStr(_loc4_);
         img_bg.skin = "png.uiGuildModule.donate.img_donateBg" + type;
         img_title.skin = "png.uiGuildModule.donate.img_donateTitle" + type;
         if(_loc3_.hasDonated)
         {
            btn_donate.disabled = true;
         }
         else
         {
            btn_donate.disabled = false;
         }
         costRender.x = btn_donate.x + (btn_donate.width - costRender.txt_num.textWidth) / 2 - 16;
      }
      
      private function doDonate(param1:Object) : void
      {
         var _loc2_:WealthVo = costRender.dataSource as WealthVo;
         if(ClientConfig.isChineseLang())
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(11000500 + type,[costRender.txt_num.text + _loc2_.showName]),confrim);
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(11000500 + type,[costRender.txt_num.text + " " + _loc2_.showName]),confrim);
         }
      }
      
      private function confrim() : void
      {
         GuildServiceHandler.ins.guildDonate(type);
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         this.selectedBox.selected = param1 == 3;
      }
   }
}
