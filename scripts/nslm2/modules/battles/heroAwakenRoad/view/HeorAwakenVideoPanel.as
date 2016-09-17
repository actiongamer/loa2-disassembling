package nslm2.modules.battles.heroAwakenRoad.view
{
   import game.ui.chapters.video.DungeonVideoPanelUI;
   import nslm2.modules.Chapters.IDungeonVideo;
   import proto.JueRoadRecordRes;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class HeorAwakenVideoPanel extends DungeonVideoPanelUI implements IDungeonVideo
   {
       
      
      private var _stcStageId:int;
      
      private var _res:JueRoadRecordRes;
      
      public function HeorAwakenVideoPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_video === _loc2_)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds(_res.shoushareportid));
         }
      }
      
      public function show(param1:Object = null) : void
      {
         if(param1)
         {
            _stcStageId = param1 as int;
         }
         this.panelBg.titleImgId = 40402;
         _res = HeroAwakenRoadModel.ins.getStageBtlGuideInfo(_stcStageId);
         if(_res)
         {
            if(_res.shousha)
            {
               this.txt_shoushaName.toolTip = _res.shousha.name;
               txt_shoushaName.text = LinkUtils.playerNameSmart(_res.shousha.id,_res.shousha.name,_res.shousha.dist,ColorLib.getMilitaryColor(_res.shousha.militaryRank));
               this.btn_video.visible = true;
               this.btn_video.x = this.txt_shoushaName.textWidth + this.txt_shoushaName.x + 5;
            }
            else
            {
               this.txt_shoushaName.toolTip = null;
               this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
               this.btn_video.visible = false;
            }
            this.list_best.dataSource = _res.zuiqiang.reverse();
            this.list_limit.dataSource = _res.jixian;
         }
         else
         {
            this.txt_shoushaName.toolTip = null;
            this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
            this.btn_video.visible = false;
            this.list_best.dataSource = [];
            this.list_limit.dataSource = [];
         }
         this.visible = true;
      }
   }
}
