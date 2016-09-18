package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonTreasureIconUI;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import morn.customs.FilterLib;
   import com.mz.core.event.MzEvent;
   import proto.GetReward;
   import nslm2.common.model.PlayerModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mediators.RollMediator;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   
   public class GuildDungeonTreasureIcon extends GuildDungeonTreasureIconUI
   {
       
      
      private var _isRoll:Boolean;
      
      public function GuildDungeonTreasureIcon()
      {
         super();
         switchEventListeners(true);
         this.parts.push(new RollMediator(this,onMouseOver));
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.ins.getFilterArr(301)[0]).addHandler(breath_cb));
         validateRedPoint();
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onTreasureClick);
            ServerEngine.ins.addAlwayHandler(7159,validateRedPoint);
            GuildDungeonModel.ins.addEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
         else
         {
            this.removeEventListener("click",onTreasureClick);
            ServerEngine.ins.removeAlwayHandler(7159,validateRedPoint);
            GuildDungeonModel.ins.removeEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
      }
      
      private function onMouseOver(param1:Boolean) : void
      {
         _isRoll = param1;
         if(param1)
         {
            this.filters = FilterLib.ins.getFilterArr(301);
         }
         else
         {
            this.filters = null;
         }
      }
      
      private function onGetTreasureCpl(param1:MzEvent) : void
      {
         var _loc2_:GetReward = param1.data as GetReward;
         if(PlayerModel.ins.isCurPlayer(_loc2_.playerid) == true)
         {
            GuildDungeonModel.ins.hasRewarded = true;
         }
         validateRedPoint();
      }
      
      private function validateRedPoint(... rest) : void
      {
         this.img_redPoint.visible = GuildDungeonModel.ins.canRewardTreasure();
      }
      
      private function breath_cb(param1:Array) : void
      {
         if(_isRoll == false)
         {
            if(GuildDungeonModel.ins.canRewardTreasure())
            {
               this.filters = param1;
            }
            else
            {
               this.filters = [];
            }
         }
      }
      
      private function onTreasureClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(40723,null,40720);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
