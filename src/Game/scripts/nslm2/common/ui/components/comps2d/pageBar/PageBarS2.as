package nslm2.common.ui.components.comps2d.pageBar
{
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import morn.core.components.List;
   
   public class PageBarS2 extends PageBarS2UI implements IPageBar
   {
       
      
      public var ctrl:ListPageBarCtrl;
      
      public function PageBarS2()
      {
         super();
         btn_first.setClickDelay(0);
         btn_last.setClickDelay(0);
         btn_next.setClickDelay(0);
         btn_prev.setClickDelay(0);
      }
      
      public function bindList(param1:List) : IPageBar
      {
         if(ctrl)
         {
            ctrl.dispose();
         }
         ctrl = new ListPageBarCtrl(param1,this.txt_pageNum,this.btn_prev,this.btn_next,this.btn_first,this.btn_last);
         this.parts.push(new ListPageBarCtrl(param1,this.txt_pageNum,this.btn_prev,this.btn_next,this.btn_first,this.btn_last));
         return this;
      }
      
      public function pageTo(param1:int, param2:Boolean) : void
      {
         if(this.ctrl)
         {
            this.ctrl.pageTo(param1,param2);
         }
      }
      
      public function setGetDataHandler(param1:*) : void
      {
         if(this.ctrl)
         {
            this.ctrl.getDataHandler = param1;
         }
      }
   }
}
