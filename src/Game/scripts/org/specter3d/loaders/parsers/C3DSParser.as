package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import away3d.loaders.parsers.utils.ParserUtil;
   import away3d.core.base.Geometry;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import away3d.tools.utils.GeomUtil;
   import away3d.core.base.ISubGeometry;
   import flash.geom.Matrix3D;
   
   public class C3DSParser extends ParserBase
   {
       
      
      public var tempName:String;
      
      private var _byteData:ByteArray;
      
      private var _materials:Object;
      
      private var _unfinalized_objects:Object;
      
      private var _cur_obj_end:uint;
      
      private var _cur_obj:ObjectVO;
      
      private var _cur_mat_end:uint;
      
      private var _cur_mat:MaterialVO;
      
      private var _firstTex:TextureVO;
      
      private var _callBack:Function;
      
      public function C3DSParser(param1:Function = null)
      {
         _callBack = param1;
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_byteData)
         {
            _byteData = ParserUtil.toByteArray(_data);
            _byteData.position = 0;
            _byteData.endian = "littleEndian";
            _materials = {};
            _unfinalized_objects = {};
         }
         while(hasTime())
         {
            if(_cur_mat && _byteData.position >= _cur_mat_end)
            {
               finalizeCurrentMaterial();
            }
            else if(_cur_obj && _byteData.position >= _cur_obj_end)
            {
               _unfinalized_objects[_cur_obj.name] = _cur_obj;
               _cur_obj_end = 4294967295;
               _cur_obj = null;
            }
            if(_byteData.bytesAvailable)
            {
               _loc4_ = uint(_byteData.readUnsignedShort());
               _loc3_ = uint(_byteData.readUnsignedInt());
               _loc5_ = uint(_byteData.position + (_loc3_ - 6));
               var _loc6_:* = _loc4_;
               if(19789 !== _loc6_)
               {
                  if(15677 !== _loc6_)
                  {
                     if(45056 !== _loc6_)
                     {
                        if(16384 !== _loc6_)
                        {
                           if(16640 !== _loc6_)
                           {
                              if(16656 !== _loc6_)
                              {
                                 if(16672 !== _loc6_)
                                 {
                                    if(16704 !== _loc6_)
                                    {
                                       if(16736 !== _loc6_)
                                       {
                                          if(16720 !== _loc6_)
                                          {
                                             _byteData.position = _byteData.position + (_loc3_ - 6);
                                          }
                                          else
                                          {
                                             parseSmoothingGroups();
                                          }
                                       }
                                       else
                                       {
                                          _cur_obj.transform = readTransform();
                                       }
                                    }
                                    else
                                    {
                                       parseUVList();
                                    }
                                 }
                                 else
                                 {
                                    parseFaceList();
                                 }
                              }
                              else
                              {
                                 parseVertexList();
                              }
                           }
                           else
                           {
                              _cur_obj.type = "mesh";
                           }
                        }
                        else
                        {
                           _cur_obj_end = _loc5_;
                           _cur_obj = new ObjectVO();
                           _cur_obj.name = readNulTermString();
                           _cur_obj.materials = new Vector.<String>();
                           _cur_obj.materialFaces = {};
                        }
                        if(dependencies.length)
                        {
                           pauseAndRetrieveDependencies();
                           break;
                        }
                        continue;
                     }
                  }
                  addr96:
                  continue;
               }
               §§goto(addr96);
            }
            else
            {
               break;
            }
         }
         if(_byteData.bytesAvailable || _cur_obj || _cur_mat)
         {
            return false;
         }
         var _loc8_:int = 0;
         var _loc7_:* = _unfinalized_objects;
         for(_loc1_ in _unfinalized_objects)
         {
            _loc2_ = constructObject(_unfinalized_objects[_loc1_]);
            if(_loc2_)
            {
               finalizeAsset(_loc2_,_loc1_);
            }
         }
         tempName = null;
         _byteData = null;
         _materials = null;
         _unfinalized_objects = null;
         _cur_obj_end = 0;
         _cur_obj = null;
         _cur_mat_end = 0;
         _cur_mat = null;
         _firstTex = null;
         _callBack = null;
         return true;
      }
      
      private function constructObject(param1:ObjectVO, param2:Vector3D = null) : Geometry
      {
         var _loc13_:* = 0;
         var _loc18_:* = undefined;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc24_:* = null;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc15_:int = 0;
         var _loc21_:* = undefined;
         var _loc23_:* = undefined;
         var _loc19_:* = undefined;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc11_:* = null;
         var _loc10_:int = 0;
         var _loc12_:* = 0;
         var _loc3_:* = null;
         var _loc22_:* = null;
         var _loc9_:* = null;
         var _loc14_:* = undefined;
         var _loc4_:* = undefined;
         var _loc20_:* = null;
         if(param1.type == "mesh")
         {
            if(!param1.indices || param1.indices.length == 0)
            {
               return null;
            }
            _loc7_ = new Vector.<VertexVO>(param1.verts.length / 3,false);
            _loc5_ = new Vector.<FaceVO>(param1.indices.length / 3,true);
            prepareData(_loc7_,_loc5_,param1);
            applySmoothGroups(_loc7_,_loc5_);
            _loc8_ = new Geometry();
            if(param1.materials.length > 1)
            {
               applyMultiMaterial(_loc7_,_loc5_,param1);
               _loc15_ = param1.materials.length;
               _loc21_ = new Vector.<Vector.<Number>>(_loc15_,true);
               _loc23_ = new Vector.<Vector.<Number>>(_loc15_,true);
               _loc19_ = new Vector.<Vector.<uint>>(_loc15_,true);
               _loc13_ = uint(0);
               while(_loc13_ < _loc15_)
               {
                  _loc21_[_loc13_] = new Vector.<Number>();
                  _loc23_[_loc13_] = new Vector.<Number>();
                  _loc19_[_loc13_] = new Vector.<uint>();
                  _loc13_++;
               }
               _loc16_ = new Dictionary();
               _loc13_ = uint(0);
               while(_loc13_ < _loc7_.length)
               {
                  _loc11_ = _loc7_[_loc13_];
                  _loc10_ = _loc11_.materialId;
                  _loc21_[_loc10_].push(_loc11_.x);
                  _loc21_[_loc10_].push(_loc11_.y);
                  _loc21_[_loc10_].push(_loc11_.z);
                  _loc23_[_loc10_].push(_loc11_.u);
                  _loc23_[_loc10_].push(_loc11_.v);
                  _loc12_ = uint(_loc21_[_loc10_].length / 3 - 1);
                  _loc16_[_loc13_] = _loc12_;
                  _loc13_++;
               }
               _loc17_ = 0;
               while(_loc17_ < _loc5_.length)
               {
                  _loc5_[_loc17_].a = _loc16_[_loc5_[_loc17_].a];
                  _loc5_[_loc17_].b = _loc16_[_loc5_[_loc17_].b];
                  _loc5_[_loc17_].c = _loc16_[_loc5_[_loc17_].c];
                  _loc17_++;
               }
               _loc13_ = uint(0);
               while(_loc13_ < _loc5_.length)
               {
                  _loc3_ = _loc5_[_loc13_];
                  _loc19_[_loc3_.materialId].push(_loc3_.a);
                  _loc19_[_loc3_.materialId].push(_loc3_.b);
                  _loc19_[_loc3_.materialId].push(_loc3_.c);
                  _loc13_++;
               }
               _loc13_ = uint(0);
               while(_loc13_ < _loc15_)
               {
                  if(_loc21_[_loc13_].length != 0)
                  {
                     _loc18_ = GeomUtil.fromVectors(_loc21_[_loc13_],_loc19_[_loc13_],_loc23_[_loc13_],null,null,null,null);
                     _loc8_.subGeometries.push(_loc18_[0]);
                  }
                  _loc13_++;
               }
            }
            else
            {
               param1.verts = new Vector.<Number>(_loc7_.length * 3,true);
               _loc13_ = uint(0);
               while(_loc13_ < _loc7_.length)
               {
                  _loc22_ = _loc7_[_loc13_];
                  param1.verts[_loc13_ * 3] = _loc22_.x;
                  param1.verts[_loc13_ * 3 + 1] = _loc22_.y;
                  param1.verts[_loc13_ * 3 + 2] = _loc22_.z;
                  _loc13_++;
               }
               param1.indices = new Vector.<uint>(_loc5_.length * 3,true);
               _loc13_ = uint(0);
               while(_loc13_ < _loc5_.length)
               {
                  param1.indices[_loc13_ * 3] = _loc5_[_loc13_].a;
                  param1.indices[_loc13_ * 3 + 1] = _loc5_[_loc13_].b;
                  param1.indices[_loc13_ * 3 + 2] = _loc5_[_loc13_].c;
                  _loc13_++;
               }
               if(param1.uvs)
               {
                  param1.uvs = new Vector.<Number>(_loc7_.length * 2,true);
                  _loc13_ = uint(0);
                  while(_loc13_ < _loc7_.length)
                  {
                     _loc9_ = _loc7_[_loc13_];
                     param1.uvs[_loc13_ * 2] = _loc9_.u;
                     param1.uvs[_loc13_ * 2 + 1] = _loc9_.v;
                     _loc13_++;
                  }
               }
               _loc18_ = GeomUtil.fromVectors(param1.verts,param1.indices,param1.uvs,null,null,null,null);
               _loc13_ = uint(0);
               while(_loc13_ < _loc18_.length)
               {
                  _loc8_.subGeometries.push(_loc18_[_loc13_]);
                  _loc13_++;
               }
            }
            if(param2)
            {
               if(param1.transform)
               {
                  _loc14_ = param1.transform.concat();
                  _loc14_[12] = 0;
                  _loc14_[13] = 0;
                  _loc14_[14] = 0;
                  _loc24_ = new Matrix3D(_loc14_);
                  param2 = _loc24_.transformVector(param2);
               }
               param2.scaleBy(-1);
               _loc24_ = new Matrix3D();
               _loc24_.appendTranslation(param2.x,param2.y,param2.z);
               _loc8_.applyTransformation(_loc24_);
            }
            if(param1.transform)
            {
               _loc24_ = new Matrix3D(param1.transform);
               _loc24_.invert();
               _loc8_.applyTransformation(_loc24_);
            }
            if(_callBack != null)
            {
               _loc4_ = new Vector.<String>();
               _loc13_ = uint(0);
               while(_loc13_ < param1.materials.length)
               {
                  _loc20_ = _materials[param1.materials[_loc13_]];
                  if(_loc20_.colorMap && _loc20_.colorMap.url.length > 0)
                  {
                     _loc4_.push(_loc20_.colorMap.url.toLowerCase());
                  }
                  _loc13_++;
               }
               _callBack(_loc8_,_loc4_);
            }
         }
         return _loc8_;
      }
      
      private function prepareData(param1:Vector.<VertexVO>, param2:Vector.<FaceVO>, param3:ObjectVO) : void
      {
         var _loc11_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc10_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = param3.verts.length;
         _loc11_ = 0;
         _loc8_ = 0;
         0;
         _loc9_ = 0;
         0;
         while(_loc11_ < _loc7_)
         {
            _loc5_ = new VertexVO();
            _loc11_++;
            _loc5_.x = param3.verts[_loc11_];
            _loc11_++;
            _loc5_.y = param3.verts[_loc11_];
            _loc11_++;
            _loc5_.z = param3.verts[_loc11_];
            if(param3.uvs)
            {
               _loc8_++;
               _loc5_.u = param3.uvs[_loc8_];
               _loc8_++;
               _loc5_.v = param3.uvs[_loc8_];
            }
            _loc9_++;
            param1[_loc9_] = _loc5_;
         }
         _loc7_ = param3.indices.length;
         _loc11_ = 0;
         _loc9_ = 0;
         0;
         while(_loc11_ < _loc7_)
         {
            _loc4_ = new FaceVO();
            _loc11_++;
            _loc4_.a = param3.indices[_loc11_];
            _loc11_++;
            _loc4_.b = param3.indices[_loc11_];
            _loc11_++;
            _loc4_.c = param3.indices[_loc11_];
            _loc4_.smoothGroup = param3.smoothingGroups[_loc9_];
            _loc10_ = 0;
            while(_loc10_ < param3.materials.length)
            {
               _loc6_ = param3.materialFaces[param3.materials[_loc10_]];
               if(_loc6_.indexOf(_loc9_) >= 0)
               {
                  _loc4_.materialId = _loc10_;
               }
               _loc10_++;
            }
            _loc9_++;
            param2[_loc9_] = _loc4_;
         }
      }
      
      private function applySmoothGroups(param1:Vector.<VertexVO>, param2:Vector.<FaceVO>) : void
      {
         var _loc15_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc7_:* = null;
         var _loc18_:* = undefined;
         var _loc17_:* = 0;
         var _loc4_:* = undefined;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc8_:* = 0;
         var _loc5_:uint = param1.length;
         var _loc9_:uint = param2.length;
         var _loc10_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(_loc5_,true);
         _loc15_ = 0;
         while(_loc15_ < _loc5_)
         {
            _loc10_[_loc15_] = new Vector.<uint>();
            _loc15_++;
         }
         _loc15_ = 0;
         while(_loc15_ < _loc9_)
         {
            _loc7_ = FaceVO(param2[_loc15_]);
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc18_ = _loc10_[_loc13_ == 0?_loc7_.a:uint(_loc13_ == 1?_loc7_.b:uint(_loc7_.c))];
               _loc17_ = uint(_loc7_.smoothGroup);
               _loc14_ = _loc18_.length - 1;
               while(_loc14_ >= 0)
               {
                  if((_loc17_ & _loc18_[_loc14_]) > 0)
                  {
                     _loc17_ = uint(_loc17_ | _loc18_[_loc14_]);
                     _loc18_.splice(_loc14_,1);
                     _loc14_ = _loc18_.length - 1;
                  }
                  _loc14_--;
               }
               _loc18_.push(_loc17_);
               _loc13_++;
            }
            _loc15_++;
         }
         var _loc16_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(_loc5_,true);
         _loc15_ = 0;
         while(_loc15_ < _loc5_)
         {
            _loc12_ = _loc10_[_loc15_].length;
            if(_loc10_[_loc15_].length >= 1)
            {
               _loc4_ = new Vector.<uint>(_loc12_,true);
               _loc16_[_loc15_] = _loc4_;
               _loc4_[0] = _loc15_;
               _loc6_ = param1[_loc15_];
               _loc13_ = 1;
               while(_loc13_ < _loc12_)
               {
                  _loc3_ = new VertexVO();
                  _loc3_.x = _loc6_.x;
                  _loc3_.y = _loc6_.y;
                  _loc3_.z = _loc6_.z;
                  _loc3_.u = _loc6_.u;
                  _loc3_.v = _loc6_.v;
                  _loc4_[_loc13_] = param1.length;
                  param1.push(_loc3_);
                  _loc13_++;
               }
            }
            _loc15_++;
         }
         _loc5_ = param1.length;
         _loc15_ = 0;
         while(_loc15_ < _loc9_)
         {
            _loc7_ = FaceVO(param2[_loc15_]);
            _loc17_ = uint(_loc7_.smoothGroup);
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc14_ = _loc13_ == 0?_loc7_.a:uint(_loc13_ == 1?_loc7_.b:uint(_loc7_.c));
               _loc18_ = _loc10_[_loc14_];
               _loc12_ = _loc18_.length;
               _loc4_ = _loc16_[_loc14_];
               _loc11_ = 0;
               while(_loc11_ < _loc12_)
               {
                  if(_loc17_ == 0 && _loc18_[_loc11_] == 0 || (_loc17_ & _loc18_[_loc11_]) > 0)
                  {
                     _loc8_ = uint(_loc4_[_loc11_]);
                     if(_loc17_ == 0)
                     {
                        _loc18_.splice(_loc11_,1);
                        _loc4_.splice(_loc11_,1);
                     }
                     if(_loc13_ == 0)
                     {
                        _loc7_.a = _loc8_;
                     }
                     else if(_loc13_ == 1)
                     {
                        _loc7_.b = _loc8_;
                     }
                     else
                     {
                        _loc7_.c = _loc8_;
                     }
                     _loc11_ = _loc12_;
                  }
                  _loc11_++;
               }
               _loc13_++;
            }
            _loc15_++;
         }
      }
      
      private function applyMultiMaterial(param1:Vector.<VertexVO>, param2:Vector.<FaceVO>, param3:ObjectVO) : void
      {
         var _loc15_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc8_:* = null;
         var _loc18_:* = undefined;
         var _loc7_:* = null;
         var _loc5_:* = undefined;
         var _loc4_:* = null;
         var _loc19_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:uint = param1.length;
         var _loc10_:uint = param2.length;
         var _loc16_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(_loc6_,true);
         _loc15_ = 0;
         while(_loc15_ < _loc6_)
         {
            _loc16_[_loc15_] = new Vector.<uint>();
            _loc15_++;
         }
         _loc15_ = 0;
         while(_loc15_ < _loc10_)
         {
            _loc8_ = FaceVO(param2[_loc15_]);
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc18_ = _loc16_[_loc13_ == 0?_loc8_.a:uint(_loc13_ == 1?_loc8_.b:uint(_loc8_.c))];
               if(_loc18_.indexOf(_loc8_.materialId) == -1)
               {
                  _loc18_.push(_loc8_.materialId);
               }
               _loc13_++;
            }
            _loc15_++;
         }
         var _loc17_:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(_loc6_,true);
         _loc15_ = 0;
         while(_loc15_ < _loc6_)
         {
            _loc7_ = param1[_loc15_];
            _loc7_.materialId = _loc16_[_loc15_][0];
            _loc12_ = _loc16_[_loc15_].length;
            if(_loc16_[_loc15_].length > 1)
            {
               _loc5_ = new Vector.<uint>(_loc12_,true);
               _loc17_[_loc15_] = _loc5_;
               _loc5_[0] = _loc15_;
               _loc13_ = 1;
               while(_loc13_ < _loc12_)
               {
                  _loc4_ = new VertexVO();
                  _loc4_.x = _loc7_.x;
                  _loc4_.y = _loc7_.y;
                  _loc4_.z = _loc7_.z;
                  _loc4_.u = _loc7_.u;
                  _loc4_.v = _loc7_.v;
                  _loc4_.materialId = _loc16_[_loc15_][_loc13_];
                  _loc5_[_loc13_] = param1.length;
                  param1.push(_loc4_);
                  _loc13_++;
               }
            }
            _loc15_++;
         }
         _loc6_ = param1.length;
         _loc15_ = 0;
         while(_loc15_ < _loc10_)
         {
            _loc8_ = FaceVO(param2[_loc15_]);
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc14_ = _loc13_ == 0?_loc8_.a:uint(_loc13_ == 1?_loc8_.b:uint(_loc8_.c));
               _loc18_ = _loc16_[_loc14_];
               _loc12_ = _loc18_.length;
               _loc5_ = _loc17_[_loc14_];
               if(_loc5_)
               {
                  _loc19_ = _loc18_.indexOf(_loc8_.materialId);
                  _loc9_ = _loc5_[_loc19_];
                  if(_loc13_ == 0)
                  {
                     _loc8_.a = _loc9_;
                  }
                  else if(_loc13_ == 1)
                  {
                     _loc8_.b = _loc9_;
                  }
                  else
                  {
                     _loc8_.c = _loc9_;
                  }
               }
               _loc13_++;
            }
            _loc15_++;
         }
      }
      
      private function parseSmoothingGroups() : void
      {
         var _loc1_:uint = _cur_obj.indices.length / 3;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            _cur_obj.smoothingGroups[_loc2_] = _byteData.readUnsignedInt();
            _loc2_++;
         }
      }
      
      private function parseFaceMaterialList() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc1_:* = undefined;
         _loc3_ = readNulTermString();
         _loc2_ = uint(_byteData.readUnsignedShort());
         if(_loc2_ == 0)
         {
            return;
         }
         _loc1_ = new Vector.<uint>(_loc2_,true);
         _loc4_ = uint(0);
         while(_loc4_ < _loc1_.length)
         {
            _loc1_[_loc4_++] = _byteData.readUnsignedShort();
         }
         _cur_obj.materials.push(_loc3_);
         _cur_obj.materialFaces[_loc3_] = _loc1_;
      }
      
      private function parseFaceList() : void
      {
         var _loc6_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc1_:* = 0;
         _loc2_ = uint(_byteData.readUnsignedShort());
         _cur_obj.indices = new Vector.<uint>(_loc2_ * 3,true);
         _loc6_ = uint(0);
         _loc3_ = uint(_cur_obj.indices.length);
         while(_loc6_ < _loc3_)
         {
            _loc1_ = uint(_byteData.readUnsignedShort());
            _loc5_ = uint(_byteData.readUnsignedShort());
            _loc4_ = uint(_byteData.readUnsignedShort());
            _cur_obj.indices[_loc6_++] = _loc1_;
            _cur_obj.indices[_loc6_++] = _loc4_;
            _cur_obj.indices[_loc6_++] = _loc5_;
            _byteData.position = _byteData.position + 2;
         }
         _cur_obj.smoothingGroups = new Vector.<uint>(_loc2_,true);
      }
      
      private function readTransform() : Vector.<Number>
      {
         var _loc1_:* = undefined;
         _loc1_ = new Vector.<Number>(16,true);
         _loc1_[0] = _byteData.readFloat();
         _loc1_[2] = _byteData.readFloat();
         _loc1_[1] = _byteData.readFloat();
         _loc1_[3] = 0;
         _loc1_[8] = _byteData.readFloat();
         _loc1_[10] = _byteData.readFloat();
         _loc1_[9] = _byteData.readFloat();
         _loc1_[11] = 0;
         _loc1_[4] = _byteData.readFloat();
         _loc1_[6] = _byteData.readFloat();
         _loc1_[5] = _byteData.readFloat();
         _loc1_[7] = 0;
         _loc1_[12] = _byteData.readFloat();
         _loc1_[14] = _byteData.readFloat();
         _loc1_[13] = _byteData.readFloat();
         _loc1_[15] = 1;
         return _loc1_;
      }
      
      private function parseUVList() : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc1_:* = 0;
         _loc1_ = uint(_byteData.readUnsignedShort());
         _cur_obj.uvs = new Vector.<Number>(_loc1_ * 2,true);
         _loc3_ = uint(0);
         _loc2_ = uint(_cur_obj.uvs.length);
         while(_loc3_ < _loc2_)
         {
            _cur_obj.uvs[_loc3_++] = _byteData.readFloat();
            _cur_obj.uvs[_loc3_++] = 1 - _byteData.readFloat();
         }
      }
      
      private function parseVertexList() : void
      {
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         var _loc1_:* = 0;
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc1_ = uint(_byteData.readUnsignedShort());
         _cur_obj.verts = new Vector.<Number>(_loc1_ * 3,true);
         _loc6_ = uint(0);
         _loc2_ = uint(_cur_obj.verts.length);
         while(_loc6_ < _loc2_)
         {
            _loc5_ = _byteData.readFloat();
            _loc4_ = _byteData.readFloat();
            _loc3_ = _byteData.readFloat();
            _cur_obj.verts[_loc6_++] = _loc5_;
            _cur_obj.verts[_loc6_++] = _loc3_;
            _cur_obj.verts[_loc6_++] = _loc4_;
         }
      }
      
      private function parseMaterial() : MaterialVO
      {
         var _loc1_:* = null;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         _loc1_ = new MaterialVO();
         while(_byteData.position < _cur_mat_end)
         {
            _loc3_ = uint(_byteData.readUnsignedShort());
            _loc2_ = uint(_byteData.readUnsignedInt());
            _loc4_ = uint(_byteData.position + (_loc2_ - 6));
            var _loc5_:* = _loc3_;
            if(40960 !== _loc5_)
            {
               if(40976 !== _loc5_)
               {
                  if(40992 !== _loc5_)
                  {
                     if(41008 !== _loc5_)
                     {
                        if(41089 !== _loc5_)
                        {
                           if(41472 !== _loc5_)
                           {
                              if(41476 !== _loc5_)
                              {
                                 _byteData.position = _loc4_;
                              }
                              else
                              {
                                 _loc1_.specularMap = parseTexture(_loc4_);
                              }
                           }
                           else
                           {
                              _loc1_.colorMap = parseTexture(_loc4_);
                           }
                        }
                        else
                        {
                           _loc1_.twoSided = true;
                        }
                     }
                     else
                     {
                        _loc1_.specularColor = readColor();
                     }
                  }
                  else
                  {
                     _loc1_.diffuseColor = readColor();
                  }
               }
               else
               {
                  _loc1_.ambientColor = readColor();
               }
            }
            else
            {
               _loc1_.name = readNulTermString();
            }
         }
         return _loc1_;
      }
      
      private function finalizeCurrentMaterial() : void
      {
         _materials[_cur_mat.name] = _cur_mat;
         _cur_mat = null;
      }
      
      private function parseTexture(param1:uint) : TextureVO
      {
         var _loc2_:* = null;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = new TextureVO();
         while(_byteData.position < param1)
         {
            _loc4_ = uint(_byteData.readUnsignedShort());
            _loc3_ = uint(_byteData.readUnsignedInt());
            if(!(int(_loc4_) - 41728))
            {
               _loc2_.url = readNulTermString();
            }
            else
            {
               _byteData.position = _byteData.position + (_loc3_ - 6);
            }
         }
         if(!_firstTex)
         {
            _firstTex = _loc2_;
         }
         return _loc2_;
      }
      
      private function readNulTermString() : String
      {
         var _loc2_:* = 0;
         var _loc1_:String = new String();
         while(true)
         {
            _loc2_ = uint(_byteData.readUnsignedByte());
            if(_byteData.readUnsignedByte() <= 0)
            {
               break;
            }
            _loc1_ = _loc1_ + String.fromCharCode(_loc2_);
         }
         return _loc1_;
      }
      
      private function readColor() : uint
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc5_ = uint(_byteData.readUnsignedShort());
         _loc4_ = uint(_byteData.readUnsignedInt());
         switch(int(_loc5_) - 16)
         {
            case 0:
               _loc3_ = uint(_byteData.readFloat() * 255);
               _loc1_ = uint(_byteData.readFloat() * 255);
               _loc2_ = uint(_byteData.readFloat() * 255);
               break;
            case 1:
               _loc3_ = uint(_byteData.readUnsignedByte());
               _loc1_ = uint(_byteData.readUnsignedByte());
               _loc2_ = uint(_byteData.readUnsignedByte());
         }
         return _loc3_ << 16 | _loc1_ << 8 | _loc2_;
      }
   }
}

