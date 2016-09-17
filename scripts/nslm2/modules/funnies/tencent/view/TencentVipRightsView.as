package nslm2.modules.funnies.tencent.view
{
   import game.ui.TencentModule.view.TencentVipRightsViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import morn.core.components.Image;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class TencentVipRightsView extends TencentVipRightsViewUI implements IViewStackPage
   {
       
      
      public function TencentVipRightsView()
      {
         super();
      }
      
      public function viewStackIn() : void
      {
         var _loc2_:int = 0;
         this.visible = true;
         this.list_img.array = [0,1,2,3,4,5];
         this.list_img.selectEnable = false;
         var _loc1_:int = 6;
         _loc2_ = 1;
         while(_loc2_ <= _loc1_)
         {
            (this["img_desc" + _loc2_] as Image).skin = UrlLib.getQQVipImg("img_desc" + _loc2_);
            (this["img_desc" + _loc2_] as Image).mouseEvent = false;
            _loc2_++;
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
   }
}
