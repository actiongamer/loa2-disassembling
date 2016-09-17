package nslm2.modules.footstones.newerAutoCtrl
{
   import game.ui.commons.comps.others.NewerAutoRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class NewerAutoRender extends NewerAutoRenderUI
   {
       
      
      private var _textArr:Array;
      
      public function NewerAutoRender()
      {
         _textArr = [LocaleMgr.ins.getStr(999000117),LocaleMgr.ins.getStr(999000118),LocaleMgr.ins.getStr(999000119)];
         super();
         TimerManager.ins.doLoop(1000,changeText);
      }
      
      private function changeText() : void
      {
         var _loc1_:String = _textArr.shift();
         this.txt_label.text = _loc1_;
         this.txt_label.commitMeasure();
         _textArr.push(_loc1_);
      }
   }
}
