package nslm2.modules.logModules
{
   import game.ui.logModules.TestModule2UI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class TestModule2 extends TestModule2UI
   {
       
      
      public function TestModule2()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.show(param1);
         tab.labels = "0,1,2,3,4,5,6,7";
         tab.selectHandler = tab_handler;
         this.preShowCpl();
      }
      
      private function tab_handler(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               break;
            case 2:
               break;
            case 3:
               ModuleMgr.ins.closeModule(90310);
               break;
            case 4:
               ModuleMgr.ins.closeModule(90300);
         }
      }
   }
}
