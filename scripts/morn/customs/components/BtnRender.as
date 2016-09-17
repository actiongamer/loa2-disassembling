package morn.customs.components
{
   import game.ui.commons.comps.btns.BtnRenderUI;
   import morn.core.events.UIEvent;
   
   public class BtnRender extends BtnRenderUI
   {
       
      
      public function BtnRender()
      {
         super();
      }
      
      public function changeView(param1:String = null, param2:String = null) : void
      {
         if(param2)
         {
            this.txt_label.text = param2;
            this.txt_label.commitMeasure();
         }
         if(param1)
         {
            this.img_icon.addEventListener("imageLoaded",onImageLoaded);
            this.img_icon.url = param1;
         }
         else
         {
            reset();
            this.img_icon.url = null;
         }
      }
      
      private function reset() : void
      {
         this.box_content.x = (this.width - this.txt_label.displayWidth) / 2;
         if(this.img_icon.bitmap)
         {
            this.txt_label.x = this.img_icon.width / 2;
         }
         else
         {
            this.txt_label.x = 0;
         }
         this.commitMeasure();
      }
      
      private function onImageLoaded(param1:UIEvent) : void
      {
         this.img_icon.removeEventListener("imageLoaded",onImageLoaded);
         reset();
      }
   }
}
