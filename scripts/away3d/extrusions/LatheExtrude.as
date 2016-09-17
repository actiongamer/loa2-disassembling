package away3d.extrusions
{
   import away3d.entities.Mesh;
   import flash.geom.Vector3D;
   import away3d.materials.utils.MultipleMaterials;
   import away3d.core.base.data.UV;
   import away3d.core.base.SubGeometry;
   import away3d.tools.helpers.MeshHelper;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.core.base.Geometry;
   import away3d.core.base.SubMesh;
   import flash.geom.Point;
   import away3d.materials.MaterialBase;
   
   public class LatheExtrude extends Mesh
   {
      
      public static const X_AXIS:String = "x";
      
      public static const Y_AXIS:String = "y";
      
      public static const Z_AXIS:String = "z";
       
      
      private const EPS:Number = 1.0E-4;
      
      private const LIMIT:uint = 196605;
      
      private const MAXRAD:Number = 1.2;
      
      private var _profile:Vector.<Vector3D>;
      
      private var _lastProfile:Vector.<Vector3D>;
      
      private var _keepLastProfile:Boolean;
      
      private var _axis:String;
      
      private var _revolutions:Number;
      
      private var _subdivision:uint;
      
      private var _offsetRadius:Number;
      
      private var _materials:MultipleMaterials;
      
      private var _coverAll:Boolean;
      
      private var _flip:Boolean;
      
      private var _centerMesh:Boolean;
      
      private var _thickness:Number;
      
      private var _preciseThickness:Boolean;
      
      private var _ignoreSides:String;
      
      private var _smoothSurface:Boolean;
      
      private var _tweek:Object;
      
      private var _varr:Vector.<Vector3D>;
      
      private var _varr2:Vector.<Vector3D>;
      
      private var _uvarr:Vector.<UV>;
      
      private var _startRotationOffset:Number = 0;
      
      private var _geomDirty:Boolean = true;
      
      private var _subGeometry:SubGeometry;
      
      private var _MaterialsSubGeometries:Vector.<SubGeometryList>;
      
      private var _maxIndProfile:uint;
      
      private var _uva:UV;
      
      private var _uvb:UV;
      
      private var _uvc:UV;
      
      private var _uvd:UV;
      
      private var _va:Vector3D;
      
      private var _vb:Vector3D;
      
      private var _vc:Vector3D;
      
      private var _vd:Vector3D;
      
      private var _uvs:Vector.<Number>;
      
      private var _vertices:Vector.<Number>;
      
      private var _indices:Vector.<uint>;
      
      private var _normals:Vector.<Number>;
      
      private var _normalTmp:Vector3D;
      
      private var _normal0:Vector3D;
      
      private var _normal1:Vector3D;
      
      private var _normal2:Vector3D;
      
      public function LatheExtrude(param1:MaterialBase = null, param2:Vector.<Vector3D> = null, param3:String = "y", param4:Number = 1, param5:uint = 10, param6:Boolean = true, param7:Boolean = false, param8:Boolean = false, param9:Number = 0, param10:Boolean = true, param11:Number = 0, param12:MultipleMaterials = null, param13:String = "", param14:Object = null, param15:Boolean = true)
      {
         _MaterialsSubGeometries = new Vector.<SubGeometryList>();
         var _loc16_:Geometry = new Geometry();
         _subGeometry = new SubGeometry();
         if(!param1 && param12 && param12.front)
         {
            param1 = param12.front;
         }
         super(_loc16_,param1);
         _profile = param2;
         _axis = param3;
         _revolutions = param4;
         _subdivision = param5 < 3?3:param5;
         _offsetRadius = param11;
         _materials = param12;
         _coverAll = param6;
         _flip = param8;
         _centerMesh = param7;
         _thickness = Math.abs(param9);
         _preciseThickness = param10;
         _ignoreSides = param13;
         _tweek = param14;
         _smoothSurface = param15;
      }
      
      public function get profile() : Vector.<Vector3D>
      {
         return _profile;
      }
      
      public function set profile(param1:Vector.<Vector3D>) : void
      {
         if(param1.length > 1)
         {
            _profile = param1;
            invalidateGeometry();
            return;
         }
         throw new Error("LatheExtrude error: the profile Vector.<Vector3D> must hold a mimimun of 2 vector3D\'s");
      }
      
      public function get startRotationOffset() : Number
      {
         return _startRotationOffset;
      }
      
      public function set startRotationOffset(param1:Number) : void
      {
         _startRotationOffset = param1;
      }
      
      public function get axis() : String
      {
         return _axis;
      }
      
      public function set axis(param1:String) : void
      {
         if(_axis == param1)
         {
            return;
         }
         _axis = param1;
         invalidateGeometry();
      }
      
      public function get revolutions() : Number
      {
         return _revolutions;
      }
      
      public function set revolutions(param1:Number) : void
      {
         if(_revolutions == param1)
         {
            return;
         }
         _revolutions = _revolutions > 0.001?_revolutions:0.001;
         _revolutions = param1;
         invalidateGeometry();
      }
      
      public function get subdivision() : uint
      {
         return _subdivision;
      }
      
      public function set subdivision(param1:uint) : void
      {
         param1 = param1 < 3?3:param1;
         if(_subdivision == param1)
         {
            return;
         }
         _subdivision = param1;
         invalidateGeometry();
      }
      
      public function get offsetRadius() : Number
      {
         return _offsetRadius;
      }
      
      public function set offsetRadius(param1:Number) : void
      {
         if(_offsetRadius == param1)
         {
            return;
         }
         _offsetRadius = param1;
         invalidateGeometry();
      }
      
      public function get materials() : MultipleMaterials
      {
         return _materials;
      }
      
      public function set materials(param1:MultipleMaterials) : void
      {
         _materials = param1;
         if(_materials.front && this.material != _materials.front)
         {
            this.material = _materials.front;
         }
         invalidateGeometry();
      }
      
      public function get coverAll() : Boolean
      {
         return _coverAll;
      }
      
      public function set coverAll(param1:Boolean) : void
      {
         if(_coverAll == param1)
         {
            return;
         }
         _coverAll = param1;
         invalidateGeometry();
      }
      
      public function get flip() : Boolean
      {
         return _flip;
      }
      
      public function set flip(param1:Boolean) : void
      {
         if(_flip == param1)
         {
            return;
         }
         _flip = param1;
         invalidateGeometry();
      }
      
      public function get smoothSurface() : Boolean
      {
         return _smoothSurface;
      }
      
      public function set smoothSurface(param1:Boolean) : void
      {
         if(_smoothSurface == param1)
         {
            return;
         }
         _smoothSurface = param1;
         _geomDirty = true;
      }
      
      public function get keepLastProfile() : Boolean
      {
         return _keepLastProfile;
      }
      
      public function set keepLastProfile(param1:Boolean) : void
      {
         if(_keepLastProfile == param1)
         {
            return;
         }
         _keepLastProfile = param1;
      }
      
      public function get lastProfile() : Vector.<Vector3D>
      {
         if(keepLastProfile && !_lastProfile)
         {
            buildExtrude();
         }
         return _lastProfile;
      }
      
      public function get preciseThickness() : Boolean
      {
         return _preciseThickness;
      }
      
      public function set preciseThickness(param1:Boolean) : void
      {
         if(_preciseThickness == param1)
         {
            return;
         }
         _preciseThickness = param1;
         invalidateGeometry();
      }
      
      public function get centerMesh() : Boolean
      {
         return _centerMesh;
      }
      
      public function set centerMesh(param1:Boolean) : void
      {
         if(_centerMesh == param1)
         {
            return;
         }
         _centerMesh = param1;
         if(_centerMesh && _subGeometry.vertexData.length > 0)
         {
            MeshHelper.recenter(this);
         }
         else
         {
            invalidateGeometry();
         }
      }
      
      public function get thickness() : Number
      {
         return _thickness;
      }
      
      public function set thickness(param1:Number) : void
      {
         if(_thickness == param1)
         {
            return;
         }
         _thickness = param1 > 0?param1:Number(_thickness);
         invalidateGeometry();
      }
      
      public function get ignoreSides() : String
      {
         return _ignoreSides;
      }
      
      public function set ignoreSides(param1:String) : void
      {
         _ignoreSides = param1;
         invalidateGeometry();
      }
      
      public function get tweek() : Object
      {
         return _tweek;
      }
      
      public function set tweek(param1:Object) : void
      {
         _tweek = param1;
         invalidateGeometry();
      }
      
      override public function get bounds() : BoundingVolumeBase
      {
         if(_geomDirty)
         {
            buildExtrude();
         }
         return super.bounds;
      }
      
      override public function get geometry() : Geometry
      {
         if(_geomDirty)
         {
            buildExtrude();
         }
         return super.geometry;
      }
      
      override public function get subMeshes() : Vector.<SubMesh>
      {
         if(_geomDirty)
         {
            buildExtrude();
         }
         return super.subMeshes;
      }
      
      private function closeTopBottom(param1:int, param2:RenderSide) : void
      {
         var _loc10_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc11_:* = 0;
         var _loc9_:* = 0;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc3_:uint = _varr.length - param1;
         var _loc12_:int = 0;
         _uvb.u = _loc12_;
         _uva.u = _loc12_;
         _loc12_ = 1;
         _uvd.u = _loc12_;
         _uvc.u = _loc12_;
         _loc11_ = uint(0);
         while(_loc11_ < _loc3_)
         {
            if(_loc11_ != 0)
            {
               if(_coverAll)
               {
                  _loc5_ = _loc11_ / _loc3_;
                  _loc4_ = (_loc11_ + param1) / _loc3_;
                  _uva.v = _loc5_;
                  _uvb.v = _loc4_;
                  _uvc.v = _loc4_;
                  _uvd.v = _loc5_;
               }
               else
               {
                  _uva.v = 0;
                  _uvb.v = 1;
                  _uvc.v = 1;
                  _uvd.v = 0;
               }
               if(param2.top)
               {
                  _loc10_ = _varr[_loc11_];
                  _loc8_ = _varr[_loc11_ + param1];
                  _loc7_ = _varr2[_loc11_ + param1];
                  _loc6_ = _varr2[_loc11_];
                  if(_flip)
                  {
                     addFace(_loc8_,_loc10_,_loc7_,_uvb,_uva,_uvc,4);
                     addFace(_loc7_,_loc10_,_loc6_,_uvc,_uva,_uvd,4);
                  }
                  else
                  {
                     addFace(_loc10_,_loc8_,_loc7_,_uva,_uvb,_uvc,4);
                     addFace(_loc10_,_loc7_,_loc6_,_uva,_uvc,_uvd,4);
                  }
               }
               if(param2.bottom)
               {
                  _loc9_ = uint(_loc11_ + param1 - 1);
                  _loc10_ = _varr[_loc9_];
                  _loc8_ = _varr[_loc9_ + param1];
                  _loc7_ = _varr2[_loc9_ + param1];
                  _loc6_ = _varr2[_loc9_];
                  if(_flip)
                  {
                     addFace(_loc10_,_loc8_,_loc7_,_uva,_uvb,_uvc,5);
                     addFace(_loc10_,_loc7_,_loc6_,_uva,_uvc,_uvd,5);
                  }
                  else
                  {
                     addFace(_loc8_,_loc10_,_loc7_,_uvb,_uva,_uvc,5);
                     addFace(_loc7_,_loc10_,_loc6_,_uvc,_uva,_uvd,5);
                  }
               }
            }
            _loc11_ = uint(_loc11_ + param1);
         }
      }
      
      private function closeSides(param1:uint, param2:RenderSide) : void
      {
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc3_:uint = _varr.length - param1;
         var _loc12_:int = param1 - 1;
         var _loc13_:Number = _preciseThickness && param1 % 2 == 0?1 / _loc12_:Number(1 / param1);
         _loc7_ = uint(0);
         while(_loc7_ < _loc12_)
         {
            if(_coverAll)
            {
               _loc5_ = _loc7_ * _loc13_;
               _loc4_ = _loc5_ + _loc13_;
               _uva.v = 1 - _loc5_;
               _uvb.v = 1 - _loc4_;
               _uvc.v = 1 - _loc4_;
               _uvd.v = 1 - _loc5_;
            }
            else
            {
               _uva.v = 0;
               _uvb.v = 1;
               _uvc.v = 1;
               _uvd.v = 0;
            }
            if(param2.left)
            {
               _loc11_ = _varr[_loc7_ + 1];
               _loc10_ = _varr[_loc7_];
               _loc9_ = _varr2[_loc7_];
               _loc8_ = _varr2[_loc7_ + 1];
               var _loc14_:int = 0;
               _uvb.u = _loc14_;
               _uva.u = _loc14_;
               _loc14_ = 1;
               _uvd.u = _loc14_;
               _uvc.u = _loc14_;
               if(_flip)
               {
                  addFace(_loc10_,_loc11_,_loc9_,_uvb,_uva,_uvc,2);
                  addFace(_loc9_,_loc11_,_loc8_,_uvc,_uva,_uvd,2);
               }
               else
               {
                  addFace(_loc11_,_loc10_,_loc9_,_uva,_uvb,_uvc,2);
                  addFace(_loc11_,_loc9_,_loc8_,_uva,_uvc,_uvd,2);
               }
            }
            if(param2.right)
            {
               _loc6_ = uint(_loc3_ + _loc7_);
               _loc11_ = _varr[_loc6_ + 1];
               _loc10_ = _varr[_loc6_];
               _loc9_ = _varr2[_loc6_];
               _loc8_ = _varr2[_loc6_ + 1];
               _loc14_ = 1;
               _uvb.u = _loc14_;
               _uva.u = _loc14_;
               _loc14_ = 0;
               _uvd.u = _loc14_;
               _uvc.u = _loc14_;
               if(_flip)
               {
                  addFace(_loc11_,_loc10_,_loc9_,_uva,_uvb,_uvc,3);
                  addFace(_loc11_,_loc9_,_loc8_,_uva,_uvc,_uvd,3);
               }
               else
               {
                  addFace(_loc10_,_loc11_,_loc9_,_uvb,_uva,_uvc,3);
                  addFace(_loc9_,_loc11_,_loc8_,_uvc,_uva,_uvd,3);
               }
            }
            _loc7_++;
         }
      }
      
      private function generate(param1:Vector.<Vector3D>, param2:String, param3:Object, param4:Boolean = true, param5:uint = 0) : void
      {
         var _loc26_:* = 0;
         var _loc31_:* = undefined;
         var _loc35_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc29_:* = 0;
         var _loc18_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc14_:* = null;
         var _loc13_:* = null;
         var _loc12_:* = null;
         var _loc11_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc8_:* = 0;
         var _loc19_:* = 0;
         var _loc33_:int = 0;
         param2 = param2;
         if(!param3)
         {
            param3 = {};
         }
         if(isNaN(param3["x"]) || !param3["x"])
         {
            param3["x"] = 0;
         }
         if(isNaN(param3["y"]) || !param3["y"])
         {
            param3["y"] = 0;
         }
         if(isNaN(param3["z"]) || !param3["z"])
         {
            param3["z"] = 0;
         }
         if(isNaN(param3["radius"]) || !param3["radius"])
         {
            param3["radius"] = 0;
         }
         var _loc28_:Number = _startRotationOffset;
         var _loc36_:Number = 360 / _subdivision;
         var _loc16_:* = 0;
         var _loc17_:* = 0;
         var _loc15_:* = 0;
         var _loc20_:* = 0;
         var _loc32_:* = 0;
         var _loc6_:Array = [];
         if(!_varr)
         {
            _varr = new Vector.<Vector3D>();
         }
         _loc29_ = uint(0);
         while(_loc29_ < param1.length)
         {
            _varr.push(new Vector3D(param1[_loc29_].x,param1[_loc29_].y,param1[_loc29_].z));
            _uvarr.push(new UV(0,1 % _loc29_));
            _loc29_++;
         }
         var _loc30_:Number = -_offsetRadius;
         var _loc25_:* = 0;
         var _loc27_:Number = 360 * _revolutions;
         var _loc7_:Number = _revolutions < 1?_subdivision:_subdivision * _revolutions;
         if(_revolutions < 1)
         {
            _loc36_ = _loc36_ * _revolutions;
         }
         _loc29_ = uint(0);
         while(_loc29_ <= _loc7_)
         {
            _loc31_ = new Vector.<Vector3D>();
            _loc31_ = param1.concat();
            _loc26_ = uint(0);
            while(_loc26_ < _loc31_.length)
            {
               _loc25_ = Number((_revolutions - 1) / (_varr.length + 1));
               if(param3["x"] != 0)
               {
                  _loc16_ = Number(_loc16_ + param3["x"] * _loc25_ / _revolutions);
               }
               if(param3["y"] != 0)
               {
                  _loc17_ = Number(_loc17_ + param3["y"] * _loc25_ / _revolutions);
               }
               if(param3["z"] != 0)
               {
                  _loc15_ = Number(_loc15_ + param3["z"] * _loc25_ / _revolutions);
               }
               if(param3.radius != 0)
               {
                  _loc20_ = Number(_loc20_ + param3.radius / (_varr.length + 1));
               }
               if(param3.rotation != 0)
               {
                  _loc32_ = Number(_loc32_ + 360 / (param3.rotation * _subdivision));
               }
               if(_axis == "x")
               {
                  if(_loc29_ == 0)
                  {
                     _loc6_[_loc26_] = _loc30_ - Math.abs(_loc31_[_loc26_].z);
                  }
                  _loc31_[_loc26_].z = Math.cos(-_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  _loc31_[_loc26_].y = Math.sin(_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  if(_loc29_ == 0)
                  {
                     _varr[_loc26_].z = _varr[_loc26_].z + _loc31_[_loc26_].z;
                     _varr[_loc26_].y = _varr[_loc26_].y + _loc31_[_loc26_].y;
                  }
               }
               else if(_axis == "y")
               {
                  if(_loc29_ == 0)
                  {
                     _loc6_[_loc26_] = _loc30_ - Math.abs(_loc31_[_loc26_].x);
                  }
                  _loc31_[_loc26_].x = Math.cos(-_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  _loc31_[_loc26_].z = Math.sin(_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  if(_loc29_ == 0)
                  {
                     _varr[_loc26_].x = _loc31_[_loc26_].x;
                     _varr[_loc26_].z = _loc31_[_loc26_].z;
                  }
               }
               else
               {
                  if(_loc29_ == 0)
                  {
                     _loc6_[_loc26_] = _loc30_ - Math.abs(_loc31_[_loc26_].y);
                  }
                  _loc31_[_loc26_].x = Math.cos(-_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  _loc31_[_loc26_].y = Math.sin(_loc28_ / 180 * 3.14159265358979) * (_loc6_[_loc26_] + _loc20_);
                  if(_loc29_ == 0)
                  {
                     _varr[_loc26_].x = _loc31_[_loc26_].x;
                     _varr[_loc26_].y = _loc31_[_loc26_].y;
                  }
               }
               _loc31_[_loc26_].x = _loc31_[_loc26_].x + _loc16_;
               _loc31_[_loc26_].y = _loc31_[_loc26_].y + _loc17_;
               _loc31_[_loc26_].z = _loc31_[_loc26_].z + _loc15_;
               _varr.push(new Vector3D(_loc31_[_loc26_].x,_loc31_[_loc26_].y,_loc31_[_loc26_].z));
               if(_coverAll)
               {
                  _loc35_ = _loc28_ / _loc27_;
               }
               else
               {
                  _loc35_ = _loc29_ % 2 == 0?0:1;
               }
               _loc34_ = _loc26_ / (_profile.length - 1);
               _uvarr.push(new UV(_loc35_,_loc34_));
               _loc26_++;
            }
            _loc28_ = _loc28_ + _loc36_;
            _loc29_++;
         }
         if(param4)
         {
            _loc9_ = param1.length;
            _loc10_ = _varr.length - _loc9_;
            _loc33_ = _loc9_ - 1;
            _loc29_ = uint(0);
            while(_loc29_ < _loc10_)
            {
               _loc18_ = 0;
               _loc26_ = uint(0);
               while(_loc26_ < _loc33_)
               {
                  if(_loc29_ > 0)
                  {
                     _loc8_ = uint(_loc29_ + _loc18_);
                     _loc19_ = _loc8_;
                     _loc21_ = _uvarr[_loc8_ + 1];
                     _loc22_ = _uvarr[_loc8_];
                     _loc23_ = _uvarr[_loc8_ + _loc9_];
                     _loc24_ = _uvarr[_loc8_ + _loc9_ + 1];
                     if(_revolutions == 1 && _loc29_ + _loc9_ == _loc10_ && _tweek == null)
                     {
                        _loc14_ = _varr[_loc19_ + 1];
                        _loc13_ = _varr[_loc19_];
                        _loc12_ = _varr[_loc19_ + _loc9_];
                        _loc11_ = _varr[_loc19_ + _loc9_ + 1];
                     }
                     else
                     {
                        _loc14_ = _varr[_loc19_ + 1];
                        _loc13_ = _varr[_loc19_];
                        _loc12_ = _varr[_loc19_ + _loc9_];
                        _loc11_ = _varr[_loc19_ + _loc9_ + 1];
                     }
                     if(_flip)
                     {
                        if(param5 == 1)
                        {
                           _uva.u = 1 - _loc21_.u;
                           _uva.v = _loc21_.v;
                           _uvb.u = 1 - _loc22_.u;
                           _uvb.v = _loc22_.v;
                           _uvc.u = 1 - _loc23_.u;
                           _uvc.v = _loc23_.v;
                           _uvd.u = 1 - _loc24_.u;
                           _uvd.v = _loc24_.v;
                           addFace(_loc14_,_loc13_,_loc12_,_uva,_uvb,_uvc,param5);
                           addFace(_loc14_,_loc12_,_loc11_,_uva,_uvc,_uvd,param5);
                        }
                        else
                        {
                           addFace(_loc13_,_loc14_,_loc12_,_loc22_,_loc21_,_loc23_,param5);
                           addFace(_loc12_,_loc14_,_loc11_,_loc23_,_loc21_,_loc24_,param5);
                        }
                     }
                     else if(param5 == 1)
                     {
                        _uva.u = _loc21_.u;
                        _uva.v = 1 - _loc21_.v;
                        _uvb.u = _loc22_.u;
                        _uvb.v = 1 - _loc22_.v;
                        _uvc.u = _loc23_.u;
                        _uvc.v = 1 - _loc23_.v;
                        _uvd.u = _loc24_.u;
                        _uvd.v = 1 - _loc24_.v;
                        addFace(_loc13_,_loc14_,_loc12_,_uvb,_uva,_uvc,param5);
                        addFace(_loc12_,_loc14_,_loc11_,_uvc,_uva,_uvd,param5);
                     }
                     else
                     {
                        addFace(_loc14_,_loc13_,_loc12_,_loc21_,_loc22_,_loc23_,param5);
                        addFace(_loc14_,_loc12_,_loc11_,_loc21_,_loc23_,_loc24_,param5);
                     }
                  }
                  _loc18_++;
                  _loc26_++;
               }
               _loc29_ = uint(_loc29_ + _loc9_);
            }
         }
      }
      
      private function buildExtrude() : void
      {
         var _loc7_:* = 0;
         var _loc12_:* = null;
         var _loc10_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc18_:* = null;
         var _loc13_:* = null;
         var _loc2_:* = null;
         var _loc20_:* = null;
         var _loc19_:* = null;
         var _loc17_:* = undefined;
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         var _loc14_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc1_:Number = NaN;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!_profile)
         {
            throw new Error("LatheExtrude error: No profile Vector.<Vector3D> set");
         }
         _MaterialsSubGeometries = null;
         _geomDirty = false;
         initHolders();
         _maxIndProfile = _profile.length * 9;
         if(_profile.length > 1)
         {
            if(_thickness != 0)
            {
               _loc12_ = ["top","bottom","right","left","front","back"];
               _loc10_ = new RenderSide();
               _loc7_ = uint(0);
               while(_loc7_ < _loc12_.length)
               {
                  _loc10_[_loc12_[_loc7_]] = _ignoreSides.indexOf(_loc12_[_loc7_]) == -1;
                  _loc7_++;
               }
               _varr = new Vector.<Vector3D>();
               _varr2 = new Vector.<Vector3D>();
               if(_preciseThickness)
               {
                  var _loc21_:* = _axis;
                  if("x" !== _loc21_)
                  {
                     if("y" !== _loc21_)
                     {
                        if("z" === _loc21_)
                        {
                           _loc4_ = "z";
                           _loc3_ = "y";
                           _loc15_ = "x";
                        }
                     }
                     else
                     {
                        _loc4_ = "y";
                        _loc3_ = "x";
                        _loc15_ = "z";
                     }
                  }
                  else
                  {
                     _loc4_ = "x";
                     _loc3_ = "z";
                     _loc15_ = "y";
                  }
                  _loc16_ = buildThicknessPoints(_profile,thickness,_loc4_,_loc3_);
                  _loc17_ = new Vector.<Vector3D>();
                  _loc9_ = new Vector.<Vector3D>();
                  _loc7_ = uint(0);
                  while(_loc7_ < _loc16_.length)
                  {
                     _loc18_ = _loc16_[_loc7_];
                     _loc13_ = new Vector3D();
                     _loc2_ = new Vector3D();
                     if(_loc7_ == 0)
                     {
                        _loc13_[_loc4_] = _loc18_.pt2.x;
                        _loc13_[_loc3_] = _loc18_.pt2.y;
                        _loc13_[_loc15_] = _profile[0][_loc15_];
                        _loc17_.push(_loc13_);
                        _loc2_[_loc4_] = _loc18_.pt1.x;
                        _loc2_[_loc3_] = _loc18_.pt1.y;
                        _loc2_[_loc15_] = _profile[0][_loc15_];
                        _loc9_.push(_loc2_);
                        if(_loc16_.length == 1)
                        {
                           _loc20_ = new Vector3D();
                           _loc19_ = new Vector3D();
                           _loc20_[_loc4_] = _loc18_.pt4.x;
                           _loc20_[_loc3_] = _loc18_.pt4.y;
                           _loc20_[_loc15_] = _profile[0][_loc15_];
                           _loc17_.push(_loc20_);
                           _loc19_[_loc4_] = _loc18_.pt3.x;
                           _loc19_[_loc3_] = _loc18_.pt3.y;
                           _loc19_[_loc15_] = _profile[0][_loc15_];
                           _loc9_.push(_loc19_);
                        }
                     }
                     else if(_loc7_ == _loc16_.length - 1)
                     {
                        _loc13_[_loc4_] = _loc18_.pt2.x;
                        _loc13_[_loc3_] = _loc18_.pt2.y;
                        _loc13_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc17_.push(_loc13_);
                        _loc2_[_loc4_] = _loc18_.pt1.x;
                        _loc2_[_loc3_] = _loc18_.pt1.y;
                        _loc2_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc9_.push(_loc2_);
                        _loc20_ = new Vector3D();
                        _loc19_ = new Vector3D();
                        _loc20_[_loc4_] = _loc18_.pt4.x;
                        _loc20_[_loc3_] = _loc18_.pt4.y;
                        _loc20_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc17_.push(_loc20_);
                        _loc19_[_loc4_] = _loc18_.pt3.x;
                        _loc19_[_loc3_] = _loc18_.pt3.y;
                        _loc19_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc9_.push(_loc19_);
                     }
                     else
                     {
                        _loc13_[_loc4_] = _loc18_.pt2.x;
                        _loc13_[_loc3_] = _loc18_.pt2.y;
                        _loc13_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc17_.push(_loc13_);
                        _loc2_[_loc4_] = _loc18_.pt1.x;
                        _loc2_[_loc3_] = _loc18_.pt1.y;
                        _loc2_[_loc15_] = _profile[_loc7_][_loc15_];
                        _loc9_.push(_loc2_);
                     }
                     _loc7_++;
                  }
                  generate(_loc17_,_axis,_tweek,_loc10_.front,0);
                  _varr2 = _varr2.concat(_varr);
                  _varr = new Vector.<Vector3D>();
                  generate(_loc9_,_axis,_tweek,_loc10_.back,1);
               }
               else
               {
                  _loc11_ = new Vector.<Vector3D>();
                  _loc14_ = new Vector.<Vector3D>();
                  _loc8_ = _thickness * 0.5;
                  _loc7_ = uint(0);
                  while(_loc7_ < _profile.length)
                  {
                     _loc21_ = _axis;
                     if("x" !== _loc21_)
                     {
                        if("y" !== _loc21_)
                        {
                           if("z" === _loc21_)
                           {
                              _loc1_ = _profile[_loc7_].y < 0?_loc8_:Number(-_loc8_);
                              _loc11_.push(new Vector3D(_profile[_loc7_].x,_profile[_loc7_].y - _loc1_,_profile[_loc7_].z));
                              _loc14_.push(new Vector3D(_profile[_loc7_].x,_profile[_loc7_].y + _loc1_,_profile[_loc7_].z));
                           }
                        }
                        else
                        {
                           _loc1_ = _profile[_loc7_].x < 0?_loc8_:Number(-_loc8_);
                           _loc11_.push(new Vector3D(_profile[_loc7_].x - _loc1_,_profile[_loc7_].y,_profile[_loc7_].z));
                           _loc14_.push(new Vector3D(_profile[_loc7_].x + _loc1_,_profile[_loc7_].y,_profile[_loc7_].z));
                        }
                     }
                     else
                     {
                        _loc1_ = _profile[_loc7_].z < 0?_loc8_:Number(-_loc8_);
                        _loc11_.push(new Vector3D(_profile[_loc7_].x,_profile[_loc7_].y,_profile[_loc7_].z - _loc1_));
                        _loc14_.push(new Vector3D(_profile[_loc7_].x,_profile[_loc7_].y,_profile[_loc7_].z + _loc1_));
                     }
                     _loc7_++;
                  }
                  generate(_loc11_,_axis,_tweek,_loc10_.front,0);
                  _varr2 = _varr2.concat(_varr);
                  _varr = new Vector.<Vector3D>();
                  generate(_loc14_,_axis,_tweek,_loc10_.back,1);
               }
               closeTopBottom(_profile.length,_loc10_);
               if(_revolutions != 1)
               {
                  closeSides(_profile.length,_loc10_);
               }
            }
            else
            {
               generate(_profile,_axis,_tweek);
            }
            if(_vertices.length > 0)
            {
               _subGeometry.updateVertexData(_vertices);
               _subGeometry.updateIndexData(_indices);
               _subGeometry.updateUVData(_uvs);
               if(_smoothSurface)
               {
                  _subGeometry.updateVertexNormalData(_normals);
               }
               this.geometry.addSubGeometry(_subGeometry);
            }
            if(_MaterialsSubGeometries && _MaterialsSubGeometries.length > 0)
            {
               _loc7_ = uint(1);
               while(_loc7_ < 6)
               {
                  _loc5_ = _MaterialsSubGeometries[_loc7_];
                  _loc6_ = _loc5_.subGeometry;
                  if(_loc6_ && _loc5_.vertices.length > 0)
                  {
                     this.geometry.addSubGeometry(_loc6_);
                     this.subMeshes[this.subMeshes.length - 1].material = _loc5_.material;
                     _loc6_.updateVertexData(_loc5_.vertices);
                     _loc6_.updateIndexData(_loc5_.indices);
                     _loc6_.updateUVData(_loc5_.uvs);
                     if(_smoothSurface)
                     {
                        _loc6_.updateVertexNormalData(_loc5_.normals);
                     }
                  }
                  _loc7_++;
               }
            }
            if(_keepLastProfile)
            {
               _lastProfile = _varr.splice(_varr.length - _profile.length,_profile.length);
            }
            else
            {
               _lastProfile = null;
            }
            _varr2 = null;
            _varr = null;
            _uvarr = null;
            if(_centerMesh)
            {
               MeshHelper.recenter(this);
            }
            return;
         }
         throw new Error("LatheExtrude error: the profile Vector.<Vector3D> must hold a mimimun of 2 vector3D\'s");
      }
      
      private function calcNormal(param1:Vector3D, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc6_:Number = param3.x - param1.x;
         var _loc8_:Number = param3.y - param1.y;
         var _loc11_:Number = param3.z - param1.z;
         var _loc9_:Number = param2.x - param1.x;
         var _loc12_:Number = param2.y - param1.y;
         var _loc13_:Number = param2.z - param1.z;
         var _loc10_:Number = _loc11_ * _loc12_ - _loc8_ * _loc13_;
         var _loc7_:Number = _loc6_ * _loc13_ - _loc11_ * _loc9_;
         var _loc5_:Number = _loc8_ * _loc9_ - _loc6_ * _loc12_;
         var _loc4_:Number = 1 / Math.sqrt(_loc10_ * _loc10_ + _loc7_ * _loc7_ + _loc5_ * _loc5_);
         var _loc14_:* = _loc10_ * _loc4_;
         _normal2.x = _loc14_;
         _loc14_ = _loc14_;
         _normal1.x = _loc14_;
         _normal0.x = _loc14_;
         _loc14_ = _loc7_ * _loc4_;
         _normal2.y = _loc14_;
         _loc14_ = _loc14_;
         _normal1.y = _loc14_;
         _normal0.y = _loc14_;
         _loc14_ = _loc5_ * _loc4_;
         _normal2.z = _loc14_;
         _loc14_ = _loc14_;
         _normal1.z = _loc14_;
         _normal0.z = _loc14_;
      }
      
      private function addFace(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:UV, param5:UV, param6:UV, param7:uint) : void
      {
         var _loc27_:* = null;
         var _loc29_:* = undefined;
         var _loc23_:* = undefined;
         var _loc9_:* = undefined;
         var _loc26_:* = undefined;
         var _loc12_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc17_:* = 0;
         var _loc19_:* = 0;
         var _loc18_:* = 0;
         var _loc13_:* = 0;
         var _loc25_:* = 0;
         var _loc20_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc8_:* = 0;
         var _loc28_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc24_:* = 0;
         var _loc22_:* = 0;
         if(param7 > 0 && _MaterialsSubGeometries && _MaterialsSubGeometries.length > 0)
         {
            _loc27_ = _MaterialsSubGeometries[param7].subGeometry;
            _loc29_ = _MaterialsSubGeometries[param7].uvs;
            _loc9_ = _MaterialsSubGeometries[param7].vertices;
            _loc26_ = _MaterialsSubGeometries[param7].indices;
            _loc23_ = _MaterialsSubGeometries[param7].normals;
         }
         else
         {
            _loc27_ = _subGeometry;
            _loc29_ = _uvs;
            _loc9_ = _vertices;
            _loc26_ = _indices;
            _loc23_ = _normals;
         }
         if(_loc9_.length + 9 > 196605)
         {
            _loc27_.updateVertexData(_loc9_);
            _loc27_.updateIndexData(_loc26_);
            _loc27_.updateUVData(_loc29_);
            if(_smoothSurface)
            {
               _loc27_.updateVertexNormalData(_loc23_);
            }
            this.geometry.addSubGeometry(_loc27_);
            if(param7 > 0 && _MaterialsSubGeometries && _MaterialsSubGeometries[param7].subGeometry)
            {
               this.subMeshes[this.subMeshes.length - 1].material = _MaterialsSubGeometries[param7].material;
            }
            _loc27_ = new SubGeometry();
            _loc27_.autoDeriveVertexTangents = true;
            if(_MaterialsSubGeometries && _MaterialsSubGeometries.length > 0)
            {
               _MaterialsSubGeometries[param7].subGeometry = _loc27_;
               _loc29_ = new Vector.<Number>();
               _loc9_ = new Vector.<Number>();
               _loc26_ = new Vector.<uint>();
               _loc23_ = new Vector.<Number>();
               _MaterialsSubGeometries[param7].uvs = _loc29_;
               _MaterialsSubGeometries[param7].indices = _loc26_;
               if(_smoothSurface)
               {
                  _MaterialsSubGeometries[param7].normals = _loc23_;
               }
               else
               {
                  _loc27_.autoDeriveVertexNormals = true;
               }
               if(param7 == 0)
               {
                  _subGeometry = _loc27_;
                  _uvs = _loc29_;
                  _vertices = _loc9_;
                  _indices = _loc26_;
                  _normals = _loc23_;
               }
            }
            else
            {
               _subGeometry = _loc27_;
               _uvs = new Vector.<Number>();
               _vertices = new Vector.<Number>();
               _indices = new Vector.<uint>();
               _normals = new Vector.<Number>();
               _loc29_ = _uvs;
               _loc9_ = _vertices;
               _loc26_ = _indices;
               _loc23_ = _normals;
            }
         }
         if(_smoothSurface)
         {
            _loc8_ = uint(_loc26_.length);
            calcNormal(param1,param2,param3);
            if(_loc8_ > 0)
            {
               _loc21_ = _loc8_ - _maxIndProfile;
               _loc24_ = uint(_loc21_ < 0?0:Number(_loc21_));
               _loc22_ = uint(_loc8_ - 1);
               for(; _loc22_ > _loc24_; _loc22_--)
               {
                  _loc16_ = uint(_loc26_[_loc22_]);
                  _loc20_ = uint(_loc16_ * 3);
                  _loc14_ = uint(_loc20_ + 1);
                  _loc15_ = uint(_loc20_ + 2);
                  _loc13_ = uint(_loc16_ * 2);
                  _loc25_ = uint(_loc13_ + 1);
                  if(!(_loc12_ && _loc11_ && _loc10_))
                  {
                     if(!_loc12_ && _loc9_[_loc20_] == param1.x && _loc9_[_loc14_] == param1.y && _loc9_[_loc15_] == param1.z)
                     {
                        _normalTmp.x = _loc23_[_loc20_];
                        _normalTmp.y = _loc23_[_loc14_];
                        _normalTmp.z = _loc23_[_loc15_];
                        _loc28_ = Vector3D.angleBetween(_normalTmp,_normal0);
                        if(_loc28_ < 1.2)
                        {
                           _normal0.x = (_normalTmp.x + _normal0.x) * 0.5;
                           _normal0.y = (_normalTmp.y + _normal0.y) * 0.5;
                           _normal0.z = (_normalTmp.z + _normal0.z) * 0.5;
                           if(_loc29_[_loc13_] == param4.u && _loc29_[_loc25_] == param4.v)
                           {
                              _loc12_ = true;
                              _loc17_ = _loc16_;
                              continue;
                           }
                        }
                     }
                     if(!_loc11_ && _loc9_[_loc20_] == param2.x && _loc9_[_loc14_] == param2.y && _loc9_[_loc15_] == param2.z)
                     {
                        _normalTmp.x = _loc23_[_loc20_];
                        _normalTmp.y = _loc23_[_loc14_];
                        _normalTmp.z = _loc23_[_loc15_];
                        _loc28_ = Vector3D.angleBetween(_normalTmp,_normal1);
                        if(_loc28_ < 1.2)
                        {
                           _normal1.x = (_normalTmp.x + _normal1.x) * 0.5;
                           _normal1.y = (_normalTmp.y + _normal1.y) * 0.5;
                           _normal1.z = (_normalTmp.z + _normal1.z) * 0.5;
                           if(_loc29_[_loc13_] == param5.u && _loc29_[_loc25_] == param5.v)
                           {
                              _loc11_ = true;
                              _loc19_ = _loc16_;
                              continue;
                           }
                        }
                     }
                     if(!_loc10_ && _loc9_[_loc20_] == param3.x && _loc9_[_loc14_] == param3.y && _loc9_[_loc15_] == param3.z)
                     {
                        _normalTmp.x = _loc23_[_loc20_];
                        _normalTmp.y = _loc23_[_loc14_];
                        _normalTmp.z = _loc23_[_loc15_];
                        _loc28_ = Vector3D.angleBetween(_normalTmp,_normal2);
                        if(_loc28_ < 1.2)
                        {
                           _normal2.x = (_normalTmp.x + _normal2.x) * 0.5;
                           _normal2.y = (_normalTmp.y + _normal2.y) * 0.5;
                           _normal2.z = (_normalTmp.z + _normal2.z) * 0.5;
                           if(_loc29_[_loc13_] == param6.u && _loc29_[_loc25_] == param6.v)
                           {
                              _loc10_ = true;
                              _loc18_ = _loc16_;
                              continue;
                           }
                           continue;
                        }
                        continue;
                     }
                     continue;
                  }
                  break;
               }
            }
         }
         if(!_loc12_)
         {
            _loc17_ = uint(_loc9_.length / 3);
            _loc9_.push(param1.x,param1.y,param1.z);
            _loc29_.push(param4.u,param4.v);
            if(_smoothSurface)
            {
               _loc23_.push(_normal0.x,_normal0.y,_normal0.z);
            }
         }
         if(!_loc11_)
         {
            _loc19_ = uint(_loc9_.length / 3);
            _loc9_.push(param2.x,param2.y,param2.z);
            _loc29_.push(param5.u,param5.v);
            if(_smoothSurface)
            {
               _loc23_.push(_normal1.x,_normal1.y,_normal1.z);
            }
         }
         if(!_loc10_)
         {
            _loc18_ = uint(_loc9_.length / 3);
            _loc9_.push(param3.x,param3.y,param3.z);
            _loc29_.push(param6.u,param6.v);
            if(_smoothSurface)
            {
               _loc23_.push(_normal2.x,_normal2.y,_normal2.z);
            }
         }
         _loc26_.push(_loc17_,_loc19_,_loc18_);
      }
      
      private function initHolders() : void
      {
         _uvarr = new Vector.<UV>();
         _uva = new UV(0,0);
         _uvb = new UV(0,0);
         _uvc = new UV(0,0);
         _uvd = new UV(0,0);
         _va = new Vector3D(0,0,0);
         _vb = new Vector3D(0,0,0);
         _vc = new Vector3D(0,0,0);
         _vd = new Vector3D(0,0,0);
         _uvs = new Vector.<Number>();
         _vertices = new Vector.<Number>();
         _indices = new Vector.<uint>();
         _normals = new Vector.<Number>();
         if(_smoothSurface)
         {
            _normal0 = new Vector3D(0,0,0);
            _normal1 = new Vector3D(0,0,0);
            _normal2 = new Vector3D(0,0,0);
            _normalTmp = new Vector3D(0,0,0);
         }
         else
         {
            _subGeometry.autoDeriveVertexNormals = true;
         }
         _subGeometry.autoDeriveVertexTangents = true;
         if(_materials && _thickness > 0)
         {
            initSubGeometryList();
         }
      }
      
      private function buildThicknessPoints(param1:Vector.<Vector3D>, param2:Number, param3:String, param4:String) : Array
      {
         var _loc11_:int = 0;
         var _loc10_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc5_:Array = [];
         var _loc9_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < param1.length - 1)
         {
            if(param1[_loc11_][param3] == 0 && param1[_loc11_][param4] == 0)
            {
               param1[_loc11_][param3] = 0.0001;
            }
            if(param1[_loc11_ + 1][param4] != null && param1[_loc11_][param4] == param1[_loc11_ + 1][param4])
            {
               var _loc12_:* = param4;
               var _loc13_:* = param1[_loc11_ + 1][_loc12_] + 0.0001;
               param1[_loc11_ + 1][_loc12_] = _loc13_;
            }
            if(param1[_loc11_][param3] != null && param1[_loc11_][param3] == param1[_loc11_ + 1][param3])
            {
               _loc13_ = param3;
               _loc12_ = param1[_loc11_ + 1][_loc13_] + 0.0001;
               param1[_loc11_ + 1][_loc13_] = _loc12_;
            }
            _loc5_.push(defineAnchors(param1[_loc11_],param1[_loc11_ + 1],param2,param3,param4));
            _loc11_++;
         }
         var _loc8_:int = _loc5_.length;
         if(_loc8_ > 1)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc8_)
            {
               if(_loc11_ < _loc8_)
               {
                  _loc10_ = defineLines(_loc11_,_loc5_[_loc11_],_loc5_[_loc11_ + 1],_loc9_);
               }
               else
               {
                  _loc10_ = defineLines(_loc11_,_loc5_[_loc11_],_loc5_[_loc11_ - 1],_loc9_);
               }
               if(_loc10_ != null)
               {
                  _loc9_.push(_loc10_);
               }
               _loc11_++;
            }
         }
         else
         {
            _loc6_ = new FourPoints();
            _loc7_ = _loc5_[0];
            _loc6_.pt1 = _loc7_.pt1;
            _loc6_.pt2 = _loc7_.pt2;
            _loc6_.pt3 = _loc7_.pt3;
            _loc6_.pt4 = _loc7_.pt4;
            _loc9_ = [_loc6_];
         }
         return _loc9_;
      }
      
      private function defineLines(param1:int, param2:FourPoints, param3:FourPoints = null, param4:Array = null) : FourPoints
      {
         var _loc5_:* = null;
         var _loc6_:FourPoints = new FourPoints();
         if(param3 == null)
         {
            _loc5_ = param4[param1 - 1];
            _loc6_.pt1 = _loc5_.pt3;
            _loc6_.pt2 = _loc5_.pt4;
            _loc6_.pt3 = param2.pt3;
            _loc6_.pt4 = param2.pt4;
            return _loc6_;
         }
         var _loc9_:Line = buildObjectLine(param2.pt1.x,param2.pt1.y,param2.pt3.x,param2.pt3.y);
         var _loc12_:Line = buildObjectLine(param2.pt2.x,param2.pt2.y,param2.pt4.x,param2.pt4.y);
         var _loc10_:Line = buildObjectLine(param3.pt1.x,param3.pt1.y,param3.pt3.x,param3.pt3.y);
         var _loc7_:Line = buildObjectLine(param3.pt2.x,param3.pt2.y,param3.pt4.x,param3.pt4.y);
         var _loc8_:Point = lineIntersect(_loc10_,_loc9_);
         var _loc11_:Point = lineIntersect(_loc12_,_loc7_);
         if(_loc8_ != null && _loc11_ != null)
         {
            if(param1 == 0)
            {
               _loc6_.pt1 = param2.pt1;
               _loc6_.pt2 = param2.pt2;
               _loc6_.pt3 = _loc8_;
               _loc6_.pt4 = _loc11_;
               return _loc6_;
            }
            _loc5_ = param4[param1 - 1];
            _loc6_.pt1 = _loc5_.pt3;
            _loc6_.pt2 = _loc5_.pt4;
            _loc6_.pt3 = _loc8_;
            _loc6_.pt4 = _loc11_;
            return _loc6_;
         }
         return null;
      }
      
      private function defineAnchors(param1:Vector3D, param2:Vector3D, param3:Number, param4:String, param5:String) : FourPoints
      {
         var _loc9_:Number = Math.atan2(param1[param5] - param2[param5],param1[param4] - param2[param4]) * 180 / 3.14159265358979;
         _loc9_ = _loc9_ - 270;
         var _loc7_:Number = _loc9_ + 180;
         var _loc6_:FourPoints = new FourPoints();
         _loc6_.pt1 = new Point(param1[param4],param1[param5]);
         _loc6_.pt2 = new Point(param1[param4],param1[param5]);
         _loc6_.pt3 = new Point(param2[param4],param2[param5]);
         _loc6_.pt4 = new Point(param2[param4],param2[param5]);
         var _loc8_:Number = param3 * 0.5;
         _loc6_.pt1.x = _loc6_.pt1.x + Math.cos(-_loc9_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt1.y = _loc6_.pt1.y + Math.sin(_loc9_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt2.x = _loc6_.pt2.x + Math.cos(-_loc7_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt2.y = _loc6_.pt2.y + Math.sin(_loc7_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt3.x = _loc6_.pt3.x + Math.cos(-_loc9_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt3.y = _loc6_.pt3.y + Math.sin(_loc9_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt4.x = _loc6_.pt4.x + Math.cos(-_loc7_ / 180 * 3.14159265358979) * _loc8_;
         _loc6_.pt4.y = _loc6_.pt4.y + Math.sin(_loc7_ / 180 * 3.14159265358979) * _loc8_;
         return _loc6_;
      }
      
      private function buildObjectLine(param1:Number, param2:Number, param3:Number, param4:Number) : Line
      {
         var _loc5_:Line = new Line();
         _loc5_.ax = param1;
         _loc5_.ay = param2;
         _loc5_.bx = param3 - param1;
         _loc5_.by = param4 - param2;
         return _loc5_;
      }
      
      private function lineIntersect(param1:Line, param2:Line) : Point
      {
         param1.bx = param1.bx == 0?0.0001:Number(param1.bx);
         param2.bx = param2.bx == 0?0.0001:Number(param2.bx);
         var _loc6_:Number = param1.by / param1.bx;
         var _loc5_:Number = param1.ay - _loc6_ * param1.ax;
         var _loc8_:Number = param2.by / param2.bx;
         var _loc7_:Number = param2.ay - _loc8_ * param2.ax;
         var _loc9_:Number = _loc6_ - _loc8_ == 0?0.0001:Number(_loc6_ - _loc8_);
         var _loc3_:Number = (_loc7_ - _loc5_) / _loc9_;
         var _loc4_:Number = _loc6_ * _loc3_ + _loc5_;
         if(isFinite(_loc3_) && isFinite(_loc4_))
         {
            return new Point(_loc3_,_loc4_);
         }
         trace("infinity");
         return null;
      }
      
      private function invalidateGeometry() : void
      {
         _geomDirty = true;
         invalidateBounds();
      }
      
      private function initSubGeometryList() : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         if(!_MaterialsSubGeometries)
         {
            _MaterialsSubGeometries = new Vector.<SubGeometryList>();
         }
         _loc4_ = uint(0);
         while(_loc4_ < 6)
         {
            _loc2_ = new SubGeometryList();
            _MaterialsSubGeometries.push(_loc2_);
            _loc2_.id = _loc4_;
            if(_loc4_ == 0)
            {
               _loc2_.subGeometry = _subGeometry;
               _loc2_.uvs = _uvs;
               _loc2_.vertices = _vertices;
               _loc2_.indices = _indices;
               _loc2_.normals = _normals;
            }
            else
            {
               _loc2_.uvs = new Vector.<Number>();
               _loc2_.vertices = new Vector.<Number>();
               _loc2_.indices = new Vector.<uint>();
               _loc2_.normals = new Vector.<Number>();
            }
            _loc4_++;
         }
         _loc4_ = uint(1);
         while(_loc4_ < 6)
         {
            switch(int(_loc4_) - 1)
            {
               case 0:
                  _loc1_ = "back";
                  break;
               case 1:
                  _loc1_ = "left";
                  break;
               case 2:
                  _loc1_ = "right";
                  break;
               case 3:
                  _loc1_ = "top";
                  break;
               case 4:
                  _loc1_ = "bottom";
            }
            if(_materials[_loc1_] && _MaterialsSubGeometries[_loc4_].subGeometry == null)
            {
               _loc2_ = _MaterialsSubGeometries[_loc4_];
               _loc3_ = new SubGeometry();
               _loc2_.material = _materials[_loc1_];
               _loc2_.subGeometry = _loc3_;
               _loc3_.autoDeriveVertexNormals = true;
               _loc3_.autoDeriveVertexTangents = true;
            }
            _loc4_++;
         }
      }
   }
}

import away3d.core.base.SubGeometry;
import away3d.materials.MaterialBase;

class SubGeometryList
{
    
   
   public var id:uint;
   
   public var uvs:Vector.<Number>;
   
   public var vertices:Vector.<Number>;
   
   public var normals:Vector.<Number>;
   
   public var indices:Vector.<uint>;
   
   public var subGeometry:SubGeometry;
   
   public var material:MaterialBase;
   
   function SubGeometryList()
   {
      super();
   }
}

class RenderSide
{
    
   
   public var top:Boolean;
   
   public var bottom:Boolean;
   
   public var right:Boolean;
   
   public var left:Boolean;
   
   public var front:Boolean;
   
   public var back:Boolean;
   
   function RenderSide()
   {
      super();
   }
}

class Line
{
    
   
   public var ax:Number;
   
   public var ay:Number;
   
   public var bx:Number;
   
   public var by:Number;
   
   function Line()
   {
      super();
   }
}

import flash.geom.Point;

class FourPoints
{
    
   
   public var pt1:Point;
   
   public var pt2:Point;
   
   public var pt3:Point;
   
   public var pt4:Point;
   
   function FourPoints()
   {
      super();
   }
}
