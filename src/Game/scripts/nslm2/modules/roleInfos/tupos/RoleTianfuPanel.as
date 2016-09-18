package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTianfuPanelUI;
   import nslm2.modules.footstones.tooltipsModules.TooltipTianfuVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class RoleTianfuPanel extends RoleTianfuPanelUI
   {
       
      
      public function RoleTianfuPanel()
      {
         super();
         this.panelBg.titleImgId = 30108;
      }
      
      public function show(param1:TooltipTianfuVo) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         this.list_tujian.dataSource = param1.tupoArr.slice(1);
      }
      
      private function getDesStr(param1:StcTupoVo) : String
      {
         var _loc2_:String = "";
         _loc2_ = _loc2_ + ("[" + LocaleMgr.ins.getStr(param1.name) + param1.tupo_level + "] " + HeroInfoUtil.getTupoDesc(param1.attr) + " " + LocaleMgr.ins.getStr(30100012,[param1.tupo_level]));
         return _loc2_;
      }
   }
}
