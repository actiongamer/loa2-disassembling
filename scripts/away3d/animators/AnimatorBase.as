package away3d.animators
{
   import flash.events.EventDispatcher;
   import away3d.core.managers.IAnimatorUpdate;
   import away3d.events.AnimatorEvent;
   import away3d.entities.Mesh;
   import away3d.animators.nodes.AnimationNodeBase;
   import away3d.animators.states.IAnimationState;
   import flash.utils.Dictionary;
   import away3d.animators.states.AnimationStateBase;
   import flash.utils.getTimer;
   import org.specter3d.context.AppGlobalContext;
   import away3d.animators.nodes.AnimationClipNodeBase;
   import away3d.animators.states.AnimationClipState;
   import flash.geom.Vector3D;
   
   public class AnimatorBase extends EventDispatcher implements IAnimatorUpdate
   {
       
      
      protected var _isPlaying:Boolean;
      
      private var _autoUpdate:Boolean = true;
      
      private var _startEvent:AnimatorEvent;
      
      private var _stopEvent:AnimatorEvent;
      
      private var _time:int;
      
      private var _playbackSpeed:Number = 1;
      
      private var _cycleEvent:AnimatorEvent;
      
      protected var _animationSet:away3d.animators.IAnimationSet;
      
      protected var _owners:Vector.<Mesh>;
      
      protected var _activeNode:AnimationNodeBase;
      
      protected var _activeState:IAnimationState;
      
      protected var __name:String;
      
      protected var _activeAnimationName:String;
      
      protected var _absoluteTime:Number = 0;
      
      private var _animationStates:Dictionary;
      
      public var updatePosition:Boolean = true;
      
      private var _oldFrame:int = -1;
      
      public var lastSendEventActName:String;
      
      public var isDispose:Boolean = false;
      
      public function AnimatorBase(param1:away3d.animators.IAnimationSet)
      {
         _owners = new Vector.<Mesh>();
         _animationStates = new Dictionary(true);
         super();
         _animationSet = param1;
      }
      
      protected function get _name() : String
      {
         return __name;
      }
      
      protected function set _name(param1:String) : void
      {
         if(__name != param1)
         {
            __name = param1;
            this.lastSendEventActName = null;
         }
      }
      
      public function set absoluteTime(param1:Number) : void
      {
         _absoluteTime = param1;
      }
      
      public function getAnimationState(param1:AnimationNodeBase) : AnimationStateBase
      {
         if(this.isDispose)
         {
            return null;
         }
         var _loc2_:Class = param1.stateClass;
         var _loc3_:* = param1;
         var _loc4_:* = _animationStates[_loc3_] || new _loc2_(this,param1);
         _animationStates[_loc3_] = _loc4_;
         return _loc4_;
      }
      
      public function getAnimationStateByName(param1:String) : AnimationStateBase
      {
         return getAnimationState(_animationSet.getAnimation(param1));
      }
      
      public function get absoluteTime() : Number
      {
         return _absoluteTime;
      }
      
      public function get animationSet() : away3d.animators.IAnimationSet
      {
         return _animationSet;
      }
      
      public function get activeState() : IAnimationState
      {
         return _activeState;
      }
      
      public function get activeAnimation() : AnimationNodeBase
      {
         return _animationSet.getAnimation(_name);
      }
      
      public function get activeAnimationName() : String
      {
         return _name;
      }
      
      public final function get autoUpdate() : Boolean
      {
         return _autoUpdate;
      }
      
      public final function set autoUpdate(param1:Boolean) : void
      {
         if(_autoUpdate == param1)
         {
            return;
         }
         _autoUpdate = param1;
         if(_autoUpdate)
         {
            start();
         }
         else
         {
            stop();
         }
      }
      
      public final function get time() : int
      {
         return _time;
      }
      
      public final function set time(param1:int) : void
      {
         if(_time == param1)
         {
            return;
         }
         update(param1);
      }
      
      public function phase(param1:Number) : void
      {
         _activeState.phase(param1);
      }
      
      public final function get playbackSpeed() : Number
      {
         return _playbackSpeed;
      }
      
      public function set playbackSpeed(param1:Number) : void
      {
         _playbackSpeed = param1;
      }
      
      public function start() : void
      {
         if(_isPlaying || !_autoUpdate)
         {
            return;
         }
         _absoluteTime = getTimer();
         _time = getTimer();
         _isPlaying = true;
         AppGlobalContext.animatorManager.register(this);
         if(!hasEventListener("start"))
         {
            return;
         }
         dispatchEvent(_startEvent || new AnimatorEvent("start",this));
      }
      
      public function stop() : void
      {
         if(!_isPlaying)
         {
            return;
         }
         _isPlaying = false;
         AppGlobalContext.animatorManager.unregister(this);
         if(!hasEventListener("stop"))
         {
            return;
         }
         dispatchEvent(_stopEvent || new AnimatorEvent("stop",this));
      }
      
      public final function update(param1:int, param2:Number = 0) : void
      {
         param2 = param2 * playbackSpeed;
         updateDeltaTime(param2);
         enterAnimator(param1);
         _time = param1;
      }
      
      function set isPlaying(param1:Boolean) : void
      {
         _isPlaying = param1;
      }
      
      public function reset(param1:String, param2:Number = 0) : void
      {
         getAnimationState(_animationSet.getAnimation(param1)).offset(param2 + _absoluteTime);
      }
      
      public function addOwner(param1:Mesh) : void
      {
         _owners.push(param1);
      }
      
      public function removeOwner(param1:Mesh) : void
      {
         _owners.splice(_owners.indexOf(param1),1);
      }
      
      protected function updateDeltaTime(param1:Number) : void
      {
         _absoluteTime = _absoluteTime + param1;
         if(_activeState && _isPlaying)
         {
            _activeState.update(_absoluteTime);
            updatePosition && applyPositionDelta();
         }
      }
      
      public final function enterAnimator(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         if(_activeNode && _activeState)
         {
            _loc3_ = _activeNode as AnimationClipNodeBase;
            _loc5_ = _activeState as AnimationClipState;
            if(_loc3_ && _loc5_)
            {
               if(_loc3_.looping)
               {
                  return;
               }
               _loc2_ = uint(_loc3_.lastFrame - 1);
               _loc4_ = uint(_loc5_.currentFrame);
               if(_loc2_ <= _loc4_)
               {
                  if(!hasEventListener("animator_complete") || lastSendEventActName == this._name)
                  {
                     return;
                  }
                  lastSendEventActName = this._name;
                  dispatchEvent(new AnimatorEvent("animator_complete",this));
               }
            }
         }
      }
      
      public function totalFrame(param1:String) : int
      {
         var _loc2_:AnimationClipNodeBase = _animationSet.getAnimation(param1) as AnimationClipNodeBase;
         return _loc2_.lastFrame - 1;
      }
      
      public function totalTime(param1:String) : int
      {
         var _loc2_:AnimationClipNodeBase = _animationSet.getAnimation(param1) as AnimationClipNodeBase;
         return _loc2_.totalDuration;
      }
      
      private final function applyPositionDelta() : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc1_:Vector3D = _activeState.positionDelta;
         var _loc4_:Number = _loc1_.length;
         if(_loc4_ > 0)
         {
            _loc2_ = uint(_owners.length);
            _loc3_ = uint(0);
            while(_loc3_ < _loc2_)
            {
               _owners[_loc3_].translateLocal(_loc1_,_loc4_);
               _loc3_++;
            }
         }
      }
      
      public function get currentFrame() : int
      {
         var _loc1_:AnimationClipState = _activeState as AnimationClipState;
         return !!_loc1_?_loc1_.currentFrame:-1;
      }
      
      public function dispatchCycleEvent() : void
      {
         if(hasEventListener("cycle_complete"))
         {
            dispatchEvent(_cycleEvent || new AnimatorEvent("cycle_complete",this));
         }
      }
      
      public function dispose() : void
      {
         this.isDispose = true;
         stop();
         AppGlobalContext.animatorManager.unregister(this);
         _animationStates = null;
         _activeNode = null;
      }
      
      public function stopOrStartEnterFrame(param1:Boolean) : void
      {
         if(_isPlaying)
         {
            if(!param1)
            {
               AppGlobalContext.animatorManager.unregister(this);
            }
            else
            {
               AppGlobalContext.animatorManager.register(this);
            }
         }
      }
   }
}
