package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsMyInfoPanelUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.BkGameStageInfoNotify;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import proto.BkKillRankInfo;
   import nslm2.utils.Uint64Util;
   import proto.BkStagePlayerInfo;
   import morn.customs.expands.MornExpandUtil;
   
   public class PeakSportsMyInfoPanel extends PeakSportsMyInfoPanelUI
   {
       
      
      public function PeakSportsMyInfoPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_info === _loc2_)
         {
            ModuleMgr.ins.showOrCloseModule(50528,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      public function show2(param1:BkGameStageInfoNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         txt_killed.text = LocaleMgr.ins.getStr(999600108) + param1.myInfo.killNum;
         txt_assisted.text = LocaleMgr.ins.getStr(999600109) + param1.myInfo.assistNum;
         if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 1)
         {
            _loc3_ = param1.killRank1[0];
         }
         else if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 2)
         {
            _loc3_ = param1.killRank2[0];
         }
         else
         {
            _loc3_ = null;
         }
         if(_loc3_ == null)
         {
            txt_gathered.text = "";
         }
         else
         {
            _loc2_ = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(_loc3_.playerId)) as BkStagePlayerInfo;
            txt_gathered.text = LocaleMgr.ins.getStr(999600110,["S" + _loc2_.playerInfo.baseInfo.dist % 10000,_loc2_.playerInfo.baseInfo.name,_loc3_.killNum]);
         }
      }
   }
}
