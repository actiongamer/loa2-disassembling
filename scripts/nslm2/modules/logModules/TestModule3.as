package nslm2.modules.logModules
{
   import game.ui.logModules.TestModule3UI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class TestModule3 extends TestModule3UI
   {
       
      
      public function TestModule3()
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
               ModuleMgr.ins.showModule(90300,null,this.moduleId);
               break;
            case 2:
               ModuleMgr.ins.showModule(90300);
               break;
            case 3:
               ModuleMgr.ins.showModule(90300);
         }
      }
   }
}
