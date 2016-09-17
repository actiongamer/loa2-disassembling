package org.specter3d.display.particle
{
   import flash.events.EventDispatcher;
   import org.specter3d.configs.particle.SpecterParticleData;
   import org.specter3d.configs.particle.EmmiterData;
   import away3d.core.base.ParticleGeometry;
   import away3d.materials.SinglePassMaterialBase;
   import away3d.animators.ParticleAnimationSet;
   import away3d.animators.nodes.ParticleFollowNode;
   import flash.utils.Dictionary;
   import away3d.primitives.PlaneGeometry;
   import away3d.core.base.Geometry;
   import away3d.primitives.CubeGeometry;
   import away3d.primitives.SphereGeometry;
   import away3d.primitives.CylinderGeometry;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.configs.particle.MeshData;
   import away3d.tools.helpers.data.ParticleGeometryTransform;
   import flash.geom.Point;
   import flash.geom.Matrix3D;
   import org.specter3d.utils.SpecterUtils;
   import flash.geom.Vector3D;
   import flash.geom.Matrix;
   import away3d.tools.helpers.ParticleGeometryHelper;
   import away3d.materials.TextureMaterial;
   import away3d.materials.methods.SimpleCutMethod;
   import away3d.materials.ColorMaterial;
   import away3d.materials.methods.ColorMatrixMethod;
   import away3d.textures.ATFTexture;
   import away3d.textures.Texture2DBase;
   import away3d.materials.methods.AlphaMaskMethod;
   import away3d.animators.nodes.ParticleBillboardNode;
   import away3d.animators.nodes.ParticlePositionNode;
   import org.specter3d.configs.particle.node.ScaleData;
   import away3d.animators.nodes.ParticleScaleNode;
   import org.specter3d.configs.particle.node.ColorData;
   import away3d.animators.nodes.ParticleColorNode;
   import away3d.animators.data.ColorSegmentPoint;
   import away3d.animators.nodes.ParticleSegmentedColorNode;
   import away3d.animators.nodes.ParticleAccelerationNode;
   import org.specter3d.display.particle.extend.ParticleDampNode;
   import away3d.animators.nodes.ParticleRotationalVelocityNode;
   import away3d.animators.nodes.ParticleVelocityNode;
   import away3d.animators.nodes.ParticleOrbitNode;
   import away3d.animators.nodes.ParticleOscillatorNode;
   import away3d.animators.nodes.ParticleBezierCurveNode;
   import away3d.animators.nodes.ParticleSpriteSheetNode;
   import org.specter3d.display.particle.extend.ParticleUVScrollNode;
   import org.specter3d.display.particle.extend.ParticleAlphaNode;
   import away3d.animators.data.ParticleProperties;
   
   public class ParticleDirver extends EventDispatcher
   {
       
      
      private var _pData:SpecterParticleData;
      
      private var _emmiterData:EmmiterData;
      
      public var geometry:ParticleGeometry;
      
      public var material:SinglePassMaterialBase;
      
      private var _animationSet:ParticleAnimationSet;
      
      public var followNode:ParticleFollowNode;
      
      private var _isOnReady:Boolean = false;
      
      private var _isTextureLoaded:Boolean = false;
      
      private var _isGeometryLoaded:Boolean = false;
      
      private var _isMaskLoaded:Boolean = false;
      
      private var _group:String = "default_group";
      
      private var _useAtf:Boolean = true;
      
      private var _emmiterUrl:String;
      
      private var _fnDic:Dictionary;
      
      private var _textureMask:Texture2DBase;
      
      private var _texture:Texture2DBase;
      
      public function ParticleDirver(param1:SpecterParticleData, param2:String, param3:String = "default_group")
      {
         _fnDic = new Dictionary();
         super();
         _pData = param1;
         _group = param3;
         _emmiterUrl = param2;
         createGeometry();
         createMaterial();
         createAnimation();
      }
      
      public function get emmiterData() : EmmiterData
      {
         return _emmiterData;
      }
      
      public function set emmiterData(param1:EmmiterData) : void
      {
         _emmiterData = param1;
         _emmiterData.pData = _pData;
      }
      
      public function get pData() : SpecterParticleData
      {
         return _pData;
      }
      
      public function get animationSet() : ParticleAnimationSet
      {
         return _animationSet;
      }
      
      public function get emmiterUrl() : String
      {
         return _emmiterUrl;
      }
      
      public function addCallbackOnReady(param1:Function) : void
      {
         if(_isOnReady)
         {
            param1(this);
         }
         else if(_fnDic)
         {
            _fnDic[param1] = param1;
         }
      }
      
      public function removeCallbackOnReady(param1:Function) : void
      {
         if(_fnDic)
         {
            delete _fnDic[param1];
         }
      }
      
      private function createGeometry() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = pData.meshData.shapeType;
         if("plane" !== _loc2_)
         {
            if("cube" !== _loc2_)
            {
               if("sphere" !== _loc2_)
               {
                  if("cylinder" !== _loc2_)
                  {
                     if("external" !== _loc2_)
                     {
                        _loc1_ = new PlaneGeometry(pData.meshData.width,pData.meshData.height,pData.meshData.segmentsW,pData.meshData.segmentsH,pData.meshData.yUp);
                     }
                     else if(pData.meshData.url == "")
                     {
                        _loc1_ = new PlaneGeometry(pData.meshData.width,pData.meshData.height,pData.meshData.segmentsW,pData.meshData.segmentsH,pData.meshData.yUp);
                     }
                     else
                     {
                        if(pData.meshData.url.indexOf(".3DS") != -1)
                        {
                           DebugEngineLog.toWindowError(pData.meshData.url + "后缀不可大写");
                           pData.meshData.url = pData.meshData.url.replace(".3DS",".3ds");
                        }
                        if(pData.meshData.url.indexOf(" ") != -1)
                        {
                           DebugEngineLog.toWindowError(pData.meshData.url + "路径不可带空格,发射器:" + _emmiterUrl);
                        }
                        if(AssetLib.hasAsset(EffectManager.getUrl(pData.meshData.url)))
                        {
                           loadCustomGeometry(EffectManager.getUrl(pData.meshData.url));
                        }
                        else
                        {
                           AppGlobalContext.asynLoader.loadOne(new ResourceVo(EffectManager.getUrl(pData.meshData.url),1),FunctionDelegate.create(loadCustomGeometry,EffectManager.getUrl(pData.meshData.url)),_group);
                        }
                     }
                  }
                  else
                  {
                     _loc1_ = new CylinderGeometry(pData.meshData.topRadius,pData.meshData.bottomRadius,pData.meshData.height,pData.meshData.segmentsW,pData.meshData.segmentsH,pData.meshData.topClosed,pData.meshData.bottomClosed);
                  }
               }
               else
               {
                  _loc1_ = new SphereGeometry(pData.meshData.radius,pData.meshData.segmentsW,pData.meshData.segmentsH);
               }
            }
            else
            {
               _loc1_ = new CubeGeometry(pData.meshData.width,pData.meshData.height,pData.meshData.depth);
            }
         }
         else
         {
            _loc1_ = new PlaneGeometry(pData.meshData.width,pData.meshData.height,pData.meshData.segmentsW,pData.meshData.segmentsH,pData.meshData.yUp);
         }
         if(_loc1_)
         {
            createParticleGeometry(_loc1_);
         }
      }
      
      private function loadCustomGeometry(param1:String) : void
      {
         var _loc2_:Geometry = AssetLib.getGeometry(param1);
         if(_loc2_)
         {
            createParticleGeometry(_loc2_.clone());
         }
         else
         {
            geometry = new ParticleGeometry();
            _isGeometryLoaded = true;
            driverLoadCount();
            if(emmiterData != null)
            {
               DebugEngineLog.toWindowError("特效模型不存在: eff：" + emmiterData.url + "     模型地址：" + param1);
            }
         }
      }
      
      private function createParticleGeometry(param1:Geometry) : void
      {
         var _loc9_:* = undefined;
         var _loc8_:* = null;
         var _loc2_:* = undefined;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<Geometry> = new Vector.<Geometry>();
         var _loc11_:MeshData = pData.meshData;
         if(_loc11_.usesModelTransform || _loc11_.usesUVTransform)
         {
            _loc9_ = new Vector.<ParticleGeometryTransform>();
            if(_loc11_.usesUVTransform)
            {
               _loc2_ = new Vector.<Point>();
               _loc10_ = 0;
               while(_loc10_ < _loc11_.uv_col)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc11_.uv_row)
                  {
                     _loc2_.push(new Point(_loc7_,_loc10_));
                     _loc7_++;
                  }
                  _loc10_++;
               }
            }
         }
         var _loc5_:int = pData.total;
         switch(int(AppGlobalContext.PlayQuality) - 1)
         {
            case 0:
               _loc5_ = Math.ceil(_loc5_ / 4);
               break;
            case 1:
               _loc5_ = Math.ceil(_loc5_ / 2);
               break;
            case 2:
         }
         _loc10_ = 0;
         while(_loc10_ < _loc5_)
         {
            _loc4_.push(param1);
            if(_loc9_)
            {
               _loc8_ = new ParticleGeometryTransform();
               if(_loc11_.usesModelTransform)
               {
                  _loc8_.vertexTransform = new Matrix3D();
                  _loc8_.vertexTransform.appendTranslation(SpecterUtils.randomRange(_loc11_.x_min,_loc11_.x_max),SpecterUtils.randomRange(_loc11_.y_min,_loc11_.y_max),SpecterUtils.randomRange(_loc11_.z_min,_loc11_.z_max));
                  _loc8_.vertexTransform.appendScale(SpecterUtils.randomRange(_loc11_.sx_min,_loc11_.sx_max),SpecterUtils.randomRange(_loc11_.sy_min,_loc11_.sy_max),SpecterUtils.randomRange(_loc11_.sz_min,_loc11_.sz_max));
                  _loc8_.vertexTransform.appendRotation(SpecterUtils.randomRange(_loc11_.rx_min,_loc11_.rx_max),Vector3D.X_AXIS);
                  _loc8_.vertexTransform.appendRotation(SpecterUtils.randomRange(_loc11_.ry_min,_loc11_.ry_max),Vector3D.Y_AXIS);
                  _loc8_.vertexTransform.appendRotation(SpecterUtils.randomRange(_loc11_.rz_min,_loc11_.rz_max),Vector3D.Z_AXIS);
               }
               if(_loc11_.usesUVTransform)
               {
                  _loc8_.UVTransform = new Matrix();
                  _loc3_ = Math.min(_loc11_.uv_col * _loc11_.uv_row - 1,SpecterUtils.randomRange(_loc11_.uv_index_min,_loc11_.uv_index_max));
                  _loc6_ = _loc2_[_loc3_];
                  _loc8_.UVTransform.tx = _loc6_.x;
                  _loc8_.UVTransform.ty = _loc6_.y;
                  _loc8_.UVTransform.scale(1 / _loc11_.uv_col,1 / _loc11_.uv_row);
               }
               _loc9_.push(_loc8_);
            }
            _loc10_++;
         }
         geometry = ParticleGeometryHelper.generateGeometry(_loc4_,_loc9_,_loc11_.useMask);
         _isGeometryLoaded = true;
         driverLoadCount();
      }
      
      public function createMaterial() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(pData.meshData.materialType == "texture")
         {
            material = new TextureMaterial();
            material.repeat = pData.meshData.repeat;
            material.smooth = pData.meshData.smooth;
            material.mipmap = false;
            material.alphaBlending = pData.meshData.alphaBlending;
            material.alphaThreshold = pData.meshData.alphaThreshold;
            if(pData.yCut)
            {
               material.addMethod(new SimpleCutMethod());
            }
            if(pData.meshData.textureUrl && pData.meshData.textureUrl != "")
            {
               if(pData.meshData.textureUrl.indexOf(".PNG") != -1)
               {
                  DebugEngineLog.toWindowError(pData.meshData.textureUrl + "后缀不可大写");
                  pData.meshData.textureUrl = pData.meshData.textureUrl.replace(".PNG",".png");
               }
               _loc3_ = EffectManager.getUrl(pData.meshData.textureUrl);
               loadTextureFile(_loc3_,onTextrueLoaded);
            }
            else
            {
               _isTextureLoaded = true;
               driverLoadCount();
            }
            if(_pData.meshData.shapeType != "trail" && pData.meshData.useMask && pData.meshData.maskUrl != "")
            {
               _loc3_ = EffectManager.getUrl(pData.meshData.maskUrl);
               loadTextureFile(_loc3_,onMaskLoaded);
            }
            else
            {
               _isMaskLoaded = true;
               driverLoadCount();
            }
         }
         else if(pData.meshData.materialType == "color")
         {
            material = new ColorMaterial(pData.meshData.color,pData.meshData.alpha);
            _isTextureLoaded = true;
            _isMaskLoaded = true;
            driverLoadCount();
         }
         if(pData.meshData.blendMode == "normal")
         {
            material.blendMode = "layer";
         }
         else if(pData.meshData.blendMode == "layer")
         {
            material.blendMode = "normal";
         }
         else
         {
            material.blendMode = pData.meshData.blendMode;
         }
         material.bothSides = pData.meshData.bothSides;
         material.colorTransform = pData.meshData.getColor();
         if(pData.meshData.isGray)
         {
            _loc1_ = [];
            _loc1_ = _loc1_.concat([0.33,0.33,0.33,0,0]);
            _loc1_ = _loc1_.concat([0.33,0.33,0.33,0,0]);
            _loc1_ = _loc1_.concat([0.33,0.33,0.33,0,0]);
            _loc1_ = _loc1_.concat([0,0,0,1,0]);
            _loc2_ = new ColorMatrixMethod(_loc1_);
            material.addMethod(_loc2_);
         }
      }
      
      private function loadTextureFile(param1:String, param2:Function) : void
      {
         $url = param1;
         $callBack = param2;
         if(AssetLib.hasAsset($url))
         {
            $callBack($url);
         }
         else if(_useAtf && $callBack != this.onMaskLoaded)
         {
            var atfUrl:String = $url.replace(".png",".dxt").replace(".jpg",".dxt");
            if(AssetLib.hasAsset(atfUrl))
            {
               var atfTexture:ATFTexture = AssetLib.getATFTexture(atfUrl);
               if(atfTexture.atfData.parsingError == false)
               {
                  $callBack(atfUrl,atfTexture);
               }
               else
               {
                  AppGlobalContext.asynLoader.loadOne(new ResourceVo($url,1),FunctionDelegate.create($callBack,$url),_group);
               }
            }
            else
            {
               onMeshAtfLoaded = function(param1:String, param2:String):void
               {
                  atfTexture = AssetLib.getATFTexture(atfUrl);
                  if(atfTexture)
                  {
                     if(atfTexture.atfData.parsingError == false)
                     {
                        $callBack(param2,atfTexture);
                     }
                     else
                     {
                        AppGlobalContext.QueueLoader.loadOne(new ResourceVo(param1,1),FunctionDelegate.create($callBack,param1),_group);
                     }
                  }
                  else
                  {
                     AppGlobalContext.asynLoader.loadOne(new ResourceVo(param1,1),FunctionDelegate.create($callBack,param1),_group);
                  }
               };
               AppGlobalContext.asynLoader.loadOne(new ResourceVo(atfUrl,1),FunctionDelegate.create(onMeshAtfLoaded,$url,atfUrl),_group);
            }
         }
         else
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo($url,1),FunctionDelegate.create($callBack,$url),_group);
         }
      }
      
      private function onTextrueLoaded(param1:String, param2:ATFTexture = null) : void
      {
         if(material is TextureMaterial)
         {
            if(param2)
            {
               _texture = param2;
            }
            else
            {
               _texture = AssetLib.getBitmapTexture(param1);
            }
            TextureMaterial(material).texture = _texture;
            TextureMaterial(material).animateUVs = this.pData.uvScrollData.usesNode && this.pData.uvScrollData.rotation != 0;
            _isTextureLoaded = true;
            driverLoadCount();
         }
      }
      
      private function onMaskLoaded(param1:String, param2:ATFTexture = null) : void
      {
         if(material is TextureMaterial)
         {
            if(param2)
            {
               _textureMask = param2;
            }
            else
            {
               _textureMask = AssetLib.getBitmapTexture(param1);
            }
            material.addMethod(new AlphaMaskMethod(_textureMask,pData.meshData.useSecondaryUV));
            _isMaskLoaded = true;
            driverLoadCount();
         }
      }
      
      private function driverLoadCount() : void
      {
         if(_isTextureLoaded && _isGeometryLoaded && _isMaskLoaded && _fnDic)
         {
            _isOnReady = true;
            var _loc3_:int = 0;
            var _loc2_:* = _fnDic;
            for each(var _loc1_ in _fnDic)
            {
               _loc1_(this);
            }
            _fnDic = null;
         }
      }
      
      private function createAnimation() : void
      {
         var _loc1_:* = undefined;
         if(_pData.meshData.shapeType == "avatar" || _pData.meshData.shapeType == "rim_light")
         {
            return;
         }
         _animationSet = new ParticleAnimationSet(true,pData.usesLooping,pData.usesDelay);
         if(pData.meshData.faceToCamera)
         {
            _animationSet.addAnimation(new ParticleBillboardNode());
         }
         _animationSet.addAnimation(new ParticlePositionNode(1));
         var _loc3_:ScaleData = pData.scaleData;
         if(_loc3_.usesNode)
         {
            _animationSet.addAnimation(new ParticleScaleNode(1,_loc3_.usesCycle,_loc3_.usesPhase,_loc3_.minScale,_loc3_.maxScale,_loc3_.cycleDuration,_loc3_.cyclePhase));
         }
         var _loc2_:ColorData = pData.colorData;
         if(_loc2_.usesNode)
         {
            if(_loc2_.usesCycle)
            {
               _animationSet.addAnimation(new ParticleColorNode(0,_loc2_.usesMultiplier,_loc2_.usesOffset,_loc2_.usesCycle,_loc2_.usesPhase,_loc2_.startColor,_loc2_.endColor,_loc2_.cycleDuration,_loc2_.cyclePhase));
            }
            else
            {
               _loc1_ = new Vector.<ColorSegmentPoint>();
               if(_loc2_.segmentNum > 0)
               {
                  _loc1_.push(new ColorSegmentPoint(_loc2_.segmentOneTime,_loc2_.segmentOneColor));
               }
               if(_loc2_.segmentNum > 1)
               {
                  _loc1_.push(new ColorSegmentPoint(_loc2_.segmentTwoTime,_loc2_.segmentTwoColor));
               }
               _animationSet.addAnimation(new ParticleSegmentedColorNode(_loc2_.usesMultiplier,_loc2_.usesOffset,_loc2_.segmentNum,_loc2_.startColor,_loc2_.endColor,_loc1_));
            }
         }
         if(pData.acceleration_x != 0 || pData.acceleration_y != 0 || pData.acceleration_z != 0)
         {
            if(pData.accelerationType == 0)
            {
               _animationSet.addAnimation(new ParticleAccelerationNode(0,new Vector3D(pData.acceleration_x,pData.acceleration_y,pData.acceleration_z)));
            }
            else
            {
               _animationSet.addAnimation(new ParticleDampNode(0,new Vector3D(pData.acceleration_x,pData.acceleration_y,pData.acceleration_z)));
            }
         }
         if(pData.rotationData.usesNode)
         {
            _animationSet.addAnimation(new ParticleRotationalVelocityNode(1));
         }
         if(pData.diffusion != 0)
         {
            _animationSet.addAnimation(new ParticleVelocityNode(1));
         }
         else if(pData.hasVelNode())
         {
            if(pData.isVelGlobal())
            {
               _animationSet.addAnimation(new ParticleVelocityNode(0,new Vector3D(pData.velocity_x,pData.velocity_y,pData.velocity_z)));
            }
            else
            {
               _animationSet.addAnimation(new ParticleVelocityNode(1));
            }
         }
         if(pData.followData.usesNode)
         {
            followNode = new ParticleFollowNode(pData.followData.usesPosition,pData.followData.usesRotation);
            _animationSet.addAnimation(followNode);
         }
         if(pData.orbitData.usesNode)
         {
            _animationSet.addAnimation(new ParticleOrbitNode(1,true,true,false,100,1,0,new Vector3D(pData.orbitData.eulersX,pData.orbitData.eulersY,pData.orbitData.eulersZ)));
         }
         if(pData.oscillatorData.usesNode)
         {
            _animationSet.addAnimation(new ParticleOscillatorNode(1));
         }
         if(pData.bezierData.usesNode)
         {
            _animationSet.addAnimation(new ParticleBezierCurveNode(0,new Vector3D(pData.bezierData.controlX,pData.bezierData.controlY,pData.bezierData.controlZ),new Vector3D(pData.bezierData.endX,pData.bezierData.endY,pData.bezierData.endY)));
         }
         if(pData.uvSheetData.usesNode)
         {
            _animationSet.addAnimation(new ParticleSpriteSheetNode(0,pData.uvSheetData.usesDuration,false,pData.uvSheetData.cols,pData.uvSheetData.rows,pData.uvSheetData.cycleDuration,0,pData.uvSheetData.totalFrames));
         }
         if(pData.uvScrollData.usesNode)
         {
            _animationSet.addAnimation(new ParticleUVScrollNode(pData.uvScrollData.speedU,pData.uvScrollData.speedV));
         }
         _animationSet.addAnimation(new ParticleAlphaNode());
         _animationSet.initParticleFunc = initParticleFunc;
      }
      
      private function initParticleFunc(param1:ParticleProperties) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc2_:* = NaN;
         var _loc4_:* = NaN;
         var _loc20_:* = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc7_:* = null;
         var _loc10_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc8_:Number = NaN;
         if(pData.randomStart)
         {
            _loc11_ = SpecterUtils.randomRange(pData.minStartTime,pData.maxStartTime);
         }
         else
         {
            _loc11_ = pData.minStartTime + (pData.maxStartTime - pData.minStartTime) / param1.total * param1.index;
         }
         param1.startTime = _loc11_;
         param1.duration = SpecterUtils.randomRange(pData.minDuration,pData.maxDuration);
         param1.delay = pData.delay;
         if(pData.rotationData.usesNode)
         {
            param1["RotationalVelocityVector3D"] = new Vector3D(pData.rotationData.x,pData.rotationData.y,pData.rotationData.z,pData.rotationData.duration);
         }
         if(pData.diffusion != 0)
         {
            _loc15_ = pData.diffusion;
            _loc2_ = 0;
            _loc4_ = 0;
            _loc20_ = 0;
            if(pData.diffusionSync)
            {
               _loc12_ = Math.random() * 3.14159265358979 * 2;
               if(pData.diffusion_x)
               {
                  _loc2_ = Number(_loc15_ * Math.sin(_loc12_));
               }
               if(pData.diffusion_y)
               {
                  _loc4_ = Number(_loc15_ * Math.cos(_loc12_));
               }
            }
            else
            {
               _loc12_ = Math.random() * 3.14159265358979;
               _loc13_ = Math.random() * 3.14159265358979 * 2;
               if(pData.diffusion_x)
               {
                  _loc2_ = Number(_loc15_ * Math.sin(_loc12_) * Math.cos(_loc13_));
               }
               if(pData.diffusion_y)
               {
                  _loc4_ = Number(_loc15_ * Math.cos(_loc12_) * Math.cos(_loc13_));
               }
               if(pData.diffusion_z)
               {
                  _loc20_ = Number(_loc15_ * Math.sin(_loc13_));
               }
            }
            param1["VelocityVector3D"] = new Vector3D(_loc2_,_loc4_,_loc20_);
         }
         else if(pData.hasVelNode() && pData.isVelGlobal() == false)
         {
            _loc3_ = SpecterUtils.randomRange(pData.velocity_x,pData.velocity_x_max);
            _loc5_ = SpecterUtils.randomRange(pData.velocity_y,pData.velocity_y_max);
            _loc9_ = SpecterUtils.randomRange(pData.velocity_z,pData.velocity_z_max);
            param1["VelocityVector3D"] = new Vector3D(_loc3_,_loc5_,_loc9_);
         }
         param1["ScaleVector3D"] = new Vector3D(pData.scaleData.singleMinScale,pData.scaleData.singleMaxScale,pData.scaleData.cycleDuration);
         var _loc14_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:* = 0;
         var _loc19_:* = 0;
         var _loc21_:* = pData.emitterType;
         if("point" !== _loc21_)
         {
            if("line" !== _loc21_)
            {
               if("box" !== _loc21_)
               {
                  if("cylinder" !== _loc21_)
                  {
                     if("sphere" === _loc21_)
                     {
                        _loc18_ = Math.random() * 2 * 3.14159265358979;
                        _loc8_ = Math.random() * 3.14159265358979;
                        _loc19_ = Number(SpecterUtils.randomRange(0,pData.radius));
                        _loc14_ = Number(_loc19_ * Math.sin(_loc8_) * Math.sin(_loc18_));
                        _loc16_ = Number(_loc19_ * Math.sin(_loc8_) * Math.cos(_loc18_));
                        _loc17_ = Number(_loc19_ * Math.cos(_loc8_));
                     }
                  }
                  else
                  {
                     if(pData.fixedRadius)
                     {
                        _loc19_ = Number(pData.radius);
                     }
                     else
                     {
                        _loc19_ = Number(SpecterUtils.randomRange(0,pData.radius));
                     }
                     _loc10_ = SpecterUtils.randomRange(0,pData.angel) * 3.14159265358979 / 180;
                     _loc14_ = Number(_loc19_ * Math.cos(_loc10_));
                     _loc17_ = Number(_loc19_ * Math.sin(_loc10_));
                     _loc16_ = Number(SpecterUtils.randomRange(-pData.cylinderHeight / 2,pData.cylinderHeight / 2));
                  }
               }
               else
               {
                  _loc14_ = Number(SpecterUtils.randomRange(-pData.boxDepth / 2,pData.boxDepth / 2));
                  _loc16_ = Number(SpecterUtils.randomRange(-pData.boxHeight / 2,pData.boxHeight / 2));
                  _loc17_ = Number(SpecterUtils.randomRange(-pData.boxWidth / 2,pData.boxWidth / 2));
               }
            }
            else
            {
               _loc7_ = pData.lines[Math.round(SpecterUtils.randomRange(0,pData.lines.length - 1))];
               _loc14_ = Number(_loc7_.randomPt.x);
               _loc16_ = Number(_loc7_.randomPt.y);
               _loc17_ = Number(_loc7_.randomPt.z);
            }
         }
         var _loc6_:ColorData = pData.colorData;
         if(_loc6_.usesNode)
         {
            param1["ColorStartColorTransform"] = _loc6_.startColor;
            param1["ColorEndColorTransform"] = _loc6_.endColor;
         }
         if(pData.orbitData.usesNode)
         {
            _loc19_ = Number(SpecterUtils.randomRange(pData.orbitData.radiusMin,pData.orbitData.radiusMax));
            param1["OrbitVector3D"] = new Vector3D(_loc19_,pData.orbitData.cycleDuration,0);
         }
         if(pData.oscillatorData.usesNode)
         {
            param1["OscillatorVector3D"] = new Vector3D(pData.oscillatorData.oscillatorX,pData.oscillatorData.oscillatorY,pData.oscillatorData.oscillatorZ,pData.oscillatorData.cycleDuration);
         }
         param1["PositionVector3D"] = new Vector3D(_loc14_,_loc16_,_loc17_);
      }
      
      public function get texture() : Texture2DBase
      {
         return _texture;
      }
      
      public function get isFollow() : Boolean
      {
         return followNode != null;
      }
      
      public function dispose() : void
      {
         if(_texture)
         {
            if(_texture is ATFTexture)
            {
               (_texture as ATFTexture).disposeAtf();
            }
            _texture = null;
            _isTextureLoaded = false;
         }
         if(_textureMask)
         {
            if(_textureMask is ATFTexture)
            {
               (_textureMask as ATFTexture).disposeAtf();
            }
            _textureMask = null;
            _isMaskLoaded = false;
         }
         if(geometry)
         {
            geometry.dispose();
            geometry = null;
            _isGeometryLoaded = false;
         }
         if(material)
         {
            material.dispose();
            material = null;
         }
         if(_animationSet)
         {
            _animationSet.dispose();
            _animationSet = null;
         }
         _isOnReady = false;
         _fnDic = null;
      }
   }
}
