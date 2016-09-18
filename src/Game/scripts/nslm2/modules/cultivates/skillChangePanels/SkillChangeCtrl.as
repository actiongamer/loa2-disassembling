package nslm2.modules.cultivates.skillChangePanels
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Component;
   import nslm2.modules.footstones.tooltipsModules.TooltipPlayerSkillVo;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class SkillChangeCtrl implements IDispose
   {
       
      
      private var _component:Component;
      
      public function SkillChangeCtrl(param1:Component)
      {
         super();
         this._component = param1;
         setToolTip(true);
         switchEventListener(true);
      }
      
      public function dispose() : void
      {
         switchEventListener(false);
      }
      
      private function setToolTip(param1:Boolean) : void
      {
         if(param1)
         {
            this._component.toolTip = new TooltipPlayerSkillVo(SkillChangeModel.ins.getUsingNorSkillId(),SkillChangeModel.ins.getUsingSpeSkillId(),SkillChangeModel.ins.getUsingAuraId());
         }
         else
         {
            this._component.toolTip = false;
         }
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            _component.addEventListener("click",onClick);
         }
         else
         {
            _component.removeEventListener("click",onClick);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(30106,null,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
