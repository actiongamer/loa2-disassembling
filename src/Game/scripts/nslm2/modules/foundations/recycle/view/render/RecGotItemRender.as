package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecGotItemRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class RecGotItemRender extends RecGotItemRenderUI
   {
       
      
      public function RecGotItemRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         txt_num.text = LocaleConsts.getNumberAbbr2(txt_num.text);
      }
   }
}
