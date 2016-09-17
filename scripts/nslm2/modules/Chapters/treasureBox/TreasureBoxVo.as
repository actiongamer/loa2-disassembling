package nslm2.modules.Chapters.treasureBox
{
   public class TreasureBoxVo
   {
       
      
      public var itemArr:Array;
      
      public var state:int;
      
      public var optionData;
      
      public var toolTip;
      
      public var showIcon:Boolean;
      
      public function TreasureBoxVo(param1:Array, param2:int, param3:* = null, param4:Boolean = true)
      {
         super();
         itemArr = param1;
         state = param2;
         optionData = param3;
         showIcon = param4;
      }
   }
}
