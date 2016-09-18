package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.guildPKCrossSer.GPKRank.GPKzkxxRenderUI;
   import proto.FamilyExpeBattleResult;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   
   public class GPKzkxxRender extends GPKzkxxRenderUI
   {
       
      
      public function GPKzkxxRender()
      {
         super();
         img_power.visible = false;
      }
      
      private function get vo() : FamilyExpeBattleResult
      {
         return this.dataSource as FamilyExpeBattleResult;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            img_flag_bg.url = GuildUtil.getFlagBgUrl(vo.flagBase);
            img_flag_icon.url = GuildUtil.getFlagIconUrl(vo.flagIcon);
            this.txt_info.text = vo.familyName + " lv." + vo.lv + "\n" + GPKConst.getDistStr(vo.opName,vo.distId,vo.distName);
            this.txt_rep.text = vo.con > 0?TextFieldUtil.htmlText2("+" + vo.con,458496):TextFieldUtil.htmlText2(vo.con,16723968);
            this.img_win.skin = !!vo.result?"png.uiGuildPKCrossSer.img_zkxx_win":"png.uiGuildPKCrossSer.img_zkxx_loss";
            rightwinTxt.text = LocaleMgr.ins.getStr(!!vo.result?999900120:999900119);
            rightwinTxt.style = !!vo.result?"渐变1":"渐变灰";
            rightwinTxt.size = 40;
            this.txt_day.text = TimeUtils.getShortTimeStr(vo.stamp);
         }
      }
   }
}
