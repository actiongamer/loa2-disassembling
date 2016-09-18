package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.SelectTreasureRenderUI;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   
   public class SelectTreasureRender extends SelectTreasureRenderUI
   {
       
      
      private var _data:TreasureVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      public function SelectTreasureRender()
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
         _data = param1 as TreasureVo;
         if(_data)
         {
            txt_stren.text = LocaleMgr.ins.getStr(999000096) + "+" + _data.baoWu.level;
            selectedFlag.selected = _data.selected;
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_data.quality));
         }
         .super.dataSource = param1;
      }
      
      override protected function validateTxtName() : void
      {
         super.validateTxtName();
         txt_name.commitMeasure();
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
