package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import game.ui.teamGuajiScenes.rank.guajiRankingRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.vo.GuajiRankVo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   
   public class GuajiRankListRender extends guajiRankingRenderUI
   {
       
      
      private var _data:GuajiRankVo;
      
      public function GuajiRankListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         _data = param1 as GuajiRankVo;
         if(_data)
         {
            _loc2_ = _data.rank;
            if(_data.rankPlayer)
            {
               txt_name.text = LinkUtils.playerNameSmart(_data.rankPlayer.playerId,_data.rankPlayer.name,_data.rankPlayer.dist);
               txt_cnt.text = _data.rankPlayer.count + "";
            }
            else
            {
               txt_name.text = "__";
               txt_cnt.text = "__";
            }
            txt_rank.text = _loc2_ + "";
            switch(int(_loc2_) - 1)
            {
               case 0:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.1ST";
                  txt_rank.text = "";
                  changeTextColor(16542720);
                  break;
               case 1:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.2ND";
                  txt_rank.text = "";
                  changeTextColor(12798193);
                  break;
               case 2:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.3RD";
                  txt_rank.text = "";
                  changeTextColor(4827135);
            }
            rwdList.dataSource = TeamGuajiModel.ins.getRewardByRank(_loc2_);
         }
      }
      
      private function changeTextColor(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = this.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.getChildAt(_loc5_);
            if(_loc3_ is Label)
            {
               (_loc3_ as Label).color = param1;
            }
            _loc5_++;
         }
      }
   }
}
