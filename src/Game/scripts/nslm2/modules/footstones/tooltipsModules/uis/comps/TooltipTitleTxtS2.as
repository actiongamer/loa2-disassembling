package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleTxtS2UI;
   
   public class TooltipTitleTxtS2 extends TooltipTitleTxtS2UI
   {
       
      
      public function TooltipTitleTxtS2()
      {
         super();
      }
      
      public function get content() : String
      {
         return dataSource as String;
      }
      
      public function set content(param1:String) : void
      {
         dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(content)
         {
            this.txt_title.text = content;
         }
         else
         {
            this.txt_title.text = "";
         }
      }
   }
}
