package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipRedEquipSkillRenderUI;
   import nslm2.modules.footstones.tooltipsModules.TooltipEquipAttrVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipRedEquipSkillRender extends TooltipRedEquipSkillRenderUI
   {
       
      
      public function TooltipRedEquipSkillRender()
      {
         super();
      }
      
      public function get vo() : TooltipEquipAttrVo
      {
         return this.dataSource as TooltipEquipAttrVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            txt_value.text = "【" + LocaleMgr.ins.getStr(vo.attr_name) + "】" + LocaleMgr.ins.getStr(vo.attr_disc) + "\n" + "（" + LocaleMgr.ins.getStr(vo.active_disc) + "）";
            txt_value.color = !!vo.actived?458496:14474460;
            this.height = txt_value.textHeight + 2;
         }
      }
   }
}
