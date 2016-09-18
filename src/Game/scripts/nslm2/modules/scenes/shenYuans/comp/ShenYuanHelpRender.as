package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanHelpRenderUI;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GameFriendData;
   
   public class ShenYuanHelpRender extends ShenYuanHelpRenderUI
   {
       
      
      public function ShenYuanHelpRender()
      {
         super();
         this.nameUseLink = true;
         btn_ok.clickHandler = okClick;
      }
      
      private function okClick() : void
      {
         if(ShenYuanModel.ins.helptimes <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500012)));
            return;
         }
         ObserverMgr.ins.sendNotice("SHENYUAN_CHOOSE_ASSIT",[vo,this.img_icon]);
      }
      
      public function get vo() : GameFriendData
      {
         return dataSource as GameFriendData;
      }
   }
}
