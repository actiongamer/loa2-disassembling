package nslm2.modules.Chapters
{
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   
   public class TreasureBoxModuleVo
   {
       
      
      public var data:TreasureBoxVo;
      
      public var closeHandler;
      
      public var rewardHandler;
      
      public var parentModuleId:int;
      
      public function TreasureBoxModuleVo(param1:TreasureBoxVo, param2:* = null, param3:* = null, param4:* = 0)
      {
         super();
         data = param1;
         closeHandler = param2;
         rewardHandler = param3;
         parentModuleId = param4;
      }
   }
}
