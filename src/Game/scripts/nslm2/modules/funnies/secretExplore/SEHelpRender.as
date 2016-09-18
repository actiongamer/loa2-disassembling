package nslm2.modules.funnies.secretExplore
{
   import game.ui.shenYuans.ShenYuanHelpRenderUI;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GameFriendData;
   import morn.core.components.Image;
   
   public class SEHelpRender extends ShenYuanHelpRenderUI
   {
       
      
      public function SEHelpRender()
      {
         super();
         this.nameUseLink = true;
         btn_ok.clickHandler = okClick;
         var _loc1_:Image = new Image();
         _loc1_.skin = "png.uiSecretExplore.img_help_bg";
         this.addChildAt(_loc1_,0);
      }
      
      private function okClick() : void
      {
         if(SEModel.ins.info.helpCount <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500012)));
            return;
         }
         ObserverMgr.ins.sendNotice("OPT_SECRET_EXPLORE_CHOOSE_FRIEND",vo);
      }
      
      public function get vo() : GameFriendData
      {
         return dataSource as GameFriendData;
      }
   }
}
