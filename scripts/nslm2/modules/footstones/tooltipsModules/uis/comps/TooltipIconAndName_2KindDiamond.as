package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_2KindDiamondUI;
   import morn.core.events.UIEvent;
   
   public class TooltipIconAndName_2KindDiamond extends TooltipIconAndName_2KindDiamondUI
   {
       
      
      private var oriW:int;
      
      private var oriH:int;
      
      private var oriW2:int;
      
      private var oriH2:int;
      
      public function TooltipIconAndName_2KindDiamond(param1:String, param2:String, param3:String, param4:String, param5:String)
      {
         super();
         oriW = this.img_icon1.width;
         oriH = this.img_icon1.height;
         this.img_icon1.addEventListener("imageLoaded",onImgLoaded);
         this.img_icon1.autoSize = true;
         this.img_icon1.url = param1;
         oriW2 = this.img_icon2.width;
         oriH2 = this.img_icon2.height;
         this.img_icon2.addEventListener("imageLoaded",onImgLoaded2);
         this.img_icon2.url = param3;
         this.txt_name1.text = param2;
         this.txt_name2.text = param4;
         this.txt_desc.text = param5;
         this.x = 15;
         this.height = this.txt_desc.y + this.txt_desc.textHeight;
      }
      
      protected function onImgLoaded(param1:UIEvent) : void
      {
         this.img_icon1.x = this.img_icon1.x + oriW / 2 - this.img_icon1.width / 2;
         this.img_icon1.y = this.img_icon1.y + oriH / 2 - this.img_icon1.height / 2;
      }
      
      protected function onImgLoaded2(param1:UIEvent) : void
      {
         this.img_icon2.x = this.img_icon2.x + oriW2 / 2 - this.img_icon2.width / 2;
         this.img_icon2.y = this.img_icon2.y + oriH2 / 2 - this.img_icon2.height / 2;
      }
   }
}
