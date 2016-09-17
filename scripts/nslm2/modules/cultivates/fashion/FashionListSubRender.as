package nslm2.modules.cultivates.fashion
{
   import game.ui.fashionModules.FashionListSubRenderUI;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcClotheSuitVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.FilterUtil;
   
   public class FashionListSubRender extends FashionListSubRenderUI
   {
       
      
      public function FashionListSubRender()
      {
         super();
         switchEventListeners(true);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            FashionModel.ins.addEventListener("evtActivateCpl",onActivateCpl);
         }
         else
         {
            FashionModel.ins.removeEventListener("evtActivateCpl",onActivateCpl);
         }
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         if(FashionModel.ins.getSuitId(param1.data) == this.dataSource)
         {
            refresh();
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            .super.dataSource = param1;
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:StcClotheSuitVo = StcMgr.ins.getClotheSuitVo(dataSource as int);
         this.txt_name.text = LocaleMgr.ins.getStr(_loc1_.name);
         this.list_skill.dataSource = [_loc1_.skill_1,_loc1_.skill_2];
         this.clothRender.dataSource = WealthUtil.createItemVo(FashionModel.ins.getFashionCloth(dataSource as int));
         this.wingRender.dataSource = WealthUtil.createItemVo(FashionModel.ins.getFashionWing(dataSource as int));
         if(FashionModel.ins.hasActivatedClothBySuitId(dataSource as int) || FashionModel.ins.hasActivatedWingBySuitId(dataSource as int))
         {
            this.box_info.filters = null;
         }
         else
         {
            this.box_info.filters = [FilterUtil.grayFilter()];
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
