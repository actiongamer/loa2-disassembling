package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonVideoRenderUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import proto.StageBtlReport;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.utils.Uint64Util;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildDungeonVideoRender extends GuildDungeonVideoRenderUI
   {
       
      
      public function GuildDungeonVideoRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_video === _loc2_)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds(vo.reportId));
         }
      }
      
      public function get vo() : StageBtlReport
      {
         return dataSource as StageBtlReport;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_rank.text = (this.listCellVo.listIndex + 1).toString();
            this.txt_name.text = LinkUtils.playerNameSmart(this.vo.playerId,this.vo.name,0,16769442);
            this.txt_damage.num = Uint64Util.toNumber(this.vo.hurt);
            this.toolTip = this.vo;
         }
      }
   }
}
