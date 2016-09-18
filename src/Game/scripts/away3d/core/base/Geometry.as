package away3d.core.base
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   import flash.geom.Matrix3D;
   import away3d.events.GeometryEvent;
   import §away3d:arcane§.invalidateBounds;
   
   public class Geometry extends NamedAssetBase implements IAsset
   {
      
      private static var geoCount:int = 0;
       
      
      private var _subGeometries:Vector.<away3d.core.base.ISubGeometry>;
      
      public function Geometry()
      {
         super();
         _subGeometries = new Vector.<away3d.core.base.ISubGeometry>();
      }
      
      public function get assetType() : String
      {
         return "geometry";
      }
      
      public function get subGeometries() : Vector.<away3d.core.base.ISubGeometry>
      {
         return _subGeometries;
      }
      
      public function applyTransformation(param1:Matrix3D) : void
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _subGeometries.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _subGeometries[_loc3_].applyTransformation(param1);
            _loc3_++;
         }
      }
      
      public function addSubGeometry(param1:away3d.core.base.ISubGeometry) : void
      {
         if(!param1)
         {
            return;
         }
         _subGeometries.push(param1);
         param1.parentGeometry = this;
         if(hasEventListener("SubGeometryAdded"))
         {
            dispatchEvent(new GeometryEvent("SubGeometryAdded",param1));
         }
         invalidateBounds(param1);
      }
      
      public function removeSubGeometry(param1:away3d.core.base.ISubGeometry) : void
      {
         _subGeometries.splice(_subGeometries.indexOf(param1),1);
         param1.parentGeometry = null;
         if(hasEventListener("SubGeometryRemoved"))
         {
            dispatchEvent(new GeometryEvent("SubGeometryRemoved",param1));
         }
         invalidateBounds(param1);
      }
      
      public function clone() : Geometry
      {
         var _loc3_:int = 0;
         var _loc1_:Geometry = new Geometry();
         var _loc2_:uint = _subGeometries.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.addSubGeometry(_subGeometries[_loc3_].clone());
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function scale(param1:Number) : void
      {
         var _loc3_:* = 0;
         var _loc2_:uint = _subGeometries.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _subGeometries[_loc3_].scale(param1);
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:* = 0;
         var _loc1_:* = null;
         var _loc2_:uint = _subGeometries.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _subGeometries[0];
            removeSubGeometry(_loc1_);
            _loc1_.dispose();
            _loc3_++;
         }
      }
      
      public function scaleUV(param1:Number = 1, param2:Number = 1) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = _subGeometries.length;
         _loc4_ = uint(0);
         while(_loc4_ < _loc3_)
         {
            _subGeometries[_loc4_].scaleUV(param1,param2);
            _loc4_++;
         }
      }
      
      public function convertToSeparateBuffers() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:int = _subGeometries.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = _subGeometries[_loc3_];
            if(!(_loc2_ is SubGeometry))
            {
               removeSubGeometry(_loc2_);
               addSubGeometry(_loc2_.cloneWithSeperateBuffers());
               _loc2_.dispose();
            }
            _loc3_++;
         }
      }
      
      function validate() : void
      {
      }
      
      function invalidateBounds(param1:away3d.core.base.ISubGeometry) : void
      {
         if(hasEventListener("BoundsInvalid"))
         {
            dispatchEvent(new GeometryEvent("BoundsInvalid",param1));
         }
      }
   }
}
