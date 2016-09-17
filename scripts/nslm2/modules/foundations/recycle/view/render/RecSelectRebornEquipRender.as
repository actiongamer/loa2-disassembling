package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecSelectRebornEquipRenderUI;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.core.components.Label;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.components.Button;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.WealthUtil;
   
   public class RecSelectRebornEquipRender extends RecSelectRebornEquipRenderUI
   {
       
      
      private var _data:RecycleVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      private var starNum:Label;
      
      public function RecSelectRebornEquipRender()
      {
         starNum = new Label();
         super();
         btn_select.clickHandler = selectHero;
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
         var _loc2_:* = null;
         _data = param1 as RecycleVo;
         if(_data)
         {
            if(_data.wealthVo.item)
            {
               txt_lvl.text = LocaleMgr.ins.getStr(999000346) + _data.wealthVo.item.star;
            }
            if(_data.wealthVo.treasure)
            {
               txt_lvl.text = LocaleMgr.ins.getStr(999000346) + _data.wealthVo.treasure.keyin;
            }
            _loc2_ = _data.wealthVo.stcItemVo;
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_.quality));
         }
         .super.dataSource = param1;
      }
      
      private function selectHero(param1:Button) : void
      {
         RecycleModel.ins.selectedRebornItem = this._data;
         RecycleModel.ins.selectedRecTreasure = this._data;
         ObserverMgr.ins.sendNotice("recycle_notice_update_selected_item");
         ModuleMgr.ins.closeModule(11305);
         ModuleMgr.ins.closeModule(11308);
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
