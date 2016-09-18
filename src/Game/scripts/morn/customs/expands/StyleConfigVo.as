package morn.customs.expands
{
   public class StyleConfigVo
   {
       
      
      public var mornCompName:String;
      
      public var skin:String;
      
      public var filters:Array;
      
      public var font;
      
      public var size;
      
      public var color;
      
      public var bold;
      
      public var labelFilterKind;
      
      public var useTextMask:Boolean = false;
      
      public var stateNum:int;
      
      public var sizeGrid:String;
      
      public var space:int;
      
      public var margin:String;
      
      public var itemColors:String;
      
      public var selectedSkin:morn.customs.expands.SkinConfigVo;
      
      public function StyleConfigVo(param1:String = "Component")
      {
         super();
         this.mornCompName = param1;
      }
      
      public function init(param1:*, param2:*) : StyleConfigVo
      {
         this.size = param1;
         this.color = param2;
         return this;
      }
      
      public function setFont(param1:*) : StyleConfigVo
      {
         this.font = param1;
         return this;
      }
      
      public function setBold(param1:*) : StyleConfigVo
      {
         this.bold = param1;
         return this;
      }
      
      public function setLabelFilterKind(param1:*) : StyleConfigVo
      {
         this.labelFilterKind = param1;
         return this;
      }
      
      public function setSkin(param1:String) : StyleConfigVo
      {
         this.skin = param1;
         return this;
      }
      
      public function setStateNum(param1:int) : StyleConfigVo
      {
         this.stateNum = param1;
         return this;
      }
      
      public function setMargin(param1:String) : StyleConfigVo
      {
         this.margin = param1;
         return this;
      }
      
      public function setSpace(param1:int) : StyleConfigVo
      {
         this.space = param1;
         return this;
      }
      
      public function setSizeGrid(param1:String) : StyleConfigVo
      {
         this.sizeGrid = param1;
         return this;
      }
      
      public function setItemColors(param1:String) : StyleConfigVo
      {
         this.itemColors = param1;
         return this;
      }
      
      public function set_selectedSkin(param1:morn.customs.expands.SkinConfigVo) : StyleConfigVo
      {
         this.selectedSkin = param1;
         return this;
      }
   }
}
