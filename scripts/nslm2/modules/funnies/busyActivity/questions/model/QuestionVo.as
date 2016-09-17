package nslm2.modules.funnies.busyActivity.questions.model
{
   import nslm2.common.model.PlayerModel;
   
   public class QuestionVo
   {
      
      public static const SINGLE:int = 1;
      
      public static const MUTIL:int = 2;
      
      public static const TEXT:int = 3;
       
      
      public var id:int;
      
      public var showId:int;
      
      public var question:String;
      
      public var type:int;
      
      public var answer:String = "";
      
      public var vip:int;
      
      public var level:int;
      
      public var answerLabels:Array;
      
      public function QuestionVo()
      {
         answerLabels = [];
         super();
      }
      
      public function getIsSelected(param1:int) : Boolean
      {
         if(answer == "")
         {
            return false;
         }
         return answer.charAt(param1) == "1";
      }
      
      public function isSingleSel() : Boolean
      {
         return type == 1;
      }
      
      public function isMutilSel() : Boolean
      {
         return type == 2;
      }
      
      public function isText() : Boolean
      {
         return type == 3;
      }
      
      public function isShow() : Boolean
      {
         return level <= PlayerModel.ins.level && vip <= PlayerModel.ins.vip;
      }
      
      public function getAnswerLabel(param1:int) : String
      {
         return answerLabels[param1];
      }
      
      public function hasSelected() : Boolean
      {
         if(type != 3)
         {
            return answer != "" && answer != "0000";
         }
         return true;
      }
   }
}
