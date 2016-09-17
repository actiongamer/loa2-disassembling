package nslm2.types
{
   public class DirConsts
   {
      
      public static const CENTER:int = 0;
      
      public static const R:int = 1;
      
      public static const RB:int = 2;
      
      public static const B:int = 3;
      
      public static const LB:int = 4;
      
      public static const L:int = 5;
      
      public static const LT:int = 6;
      
      public static const T:int = 7;
      
      public static const RT:int = 8;
      
      public static const RIGHT:int = 1;
      
      public static const DOWN:int = 3;
      
      public static const LEFT:int = 5;
      
      public static const UP:int = 7;
      
      private static var roArr:Array;
       
      
      public function DirConsts()
      {
         super();
      }
      
      public static function countRo(param1:int) : int
      {
         if(roArr == null)
         {
            roArr = [];
            roArr[0] = 0;
            roArr[1] = 0;
            roArr[2] = 45;
            roArr[3] = 90;
            roArr[4] = 135;
            roArr[5] = 180;
            roArr[6] = 225;
            roArr[7] = 270;
            roArr[8] = 315;
         }
         return roArr[param1];
      }
   }
}
