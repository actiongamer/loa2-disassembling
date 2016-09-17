package away3d.tools.utils
{
   import flash.geom.Vector3D;
   import away3d.entities.Mesh;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.base.ISubGeometry;
   
   public class Bounds
   {
      
      private static var _minX:Number;
      
      private static var _minY:Number;
      
      private static var _minZ:Number;
      
      private static var _maxX:Number;
      
      private static var _maxY:Number;
      
      private static var _maxZ:Number;
      
      private static var _defaultPosition:Vector3D = new Vector3D(0,0,0);
       
      
      public function Bounds()
      {
         super();
      }
      
      public static function getMeshBounds(param1:Mesh) : void
      {
         reset();
         parseMeshBounds(param1);
      }
      
      public static function getObjectContainerBounds(param1:ObjectContainer3D) : void
      {
         reset();
         parseObjectContainerBounds(param1);
      }
      
      public static function getVerticesVectorBounds(param1:Vector.<Number>) : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:* = 0;
         reset();
         var _loc2_:uint = param1.length;
         if(_loc2_ % 3 != 0)
         {
            return;
         }
         _loc5_ = uint(0);
         while(_loc5_ < _loc2_)
         {
            _loc6_ = param1[_loc5_];
            _loc4_ = param1[_loc5_ + 1];
            _loc3_ = param1[_loc5_ + 2];
            if(_loc6_ < _minX)
            {
               _minX = _loc6_;
            }
            if(_loc6_ > _maxX)
            {
               _maxX = _loc6_;
            }
            if(_loc4_ < _minY)
            {
               _minY = _loc4_;
            }
            if(_loc4_ > _maxY)
            {
               _maxY = _loc4_;
            }
            if(_loc3_ < _minZ)
            {
               _minZ = _loc3_;
            }
            if(_loc3_ > _maxZ)
            {
               _maxZ = _loc3_;
            }
            _loc5_ = uint(_loc5_ + 3);
         }
      }
      
      public static function get minX() : Number
      {
         return _minX;
      }
      
      public static function get minY() : Number
      {
         return _minY;
      }
      
      public static function get minZ() : Number
      {
         return _minZ;
      }
      
      public static function get maxX() : Number
      {
         return _maxX;
      }
      
      public static function get maxY() : Number
      {
         return _maxY;
      }
      
      public static function get maxZ() : Number
      {
         return _maxZ;
      }
      
      public static function get width() : Number
      {
         return _maxX - _minX;
      }
      
      public static function get height() : Number
      {
         return _maxY - _minY;
      }
      
      public static function get depth() : Number
      {
         return _maxZ - _minZ;
      }
      
      private static function reset() : void
      {
         _minZ = Infinity;
         _minY = Infinity;
         _minX = Infinity;
         _maxZ = -Infinity;
         _maxY = -Infinity;
         _maxX = -Infinity;
         _defaultPosition.x = 0;
         _defaultPosition.y = 0;
         _defaultPosition.z = 0;
      }
      
      private static function parseObjectContainerBounds(param1:ObjectContainer3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(param1 is Mesh && param1.numChildren == 0)
         {
            parseMeshBounds(Mesh(param1),param1.position);
         }
         _loc3_ = uint(0);
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = param1.getChildAt(_loc3_);
            parseObjectContainerBounds(ObjectContainer3D(_loc2_));
            _loc3_++;
         }
      }
      
      private static function parseMeshBounds(param1:Mesh, param2:Vector3D = null) : void
      {
         var _loc13_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc4_:* = undefined;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc5_:* = undefined;
         var _loc6_:* = 0;
         var _loc14_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc3_:Vector3D = param2 || _defaultPosition;
         try
         {
            _loc13_ = _loc3_.x;
            _loc12_ = _loc3_.y;
            _loc11_ = _loc3_.z;
            if(_loc13_ + param1.minX < _minX)
            {
               _minX = _loc13_ + param1.minX;
            }
            if(_loc13_ + param1.maxX > _maxX)
            {
               _maxX = _loc13_ + param1.maxX;
            }
            if(_loc12_ + param1.minY < _minY)
            {
               _minY = _loc12_ + param1.minY;
            }
            if(_loc12_ + param1.maxY > _maxY)
            {
               _maxY = _loc12_ + param1.maxY;
            }
            if(_loc11_ + param1.minZ < _minZ)
            {
               _minZ = _loc11_ + param1.minZ;
            }
            if(_loc11_ + param1.maxZ > _maxZ)
            {
               _maxZ = _loc11_ + param1.maxZ;
            }
            if(param1.scaleX != 1)
            {
               _minX = _minX * param1.scaleX;
               _maxX = _maxX * param1.scaleX;
            }
            if(param1.scaleY != 1)
            {
               _minY = _minY * param1.scaleY;
               _maxY = _maxY * param1.scaleY;
            }
            if(param1.scaleZ != 1)
            {
               _minZ = _minZ * param1.scaleZ;
               _maxZ = _maxZ * param1.scaleZ;
            }
            return;
         }
         catch(e:Error)
         {
            _loc4_ = param1.geometry.subGeometries;
            _loc9_ = _loc4_.length;
            _loc8_ = uint(0);
            while(_loc8_ < _loc9_)
            {
               _loc10_ = _loc4_[_loc8_];
               _loc5_ = _loc10_.vertexData;
               _loc14_ = uint(_loc5_.length);
               _loc7_ = uint(_loc10_.vertexStride);
               _loc6_ = uint(_loc10_.vertexOffset);
               while(_loc6_ < _loc14_)
               {
                  _loc13_ = _loc5_[_loc6_] * param1.scaleX + _loc3_.x;
                  _loc12_ = _loc5_[_loc6_ + 1] * param1.scaleY + _loc3_.y;
                  _loc11_ = _loc5_[_loc6_ + 2] * param1.scaleZ + _loc3_.z;
                  if(_loc13_ < _minX)
                  {
                     _minX = _loc13_;
                  }
                  if(_loc13_ > _maxX)
                  {
                     _maxX = _loc13_;
                  }
                  if(_loc12_ < _minY)
                  {
                     _minY = _loc12_;
                  }
                  if(_loc12_ > _maxY)
                  {
                     _maxY = _loc12_;
                  }
                  if(_loc11_ < _minZ)
                  {
                     _minZ = _loc11_;
                  }
                  if(_loc11_ > _maxZ)
                  {
                     _maxZ = _loc11_;
                  }
                  _loc6_ = uint(_loc6_ + _loc7_);
               }
               _loc8_++;
            }
            return;
         }
      }
   }
}
