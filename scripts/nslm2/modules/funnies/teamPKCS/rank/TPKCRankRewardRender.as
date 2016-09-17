package nslm2.modules.funnies.teamPKCS.rank
{
   import game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI;
   import morn.core.components.Image;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   
   public class TPKCRankRewardRender extends BattlefieldRankRewardRenderUI
   {
       
      
      private var _image:Image;
      
      public function TPKCRankRewardRender()
      {
         super();
         this.txt_isNowRank.font = "Em_YaHeiB";
         this.txt_isNowRank.rotation = -45;
         this.box_isNowRank.mouseEvent = false;
         this.box_isNowRank.visible = false;
      }
      
      public function get rankVo() : StcRankVo
      {
         return this.dataSource as StcRankVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.img_icon.skin = SkinLib.changeSkinNum(this.img_icon.skin,Math.min(6,this.listCellVo.dataIndex + 1));
            txt_rank.text = LocaleMgr.ins.getStr(999900262 + rankVo.rankMin);
            this.box_isNowRank.visible = rankVo.rankMin == TPKCRankRewardModule.myFrank;
            if(_image)
            {
               _image.dispose();
            }
            if(rankVo.title_id != 0)
            {
               this.txt_title.text = LocaleMgr.ins.getStr(50500121) + ":";
               _image = new Image();
               _image.scale = 0.8;
               _image.x = 210;
               _image.y = -12;
               _image.url = UrlLib.getPlayerTitleImg(rankVo.title_id);
               this.addChildAt(_image,0);
            }
            else
            {
               this.txt_title.text = LocaleMgr.ins.getStr(50500121) + ":" + LocaleMgr.ins.getStr(12200);
            }
            this.list_reward.dataSource = WealthUtil.costStrToArr(rankVo.jibenjiangli);
         }
      }
   }
}
