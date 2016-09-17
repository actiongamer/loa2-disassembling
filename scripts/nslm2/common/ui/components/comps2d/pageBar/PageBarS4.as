package nslm2.common.ui.components.comps2d.pageBar
{
   import game.ui.commons.comps.pageBars.PageBarS4UI;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import morn.core.components.List;
   
   public class PageBarS4 extends PageBarS4UI implements IPageBar
   {
       
      
      public var ctrl:ListPageBarCtrl;
      
      public function PageBarS4()
      {
         super();
      }
      
      public function bindList(param1:List) : IPageBar
      {
         if(ctrl)
         {
            ctrl.dispose();
         }
         ctrl = new ListPageBarCtrl(param1,null,this.btn_prev,this.btn_next,null,null);
         this.parts.push(new ListPageBarCtrl(param1,null,this.btn_prev,this.btn_next,null,null));
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
