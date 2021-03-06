package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.petReborn.RecSelectRebornPetRenderUI;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.components.Button;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class RecSelectRebornPetRender extends RecSelectRebornPetRenderUI
   {
       
      
      private var _data:RecycleVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      public function RecSelectRebornPetRender()
      {
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
            txt_lvl.text = LocaleMgr.ins.getStr(11300000) + _data.petInfoVo.petInfo.level;
            _loc2_ = _data.petInfoVo.stcVo;
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_.quality));
            txt_phase.text = LocaleMgr.ins.getStr(11300002) + _data.petInfoVo.petInfo.grade;
         }
         .super.dataSource = param1;
      }
      
      private function selectHero(param1:Button) : void
      {
         RecycleModel.ins.selectedRebornItem = this._data;
         ObserverMgr.ins.sendNotice("recycle_notice_update_selected_item");
         ModuleMgr.ins.closeModule(11309);
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = _data.petInfoVo;
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
   }
}
