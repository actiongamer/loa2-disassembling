package nslm2.modules.battles.guildDungeons.render
{
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagNormalRender;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import proto.FamilyStageFightEndNotify;
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.geom.Point;
   
   public class GuildDungeonYukouFlagRender extends GuildDungeonFlagRender
   {
       
      
      private var _dungeonFlagRender:DungeonFlagNormalRender;
      
      public function GuildDungeonYukouFlagRender(param1:int)
      {
         super(param1);
      }
      
      override protected function refresh() : void
      {
         super.refresh();
         this.visible = GuildDungeonModel.ins.isAllCleared();
         if(GuildDungeonModel.ins.isAllCleared() == false)
         {
            if(_bossAvatar)
            {
               _bossAvatar.dispose();
               _bossAvatar = null;
            }
         }
      }
      
      override protected function onFightEnd(param1:FamilyStageFightEndNotify) : void
      {
         var _loc2_:* = null;
         this.visible = GuildDungeonModel.ins.isAllCleared();
         if(GuildDungeonModel.ins.isAllCleared() && _bossAvatar == null)
         {
            _bossAvatar = new UIUnit3DS2();
            _bossAvatar.initByStcNpcId(StcMgr.ins.getNpcGroupVo(this.vo.npcgroup).head_id);
            _bossAvatar.buttonMode = true;
            _loc2_ = this.vo.position.split(",");
            _bossAvatar.pos2d = new Point(_loc2_[0] - 505,-_loc2_[1] + 280);
            _bossAvatar.scaleAll = 0.5;
            _bossAvatar.rotation = -90;
            GuildDungeonModel.ins.panel3D.addChild3D(_bossAvatar);
         }
      }
   }
}
