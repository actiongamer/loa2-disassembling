package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialRankRenderUI;
   import nslm2.modules.funnies.dials.vos.DialRewardVo;
   import nslm2.modules.funnies.dials.model.DialModel;
   import proto.ZhuanPanScoreMemer;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.utils.WealthUtil;
   
   public class DialRankRender extends DialRankRenderUI
   {
       
      
      public function DialRankRender()
      {
         super();
      }
      
      private function get info() : DialRewardVo
      {
         return this.dataSource as DialRewardVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            _loc5_ = DialModel.ins.rankMemberInfoDict.getValue(info.rank);
            if(_loc5_)
            {
               this.txt_name.text = PlayerModel.ins.getFullNameWithDistName(_loc5_.baseinfo);
               this.txt_score.num = _loc5_.score;
            }
            else
            {
               this.txt_name.text = "";
               this.txt_score.text = "";
            }
            if(int(info.rank) > 3)
            {
               this.img_crown.visible = false;
               this.txt_rank.num = info.rank;
               this.txt_rank.visible = true;
            }
            else
            {
               this.img_crown.skin = SkinLib.getRankCrown(info.rank);
               this.img_crown.visible = true;
               this.txt_rank.visible = false;
            }
            _loc4_ = DialModel.ins.rewardDict.getValue(info.rank);
            _loc3_ = WealthUtil.costStrToArr(_loc4_.data.rewards);
            this.list_normal.dataSource = _loc3_;
            this.list_normal.repeatX = _loc3_.length;
            this.list_normal.commitMeasure();
            this.list_normal.x = (this.box_normal.width - this.list_normal.width) / 2;
            _loc2_ = WealthUtil.costStrToArr(_loc4_.data.suprewards);
            this.list_super.dataSource = _loc2_;
            this.list_super.repeatX = _loc2_.length;
            this.list_super.commitMeasure();
            this.list_super.x = (this.box_super.width - this.list_super.width) / 2;
         }
      }
   }
}
