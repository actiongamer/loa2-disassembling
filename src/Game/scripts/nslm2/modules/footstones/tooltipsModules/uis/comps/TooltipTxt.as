package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTxtUI;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TooltipTxt extends TooltipTxtUI
   {
       
      
      private var txt_desc1:TextField;
      
      public function TooltipTxt(param1:uint = 13341521)
      {
         super();
         this.txt_desc.color = param1;
         this.txt_desc1 = new TextField();
         this.addChild(this.txt_desc1);
         this.txt_desc.visible = false;
         this.txt_desc1.textColor = param1;
         this.txt_desc1.multiline = true;
         this.txt_desc1.width = 290;
         this.txt_desc1.autoSize = "left";
         this.txt_desc1.wordWrap = true;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.size = 12;
         _loc2_.font = "Arial";
         _loc2_.leading = 6;
         _loc2_.letterSpacing = 1;
         this.txt_desc1.defaultTextFormat = _loc2_;
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
            this.txt_desc.text = content;
            this.txt_desc1.htmlText = content;
         }
         else
         {
            this.txt_desc.text = "";
         }
         this.width = this.txt_desc.textField.textWidth + 4;
         this.height = this.txt_desc.height;
      }
      
      override public function get height() : Number
      {
         return txt_desc.textHeight;
      }
   }
}