import away3d.textures.Texture2DBase;

class TextureVO
{
    
   
   public var url:String;
   
   public var texture:Texture2DBase;
   
   function TextureVO()
   {
      super();
   }
}

import away3d.materials.MaterialBase;

class MaterialVO
{
    
   
   public var name:String;
   
   public var ambientColor:uint;
   
   public var diffuseColor:uint;
   
   public var specularColor:uint;
   
   public var twoSided:Boolean;
   
   public var colorMap:TextureVO;
   
   public var specularMap:TextureVO;
   
   public var material:MaterialBase;
   
   function MaterialVO()
   {
      super();
   }
}

class ObjectVO
{
    
   
   public var name:String;
   
   public var type:String;
   
   public var pivotX:Number;
   
   public var pivotY:Number;
   
   public var pivotZ:Number;
   
   public var transform:Vector.<Number>;
   
   public var verts:Vector.<Number>;
   
   public var indices:Vector.<uint>;
   
   public var uvs:Vector.<Number>;
   
   public var materialFaces:Object;
   
   public var materials:Vector.<String>;
   
   public var smoothingGroups:Vector.<uint>;
   
   function ObjectVO()
   {
      super();
   }
}

import flash.geom.Vector3D;

class VertexVO
{
    
   
   public var x:Number;
   
   public var y:Number;
   
   public var z:Number;
   
   public var u:Number;
   
   public var v:Number;
   
   public var normal:Vector3D;
   
   public var tangent:Vector3D;
   
   public var materialId:uint;
   
   function VertexVO()
   {
      super();
   }
}

class FaceVO
{
    
   
   public var a:uint;
   
   public var b:uint;
   
   public var c:uint;
   
   public var smoothGroup:uint;
   
   public var materialId:uint;
   
   function FaceVO()
   {
      super();
   }
}
