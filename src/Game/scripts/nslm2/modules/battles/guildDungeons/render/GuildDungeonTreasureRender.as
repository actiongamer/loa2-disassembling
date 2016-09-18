package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonTreasureRenderUI;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.modules.battles.guildDungeons.GuildDungeonTreasureEffectCtrl;
   import proto.GetReward;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.guildDungeons.GuildDungeonService;
   import com.mz.core.event.MzEvent;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   
   public class GuildDungeonTreasureRender extends GuildDungeonTreasureRenderUI
   {
       
      
      private var _floatCtrl:FloatUpDownEffCtrl;
      
      private var _starEffectCtrl:GuildDungeonTreasureEffectCtrl;
      
      public function GuildDungeonTreasureRender()
      {
         super();
         switchEventListeners(true);
         this.parts.push(new FloatUpDownEffCtrl().init(this.txt_alert));
      }
      
      public function get vo() : GetReward
      {
         return this.dataSource as GetReward;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onMouseClick);
            GuildDungeonModel.ins.addEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
         else
         {
            this.removeEventListener("click",onMouseClick);
            GuildDungeonModel.ins.removeEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         if(this.vo.name)
         {
            return;
         }
         if(GuildDungeonModel.ins.hasRewarded)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300007010));
            return;
         }
         GuildDungeonService.ins.familyStageGetReward(this.vo.position);
      }
      
      private function onGetTreasureCpl(param1:MzEvent) : void
      {
         var _loc2_:GetReward = param1.data as GetReward;
         if(this.vo && _loc2_.position == this.vo.position)
         {
            this.dataSource = _loc2_;
            showEffect();
         }
         showCanReward();
      }
      
      private function showEffect() : void
      {
         if(PlayerModel.ins.isCurPlayer(this.vo.playerid) == false)
         {
            AlertUtil.alert(LocaleMgr.ins.getStr(40710505));
         }
         else
         {
            GuildDungeonModel.ins.hasRewarded = true;
            FloatUtil.showGetItemsDisplayPanel(this.list_reward.dataSource as Array);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_playerName.text = this.vo.name;
            if(this.vo.name)
            {
               this.btn_treasure.skin = "png.uiGuildDungeon.btn_treasureOpen";
               this.list_reward.visible = true;
               this.list_reward.dataSource = [WealthUtil.createWealthVo(this.vo.kind,this.vo.id,this.vo.count)];
               if(_floatCtrl == null)
               {
                  _floatCtrl = new FloatUpDownEffCtrl().init(this.list_reward,NaN,4,4);
               }
               this.txt_alert.visible = false;
               if(_starEffectCtrl)
               {
                  _starEffectCtrl.dispose();
               }
            }
            else
            {
               this.btn_treasure.skin = "png.uiGuildDungeon.btn_treasureClose";
               this.list_reward.visible = false;
               if(_floatCtrl)
               {
                  _floatCtrl.dispose();
                  _floatCtrl = null;
               }
               if(_starEffectCtrl == null && GuildDungeonModel.ins.isAllCleared())
               {
                  _starEffectCtrl = new GuildDungeonTreasureEffectCtrl(this);
               }
               showCanReward();
            }
         }
      }
      
      private function showCanReward() : void
      {
         if(GuildDungeonModel.ins.hasRewarded == false && GuildDungeonModel.ins.isAllCleared())
         {
            this.txt_alert.visible = true;
         }
         else
         {
            this.txt_alert.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         if(_floatCtrl)
         {
            _floatCtrl.dispose();
            _floatCtrl = null;
         }
         super.dispose();
      }
   }
}
