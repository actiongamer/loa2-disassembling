package nslm2.modules.funnies.qihoo
{
   import game.ui.qihooModule.QihooModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS3;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class QihooModule extends QihooModuleUI
   {
       
      
      public function QihooModule()
      {
         super();
      }
      
      public function get pageBar() : PageBarS3
      {
         return this.pageBarUi as PageBarS3;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.txt_toWeb.text = LinkUtils.href("http://192.168.240.111:8007/","360安全卫士官网");
         this.img_backpanel.skin = UrlLib.getQihooImg("img_backpanel");
         this.img_title.skin = UrlLib.getQihooImg("img_title");
         this.list_gifts.dataSource = QihooService.ins.giftLv;
         this.pageBar.bindList(this.list_gifts);
         super.preShow(param1);
      }
   }
}
