package nslm2.modules.cultivates.skin.render
{
   import game.ui.skinModule.render.SkinBookTitleRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class SkinBookTitleRender extends SkinBookTitleRenderUI
   {
       
      
      public function SkinBookTitleRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 as int == 0)
         {
            this.img_normal.skin = "png.uiSkin.img_icon2";
            this.img_selected.skin = "png.uiSkin.img_iconselected2";
            this.addEventListener("click",clickHandler);
         }
         else
         {
            this.img_normal.skin = "png.uiSkin.img_icon";
            this.img_selected.skin = "png.uiSkin.img_iconselected";
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(51800110));
      }
   }
}
