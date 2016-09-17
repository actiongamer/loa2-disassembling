package org.specter3d.display
{
   import away3d.containers.ObjectContainer3D;
   import away3d.core.managers.IAnimatorUpdate;
   import away3d.materials.methods.EffectMethodBase;
   import org.specter3d.utils.HashMap;
   import away3d.entities.Mesh;
   import away3d.materials.lightpickers.LightPickerBase;
   import away3d.materials.methods.SimpleShadowMapMethodBase;
   import org.specter3d.configs.Specter3DConfig;
   import org.specter3d.events.Specter3DEvent;
   import away3d.materials.SinglePassMaterialBase;
   import org.specter3d.context.AppGlobalContext;
   import away3d.materials.methods.ColorMatrixMethod;
   import com.greensock.TweenLite;
   import away3d.containers.View3D;
   import away3d.events.MouseEvent3D;
   import away3d.materials.TextureMaterial;
   
   public class Specter3D extends ObjectContainer3D implements IAnimatorUpdate
   {
       
      
      public var allResComplete:Boolean;
      
      private var _addMethodV:Vector.<EffectMethodBase>;
      
      private var _alphaDirty:Boolean;
      
      private var _lightDirty:Boolean;
      
      private var _methodDirty:Boolean;
      
      private var _removeMethodV:Vector.<EffectMethodBase>;
      
      private var _shadowDirty:Boolean;
      
      private var _evtMap:HashMap;
      
      private var _isDispose:Boolean;
      
      protected var _meshVec:Vector.<Mesh>;
      
      private var _alpha:Number = 1;
      
      private var _elementType:int;
      
      private var _lightPicker:LightPickerBase;
      
      private var _shadowMethod:SimpleShadowMapMethodBase;
      
      private var _specterData:Specter3DConfig;
      
      private var _coordinateAngel:int = 90;
      
      public var rotationTweenDurationFrame:int = 15;
      
      private var _rotationTweenLite:TweenLite;
      
      public function Specter3D(param1:Specter3DConfig = null)
      {
         super();
         this.specterData = param1;
         this._elementType = !!param1?param1.elementType:-1;
         initialization();
      }
      
      public function update(param1:int, param2:Number = 0) : void
      {
         onRender(param2);
      }
      
      override public function addChild(param1:ObjectContainer3D) : ObjectContainer3D
      {
         if(param1 is Mesh)
         {
            _meshVec.push(param1);
            _shadowDirty = true;
            _methodDirty = true;
            _lightDirty = true;
            _alphaDirty = true;
         }
         return super.addChild(param1);
      }
      
      override public function addChildren(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = rest;
         for each(var _loc2_ in rest)
         {
            addChild(_loc2_);
         }
         super.addChildren(rest);
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = _addMethodV.indexOf(param1);
         if(_loc2_ > -1)
         {
            return;
         }
         var _loc3_:int = _removeMethodV.indexOf(param1);
         if(_loc3_ > -1)
         {
            _removeMethodV.splice(_loc3_,1);
         }
         _addMethodV.push(param1);
         _methodDirty = true;
      }
      
      public function addShadowMethod(param1:SimpleShadowMapMethodBase) : void
      {
         if(_shadowMethod == param1)
         {
            return;
         }
         _shadowMethod = param1;
         _shadowDirty = true;
      }
      
      public function get alpha() : Number
      {
         return _alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(_alpha == param1)
         {
            return;
         }
         _alpha = param1 > 1?1:Number(param1);
         _alphaDirty = true;
      }
      
      public function get alphaDirty() : Boolean
      {
         return _alphaDirty;
      }
      
      public function set alphaDirty(param1:Boolean) : void
      {
         _alphaDirty = param1;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:* = null;
         super.addEventListener(param1,param2,param3,param4,param5);
         if(_evtMap != null)
         {
            _loc6_ = _evtMap.getValue(param1) as Array;
            if(!_loc6_)
            {
               _loc6_ = [];
            }
            if(_loc6_.indexOf(param2) < 0)
            {
               _loc6_.push(param2);
               _evtMap.put(param1,_loc6_);
            }
         }
      }
      
      public function get isDispose() : Boolean
      {
         return _isDispose;
      }
      
      override public function dispose() : void
      {
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc8_:* = null;
         var _loc3_:* = null;
         if(_isDispose)
         {
            return;
         }
         if(this.hasEventListener("disposed"))
         {
            this.dispatchEvent(new Specter3DEvent("disposed"));
         }
         super.dispose();
         _isDispose = true;
         var _loc5_:Array = _evtMap.keySet();
         var _loc13_:int = 0;
         var _loc12_:* = _loc5_;
         for each(var _loc1_ in _loc5_)
         {
            _loc7_ = _evtMap.getValue(_loc1_) as Array;
            var _loc11_:int = 0;
            var _loc10_:* = _loc7_;
            for each(_loc6_ in _loc7_)
            {
               this.removeEventListener(_loc1_,_loc6_);
            }
            _loc7_.length = 0;
         }
         _evtMap = null;
         var _loc4_:uint = _meshVec.length;
         _loc9_ = 0;
         while(_loc9_ < _loc4_)
         {
            _loc8_ = _meshVec[_loc9_];
            _loc3_ = _loc8_.material as SinglePassMaterialBase;
            if(_loc3_ != null)
            {
               var _loc15_:int = 0;
               var _loc14_:* = _addMethodV;
               for each(var _loc2_ in _addMethodV)
               {
                  if(_loc3_.hasMethod(_loc2_))
                  {
                     _loc3_.removeMethod(_loc2_);
                  }
               }
            }
            _loc9_++;
         }
         _specterData = null;
         _meshVec.length = 0;
         _addMethodV.length = 0;
         _removeMethodV.length = 0;
         if(_rotationTweenLite)
         {
            _rotationTweenLite.kill();
            _rotationTweenLite = null;
         }
         AppGlobalContext.animatorManager.unregister(this);
      }
      
      public function get elementType() : int
      {
         return _elementType;
      }
      
      public function set elementType(param1:int) : void
      {
         _elementType = param1;
      }
      
      public function getRotation(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc6_:int = 0;
         var _loc8_:Number = NaN;
         var _loc5_:Number = param3 - param1;
         var _loc7_:Number = param4 - param2;
         _loc6_ = Math.atan(Math.abs(_loc7_) / Math.abs(_loc5_)) / 3.14159265358979 * 180;
         if(!(_loc5_ >= 0 && _loc7_ >= 0))
         {
            if(_loc5_ < 0 && _loc7_ >= 0)
            {
               _loc6_ = 180 - _loc6_;
            }
            else if(_loc5_ < 0 && _loc7_ < 0)
            {
               _loc6_ = 180 + _loc6_;
            }
            else if(_loc5_ >= 0 && _loc7_ < 0)
            {
               _loc6_ = 360 - _loc6_;
            }
         }
         return _loc6_;
      }
      
      public function hasMethod(param1:EffectMethodBase) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < _addMethodV.length)
         {
            if(_addMethodV[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get lightDirty() : Boolean
      {
         return _lightDirty;
      }
      
      public function set lightDirty(param1:Boolean) : void
      {
         _lightDirty = param1;
      }
      
      public function get lightPicker() : LightPickerBase
      {
         return _lightPicker;
      }
      
      public function set lightPicker(param1:LightPickerBase) : void
      {
         if(_lightPicker == param1)
         {
            return;
         }
         _lightPicker = param1;
         _lightDirty = true;
      }
      
      public function get methodDirty() : Boolean
      {
         return _methodDirty;
      }
      
      public function set methodDirty(param1:Boolean) : void
      {
         _methodDirty = param1;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         .super.mouseEnabled = param1;
         addMouseEventListener();
      }
      
      public function removeAllColorMethod() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _addMethodV.length)
         {
            if(_addMethodV[_loc2_] is ColorMatrixMethod)
            {
               _loc1_ = _addMethodV.splice(_loc2_,1)[0];
               _loc2_--;
            }
            _loc2_++;
         }
         _methodDirty = true;
      }
      
      override public function removeChild(param1:ObjectContainer3D) : void
      {
         if(!param1)
         {
            return;
         }
         super.removeChild(param1);
         var _loc2_:int = _meshVec.indexOf(param1 as Mesh);
         _meshVec.splice(_loc2_,1);
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = _addMethodV.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         var _loc3_:EffectMethodBase = _addMethodV.splice(_loc2_,1)[0];
         _removeMethodV.push(_loc3_);
         _methodDirty = true;
      }
      
      public function removeShadowMethod(param1:SimpleShadowMapMethodBase) : void
      {
         if(_shadowMethod != param1)
         {
            return;
         }
         _shadowMethod = null;
         _shadowDirty = true;
      }
      
      public function rotationTo(param1:Number, param2:Number) : void
      {
         setRotation(getRotation(this.x,this.z,param1,param2));
      }
      
      public function get coordinateAngel() : int
      {
         return _coordinateAngel;
      }
      
      public function set coordinateAngel(param1:int) : void
      {
         _coordinateAngel = param1;
      }
      
      public function setRotation(param1:Number, param2:Boolean = false) : void
      {
         if(param2)
         {
            while(param1 < 0)
            {
               param1 = param1 + 360;
            }
            if(coordinateAngel < 0)
            {
               coordinateAngel = coordinateAngel + 360;
            }
            if(_rotationTweenLite)
            {
               _rotationTweenLite.kill();
               _rotationTweenLite = null;
            }
            if(Math.abs(coordinateAngel - param1) > 180)
            {
               if(coordinateAngel > param1)
               {
                  coordinateAngel = coordinateAngel - 360;
               }
               else if(coordinateAngel < param1)
               {
                  param1 = param1 - 360;
               }
            }
            _rotationTweenLite = TweenLite.to(this,rotationTweenDurationFrame,{
               "coordinateAngel":param1,
               "onUpdate":onRotationUpdate,
               "useFrames":true
            });
         }
         else
         {
            if(_rotationTweenLite)
            {
               _rotationTweenLite.kill();
               _rotationTweenLite = null;
            }
            coordinateAngel = param1;
            onRotationUpdate();
         }
      }
      
      protected function onRotationUpdate() : void
      {
         rotationY = -coordinateAngel - 90;
      }
      
      public function get shadowDirty() : Boolean
      {
         return _shadowDirty;
      }
      
      public function set shadowDirty(param1:Boolean) : void
      {
         _shadowDirty = param1;
      }
      
      public function get specterData() : Specter3DConfig
      {
         return _specterData;
      }
      
      public function set specterData(param1:Specter3DConfig) : void
      {
         _specterData = param1;
      }
      
      public function get subMeshV() : Vector.<Mesh>
      {
         return _meshVec;
      }
      
      public function updateScenePostion(param1:View3D) : void
      {
      }
      
      public function setVisible(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      protected function onMouse3DOver(param1:MouseEvent3D) : void
      {
      }
      
      protected function onMoust3DDown(param1:MouseEvent3D) : void
      {
      }
      
      protected function onMoust3DOut(param1:MouseEvent3D) : void
      {
      }
      
      protected function onMoust3DUp(param1:MouseEvent3D) : void
      {
      }
      
      protected function onRender(param1:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:uint = 0;
         var _loc2_:uint = _meshVec.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _meshVec[_loc4_];
            if(_alphaDirty)
            {
               updateAlpha(_loc3_);
            }
            if(_methodDirty && (_addMethodV.length > 0 || _removeMethodV.length > 0))
            {
               updateMethod(_loc3_);
            }
            if(_lightDirty && _lightPicker != null)
            {
               updateLight(_loc3_);
            }
            if(_shadowDirty && _shadowMethod)
            {
               updateShadowMethod(_loc3_);
            }
            _loc4_++;
         }
         _removeMethodV.length > 0 && _loc5_;
         _alphaDirty = false;
         _lightDirty = false;
         _methodDirty = false;
         _shadowDirty = false;
      }
      
      protected function updateAlpha(param1:Mesh) : void
      {
         var _loc2_:TextureMaterial = param1.material as TextureMaterial;
         if(_alphaDirty && _loc2_)
         {
            _loc2_.alpha = alpha;
         }
      }
      
      protected function updateLight(param1:Mesh) : void
      {
         var _loc2_:TextureMaterial = param1.material as TextureMaterial;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.lightPicker = _lightPicker;
      }
      
      protected function updateMethod(param1:Mesh) : void
      {
         var _loc3_:SinglePassMaterialBase = param1.material as SinglePassMaterialBase;
         if(_loc3_ == null)
         {
            return;
         }
         if(_addMethodV && _addMethodV.length)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _addMethodV;
            for each(var _loc4_ in _addMethodV)
            {
               if(!_loc3_.hasMethod(_loc4_))
               {
                  _loc3_.addMethod(_loc4_);
               }
            }
         }
         if(_removeMethodV && _removeMethodV.length)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _removeMethodV;
            for each(var _loc2_ in _removeMethodV)
            {
               if(_loc3_.hasMethod(_loc2_))
               {
                  _loc3_.removeMethod(_loc2_);
               }
            }
         }
      }
      
      protected function updateShadowMethod(param1:Mesh) : void
      {
         var _loc2_:TextureMaterial = param1.material as TextureMaterial;
         if(!_loc2_)
         {
            return;
         }
         param1.castsShadows = true;
         _loc2_.shadowMethod = _shadowMethod;
      }
      
      private function addMouseEventListener() : void
      {
         var _loc2_:* = null;
         var _loc1_:uint = this.numChildren;
         if(!_loc1_)
         {
            return;
         }
         while(_loc1_--)
         {
            _loc2_ = this.getChildAt(_loc1_);
            if(_loc2_ && _loc2_.mouseEnabled && _mouseEnabled)
            {
               _loc2_.addEventListener("mouseOver3d",onMouse3DOver,true);
               _loc2_.addEventListener("mouseOut3d",onMoust3DOut,true);
               _loc2_.addEventListener("mouseDown3d",onMoust3DDown,true);
               _loc2_.addEventListener("mouseUp3d",onMoust3DUp,true);
            }
         }
      }
      
      protected function initialization() : void
      {
         _evtMap = new HashMap();
         _meshVec = new Vector.<Mesh>();
         _addMethodV = new Vector.<EffectMethodBase>();
         _removeMethodV = new Vector.<EffectMethodBase>();
      }
   }
}
