package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardKindRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxModel;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   
   public class GetRewardKindRender extends GetRewardKindRenderUI
   {
       
      
      public function GetRewardKindRender()
      {
         super();
         this.buttonMode = true;
         this.parts.push(new RoleGrowFilterMed(this,FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(5))));
      }
      
      public function get vo() : GetRewardVo
      {
         return this.dataSource as GetRewardVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(5100 + vo.groupId);
            _loc2_ = this.img_bg.skin.substring(0,img_bg.skin.length - 1);
            this.img_bg.skin = _loc2_ + vo.groupId;
            this.img_icon.skin = TreasureBoxModel.ins.closeUrl(2);
         }
      }
   }
}
