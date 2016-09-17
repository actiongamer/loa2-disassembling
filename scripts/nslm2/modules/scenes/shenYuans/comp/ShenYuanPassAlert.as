package nslm2.modules.scenes.shenYuans.comp
{
   import morn.customs.components.AlertContent;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import com.greensock.TweenLite;
   
   public class ShenYuanPassAlert extends AlertContent
   {
       
      
      public function ShenYuanPassAlert()
      {
         super();
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500124);
         this.alert.txt_content.align = "left";
         this.alert.txt_content.text = LocaleMgr.ins.getStr(41500125,[ShenYuanModel.ins.canReachLayer]);
         this.alert.txt_content.visible = true;
         this.alert.cb_noShow.label = " " + LocaleMgr.ins.getStr(41500126);
         this.alert.cb_noShow.x = 37;
         TweenLite.delayedCall(0,showCB);
      }
      
      private function showCB() : void
      {
         this.alert.cb_noShow.visible = true;
      }
      
      public function get cb_selected() : Boolean
      {
         return this.alert.cb_noShow.selected;
      }
   }
}
