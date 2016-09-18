package nslm2.modules.funnies.guildPKCrossSer
{
   import game.ui.guildPKCrossSer.GPKChallenRewardUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.components.PanelBgS3;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   
   public class GPKChallReward extends GPKChallenRewardUI
   {
       
      
      public function GPKChallReward()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50700035);
         this.img_bg.skin = UrlLib.gpkcUrl("img_chall_reward_bg.png");
         PanelBgS3(this.panelBg).img_frame.visible = false;
         this.img_select.x = 15;
         this.txt0.text = LocaleMgr.ins.getStr(50700038);
         this.txt1.text = LocaleMgr.ins.getStr(50700039);
         this.txt2.text = LocaleMgr.ins.getStr(50700038);
         this.txt3.text = LocaleMgr.ins.getStr(50700039);
         this.txt_loss.text = LocaleMgr.ins.getStr(50700037);
         this.txt_win.text = LocaleMgr.ins.getStr(50700036);
         this.txt_tip.text = LocaleMgr.ins.getStr(50700040);
         var _loc2_:int = DefindConsts.FAMILY_EXPE_WIN_REWARD;
         var _loc3_:int = DefindConsts.FAMILY_EXPE_LOSE_REWARD;
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_drop_group","drop_group_id",_loc2_);
         if(_loc1_.length > 0)
         {
            this.item0.array = WealthUtil.dropBaseByGroupIdToWealthVoArr(_loc1_[0].id);
         }
         if(_loc1_.length > 1)
         {
            this.item1.array = WealthUtil.dropBaseByGroupIdToWealthVoArr(_loc1_[1].id);
         }
         _loc1_ = StcMgr.ins.getVoArrByColumnValue("static_drop_group","drop_group_id",_loc3_);
         if(_loc1_.length > 0)
         {
            this.item2.array = WealthUtil.dropBaseByGroupIdToWealthVoArr(_loc1_[0].id);
         }
         if(_loc1_.length > 1)
         {
            this.item3.array = WealthUtil.dropBaseByGroupIdToWealthVoArr(_loc1_[1].id);
         }
         if(GPKCModel.ins.info)
         {
            if(GPKCModel.ins.info.result == GPKConst.result_loss)
            {
               this.img_select.visible = true;
               this.img_select.y = 200;
            }
            else if(GPKCModel.ins.info.result == GPKConst.result_win)
            {
               this.img_select.visible = true;
               this.img_select.y = 37;
            }
            else
            {
               this.img_select.visible = false;
            }
         }
         else
         {
            this.img_select.visible = false;
         }
      }
   }
}
