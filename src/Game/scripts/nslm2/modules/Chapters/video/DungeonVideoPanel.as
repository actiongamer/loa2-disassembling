package nslm2.modules.Chapters.video
{
   import game.ui.chapters.video.DungeonVideoPanelUI;
   import nslm2.modules.Chapters.IDungeonVideo;
   import proto.StageBtlGuideRes;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class DungeonVideoPanel extends DungeonVideoPanelUI implements IDungeonVideo
   {
       
      
      private var _stcStageId:int;
      
      private var _res:StageBtlGuideRes;
      
      public function DungeonVideoPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_video === _loc2_)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds(_res.shousha.reportId));
         }
      }
      
      public function show(param1:Object = null) : void
      {
         if(param1)
         {
            _stcStageId = param1 as int;
         }
         this.panelBg.titleImgId = 40402;
         _res = ChapterModel.ins.getStageBtlGuideInfo(_stcStageId);
         if(!_res)
         {
         }
         if(_res.shousha)
         {
            this.txt_shoushaName.toolTip = _res.shousha;
            if(Uint64Util.equal(_res.shousha.playerId,PlayerModel.ins.playerInfo.id))
            {
               this.txt_shoushaName.text = _res.shousha.name;
            }
            else
            {
               this.txt_shoushaName.text = LinkUtils.playerName(_res.shousha.playerId,_res.shousha.name,0,12798193,15);
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
         this.list_best.dataSource = _res.zuiqiang;
         this.list_limit.dataSource = _res.jixian;
         this.visible = true;
      }
   }
}
