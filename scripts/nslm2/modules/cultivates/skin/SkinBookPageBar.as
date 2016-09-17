package nslm2.modules.cultivates.skin
{
   import game.ui.skinModule.SkinBookPageBarUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.common.ctrls.ListPageBarCtrlVertical;
   import morn.core.components.List;
   
   public class SkinBookPageBar extends SkinBookPageBarUI implements IPageBar
   {
       
      
      public var ctrl:ListPageBarCtrlVertical;
      
      public function SkinBookPageBar()
      {
         super();
      }
      
      public function bindList(param1:List) : IPageBar
      {
         if(ctrl)
         {
            ctrl.dispose();
         }
         ctrl = new ListPageBarCtrlVertical(param1,null,this.btn_up,this.btn_down,null,null);
         this.parts.push(new ListPageBarCtrlVertical(param1,null,this.btn_up,this.btn_down,null,null));
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
