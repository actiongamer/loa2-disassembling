package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PeakSportsHeroInfoRender extends PeakSportsHeroInfoRenderUI
   {
       
      
      private var _playerInfo:Object;
      
      public function PeakSportsHeroInfoRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _playerInfo = param1 as Object;
         if(_playerInfo == null)
         {
            return;
         }
         if(Uint64Util.equal(_playerInfo.id,PlayerModel.ins.playerInfo.id))
         {
            if(_playerInfo.side == 1)
            {
               myImage.url = "png.uiPeakSports.蓝色自己";
            }
            else if(_playerInfo.side == 2)
            {
               myImage.url = "png.uiPeakSports.绿色自己";
            }
            else
            {
               myImage.url = "";
            }
         }
         else
         {
            myImage.url = "";
         }
         heroImage.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(_playerInfo.npcId).head_id);
         heroNameTxt.text = _playerInfo.name + " Lv." + _playerInfo.lv;
         powerTxt.text = LocaleMgr.ins.getStr(999600052) + _playerInfo.ability;
      }
   }
}
