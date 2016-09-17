package nslm2.mgrs.uiFades
{
   public class UIFadeUtil
   {
       
      
      public function UIFadeUtil()
      {
         super();
      }
      
      public static function checkTriggerKind_fade(param1:int, param2:Boolean) : Boolean
      {
         switch(int(param1) - 1)
         {
            case 0:
               return param2 == true;
            case 1:
               return param2 == false;
            case 2:
               return true;
         }
      }
   }
}
