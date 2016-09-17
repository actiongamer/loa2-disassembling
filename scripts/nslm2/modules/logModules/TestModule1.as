package nslm2.modules.logModules
{
   import game.ui.logModules.TestModule1UI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   
   public class TestModule1 extends TestModule1UI
   {
       
      
      public function TestModule1()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.show(param1);
         this.preShowCpl();
      }
      
      private function tab_handler(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               ModuleMgr.ins.showModule(90312,null,this.moduleId);
               break;
            case 2:
               ModuleMgr.ins.showModule(90312,null,90310);
               break;
            case 3:
               AlertUtil.comfirm("queren1");
         }
      }
   }
}
