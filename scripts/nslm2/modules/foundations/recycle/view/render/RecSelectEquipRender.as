package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecSelectEquipRenderUI;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   
   public class RecSelectEquipRender extends RecSelectEquipRenderUI
   {
       
      
      private var _data:RecycleVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      public function RecSelectEquipRender()
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
            if(_data.wealthVo.kind == 2121)
            {
               txt_stren.text = LocaleMgr.ins.getStr(999000346) + "" + _data.wealthVo.treasure.keyin;
               txt_jinlian.text = LocaleMgr.ins.getStr(999000341) + "" + _data.wealthVo.treasure.level;
            }
            else
            {
               txt_stren.text = LocaleMgr.ins.getStr(999000341) + "+" + _data.strenLvl;
               txt_jinlian.text = LocaleMgr.ins.getStr(999000342) + "+" + _data.jinlianLvl;
            }
            selectedFlag.selected = _data.isSelected;
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_data.quality));
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
