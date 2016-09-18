package away3d.loaders.parsers
{
   import away3d.loaders.parsers.utils.ParserUtil;
   import away3d.entities.Mesh;
   import away3d.core.base.data.Vertex;
   import away3d.core.base.data.UV;
   import away3d.loaders.misc.ResourceDependency;
   import away3d.library.assets.IAsset;
   import away3d.textures.Texture2DBase;
   import com.mz.core.logging.Log;
   import away3d.core.base.Geometry;
   import away3d.materials.TextureMaterial;
   import away3d.materials.utils.DefaultMaterialManager;
   import away3d.materials.MaterialBase;
   import away3d.tools.utils.GeomUtil;
   import away3d.core.base.ISubGeometry;
   import away3d.materials.methods.BasicSpecularMethod;
   import flash.net.URLRequest;
   import away3d.materials.ColorMultiPassMaterial;
   
   public class OBJParser extends ParserBase
   {
       
      
      private var _textData:String;
      
      private var _startedParsing:Boolean;
      
      private var _charIndex:uint;
      
      private var _oldIndex:uint;
      
      private var _stringLength:uint;
      
      private var _currentObject:ObjectGroup;
      
      private var _currentGroup:Group;
      
      private var _currentMaterialGroup:MaterialGroup;
      
      private var _objects:Vector.<ObjectGroup>;
      
      private var _materialIDs:Vector.<String>;
      
      private var _materialLoaded:Vector.<LoadedMaterial>;
      
      private var _materialSpecularData:Vector.<SpecularData>;
      
      private var _meshes:Vector.<Mesh>;
      
      private var _lastMtlID:String;
      
      private var _objectIndex:uint;
      
      private var _realIndices:Array;
      
      private var _vertexIndex:uint;
      
      private var _vertices:Vector.<Vertex>;
      
      private var _vertexNormals:Vector.<Vertex>;
      
      private var _uvs:Vector.<UV>;
      
      private var _scale:Number;
      
      private var _mtlLib:Boolean;
      
      private var _mtlLibLoaded:Boolean = true;
      
      private var _activeMaterialID:String = "";
      
      public function OBJParser(param1:Number = 1)
      {
         super("plainText");
         _scale = param1;
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "obj";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         var _loc4_:* = false;
         var _loc3_:* = false;
         var _loc2_:String = ParserUtil.toString(param1);
         if(_loc2_)
         {
            _loc4_ = _loc2_.indexOf("\nv ") != -1;
            _loc3_ = _loc2_.indexOf("\nf ") != -1;
         }
         return _loc4_ && _loc3_;
      }
      
      public function set scale(param1:Number) : void
      {
         _scale = param1;
      }
      
      override function resolveDependency(param1:ResourceDependency) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.id == "mtl")
         {
            _loc4_ = ParserUtil.toString(param1.data);
            parseMtl(_loc4_);
         }
         else
         {
            if(param1.assets.length != 1)
            {
               return;
            }
            _loc3_ = param1.assets[0];
            if(_loc3_.assetType == "texture")
            {
               _loc2_ = new LoadedMaterial();
               _loc2_.materialID = param1.id;
               _loc2_.texture = _loc3_ as Texture2DBase;
               _materialLoaded.push(_loc2_);
               if(_meshes.length > 0)
               {
                  applyMaterial(_loc2_);
               }
            }
         }
      }
      
      override function resolveDependencyFailure(param1:ResourceDependency) : void
      {
         var _loc2_:* = null;
         if(param1.id == "mtl")
         {
            _mtlLib = false;
            _mtlLibLoaded = false;
         }
         else
         {
            _loc2_ = new LoadedMaterial();
            _loc2_.materialID = param1.id;
            _materialLoaded.push(_loc2_);
         }
         if(_meshes.length > 0)
         {
            applyMaterial(_loc2_);
         }
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:String = String.fromCharCode(10);
         if(!_startedParsing)
         {
            _textData = getTextData();
            _textData = _textData.replace(/\\[\r\n]+\s*/gm," ");
         }
         if(_textData.indexOf(_loc2_) == -1)
         {
            _loc2_ = String.fromCharCode(13);
         }
         if(!_startedParsing)
         {
            _startedParsing = true;
            _vertices = new Vector.<Vertex>();
            _vertexNormals = new Vector.<Vertex>();
            _materialIDs = new Vector.<String>();
            _materialLoaded = new Vector.<LoadedMaterial>();
            _meshes = new Vector.<Mesh>();
            _uvs = new Vector.<UV>();
            _stringLength = _textData.length;
            _charIndex = _textData.indexOf(_loc2_,0);
            _oldIndex = 0;
            _objects = new Vector.<ObjectGroup>();
            _objectIndex = 0;
         }
         while(_charIndex < _stringLength)
         {
            _charIndex = _textData.indexOf(_loc2_,_oldIndex);
            if(_charIndex == -1)
            {
               _charIndex = _stringLength;
            }
            _loc3_ = _textData.substring(_oldIndex,_charIndex);
            _loc3_ = _loc3_.split("\r").join("");
            _loc3_ = _loc3_.replace("  "," ");
            _loc1_ = _loc3_.split(" ");
            _oldIndex = _charIndex + 1;
            parseLine(_loc1_);
            if(parsingPaused)
            {
               Log.debug(this,"解码失败");
               return false;
            }
         }
         if(_charIndex >= _stringLength)
         {
            if(_mtlLib && !_mtlLibLoaded)
            {
               Log.debug(this,"解码失败");
               return false;
            }
            translate();
            applyMaterials();
            return true;
         }
         Log.debug(this,"解码失败");
         return false;
      }
      
      private function parseLine(param1:Array) : void
      {
         var _loc2_:* = param1[0];
         if("mtllib" !== _loc2_)
         {
            if("g" !== _loc2_)
            {
               if("o" !== _loc2_)
               {
                  if("usemtl" !== _loc2_)
                  {
                     if("v" !== _loc2_)
                     {
                        if("vt" !== _loc2_)
                        {
                           if("vn" !== _loc2_)
                           {
                              if("f" === _loc2_)
                              {
                                 parseFace(param1);
                              }
                           }
                           else
                           {
                              parseVertexNormal(param1);
                           }
                        }
                        else
                        {
                           parseUV(param1);
                        }
                     }
                     else
                     {
                        parseVertex(param1);
                     }
                  }
                  else if(_mtlLib)
                  {
                     if(!param1[1])
                     {
                        param1[1] = "def000";
                     }
                     _materialIDs.push(param1[1]);
                     _activeMaterialID = param1[1];
                     if(_currentGroup)
                     {
                        _currentGroup.materialID = _activeMaterialID;
                     }
                  }
               }
               else
               {
                  createObject(param1);
               }
            }
            else
            {
               createGroup(param1);
            }
         }
         else
         {
            _mtlLib = true;
            _mtlLibLoaded = false;
            loadMtl(param1[1]);
         }
      }
      
      private function translate() : void
      {
         var _loc7_:int = 0;
         var _loc9_:* = undefined;
         var _loc4_:* = 0;
         var _loc8_:* = undefined;
         var _loc3_:* = 0;
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         var _loc5_:* = null;
         var _loc1_:* = 0;
         _loc7_ = 0;
         while(_loc7_ < _objects.length)
         {
            _loc9_ = _objects[_loc7_].groups;
            _loc4_ = uint(_loc9_.length);
            _loc1_ = uint(0);
            while(_loc1_ < _loc4_)
            {
               _loc11_ = new Geometry();
               _loc8_ = _loc9_[_loc1_].materialGroups;
               _loc3_ = uint(_loc8_.length);
               _loc6_ = uint(0);
               while(_loc6_ < _loc3_)
               {
                  translateMaterialGroup(_loc8_[_loc6_],_loc11_);
                  _loc6_++;
               }
               if(_loc11_.subGeometries.length != 0)
               {
                  finalizeAsset(_loc11_,"");
                  _loc5_ = new TextureMaterial(DefaultMaterialManager.getDefaultTexture());
                  _loc10_ = new Mesh(_loc11_,_loc5_);
                  if(_objects[_loc7_].name)
                  {
                     _loc10_.name = _objects[_loc7_].name;
                  }
                  else if(_loc9_[_loc1_].name)
                  {
                     _loc10_.name = _loc9_[_loc1_].name;
                  }
                  else
                  {
                     _loc10_.name = "";
                  }
                  _meshes.push(_loc10_);
                  if(_loc9_[_loc1_].materialID != "")
                  {
                     _loc5_.name = _loc9_[_loc1_].materialID + "~" + _loc10_.name;
                  }
                  else
                  {
                     _loc5_.name = _lastMtlID + "~" + _loc10_.name;
                  }
                  if(_loc10_.subMeshes.length > 1)
                  {
                     _loc2_ = uint(1);
                     while(_loc2_ < _loc10_.subMeshes.length)
                     {
                        _loc10_.subMeshes[_loc2_].material = _loc5_;
                        _loc2_++;
                     }
                  }
                  finalizeAsset(_loc10_);
               }
               _loc1_++;
            }
            _loc7_++;
         }
      }
      
      private function translateMaterialGroup(param1:MaterialGroup, param2:Geometry) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = 0;
         var _loc11_:* = undefined;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc6_:Vector.<FaceData> = param1.faces;
         var _loc5_:uint = _loc6_.length;
         var _loc7_:Vector.<Number> = new Vector.<Number>();
         var _loc13_:Vector.<Number> = new Vector.<Number>();
         var _loc10_:Vector.<Number> = new Vector.<Number>();
         var _loc12_:Vector.<uint> = new Vector.<uint>();
         _realIndices = [];
         _vertexIndex = 0;
         _loc9_ = uint(0);
         while(_loc9_ < _loc5_)
         {
            _loc4_ = _loc6_[_loc9_];
            _loc3_ = uint(_loc4_.indexIds.length - 1);
            _loc8_ = uint(1);
            while(_loc8_ < _loc3_)
            {
               translateVertexData(_loc4_,_loc8_,_loc7_,_loc13_,_loc12_,_loc10_);
               translateVertexData(_loc4_,0,_loc7_,_loc13_,_loc12_,_loc10_);
               translateVertexData(_loc4_,_loc8_ + 1,_loc7_,_loc13_,_loc12_,_loc10_);
               _loc8_++;
            }
            _loc9_++;
         }
         if(_loc7_.length > 0)
         {
            _loc11_ = GeomUtil.fromVectors(_loc7_,_loc12_,_loc13_,_loc10_,null,null,null);
            _loc9_ = uint(0);
            while(_loc9_ < _loc11_.length)
            {
               param2.addSubGeometry(_loc11_[_loc9_]);
               _loc9_++;
            }
         }
      }
      
      private function translateVertexData(param1:FaceData, param2:int, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<uint>, param6:Vector.<Number>) : void
      {
         var _loc8_:* = 0;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         if(!_realIndices[param1.indexIds[param2]])
         {
            _loc8_ = uint(_vertexIndex);
            _vertexIndex = _vertexIndex + 1;
            _realIndices[param1.indexIds[param2]] = _vertexIndex + 1;
            _loc10_ = _vertices[param1.vertexIndices[param2] - 1];
            param3.push(_loc10_.x * _scale,_loc10_.y * _scale,_loc10_.z * _scale);
            if(param1.normalIndices.length > 0)
            {
               _loc7_ = _vertexNormals[param1.normalIndices[param2] - 1];
               param6.push(_loc7_.x,_loc7_.y,_loc7_.z);
            }
            if(param1.uvIndices.length > 0)
            {
               try
               {
                  _loc9_ = _uvs[param1.uvIndices[param2] - 1];
                  param4.push(_loc9_.u,_loc9_.v);
               }
               catch(e:Error)
               {
                  switch(int(param2))
                  {
                     case 0:
                        param4.push(0,1);
                        break;
                     case 1:
                        param4.push(0.5,0);
                        break;
                     case 2:
                        param4.push(1,1);
                  }
               }
            }
         }
         else
         {
            _loc8_ = uint(_realIndices[param1.indexIds[param2]] - 1);
         }
         param5.push(_loc8_);
      }
      
      private function createObject(param1:Array) : void
      {
         _currentGroup = null;
         _currentMaterialGroup = null;
         _currentObject = new ObjectGroup();
         _objects.push(new ObjectGroup());
         if(param1)
         {
            _currentObject.name = param1[1];
         }
      }
      
      private function createGroup(param1:Array) : void
      {
         if(!_currentObject)
         {
            createObject(null);
         }
         _currentGroup = new Group();
         _currentGroup.materialID = _activeMaterialID;
         if(param1)
         {
            _currentGroup.name = param1[1];
         }
         _currentObject.groups.push(_currentGroup);
         createMaterialGroup(null);
      }
      
      private function createMaterialGroup(param1:Array) : void
      {
         _currentMaterialGroup = new MaterialGroup();
         if(param1)
         {
            _currentMaterialGroup.url = param1[1];
         }
         _currentGroup.materialGroups.push(_currentMaterialGroup);
      }
      
      private function parseVertex(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         var _loc4_:* = 0;
         if(param1.length > 4)
         {
            _loc3_ = [];
            _loc4_ = uint(1);
            while(_loc4_ < param1.length)
            {
               _loc2_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc2_))
               {
                  _loc3_.push(_loc2_);
               }
               _loc4_++;
            }
            _vertices.push(new Vertex(_loc3_[0],_loc3_[1],-_loc3_[2]));
         }
         else
         {
            _vertices.push(new Vertex(parseFloat(param1[1]),parseFloat(param1[2]),-parseFloat(param1[3])));
         }
      }
      
      private function parseUV(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         var _loc4_:* = 0;
         if(param1.length > 3)
         {
            _loc3_ = [];
            _loc4_ = uint(1);
            while(_loc4_ < param1.length)
            {
               _loc2_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc2_))
               {
                  _loc3_.push(_loc2_);
               }
               _loc4_++;
            }
            _uvs.push(new UV(_loc3_[0],1 - _loc3_[1]));
         }
         else
         {
            _uvs.push(new UV(parseFloat(param1[1]),1 - parseFloat(param1[2])));
         }
      }
      
      private function parseVertexNormal(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         var _loc4_:* = 0;
         if(param1.length > 4)
         {
            _loc3_ = [];
            _loc4_ = uint(1);
            while(_loc4_ < param1.length)
            {
               _loc2_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc2_))
               {
                  _loc3_.push(_loc2_);
               }
               _loc4_++;
            }
            _vertexNormals.push(new Vertex(_loc3_[0],_loc3_[1],-_loc3_[2]));
         }
         else
         {
            _vertexNormals.push(new Vertex(parseFloat(param1[1]),parseFloat(param1[2]),-parseFloat(param1[3])));
         }
      }
      
      private function parseFace(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = 0;
         var _loc4_:uint = param1.length;
         var _loc2_:FaceData = new FaceData();
         if(!_currentGroup)
         {
            createGroup(null);
         }
         _loc5_ = uint(1);
         while(_loc5_ < _loc4_)
         {
            if(param1[_loc5_] != "")
            {
               _loc3_ = param1[_loc5_].split("/");
               _loc2_.vertexIndices.push(parseIndex(parseInt(_loc3_[0]),_vertices.length));
               if(_loc3_[1] && String(_loc3_[1]).length > 0)
               {
                  _loc2_.uvIndices.push(parseIndex(parseInt(_loc3_[1]),_uvs.length));
               }
               if(_loc3_[2] && String(_loc3_[2]).length > 0)
               {
                  _loc2_.normalIndices.push(parseIndex(parseInt(_loc3_[2]),_vertexNormals.length));
               }
               _loc2_.indexIds.push(param1[_loc5_]);
            }
            _loc5_++;
         }
         _currentMaterialGroup.faces.push(_loc2_);
      }
      
      private function parseIndex(param1:int, param2:uint) : int
      {
         if(param1 < 0)
         {
            return param1 + param2 + 1;
         }
         return param1;
      }
      
      private function parseMtl(param1:String) : void
      {
         var _loc17_:* = null;
         var _loc11_:* = null;
         var _loc7_:* = 0;
         var _loc18_:* = null;
         var _loc13_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc8_:* = 0;
         var _loc5_:* = 0;
         var _loc14_:* = 0;
         var _loc10_:* = NaN;
         var _loc15_:* = NaN;
         var _loc6_:* = null;
         var _loc9_:* = 0;
         var _loc16_:* = null;
         var _loc2_:* = null;
         var _loc12_:* = null;
         var _loc4_:Array = param1.split("newmtl");
         _loc9_ = uint(0);
         while(_loc9_ < _loc4_.length)
         {
            _loc17_ = (_loc4_[_loc9_].split("\r") as Array).join("").split("\n");
            if(_loc17_.length == 1)
            {
               _loc17_ = _loc4_[_loc9_].split(String.fromCharCode(13));
            }
            _loc14_ = uint(16777215);
            _loc5_ = uint(16777215);
            _loc8_ = uint(16777215);
            _loc10_ = 0;
            _loc13_ = false;
            _loc3_ = false;
            _loc15_ = 1;
            _loc6_ = "";
            _loc7_ = uint(0);
            for(; _loc7_ < _loc17_.length; _loc7_++)
            {
               _loc17_[_loc7_] = _loc17_[_loc7_].replace(/\s+$/,"");
               if(_loc17_[_loc7_].substring(0,1) != "#" && (_loc7_ == 0 || _loc17_[_loc7_] != ""))
               {
                  _loc11_ = _loc17_[_loc7_].split(" ");
                  if(String(_loc11_[0]).charCodeAt(0) == 9 || String(_loc11_[0]).charCodeAt(0) == 32)
                  {
                     _loc11_[0] = _loc11_[0].substring(1,_loc11_[0].length);
                  }
                  if(_loc7_ == 0)
                  {
                     _lastMtlID = _loc11_.join("");
                     _lastMtlID = _lastMtlID == ""?"def000":_lastMtlID;
                  }
                  else
                  {
                     var _loc19_:* = _loc11_[0];
                     if("Ka" !== _loc19_)
                     {
                        if("Ks" !== _loc19_)
                        {
                           if("Ns" !== _loc19_)
                           {
                              if("Kd" !== _loc19_)
                              {
                                 if("tr" !== _loc19_)
                                 {
                                    if("d" !== _loc19_)
                                    {
                                       if("map_Kd" === _loc19_)
                                       {
                                          _loc6_ = parseMapKdString(_loc11_);
                                          _loc6_ = _loc6_.replace(/\\/g,"/");
                                          continue;
                                       }
                                       continue;
                                    }
                                 }
                                 if(_loc11_[1] && !isNaN(Number(_loc11_[1])))
                                 {
                                    _loc15_ = Number(_loc11_[1]);
                                 }
                              }
                              else if(_loc11_[1] && !isNaN(Number(_loc11_[1])) && _loc11_[2] && !isNaN(Number(_loc11_[2])) && _loc11_[3] && !isNaN(Number(_loc11_[3])))
                              {
                                 _loc8_ = uint(_loc11_[1] * 255 << 16 | _loc11_[2] * 255 << 8 | _loc11_[3] * 255);
                                 _loc3_ = true;
                              }
                           }
                           else
                           {
                              if(_loc11_[1] && !isNaN(Number(_loc11_[1])))
                              {
                                 _loc10_ = Number(_loc11_[1] * 0.001);
                              }
                              if(_loc10_ == 0)
                              {
                                 _loc13_ = false;
                              }
                           }
                        }
                        else if(_loc11_[1] && !isNaN(Number(_loc11_[1])) && _loc11_[2] && !isNaN(Number(_loc11_[2])) && _loc11_[3] && !isNaN(Number(_loc11_[3])))
                        {
                           _loc14_ = uint(_loc11_[1] * 255 << 16 | _loc11_[2] * 255 << 8 | _loc11_[3] * 255);
                           _loc13_ = true;
                        }
                     }
                     else if(_loc11_[1] && !isNaN(Number(_loc11_[1])) && _loc11_[2] && !isNaN(Number(_loc11_[2])) && _loc11_[3] && !isNaN(Number(_loc11_[3])))
                     {
                        _loc5_ = uint(_loc11_[1] * 255 << 16 | _loc11_[2] * 255 << 8 | _loc11_[3] * 255);
                     }
                  }
                  continue;
               }
            }
            if(_loc6_ != "")
            {
               if(_loc13_)
               {
                  _loc18_ = new BasicSpecularMethod();
                  _loc18_.specularColor = _loc14_;
                  _loc18_.specular = _loc10_;
                  _loc16_ = new SpecularData();
                  _loc16_.alpha = _loc15_;
                  _loc16_.basicSpecularMethod = _loc18_;
                  _loc16_.materialID = _lastMtlID;
                  if(!_materialSpecularData)
                  {
                     _materialSpecularData = new Vector.<SpecularData>();
                  }
                  _materialSpecularData.push(_loc16_);
               }
               addDependency(_lastMtlID,new URLRequest(_loc6_));
            }
            else if(_loc3_ && !isNaN(_loc8_))
            {
               _loc2_ = new LoadedMaterial();
               _loc2_.materialID = _lastMtlID;
               if(_loc15_ == 0)
               {
               }
               _loc12_ = new ColorMultiPassMaterial(_loc8_);
               ColorMultiPassMaterial(_loc12_).ambientColor = _loc5_;
               ColorMultiPassMaterial(_loc12_).repeat = true;
               if(_loc13_)
               {
                  ColorMultiPassMaterial(_loc12_).specularColor = _loc14_;
                  ColorMultiPassMaterial(_loc12_).specular = _loc10_;
               }
               _loc2_.cm = _loc12_;
               _materialLoaded.push(_loc2_);
               if(_meshes.length > 0)
               {
                  applyMaterial(_loc2_);
               }
            }
            _loc9_++;
         }
         _mtlLibLoaded = true;
      }
      
      private function parseMapKdString(param1:Array) : String
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:String = "";
         _loc4_ = 1;
         while(_loc4_ < param1.length)
         {
            var _loc5_:* = param1[_loc4_];
            if("-blendu" !== _loc5_)
            {
               if("-blendv" !== _loc5_)
               {
                  if("-cc" !== _loc5_)
                  {
                     if("-clamp" !== _loc5_)
                     {
                        if("-texres" !== _loc5_)
                        {
                           if("-mm" !== _loc5_)
                           {
                              if("-o" !== _loc5_)
                              {
                                 if("-s" !== _loc5_)
                                 {
                                    if("-t" !== _loc5_)
                                    {
                                       _loc2_ = true;
                                    }
                                 }
                                 addr38:
                                 _loc4_ = _loc4_ + 4;
                                 continue;
                              }
                              §§goto(addr38);
                           }
                           else
                           {
                              _loc4_ = _loc4_ + 3;
                           }
                        }
                        addr77:
                        if(!_loc2_)
                        {
                           continue;
                        }
                        break;
                     }
                     addr22:
                     _loc4_ = _loc4_ + 2;
                     §§goto(addr77);
                  }
                  addr21:
                  §§goto(addr22);
               }
               addr20:
               §§goto(addr21);
            }
            §§goto(addr20);
         }
         _loc4_;
         while(_loc4_ < param1.length)
         {
            _loc3_ = _loc3_ + param1[_loc4_];
            _loc3_ = _loc3_ + " ";
            _loc4_++;
         }
         _loc3_ = _loc3_.replace(/\s+$/,"");
         return _loc3_;
      }
      
      private function loadMtl(param1:String) : void
      {
         addDependency("mtl",new URLRequest(param1),true);
         pauseAndRetrieveDependencies();
      }
      
      private function applyMaterial(param1:LoadedMaterial) : void
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = 0;
         var _loc3_:* = null;
         var _loc6_:* = 0;
         _loc6_ = uint(0);
         while(_loc6_ < _meshes.length)
         {
            _loc7_ = _meshes[_loc6_];
            _loc4_ = _loc7_.material.name.split("~");
            if(_loc4_[0] == param1.materialID)
            {
               if(param1.cm)
               {
                  if(_loc7_.material)
                  {
                     _loc7_.material = null;
                  }
                  _loc7_.material = param1.cm;
               }
               else if(param1.texture)
               {
                  _loc2_ = TextureMaterial(_loc7_.material);
                  TextureMaterial(_loc2_).texture = param1.texture;
                  TextureMaterial(_loc2_).ambientColor = param1.ambientColor;
                  TextureMaterial(_loc2_).alpha = param1.alpha;
                  TextureMaterial(_loc2_).repeat = true;
                  if(param1.specularMethod)
                  {
                     TextureMaterial(_loc2_).specularMethod = null;
                     TextureMaterial(_loc2_).specularMethod = param1.specularMethod;
                  }
                  else if(_materialSpecularData)
                  {
                     _loc5_ = uint(0);
                     while(_loc5_ < _materialSpecularData.length)
                     {
                        _loc3_ = _materialSpecularData[_loc5_];
                        if(_loc3_.materialID == param1.materialID)
                        {
                           TextureMaterial(_loc2_).specularMethod = null;
                           TextureMaterial(_loc2_).specularMethod = _loc3_.basicSpecularMethod;
                           TextureMaterial(_loc2_).ambientColor = _loc3_.ambientColor;
                           TextureMaterial(_loc2_).alpha = _loc3_.alpha;
                           break;
                        }
                        _loc5_++;
                     }
                  }
               }
               _loc7_.material.name = !!_loc4_[1]?_loc4_[1]:_loc4_[0];
               _meshes.splice(_loc6_,1);
               _loc6_--;
            }
            _loc6_++;
         }
         if(param1.cm || _loc2_)
         {
            finalizeAsset(param1.cm || _loc2_);
         }
      }
      
      private function applyMaterials() : void
      {
         var _loc1_:* = 0;
         if(_materialLoaded.length == 0)
         {
            return;
         }
         _loc1_ = uint(0);
         while(_loc1_ < _materialLoaded.length)
         {
            applyMaterial(_materialLoaded[_loc1_]);
            _loc1_++;
         }
      }
   }
}

