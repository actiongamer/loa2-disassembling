package nslm2.modules.funnies.abilityRankModule.render
{
   import game.ui.abilityRankModule.render.AbilityRankListRenderUI;
   import nslm2.modules.funnies.abilityRankModule.vo.AbilityRankVo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class AbilityRankListRender extends AbilityRankListRenderUI
   {
       
      
      private var _data:AbilityRankVo;
      
      public function AbilityRankListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as AbilityRankVo;
         img_crown.visible = true;
         if(_data)
         {
            txt_rank.text = "";
            if(_data.rankData)
            {
               txt_name.text = LinkUtils.playerNameSmart(_data.rankData.baseinfo.id,_data.rankData.baseinfo.name,_data.rankData.baseinfo.dist,ColorLib.getMilitaryColor(_data.rankData.baseinfo.militaryRank));
               txt_value.num = Uint64Util.toNumber(_data.rankData.ability);
            }
            else
            {
               var _loc2_:String = "--";
               txt_value.text = _loc2_;
               txt_name.text = _loc2_;
            }
            switch(int(_data.rank) - 1)
            {
               case 0:
               case 1:
               case 2:
                  img_crown.skin = SkinLib.getRankCrown(_data.rank);
            }
            list_reward.dataSource = [];
            list_reward.dataSource = _data.reward;
            list_superReward.dataSource = [];
            list_superReward.dataSource = _data.superReward;
         }
         .super.dataSource = param1;
      }
   }
}
