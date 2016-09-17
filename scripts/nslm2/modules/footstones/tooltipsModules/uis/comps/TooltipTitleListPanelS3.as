package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS3UI;
   
   public class TooltipTitleListPanelS3 extends TooltipTitleListPanelS3UI
   {
       
      
      public function TooltipTitleListPanelS3(param1:String, param2:uint, param3:Array, param4:Class = null, param5:int = 7)
      {
         super();
         this.txt_title.color = param2;
         this.txt_title.text = param1;
         if(param4)
         {
            this.list_prop.itemRender = param4;
         }
         this.list_prop.repeatY = param3.length;
         this.list_prop.spaceY = param5;
         this.list_prop.array = param3;
         this.height = this.list_prop.y + this.list_prop.height;
         this.x = 15;
      }
      
      public function loopItemRender(param1:int = 0) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < list_prop.length)
         {
            _loc2_ = list_prop.getCell(_loc3_) as TooltipTxt;
            _loc2_.txt_desc.leading = param1;
            _loc3_++;
         }
      }
   }
}
