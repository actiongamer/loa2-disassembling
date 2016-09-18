package org.specter3d.geom
{
   public final class LineClassification
   {
      
      public static const COLLINEAR:int = 0;
      
      public static const LINES_INTERSECT:int = 1;
      
      public static const SEGMENTS_INTERSECT:int = 2;
      
      public static const A_BISECTS_B:int = 3;
      
      public static const B_BISECTS_A:int = 4;
      
      public static const PARALELL:int = 5;
       
      
      public function LineClassification()
      {
         super();
      }
   }
}
