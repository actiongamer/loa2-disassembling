package nslm2.modules.battles.guildDungeons
{
   import game.ui.guildDungeon.GuildDungeonVideoPanelUI;
   import nslm2.modules.Chapters.IDungeonVideo;
   import proto.FamilyStageRecordRes;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildDungeonVideoPanel extends GuildDungeonVideoPanelUI implements IDungeonVideo
   {
       
      
      private var _stcStageId:int;
      
      private var _res:FamilyStageRecordRes;
      
      public function GuildDungeonVideoPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
      }
      
      private function get stcFamilyStageNodeVo() : StcFamilyStageNodeVo
      {
         return StcMgr.ins.getFamilyStageNodeVo(_stcStageId);
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_video === _loc2_)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds(_res.lastfight.reportId));
         }
      }
      
      public function show(param1:Object = null) : void
      {
         if(param1)
         {
            _stcStageId = param1 as int;
         }
         this.panelBg.titleImgId = 40726;
         _res = GuildDungeonModel.ins.getStageBtlGuideInfo(_stcStageId);
         if(!_res)
         {
         }
         if(_res.lastfight)
         {
            this.txt_shoushaName.toolTip = _res.lastfight;
            if(Uint64Util.equal(_res.lastfight.playerId,PlayerModel.ins.playerInfo.id))
            {
               this.txt_shoushaName.text = _res.lastfight.name;
            }
            else
            {
               this.txt_shoushaName.text = LinkUtils.playerName(_res.lastfight.playerId,_res.lastfight.name,0,12798193,15);
            }
            this.btn_video.visible = true;
            this.btn_video.x = this.txt_shoushaName.textWidth + this.txt_shoushaName.x + 5;
         }
         else
         {
            this.txt_shoushaName.toolTip = null;
            this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
            this.btn_video.visible = false;
         }
         this.list_best.dataSource = _res.rank;
         this.visible = true;
      }
   }
}
