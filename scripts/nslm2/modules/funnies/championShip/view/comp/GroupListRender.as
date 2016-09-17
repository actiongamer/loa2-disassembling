package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.GroupListRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class GroupListRender extends GroupListRenderUI
   {
      
      private static const IMG_TITLE_SKIN:String = "png.uiChampionship.img_title_";
       
      
      public function GroupListRender()
      {
         super();
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = param1 as int;
         var _loc3_:int = 999902561 + param1;
         l_txt.text = LocaleMgr.ins.getStr(_loc3_);
         if(_loc2_ > 4)
         {
            img_light.visible = true;
         }
         else
         {
            img_light.visible = false;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 3;
      }
   }
}
