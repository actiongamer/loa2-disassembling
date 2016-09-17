package nslm2.modules.Chapters.treasureBox
{
   public class TreasureBoxModel
   {
      
      private static var _ins:nslm2.modules.Chapters.treasureBox.TreasureBoxModel;
       
      
      public function TreasureBoxModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.Chapters.treasureBox.TreasureBoxModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.Chapters.treasureBox.TreasureBoxModel();
         }
         return _ins;
      }
      
      public function hasRewardUrl(param1:int) : String
      {
         return "png.a5.commonImgs.btn_hasReward" + param1;
      }
      
      public function openUrl(param1:int) : String
      {
         return "png.a5.commonImgs.btn_opening" + param1;
      }
      
      public function closeUrl(param1:int) : String
      {
         return "png.a5.commonImgs.btn_reward" + param1;
      }
   }
}
