package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.FamilyBossTimeRenderUI;
   import org.manager.DateUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FamilyBossTimeListRender extends FamilyBossTimeRenderUI
   {
       
      
      public function FamilyBossTimeListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:DateUtils = param1 as DateUtils;
         if(_loc2_)
         {
            txt_day.text = _loc2_.month + 1 + LocaleMgr.ins.getStr(999000415) + _loc2_.date + LocaleMgr.ins.getStr(999000416);
            txt_time.text = _loc2_.hours + ":00";
         }
         .super.dataSource = param1;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 2 || param1 == 3;
         img_ok.visible = param1 == 3;
         img_bg.visible = !img_selected.visible;
      }
   }
}
