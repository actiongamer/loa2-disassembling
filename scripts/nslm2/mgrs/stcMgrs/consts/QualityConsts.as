package nslm2.mgrs.stcMgrs.consts
{
   public class QualityConsts
   {
      
      public static const NONE:uint = 0;
      
      public static const WHITE_TYPE:uint = 1;
      
      public static const GREE_TYPE:uint = 2;
      
      public static const BLUE_TYPE:uint = 3;
      
      public static const PURPLE_TYPE:uint = 4;
      
      public static const ORANGE_TYPE:uint = 5;
      
      public static const RED_TYPE:uint = 6;
      
      public static const GOLD_YELLOW_TYPE:uint = 7;
       
      
      public function QualityConsts()
      {
         super();
      }
      
      public static function getQuColor(param1:int) : uint
      {
         switch(int(param1) - 1)
         {
            case 0:
               return 14210735;
            case 1:
               return 458496;
            case 2:
               return 4827135;
            case 3:
               return 12798193;
            case 4:
               return 16542720;
            case 5:
               return 16723968;
            case 6:
               return 16046112;
         }
      }
   }
}
