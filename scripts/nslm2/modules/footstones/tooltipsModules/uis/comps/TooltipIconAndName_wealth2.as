package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_wealthUI;
   import morn.core.events.UIEvent;
   
   public class TooltipIconAndName_wealth2 extends TooltipIconAndName_wealthUI
   {
       
      
      private var oriW:int;
      
      private var oriH:int;
      
      public function TooltipIconAndName_wealth2(param1:String, param2:String, param3:String, param4:String)
      {
         super();
         oriW = this.img_icon.width;
         oriH = this.img_icon.height;
         this.img_icon.addEventListener("imageLoaded",onImgLoaded);
         this.img_icon.autoSize = true;
         this.img_icon.url = param1;
         this.txt_name.text = param2;
         this.txt_desc.text = param4;
         this.x = 15;
         this.height = this.txt_desc.y + this.txt_desc.textHeight;
      }
      
      protected function onImgLoaded(param1:UIEvent) : void
      {
         this.img_icon.x = this.img_icon.x + oriW / 2 - this.img_icon.width / 2;
         this.img_icon.y = this.img_icon.y + oriH / 2 - this.img_icon.height / 2;
      }
   }
}
