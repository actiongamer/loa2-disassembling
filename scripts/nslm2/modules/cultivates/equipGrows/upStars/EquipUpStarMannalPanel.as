package nslm2.modules.cultivates.equipGrows.upStars
{
   import game.ui.equipGrows.upStars.EquipUpStarMannalPanelUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class EquipUpStarMannalPanel extends EquipUpStarMannalPanelUI
   {
       
      
      public function EquipUpStarMannalPanel()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000551);
      }
      
      public function show() : void
      {
         this.list_mannal.dataSource = StcMgr.ins.getEquipAddStarTable().array.filter(filterMannal);
      }
      
      private function filterMannal(param1:StcEquipAddStarVo, param2:int, param3:Array) : Boolean
      {
         if(param1.totalstep == 0)
         {
            return false;
         }
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1.equipId);
         if(_loc4_)
         {
            return true;
         }
         return false;
      }
   }
}
