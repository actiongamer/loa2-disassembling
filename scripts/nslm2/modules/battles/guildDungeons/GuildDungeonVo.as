package nslm2.modules.battles.guildDungeons
{
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class GuildDungeonVo extends DungeonVo
   {
       
      
      public var res;
      
      public function GuildDungeonVo(param1:int)
      {
         super(param1);
      }
      
      public function get stcGuildStageVo() : StcFamilyStageNodeVo
      {
         return StcMgr.ins.getFamilyStageNodeVo(this.dungeonId);
      }
      
      override public function get stcStageVo() : StcStageVo
      {
         if(stcGuildStageVo)
         {
            return StcMgr.ins.getStageVo(this.stcGuildStageVo.stageid);
         }
         return null;
      }
      
      override public function monsterGroupId(param1:int) : int
      {
         var _loc2_:int = 0;
         if(!int(param1))
         {
            _loc2_ = this.stcGuildStageVo.npcgroup;
         }
         return _loc2_;
      }
   }
}
