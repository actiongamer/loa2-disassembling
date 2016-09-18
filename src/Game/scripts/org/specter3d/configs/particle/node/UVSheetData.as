package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class UVSheetData extends BaseData
   {
       
      
      public var rows:int = 1;
      
      public var cols:int = 1;
      
      public var totalFrames:int = 99;
      
      public var usesDuration:Boolean;
      
      public var cycleDuration:Number = 1;
      
      public function UVSheetData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:UVSheetData = new UVSheetData();
         _loc1_.usesNode = usesNode;
         _loc1_.rows = rows;
         _loc1_.cols = cols;
         _loc1_.usesDuration = usesDuration;
         _loc1_.cycleDuration = cycleDuration;
         _loc1_.totalFrames = totalFrames;
         return _loc1_;
      }
   }
}
