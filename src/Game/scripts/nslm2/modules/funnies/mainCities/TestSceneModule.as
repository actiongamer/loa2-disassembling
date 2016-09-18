package nslm2.modules.funnies.mainCities
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   
   public class TestSceneModule extends SceneModuleView
   {
       
      
      public function TestSceneModule()
      {
         super();
         var _loc1_:Button = new Button();
         _loc1_.style = "按钮大蓝";
         this.addChild(_loc1_);
         var _loc2_:int = 0;
         _loc1_.centerY = _loc2_;
         _loc1_.centerX = _loc2_;
         _loc1_.clickHandler = btn_handler;
      }
      
      private function btn_handler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
