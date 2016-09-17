package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI;
   import morn.core.components.Image;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   
   public class BattlefieldRankRewardRender extends BattlefieldRankRewardRenderUI
   {
       
      
      private var _image:Image;
      
      public function BattlefieldRankRewardRender()
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
            if(rankVo.rankMin == 1)
            {
               this.txt_rank.text = LocaleMgr.ins.getStr(50400602,[rankVo.rankMin]);
            }
            else if(rankVo.rankMin == rankVo.rankMax)
            {
               if(rankVo.rankMin == 0)
               {
                  this.txt_rank.text = LocaleMgr.ins.getStr(50500120);
               }
               else
               {
                  this.txt_rank.text = String(rankVo.rankMin);
               }
            }
            else
            {
               this.txt_rank.text = rankVo.rankMin + "-" + rankVo.rankMax;
            }
            this.box_isNowRank.visible = rankVo.checkRank(BattlefieldModel.ins.getCurRank(rankVo.kind));
            if(_image)
            {
               _image.dispose();
            }
            if(rankVo.title_id != 0)
            {
               this.txt_title.text = LocaleMgr.ins.getStr(50500121) + ":";
               _image = new Image();
               _image.scale = 0.8;
               _image.x = 240;
               _image.y = 24;
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
