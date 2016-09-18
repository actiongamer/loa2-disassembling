package nslm2.modules.cultivates.reinforceTrain
{
   import game.ui.reinforceTrain.ReinforceTrainModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.reinforceTrain.view.ReinforceLevView;
   
   public class ReinforceTrainModule extends ReinforceTrainModuleUI
   {
       
      
      private var subViewStack:ViewStack;
      
      public function ReinforceTrainModule()
      {
         super();
         subViewStack = new ViewStack();
         subViewStack.x = 34;
         subViewStack.y = 77;
         addChild(subViewStack);
         tabBar.labels = LocaleMgr.ins.getStr(30815001);
         tabBar.selectHandler = tabChangeHandler;
         subViewStack.selectedIndex = 0;
         this.txt_hint.text = LocaleMgr.ins.getStr(30815009);
         subViewStack.addItem(new ReinforceLevView());
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30815000);
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         super.preShowCpl();
      }
      
      private function tabChangeHandler(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.dispose();
      }
   }
}
