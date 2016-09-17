package nslm2.mgrs.skins
{
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   
   public class ColorLib
   {
      
      public static const BUTTON_NORMAL:uint = 16775367;
      
      public static const WHITE:uint = 14210735;
      
      public static const WHITE_2:uint = 14474460;
      
      public static const GREEN:uint = 458496;
      
      public static const GREEN_2:uint = 7329076;
      
      public static const BLUE:uint = 4827135;
      
      public static const PURPLE:uint = 12798193;
      
      public static const ORANGE:uint = 16542720;
      
      public static const WARN_RED:uint = 16723968;
      
      public static const RED:uint = 16723968;
      
      public static const RED2:uint = 15679552;
      
      public static const GOLD:uint = 16046112;
      
      public static const GOLD2:uint = 16769187;
      
      public static const YELLOW:uint = 16773888;
      
      public static const GOLD_BLACK:uint = 13341521;
      
      public static const GOLD_BLACK2:uint = 14328417;
      
      public static const GOLD_BLACK3:uint = 16745472;
      
      public static const GOLD_LIGHT:uint = 16769442;
      
      public static const GRAY:uint = 7566195;
      
      public static const BRICK_RED:uint = 13198693;
      
      public static const COFEEE:uint = 4003584;
      
      public static const RED_1:uint = 12594176;
      
      public static const RED_FORBIDON:uint = 16723968;
      
      public static const title:uint = 16046112;
      
      public static const CONTENT:uint = 14210735;
      
      public static const DESCRIPTION:uint = 13341521;
      
      public static const quality0:uint = 5666960;
      
      public static const quality1:uint = 14210735;
      
      public static const quality2:uint = 7329076;
      
      public static const quality3:uint = 4827135;
      
      public static const quality4:uint = 12798193;
      
      public static const quality5:uint = 16542720;
      
      public static const quality6:uint = 15679552;
      
      public static const quality7:uint = 16046112;
      
      public static const UNIT3D_OVER_PURPLE:uint = 12798193;
      
      public static const COLOR_ZHONGYAOTISHI_JUHUANG:uint = 16542720;
      
      private static const qualityArr:Array = [5666960,14210735,7329076,4827135,12798193,16542720,15679552,16046112];
       
      
      public function ColorLib()
      {
         super();
      }
      
      public static function qualityColor(param1:int) : uint
      {
         return qualityArr[param1];
      }
      
      public static function getMilitaryColor(param1:int) : uint
      {
         return qualityColor(MilitaryModel.ins.getPlayerQuality(param1));
      }
   }
}
