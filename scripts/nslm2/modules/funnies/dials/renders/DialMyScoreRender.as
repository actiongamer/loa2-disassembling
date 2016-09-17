package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialMyScoreRenderUI;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class DialMyScoreRender extends DialMyScoreRenderUI
   {
       
      
      public function DialMyScoreRender()
      {
         super();
      }
      
      private function switchEventListeners(param1:*) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("super_dial_cpl",onDialCpl);
            DialMsgs.ins.addEventListener("common_dial_cpl",onDialCpl);
         }
         else
         {
            DialMsgs.ins.removeEventListener("super_dial_cpl",onDialCpl);
            DialMsgs.ins.addEventListener("common_dial_cpl",onDialCpl);
         }
      }
      
      private function onDialCpl(param1:MzEvent) : void
      {
         this.txt_myScore.text = LocaleMgr.ins.getStr(50500006,[DialModel.ins.getMyScore()]);
      }
      
      public function init() : void
      {
         this.img_icon.skin = UrlLib.dialModule("img_score");
         this.txt_myScore.text = LocaleMgr.ins.getStr(50500006,[DialModel.ins.getMyScore()]);
         switchEventListeners(true);
         var _loc1_:int = DialModel.TYPE == 60800?60800025:60810008;
         this.toolTip = LocaleMgr.ins.getStr(_loc1_);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
