package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipGodhoodRenderUI;
   import nslm2.modules.footstones.tooltipsModules.TooltipGodhoodVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipGodhoodRender extends TooltipGodhoodRenderUI
   {
       
      
      public function TooltipGodhoodRender()
      {
         super();
      }
      
      private function get vo() : TooltipGodhoodVo
      {
         return this.dataSource as TooltipGodhoodVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            this.render_hero.dataSource = WealthUtil.createNpcVo(vo.heroinfo.baseInfo.baseId,1);
            this.txt_name.text = HeroInfoUtil.getHtmlNameHasTupoLevel(vo.heroinfo.baseInfo.baseId);
            _loc2_ = vo.stcItemVo.extend_1;
            if(RoleTupoUtil.getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(vo.heroinfo.baseInfo),vo.stcItemVo.id) == 1)
            {
               this.txt_itemCnt.text = LocaleMgr.ins.getStr(10220009);
            }
            else
            {
               this.txt_itemCnt.text = LocaleMgr.ins.getStr(999000173);
               this.txt_itemCnt.color = 16723968;
            }
         }
      }
   }
}
