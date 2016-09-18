package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonAceTreasureRenderUI;
   import proto.GetReward;
   import nslm2.utils.WealthUtil;
   
   public class GuildDungeonAceTreasureRender extends GuildDungeonAceTreasureRenderUI
   {
       
      
      private var _rewardVo:GetReward;
      
      public function GuildDungeonAceTreasureRender()
      {
         super();
      }
      
      public function get rewardVo() : GetReward
      {
         return _rewardVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _rewardVo = param1 as GetReward;
         .super.dataSource = WealthUtil.createWealthVo(rewardVo.kind,rewardVo.id,rewardVo.count);
         refresh();
      }
      
      private function refresh() : void
      {
         if(rewardVo.hasPlayerid)
         {
            this.img_hasReward.visible = true;
            this.txt_playerName.text = rewardVo.name;
         }
         else
         {
            this.img_hasReward.visible = false;
            this.txt_playerName.text = "";
         }
      }
   }
}
