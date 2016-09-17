package nslm2.modules.cultivates.skin.render
{
   import game.ui.skinModule.render.WealthRenderS9ForSkinUI;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.cultivates.skin.service.SkinService;
   import flash.events.MouseEvent;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import morn.customs.FilterLib;
   
   public class WealthRenderS9ForSkin extends WealthRenderS9ForSkinUI
   {
       
      
      private var breathCtrl:GlowFilterBreathCtrl;
      
      public function WealthRenderS9ForSkin()
      {
         super();
         this.switchEventListeners(true);
         this.buttonMode = true;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            SkinModel.ins.addEventListener("evtActivateCpl",onActivateCpl);
            this.addEventListener("click",onClick);
         }
         else
         {
            SkinModel.ins.removeEventListener("evtActivateCpl",onActivateCpl);
            this.removeEventListener("click",onClick);
         }
      }
      
      protected function onActivateCpl(param1:MzEvent) : void
      {
         if(dataSource as WealthVo)
         {
            if(param1.data == (dataSource as WealthVo).sid)
            {
               ObjectUtils.gray(this.img_icon,false);
            }
         }
      }
      
      private function doActivate() : void
      {
         SkinService.ins.activateClothes((dataSource as WealthVo).sid);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(dataSource as WealthVo)
         {
            if(SkinModel.ins.canActive((dataSource as WealthVo).sid))
            {
               breathCtrl.dispose();
               this.box_main.filters = null;
               _loc2_ = new BmcSpriteSheet();
               _loc2_.x = -41;
               _loc2_.y = -40;
               addChild(_loc2_);
               _loc2_.addEndHandler(doActivate).init(3020001);
            }
            else if(!SkinModel.ins.isActive((dataSource as WealthVo).sid) && !SkinModel.ins.isUsed((dataSource as WealthVo).sid))
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int((dataSource as WealthVo).stcItemVo.get_point)),31110);
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(breathCtrl != null)
         {
            breathCtrl.dispose();
            breathCtrl = null;
            this.box_main.filters = [];
         }
         var _loc2_:WealthVo = param1 as WealthVo;
         if(!SkinModel.ins.isActive(_loc2_.sid) && !SkinModel.ins.isUsed(_loc2_.sid))
         {
            ObjectUtils.gray(this.img_icon);
            if(SkinModel.ins.canActive(_loc2_.sid))
            {
               breathCtrl = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_ORANGE).addHandler(breath_cb);
               this.parts.push(new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_ORANGE).addHandler(breath_cb));
            }
         }
         else
         {
            ObjectUtils.gray(this.img_icon,false);
            this.filters = null;
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.box_main.filters = param1;
      }
      
      override public function dispose() : void
      {
         this.switchEventListeners(false);
         super.dispose();
      }
   }
}
