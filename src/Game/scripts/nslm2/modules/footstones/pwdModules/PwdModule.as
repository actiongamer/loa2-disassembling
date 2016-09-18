package nslm2.modules.footstones.pwdModules
{
   import game.ui.PwdModule.PwdModuleUI;
   import morn.core.handlers.Handler;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class PwdModule extends PwdModuleUI
   {
       
      
      private var _cplHandler:Handler;
      
      public function PwdModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFunc);
      }
      
      private function btnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_confirm === _loc2_)
         {
            Handler.execute(_cplHandler,[txt_pwdInput.text]);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         txt_pwdInput.textField.restrict = "a-z0-9";
         _cplHandler = param1 as Handler;
         this.preShowCpl();
      }
   }
}
