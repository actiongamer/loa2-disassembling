package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.ActivityDoubleTipUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ActivityDoubleTip extends ActivityDoubleTipUI
   {
       
      
      public function ActivityDoubleTip(param1:String = null, param2:String = null)
      {
         super();
         if(param1 == null)
         {
            param1 = LocaleMgr.ins.getStr(999000394);
         }
         this.mouseEvent = false;
      }
   }
}
