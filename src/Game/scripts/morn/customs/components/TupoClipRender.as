package morn.customs.components
{
   import game.ui.commons.icons.TupoClipRenderUI;
   
   public class TupoClipRender extends TupoClipRenderUI
   {
       
      
      public function TupoClipRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.clipList.value = param1 as int;
      }
   }
}
