package away3d.core.pick
{
   import flash.geom.Rectangle;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.Context3D;
   import flash.display3D.Program3D;
   import flash.display.BitmapData;
   import away3d.core.base.IRenderable;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import away3d.containers.View3D;
   import away3d.core.traverse.EntityCollector;
   import away3d.containers.Scene3D;
   import flash.display3D.textures.TextureBase;
   import away3d.cameras.Camera3D;
   import away3d.core.data.RenderableListItem;
   import away3d.core.managers.Context3DProxy;
   import com.adobe.utils.AGALMiniAssembler;
   import away3d.debug.Debug;
   import away3d.entities.Entity;
   import flash.geom.Matrix3D;
   import flash.display3D.Context3DClearMask;
   import away3d.core.base.SubMesh;
   import away3d.core.base.ISubGeometry;
   import away3d.core.math.Matrix3DUtils;
   
   public class ShaderPicker implements IPicker
   {
      
      private static const MOUSE_SCISSOR_RECT:Rectangle = new Rectangle(0,0,1,1);
       
      
      private var _stage3DProxy:Stage3DProxy;
      
      private var _context:Context3D;
      
      private var _objectProgram3D:Program3D;
      
      private var _triangleProgram3D:Program3D;
      
      private var _bitmapData:BitmapData;
      
      private var _viewportData:Vector.<Number>;
      
      private var _boundOffsetScale:Vector.<Number>;
      
      private var _id:Vector.<Number>;
      
      private var _interactives:Vector.<IRenderable>;
      
      private var _interactiveId:uint;
      
      private var _hitColor:uint;
      
      private var _projX:Number;
      
      private var _projY:Number;
      
      private var _hitRenderable:IRenderable;
      
      private var _localHitPosition:Vector3D;
      
      private var _hitUV:Point;
      
      private var _localHitNormal:Vector3D;
      
      private var _rayPos:Vector3D;
      
      private var _rayDir:Vector3D;
      
      private var _potentialFound:Boolean;
      
      public function ShaderPicker()
      {
         _bitmapData = new BitmapData(1,1,false,0);
         _interactives = new Vector.<IRenderable>();
         _localHitPosition = new Vector3D();
         _hitUV = new Point();
         _localHitNormal = new Vector3D();
         _rayPos = new Vector3D();
         _rayDir = new Vector3D();
         super();
         _id = new Vector.<Number>(4,true);
         _viewportData = new Vector.<Number>(4,true);
         _boundOffsetScale = new Vector.<Number>(8,true);
         _boundOffsetScale[3] = 0;
         _boundOffsetScale[7] = 1;
      }
      
      public function getViewCollision(param1:Number, param2:Number, param3:View3D) : PickingCollisionVO
      {
         var _loc4_:EntityCollector = param3.entityCollector;
         _stage3DProxy = param3.stage3DProxy;
         if(!_stage3DProxy)
         {
            return null;
         }
         _context = _stage3DProxy._context3D;
         _viewportData[0] = param3.width;
         _viewportData[1] = param3.height;
         _projX = 2 * param1 / param3.width - 1;
         _viewportData[2] = -(2 * param1 / param3.width - 1);
         _projY = 2 * param2 / param3.height - 1;
         _viewportData[3] = 2 * param2 / param3.height - 1;
         _potentialFound = false;
         draw(_loc4_,null);
         _context.setVertexBufferAt(0,null);
         if(!_context || !_potentialFound)
         {
            return null;
         }
         _context.drawToBitmapData(_bitmapData);
         _hitColor = _bitmapData.getPixel(0,0);
         if(!_hitColor)
         {
            _context.present();
            return null;
         }
         _hitRenderable = _interactives[_hitColor - 1];
         var _loc5_:PickingCollisionVO = _hitRenderable.sourceEntity.pickingCollisionVO;
         if(_hitRenderable.shaderPickingDetails)
         {
            getHitDetails(param3.camera);
            _loc5_.localPosition = _localHitPosition;
            _loc5_.localNormal = _localHitNormal;
            _loc5_.uv = _hitUV;
         }
         else
         {
            _loc5_.localPosition = null;
            _loc5_.localNormal = null;
            _loc5_.uv = null;
         }
         return _loc5_;
      }
      
      public function getSceneCollision(param1:Vector3D, param2:Vector3D, param3:Scene3D) : PickingCollisionVO
      {
         return null;
      }
      
      protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         var _loc3_:Camera3D = param1.camera;
         _context.clear(0,0,0,1);
         _stage3DProxy.scissorRect = MOUSE_SCISSOR_RECT;
         _interactiveId = 0;
         _interactives.length = 0;
         if(!_objectProgram3D)
         {
            initObjectProgram3D();
         }
         _context.setBlendFactors("one","zero");
         _context.setDepthTest(true,"less");
         _stage3DProxy.setProgram(_objectProgram3D);
         _context.setProgramConstantsFromVector("vertex",4,_viewportData,1);
         drawRenderables(param1.opaqueRenderableHead,_loc3_);
         drawRenderables(param1.blendedRenderableHead,_loc3_);
      }
      
      private function drawRenderables(param1:RenderableListItem, param2:Camera3D) : void
      {
         var _loc3_:* = null;
         while(param1)
         {
            _loc3_ = param1.renderable;
            if(!_loc3_.sourceEntity.scene || !_loc3_.mouseEnabled)
            {
               param1 = param1.next;
            }
            else
            {
               _potentialFound = true;
               _context.setCulling(!!_loc3_.material.bothSides?"none":"back");
               _interactiveId = Number(_interactiveId) + 1;
               _interactives[Number(_interactiveId)] = _loc3_;
               _id[1] = (_interactiveId >> 8) / 255;
               _id[2] = (_interactiveId & 255) / 255;
               _context.setProgramConstantsFromMatrix("vertex",0,_loc3_.modelViewProjection,true);
               _context.setProgramConstantsFromVector("fragment",0,_id,1);
               _loc3_.activateVertexBuffer(0,_stage3DProxy);
               _context.drawTriangles(_loc3_.getIndexBuffer(_stage3DProxy),0,_loc3_.numTriangles);
               Context3DProxy.drawCall++;
               param1 = param1.next;
            }
         }
      }
      
      private function updateRay(param1:Camera3D) : void
      {
         _rayPos = param1.scenePosition;
         _rayDir = param1.getRay(_projX,_projY);
         _rayDir.normalize();
      }
      
      private function initObjectProgram3D() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         _objectProgram3D = _context.createProgram();
         _loc2_ = "m44 vt0, va0, vc0\t\t\t\nmul vt1.xy, vt0.w, vc4.zw\t\nadd vt0.xy, vt0.xy, vt1.xy\t\nmul vt0.xy, vt0.xy, vc4.xy\t\nmov op, vt0\t\n";
         _loc1_ = "mov oc, fc0";
         _objectProgram3D.upload(new AGALMiniAssembler(Debug.active).assemble("vertex",_loc2_),new AGALMiniAssembler(Debug.active).assemble("fragment",_loc1_));
      }
      
      private function initTriangleProgram3D() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         _triangleProgram3D = _context.createProgram();
         _loc2_ = "add vt0, va0, vc5 \t\t\t\nmul vt0, vt0, vc6 \t\t\t\nmov v0, vt0\t\t\t\t\nm44 vt0, va0, vc0\t\t\t\nmul vt1.xy, vt0.w, vc4.zw\t\nadd vt0.xy, vt0.xy, vt1.xy\t\nmul vt0.xy, vt0.xy, vc4.xy\t\nmov op, vt0\t\n";
         _loc1_ = "mov oc, v0";
         _triangleProgram3D.upload(new AGALMiniAssembler(Debug.active).assemble("vertex",_loc2_),new AGALMiniAssembler(Debug.active).assemble("fragment",_loc1_));
      }
      
      private function getHitDetails(param1:Camera3D) : void
      {
         getApproximatePosition(param1);
         getPreciseDetails(param1);
      }
      
      private function getApproximatePosition(param1:Camera3D) : void
      {
         var _loc3_:* = 0;
         var _loc10_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:Entity = _hitRenderable.sourceEntity;
         var _loc2_:Matrix3D = _hitRenderable.modelViewProjection;
         if(!_triangleProgram3D)
         {
            initTriangleProgram3D();
         }
         _loc8_ = 1 / (_loc4_.maxX - _loc4_.minX);
         _boundOffsetScale[4] = 1 / (_loc4_.maxX - _loc4_.minX);
         _loc10_ = 1 / (_loc4_.maxY - _loc4_.minY);
         _boundOffsetScale[5] = 1 / (_loc4_.maxY - _loc4_.minY);
         _loc6_ = 1 / (_loc4_.maxZ - _loc4_.minZ);
         _boundOffsetScale[6] = 1 / (_loc4_.maxZ - _loc4_.minZ);
         _loc7_ = -_loc4_.minX;
         _boundOffsetScale[0] = -_loc4_.minX;
         _loc9_ = -_loc4_.minY;
         _boundOffsetScale[1] = -_loc4_.minY;
         _loc5_ = -_loc4_.minZ;
         _boundOffsetScale[2] = -_loc4_.minZ;
         _stage3DProxy.setProgram(_triangleProgram3D);
         _context.clear(0,0,0,0,1,0,Context3DClearMask.DEPTH);
         _context.setScissorRectangle(MOUSE_SCISSOR_RECT);
         _context.setProgramConstantsFromMatrix("vertex",0,_loc2_,true);
         _context.setProgramConstantsFromVector("vertex",5,_boundOffsetScale,2);
         _hitRenderable.activateVertexBuffer(0,_stage3DProxy);
         _context.drawTriangles(_hitRenderable.getIndexBuffer(_stage3DProxy),0,_hitRenderable.numTriangles);
         Context3DProxy.drawCall++;
         _context.drawToBitmapData(_bitmapData);
         _loc3_ = uint(_bitmapData.getPixel(0,0));
         _localHitPosition.x = (_loc3_ >> 16 & 255) / (_loc8_ * 255) - _loc7_;
         _localHitPosition.y = (_loc3_ >> 8 & 255) / (_loc10_ * 255) - _loc9_;
         _localHitPosition.z = (_loc3_ & 255) / (_loc6_ * 255) - _loc5_;
      }
      
      private function getPreciseDetails(param1:Camera3D) : void
      {
         var _loc9_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc20_:* = 0;
         var _loc19_:* = 0;
         var _loc21_:* = 0;
         var _loc15_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc25_:* = 0;
         var _loc27_:* = 0;
         var _loc23_:* = 0;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc17_:ISubGeometry = SubMesh(_hitRenderable).subGeometry;
         var _loc16_:Vector.<uint> = _loc17_.indexData;
         var _loc3_:Vector.<Number> = _loc17_.vertexData;
         var _loc39_:int = _loc16_.length;
         var _loc44_:uint = 0;
         var _loc41_:uint = 1;
         var _loc42_:uint = 2;
         var _loc18_:Vector.<Number> = _loc17_.UVData;
         var _loc14_:Vector.<Number> = _loc17_.faceNormals;
         var _loc56_:Number = _localHitPosition.x;
         var _loc55_:Number = _localHitPosition.y;
         var _loc53_:Number = _localHitPosition.z;
         var _loc12_:int = _loc17_.vertexStride;
         var _loc52_:int = _loc17_.vertexOffset;
         updateRay(param1);
         while(_loc44_ < _loc39_)
         {
            _loc21_ = uint(_loc52_ + _loc16_[_loc44_] * _loc12_);
            _loc20_ = uint(_loc52_ + _loc16_[_loc41_] * _loc12_);
            _loc19_ = uint(_loc52_ + _loc16_[_loc42_] * _loc12_);
            _loc30_ = _loc3_[_loc21_];
            _loc9_ = _loc3_[_loc21_ + 1];
            _loc2_ = _loc3_[_loc21_ + 2];
            _loc28_ = _loc3_[_loc20_];
            _loc10_ = _loc3_[_loc20_ + 1];
            _loc4_ = _loc3_[_loc20_ + 2];
            _loc29_ = _loc3_[_loc19_];
            _loc11_ = _loc3_[_loc19_ + 1];
            _loc6_ = _loc3_[_loc19_ + 2];
            if(!(_loc56_ < _loc30_ && _loc56_ < _loc28_ && _loc56_ < _loc29_ || _loc55_ < _loc9_ && _loc55_ < _loc10_ && _loc55_ < _loc11_ || _loc53_ < _loc2_ && _loc53_ < _loc4_ && _loc53_ < _loc6_ || _loc56_ > _loc30_ && _loc56_ > _loc28_ && _loc56_ > _loc29_ || _loc55_ > _loc9_ && _loc55_ > _loc10_ && _loc55_ > _loc11_ || _loc53_ > _loc2_ && _loc53_ > _loc4_ && _loc53_ > _loc6_))
            {
               _loc13_ = _loc29_ - _loc30_;
               _loc15_ = _loc11_ - _loc9_;
               _loc26_ = _loc6_ - _loc2_;
               _loc36_ = _loc28_ - _loc30_;
               _loc33_ = _loc10_ - _loc9_;
               _loc35_ = _loc4_ - _loc2_;
               _loc48_ = _loc56_ - _loc30_;
               _loc50_ = _loc55_ - _loc9_;
               _loc51_ = _loc53_ - _loc2_;
               _loc40_ = _loc13_ * _loc13_ + _loc15_ * _loc15_ + _loc26_ * _loc26_;
               _loc37_ = _loc13_ * _loc36_ + _loc15_ * _loc33_ + _loc26_ * _loc35_;
               _loc38_ = _loc13_ * _loc48_ + _loc15_ * _loc50_ + _loc26_ * _loc51_;
               _loc22_ = _loc36_ * _loc36_ + _loc33_ * _loc33_ + _loc35_ * _loc35_;
               _loc24_ = _loc36_ * _loc48_ + _loc33_ * _loc50_ + _loc35_ * _loc51_;
               _loc43_ = 1 / (_loc40_ * _loc22_ - _loc37_ * _loc37_);
               _loc49_ = (_loc22_ * _loc38_ - _loc37_ * _loc24_) * _loc43_;
               _loc47_ = (_loc40_ * _loc24_ - _loc37_ * _loc38_) * _loc43_;
               if(_loc49_ >= 0 && _loc47_ >= 0 && _loc49_ + _loc47_ <= 1)
               {
                  getPrecisePosition(_hitRenderable.inverseSceneTransform,_loc14_[_loc44_],_loc14_[_loc44_ + 1],_loc14_[_loc44_ + 2],_loc30_,_loc9_,_loc2_);
                  _loc48_ = _localHitPosition.x - _loc30_;
                  _loc50_ = _localHitPosition.y - _loc9_;
                  _loc51_ = _localHitPosition.z - _loc2_;
                  _loc34_ = _loc28_ - _loc30_;
                  _loc31_ = _loc10_ - _loc9_;
                  _loc32_ = _loc4_ - _loc2_;
                  _loc8_ = _loc29_ - _loc30_;
                  _loc7_ = _loc11_ - _loc9_;
                  _loc5_ = _loc6_ - _loc2_;
                  _localHitNormal.x = _loc31_ * _loc5_ - _loc32_ * _loc7_;
                  _localHitNormal.y = _loc32_ * _loc8_ - _loc34_ * _loc5_;
                  _localHitNormal.z = _loc34_ * _loc7_ - _loc31_ * _loc8_;
                  _loc54_ = 1 / Math.sqrt(_localHitNormal.x * _localHitNormal.x + _localHitNormal.y * _localHitNormal.y + _localHitNormal.z * _localHitNormal.z);
                  _localHitNormal.x = _localHitNormal.x * _loc54_;
                  _localHitNormal.y = _localHitNormal.y * _loc54_;
                  _localHitNormal.z = _localHitNormal.z * _loc54_;
                  _loc38_ = _loc13_ * _loc48_ + _loc15_ * _loc50_ + _loc26_ * _loc51_;
                  _loc24_ = _loc36_ * _loc48_ + _loc33_ * _loc50_ + _loc35_ * _loc51_;
                  _loc49_ = (_loc22_ * _loc38_ - _loc37_ * _loc24_) * _loc43_;
                  _loc47_ = (_loc40_ * _loc24_ - _loc37_ * _loc38_) * _loc43_;
                  _loc23_ = uint(_loc16_[_loc44_] << 1);
                  _loc25_ = uint(_loc16_[_loc41_] << 1);
                  _loc27_ = uint(_loc16_[_loc42_] << 1);
                  _loc46_ = _loc18_[_loc23_];
                  _loc45_ = _loc18_[_loc23_ + 1];
                  _hitUV.x = _loc46_ + _loc47_ * (_loc18_[_loc25_] - _loc46_) + _loc49_ * (_loc18_[_loc27_] - _loc46_);
                  _hitUV.y = _loc45_ + _loc47_ * (_loc18_[_loc25_ + 1] - _loc45_) + _loc49_ * (_loc18_[_loc27_ + 1] - _loc45_);
                  return;
               }
            }
            _loc44_ = _loc44_ + 3;
            _loc41_ = _loc41_ + 3;
            _loc42_ = _loc42_ + 3;
         }
      }
      
      private function getPrecisePosition(param1:Matrix3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc18_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc8_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc11_:Number = _rayPos.x;
         var _loc10_:Number = _rayPos.y;
         var _loc9_:Number = _rayPos.z;
         _loc12_ = _rayDir.x;
         _loc14_ = _rayDir.y;
         _loc13_ = _rayDir.z;
         param1.copyRawDataTo(_loc8_);
         _loc17_ = _loc8_[0] * _loc12_ + _loc8_[4] * _loc14_ + _loc8_[8] * _loc13_;
         _loc18_ = _loc8_[1] * _loc12_ + _loc8_[5] * _loc14_ + _loc8_[9] * _loc13_;
         _loc15_ = _loc8_[2] * _loc12_ + _loc8_[6] * _loc14_ + _loc8_[10] * _loc13_;
         _loc12_ = _loc8_[0] * _loc11_ + _loc8_[4] * _loc10_ + _loc8_[8] * _loc9_ + _loc8_[12];
         _loc14_ = _loc8_[1] * _loc11_ + _loc8_[5] * _loc10_ + _loc8_[9] * _loc9_ + _loc8_[13];
         _loc13_ = _loc8_[2] * _loc11_ + _loc8_[6] * _loc10_ + _loc8_[10] * _loc9_ + _loc8_[14];
         _loc16_ = ((param5 - _loc12_) * param2 + (param6 - _loc14_) * param3 + (param7 - _loc13_) * param4) / (_loc17_ * param2 + _loc18_ * param3 + _loc15_ * param4);
         _localHitPosition.x = _loc12_ + _loc17_ * _loc16_;
         _localHitPosition.y = _loc14_ + _loc18_ * _loc16_;
         _localHitPosition.z = _loc13_ + _loc15_ * _loc16_;
      }
   }
}
