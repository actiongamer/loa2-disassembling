package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2UI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NewYear2016_GodSubPanel2 extends NewYear2016_GodSubPanel2UI implements IViewStackPage
   {
       
      
      public function NewYear2016_GodSubPanel2()
      {
         super();
         this.txt_tip1.text = LocaleMgr.ins.getStr(13310013);
         this.list_reward.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         switchEventListeners(true);
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.service.addEventListener("EVT_WELFARE_INFO_NOTIFY",onWelfareInfoNotify);
         }
         else
         {
            this.service.removeEventListener("EVT_WELFARE_INFO_NOTIFY",onWelfareInfoNotify);
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
      
      private function onWelfareInfoNotify(... rest) : void
      {
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         this.num_total.value = this.service.welfareInfoRes.total;
         this.num_total.x = this.width - this.num_total.width - 20;
         this.list_reward.array = this.service.welfareInfoRes.getRew;
      }
   }
}
