package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecSelectHeroRenderUI;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   
   public class RecSelectHeroRender extends RecSelectHeroRenderUI
   {
       
      
      private var _data:RecycleVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      public function RecSelectHeroRender()
      {
         super();
         filterMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_data)
         {
            return _data.wealthVo;
         }
         return null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as RecycleVo;
         if(_data)
         {
            txt_lvl.text = LocaleMgr.ins.getStr(999000343) + _data.heroBaseInfo.level;
            txt_tupo.text = LocaleMgr.ins.getStr(999000344) + "+" + _data.tupoLvl;
            txt_phase.text = LocaleMgr.ins.getStr(999000345) + "+" + _data.phaseLvl;
            selectedFlag.selected = _data.isSelected;
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_data.quality));
            img_group.skin = UrlLib.npcGroupImg(wealthVo.stcNpcVo.group);
         }
         .super.dataSource = param1;
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
   }
}
