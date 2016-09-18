package nslm2.modules.funnies.worldBoss.view.render
{
   import game.ui.worldBoss.render.WorldBossRankRenderUI;
   import nslm2.modules.funnies.worldBoss.vo.WorldBossRankVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class WorldBossRankListRender extends WorldBossRankRenderUI
   {
       
      
      private var _data:WorldBossRankVo;
      
      public function WorldBossRankListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as WorldBossRankVo;
         img_rank.visible = true;
         if(_data)
         {
            txt_rank.text = "";
            if(_data.rankData && _data.rankData.hurt >= DefindConsts.WORLD_BOSS_SHANGBANG)
            {
               txt_name.text = LinkUtils.playerNameSmart(_data.rankData.playerid,_data.rankData.name,0);
               txt_count.num = _data.rankData.hurt;
            }
            else
            {
               var _loc2_:String = "--";
               txt_count.text = _loc2_;
               txt_name.text = _loc2_;
            }
            switch(int(_data.rank) - 1)
            {
               case 0:
               case 1:
               case 2:
                  img_rank.skin = SkinLib.getRankCrown(_data.rank);
            }
            list_rwd.dataSource = [];
            list_rwd.repeatX = _data.reward.length;
            list_rwd.dataSource = _data.reward;
         }
         .super.dataSource = param1;
      }
   }
}
