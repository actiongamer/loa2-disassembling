package nslm2.modules.foundations.auctionShop.view.render
{
   import game.ui.auctionShopModule.render.SortLableUI;
   import nslm2.modules.foundations.auctionShop.vo.SortTitleVo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class SortLabelRender extends SortLableUI
   {
       
      
      private var data:SortTitleVo;
      
      public function SortLabelRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         data = param1 as SortTitleVo;
         if(data)
         {
            txt_label.text = data.label;
            if(data.isDESC)
            {
               img_arrow.rotation = 0;
            }
            else
            {
               img_arrow.repeatSkin = 180;
            }
            addEventListener("click",clickHandler);
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         data.isDESC = !data.isDESC;
         if(data.isDESC)
         {
            img_arrow.rotation = 0;
         }
         else
         {
            img_arrow.rotation = 180;
         }
         ObserverMgr.ins.sendNotice("auction_notice_sort",data);
      }
   }
}
