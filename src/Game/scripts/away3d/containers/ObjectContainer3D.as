package away3d.containers
{
   import away3d.core.base.Object3D;
   import away3d.library.assets.IAsset;
   import flash.geom.Matrix3D;
   import away3d.core.partition.Partition3D;
   import away3d.events.Object3DEvent;
   import flash.geom.Vector3D;
   import §away3d:arcane§._ancestorsAllowMouseEnabled;
   import §away3d:arcane§.implicitPartition;
   import §away3d:arcane§._oldScene;
   import away3d.entities.Entity;
   import flash.events.Event;
   
   public class ObjectContainer3D extends Object3D implements IAsset
   {
       
      
      var _ancestorsAllowMouseEnabled:Boolean;
      
      var _isRoot:Boolean;
      
      protected var _scene:away3d.containers.Scene3D;
      
      protected var _parent:away3d.containers.ObjectContainer3D;
      
      protected var _sceneTransform:Matrix3D;
      
      protected var _sceneTransformDirty:Boolean = true;
      
      protected var _explicitPartition:Partition3D;
      
      protected var _implicitPartition:Partition3D;
      
      protected var _mouseEnabled:Boolean;
      
      private var _sceneTransformChanged:Object3DEvent;
      
      private var _scenechanged:Object3DEvent;
      
      protected var _children:Vector.<away3d.containers.ObjectContainer3D>;
      
      private var _mouseChildren:Boolean = true;
      
      var _oldScene:away3d.containers.Scene3D;
      
      private var _inverseSceneTransform:Matrix3D;
      
      private var _inverseSceneTransformDirty:Boolean = true;
      
      private var _scenePosition:Vector3D;
      
      private var _scenePositionDirty:Boolean = true;
      
      private var _explicitVisibility:Boolean = true;
      
      private var _implicitVisibility:Boolean = true;
      
      private var _listenToSceneTransformChanged:Boolean;
      
      private var _listenToSceneChanged:Boolean;
      
      protected var _ignoreTransform:Boolean = false;
      
      public var billboard:Boolean;
      
      public function ObjectContainer3D()
      {
         _sceneTransform = new Matrix3D();
         _children = new Vector.<away3d.containers.ObjectContainer3D>();
         _inverseSceneTransform = new Matrix3D();
         _scenePosition = new Vector3D();
         super();
      }
      
      public function get ignoreTransform() : Boolean
      {
         return _ignoreTransform;
      }
      
      public function set ignoreTransform(param1:Boolean) : void
      {
         _ignoreTransform = param1;
         _sceneTransformDirty = !param1;
         _inverseSceneTransformDirty = !param1;
         _scenePositionDirty = !param1;
         if(!param1)
         {
            _sceneTransform.identity();
            _scenePosition.setTo(0,0,0);
         }
      }
      
      function get implicitPartition() : Partition3D
      {
         return _implicitPartition;
      }
      
      function set implicitPartition(param1:Partition3D) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = null;
         if(param1 == _implicitPartition)
         {
            return;
         }
         var _loc3_:uint = _children.length;
         if(param1 == null)
         {
            _implicitPartition = null;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = _children[_loc4_++];
               _loc2_.implicitPartition = null;
            }
            return;
         }
         _implicitPartition = param1;
         _loc4_ = uint(0);
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++];
            if(!_loc2_._explicitPartition)
            {
               _loc2_.implicitPartition = param1;
            }
         }
      }
      
      function get isVisible() : Boolean
      {
         return _implicitVisibility && _explicitVisibility;
      }
      
      function setParent(param1:away3d.containers.ObjectContainer3D) : void
      {
         _parent = param1;
         updateMouseChildren();
         if(param1 == null)
         {
            scene = null;
            return;
         }
         notifySceneTransformChange();
         notifySceneChange();
      }
      
      private function notifySceneTransformChange() : void
      {
         var _loc2_:int = 0;
         if(_sceneTransformDirty || _ignoreTransform)
         {
            return;
         }
         invalidateSceneTransform();
         var _loc1_:uint = _children.length;
         while(_loc2_ < _loc1_)
         {
            _children[_loc2_++].notifySceneTransformChange();
         }
         if(_listenToSceneTransformChanged)
         {
            if(!_sceneTransformChanged)
            {
               _sceneTransformChanged = new Object3DEvent("scenetransformChanged",this);
            }
            dispatchEvent(_sceneTransformChanged);
         }
      }
      
      private function notifySceneChange() : void
      {
         var _loc2_:int = 0;
         notifySceneTransformChange();
         var _loc1_:uint = _children.length;
         while(_loc2_ < _loc1_)
         {
            _children[_loc2_++].notifySceneChange();
         }
         if(_listenToSceneChanged)
         {
            if(!_scenechanged)
            {
               _scenechanged = new Object3DEvent("sceneChanged",this);
            }
            dispatchEvent(_scenechanged);
         }
      }
      
      protected function updateMouseChildren() : void
      {
         var _loc2_:* = 0;
         if(_parent && !_parent._isRoot)
         {
            _ancestorsAllowMouseEnabled = parent._ancestorsAllowMouseEnabled && _parent.mouseChildren;
         }
         else
         {
            _ancestorsAllowMouseEnabled = mouseChildren;
         }
         var _loc1_:uint = _children.length;
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _children[_loc2_].updateMouseChildren();
            _loc2_++;
         }
      }
      
      public function get mouseEnabled() : Boolean
      {
         return _mouseEnabled;
      }
      
      public function set mouseEnabled(param1:Boolean) : void
      {
         _mouseEnabled = param1;
         updateMouseChildren();
      }
      
      override function invalidateTransform() : void
      {
         super.invalidateTransform();
         notifySceneTransformChange();
      }
      
      protected function invalidateSceneTransform() : void
      {
         _sceneTransformDirty = !_ignoreTransform;
         _inverseSceneTransformDirty = !_ignoreTransform;
         _scenePositionDirty = !_ignoreTransform;
      }
      
      protected function updateSceneTransform() : void
      {
         var _loc4_:* = undefined;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc1_:Number = NaN;
         if(_parent && !_parent._isRoot)
         {
            _sceneTransform.copyFrom(_parent.sceneTransform);
            _sceneTransform.prepend(transform);
            if(billboard)
            {
               _loc4_ = _sceneTransform.decompose();
               _sceneTransform.identity();
               _loc2_ = _loc4_[2].x == 0?1:Number(_loc4_[2].x);
               _loc3_ = _loc4_[2].y == 0?1:Number(_loc4_[2].y);
               _loc1_ = _loc4_[2].z == 0?1:Number(_loc4_[2].z);
               _sceneTransform.position = _loc4_[0];
               _sceneTransform.prependScale(_loc2_,_loc3_,_loc1_);
               _sceneTransform.prependRotation(0.1,Vector3D.Y_AXIS);
            }
         }
         else
         {
            _sceneTransform.copyFrom(transform);
         }
         _sceneTransformDirty = false;
      }
      
      public function get mouseChildren() : Boolean
      {
         return _mouseChildren;
      }
      
      public function set mouseChildren(param1:Boolean) : void
      {
         _mouseChildren = param1;
         updateMouseChildren();
      }
      
      public final function get visible() : Boolean
      {
         return _explicitVisibility;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc3_:* = 0;
         var _loc2_:uint = _children.length;
         _explicitVisibility = param1;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _children[_loc3_].updateImplicitVisibility();
            _loc3_++;
         }
      }
      
      public function get assetType() : String
      {
         return "container";
      }
      
      public final function get scenePosition() : Vector3D
      {
         if(_scenePositionDirty)
         {
            sceneTransform.copyColumnTo(3,_scenePosition);
            _scenePositionDirty = false;
         }
         return _scenePosition;
      }
      
      public function get isScenePositionDirty() : Boolean
      {
         return _scenePositionDirty;
      }
      
      public function get minX() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].minX;
            if(_loc2_ < _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get minY() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].minY;
            if(_loc2_ < _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get minZ() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].minZ;
            if(_loc2_ < _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get maxX() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = -Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].maxX;
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get maxY() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = -Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].maxY;
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get maxZ() : Number
      {
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:uint = _children.length;
         var _loc1_:* = -Infinity;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++].maxZ;
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get partition() : Partition3D
      {
         return _explicitPartition;
      }
      
      public function set partition(param1:Partition3D) : void
      {
         _explicitPartition = param1;
         implicitPartition = !!param1?param1:!!_parent?_parent.implicitPartition:null;
      }
      
      public function get sceneTransform() : Matrix3D
      {
         if(_sceneTransformDirty)
         {
            updateSceneTransform();
         }
         return _sceneTransform;
      }
      
      public function get scene() : away3d.containers.Scene3D
      {
         return _scene;
      }
      
      public function set scene(param1:away3d.containers.Scene3D) : void
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _children.length;
         while(_loc3_ < _loc2_)
         {
            _children[_loc3_++].scene = param1;
         }
         if(_scene == param1)
         {
            return;
         }
         if(param1 == null)
         {
            _oldScene = _scene;
         }
         if(_explicitPartition && _oldScene && _oldScene != _scene)
         {
            partition = null;
         }
         if(param1)
         {
            _oldScene = null;
         }
         _scene = param1;
      }
      
      public final function get inverseSceneTransform() : Matrix3D
      {
         if(_inverseSceneTransformDirty)
         {
            _inverseSceneTransform.copyFrom(sceneTransform);
            _inverseSceneTransform.invert();
            _inverseSceneTransformDirty = false;
         }
         return _inverseSceneTransform;
      }
      
      public function get parent() : away3d.containers.ObjectContainer3D
      {
         return _parent;
      }
      
      public function contains(param1:away3d.containers.ObjectContainer3D) : Boolean
      {
         return _children.indexOf(param1) >= 0;
      }
      
      public function addChild(param1:away3d.containers.ObjectContainer3D) : away3d.containers.ObjectContainer3D
      {
         if(param1 == null)
         {
            throw new Error("Parameter child cannot be null.");
         }
         if(param1._parent)
         {
            param1._parent.removeChild(param1);
         }
         if(!param1._explicitPartition)
         {
            param1.implicitPartition = _implicitPartition;
         }
         param1.setParent(this);
         param1.scene = _scene;
         param1.notifySceneTransformChange();
         param1.updateMouseChildren();
         param1.updateImplicitVisibility();
         _children.push(param1);
         return param1;
      }
      
      public function addChildren(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = rest;
         for each(var _loc2_ in rest)
         {
            addChild(_loc2_);
         }
      }
      
      public function removeChild(param1:away3d.containers.ObjectContainer3D) : void
      {
         if(param1 == null)
         {
            throw new Error("Parameter child cannot be null");
         }
         var _loc2_:int = _children.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         _children.splice(_loc2_,1);
         param1.setParent(null);
         if(!param1._explicitPartition)
         {
            param1.implicitPartition = null;
         }
      }
      
      public function removeChildAt(param1:uint) : void
      {
         var _loc2_:away3d.containers.ObjectContainer3D = _children[param1];
         removeChildInternal(param1,_loc2_);
      }
      
      private function removeChildInternal(param1:uint, param2:away3d.containers.ObjectContainer3D) : void
      {
         _children.splice(param1,1);
         param2.setParent(null);
         if(!param2._explicitPartition)
         {
            param2.implicitPartition = null;
         }
      }
      
      public function getChildAt(param1:uint) : away3d.containers.ObjectContainer3D
      {
         return _children[param1];
      }
      
      public function get numChildren() : uint
      {
         return _children.length;
      }
      
      override public function lookAt(param1:Vector3D, param2:Vector3D = null) : void
      {
         super.lookAt(param1,param2);
         notifySceneTransformChange();
      }
      
      override public function translateLocal(param1:Vector3D, param2:Number) : void
      {
         super.translateLocal(param1,param2);
         notifySceneTransformChange();
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         if(parent)
         {
            parent.removeChild(this);
         }
         var _loc1_:uint = _children.length;
         if(this.implicitPartition)
         {
            this.implicitPartition.removeReference(_children[_loc2_] as Entity);
         }
         this.scene = null;
         this._oldScene = null;
         this.implicitPartition = null;
         while(_loc2_ < _loc1_)
         {
            if((_children[_loc2_] as away3d.containers.ObjectContainer3D).implicitPartition)
            {
               (_children[_loc2_] as away3d.containers.ObjectContainer3D).implicitPartition.removeReference(_children[_loc2_] as Entity);
            }
            (_children[_loc2_] as away3d.containers.ObjectContainer3D).scene = null;
            (_children[_loc2_] as away3d.containers.ObjectContainer3D)._oldScene = null;
            (_children[_loc2_] as away3d.containers.ObjectContainer3D).implicitPartition = null;
            _loc2_++;
         }
      }
      
      override public function clone(param1:Boolean = true) : Object3D
      {
         var _loc4_:* = 0;
         var _loc2_:away3d.containers.ObjectContainer3D = new away3d.containers.ObjectContainer3D();
         _loc2_.pivotPoint = pivotPoint;
         _loc2_.transform = transform;
         _loc2_.partition = partition;
         _loc2_.name = name;
         var _loc3_:uint = _children.length;
         _loc4_ = uint(0);
         while(_loc4_ < _loc3_)
         {
            _loc2_.addChild(away3d.containers.ObjectContainer3D(_children[_loc4_].clone()));
            _loc4_++;
         }
         return _loc2_;
      }
      
      override public function rotate(param1:Vector3D, param2:Number) : void
      {
         super.rotate(param1,param2);
         notifySceneTransformChange();
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Boolean = super.dispatchEvent(param1);
         if(param1.bubbles)
         {
            if(_parent)
            {
               _parent.dispatchEvent(param1);
            }
            else if(_scene)
            {
               _scene.dispatchEvent(param1);
            }
         }
         return _loc2_;
      }
      
      public function updateImplicitVisibility() : void
      {
         var _loc2_:* = 0;
         var _loc1_:uint = _children.length;
         _implicitVisibility = _parent._explicitVisibility && _parent._implicitVisibility;
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _children[_loc2_].updateImplicitVisibility();
            _loc2_++;
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         var _loc6_:* = param1;
         if("scenetransformChanged" !== _loc6_)
         {
            if("sceneChanged" === _loc6_)
            {
               _listenToSceneChanged = true;
            }
         }
         else
         {
            _listenToSceneTransformChanged = true;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(hasEventListener(param1))
         {
            return;
         }
         var _loc4_:* = param1;
         if("scenetransformChanged" !== _loc4_)
         {
            if("sceneChanged" === _loc4_)
            {
               _listenToSceneChanged = false;
            }
         }
         else
         {
            _listenToSceneTransformChanged = false;
         }
      }
   }
}
