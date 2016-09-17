package nslm2.modules.cultivates.recommendHero.render
{
   import game.ui.recommendHero.render.RecoYuanjunHeroRenderUI;
   import nslm2.common.model.HeroModel;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class RecoYuanjunHeroRender extends RecoYuanjunHeroRenderUI
   {
       
      
      public function RecoYuanjunHeroRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(HeroModel.ins.getHeroNodeCount(this.wealthVo.stcNpcVo.node) > 0)
            {
               if(this.ref_img_icon != null)
               {
                  this.ref_img_icon.filters = null;
               }
            }
            else if(this.ref_img_icon != null)
            {
               this.ref_img_icon.filters = [FilterUtil.grayFilter()];
            }
            switchEventListeners(true);
         }
         else
         {
            switchEventListeners(false);
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onClick);
         }
         else
         {
            this.removeEventListener("click",onClick);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.wealthVo.stcNpcVo.get_point == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000064));
         }
         else
         {
            _loc2_ = new RoleInfoModuleParam();
            _loc2_.init(HeroInfoUtil.createFakeHeroInfoByNpcVo(this.wealthVo.stcNpcVo),30100,true);
            ModuleMgr.ins.showModule(30100,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}