class ObjectGroup
{
    
   
   public var name:String;
   
   public var groups:Vector.<Group>;
   
   function ObjectGroup()
   {
      groups = new Vector.<Group>();
      super();
   }
}

class Group
{
    
   
   public var name:String;
   
   public var materialID:String;
   
   public var materialGroups:Vector.<MaterialGroup>;
   
   function Group()
   {
      materialGroups = new Vector.<MaterialGroup>();
      super();
   }
}

class MaterialGroup
{
    
   
   public var url:String;
   
   public var faces:Vector.<FaceData>;
   
   function MaterialGroup()
   {
      faces = new Vector.<FaceData>();
      super();
   }
}

import away3d.materials.methods.BasicSpecularMethod;

class SpecularData
{
    
   
   public var materialID:String;
   
   public var basicSpecularMethod:BasicSpecularMethod;
   
   public var ambientColor:uint = 16777215;
   
   public var alpha:Number = 1;
   
   function SpecularData()
   {
      super();
   }
}

import away3d.textures.Texture2DBase;
import away3d.materials.MaterialBase;
import away3d.materials.methods.BasicSpecularMethod;

class LoadedMaterial
{
    
   
   public var materialID:String;
   
   public var texture:Texture2DBase;
   
   public var cm:MaterialBase;
   
   public var specularMethod:BasicSpecularMethod;
   
   public var ambientColor:uint = 16777215;
   
   public var alpha:Number = 1;
   
   function LoadedMaterial()
   {
      super();
   }
}

class FaceData
{
    
   
   public var vertexIndices:Vector.<uint>;
   
   public var uvIndices:Vector.<uint>;
   
   public var normalIndices:Vector.<uint>;
   
   public var indexIds:Vector.<String>;
   
   function FaceData()
   {
      vertexIndices = new Vector.<uint>();
      uvIndices = new Vector.<uint>();
      normalIndices = new Vector.<uint>();
      indexIds = new Vector.<String>();
      super();
   }
}
