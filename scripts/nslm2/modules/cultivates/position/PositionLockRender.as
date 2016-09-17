package nslm2.modules.cultivates.position
{
   import game.ui.position.PositionLockRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.uiEffects.RollFilterMed;
   import morn.customs.FilterLib;
   
   public class PositionLockRender extends PositionLockRenderUI
   {
       
      
      public function PositionLockRender()
      {
         super();
         this.img_icon.buttonMode = true;
         this.txt_prompt.mouseEvent = false;
         this.addEventListener("click",onClick);
         this.parts.push(new RollFilterMed(this.img_icon,[FilterLib.BUTTON_OVER_STATE]));
      }
      
      public function set openLevel(param1:int) : void
      {
         this.txt_prompt.text = LocaleMgr.ins.getStr(30100044,[param1]);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
