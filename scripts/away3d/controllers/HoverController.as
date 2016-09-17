package away3d.controllers
{
   import §away3d:arcane§._currentTiltAngle;
   import §away3d:arcane§._currentPanAngle;
   import flash.geom.Vector3D;
   import away3d.entities.Entity;
   import away3d.containers.ObjectContainer3D;
   
   public class HoverController extends LookAtController
   {
       
      
      var _currentPanAngle:Number = 0;
      
      var _currentTiltAngle:Number = 90;
      
      public var hasTweenStep:Boolean = true;
      
      private var _panAngle:Number = 0;
      
      private var _tiltAngle:Number = 90;
      
      private var _distance:Number = 1000;
      
      private var _minPanAngle:Number = -Infinity;
      
      private var _maxPanAngle:Number = Infinity;
      
      private var _minTiltAngle:Number = -90;
      
      private var _maxTiltAngle:Number = 90;
      
      private var _steps:uint = 8;
      
      private var _yFactor:Number = 2;
      
      private var _wrapPanAngle:Boolean = false;
      
      public function HoverController(param1:Entity = null, param2:ObjectContainer3D = null, param3:Number = 0, param4:Number = 90, param5:Number = 1000, param6:Number = -90, param7:Number = 90, param8:Number = NaN, param9:Number = NaN, param10:uint = 8, param11:Number = 2, param12:Boolean = false)
      {
         super(param1,param2);
         this.distance = param5;
         this.panAngle = param3;
         this.tiltAngle = param4;
         this.minPanAngle = param8 || Number(-Infinity);
         this.maxPanAngle = param9 || Infinity;
         this.minTiltAngle = param6;
         this.maxTiltAngle = param7;
         this.steps = param10;
         this.yFactor = param11;
         this.wrapPanAngle = param12;
         _currentPanAngle = _panAngle;
         _currentTiltAngle = _tiltAngle;
      }
      
      public function get steps() : uint
      {
         return _steps;
      }
      
      public function set steps(param1:uint) : void
      {
         param1 = param1 < 1?1:param1;
         if(_steps == param1)
         {
            return;
         }
         _steps = param1;
         notifyUpdate();
      }
      
      public function get panAngle() : Number
      {
         return _panAngle;
      }
      
      public function set panAngle(param1:Number) : void
      {
         param1 = Math.max(_minPanAngle,Math.min(_maxPanAngle,param1));
         if(_panAngle == param1)
         {
            return;
         }
         _panAngle = param1;
         notifyUpdate();
      }
      
      public function get tiltAngle() : Number
      {
         return _tiltAngle;
      }
      
      public function set tiltAngle(param1:Number) : void
      {
         param1 = Math.max(_minTiltAngle,Math.min(_maxTiltAngle,param1));
         if(_tiltAngle == param1)
         {
            return;
         }
         _tiltAngle = param1;
         notifyUpdate();
      }
      
      public function get distance() : Number
      {
         return _distance;
      }
      
      public function set distance(param1:Number) : void
      {
         if(_distance == param1)
         {
            return;
         }
         _distance = param1;
         notifyUpdate();
      }
      
      public function get minPanAngle() : Number
      {
         return _minPanAngle;
      }
      
      public function set minPanAngle(param1:Number) : void
      {
         if(_minPanAngle == param1)
         {
            return;
         }
         _minPanAngle = param1;
         panAngle = Math.max(_minPanAngle,Math.min(_maxPanAngle,_panAngle));
      }
      
      public function get maxPanAngle() : Number
      {
         return _maxPanAngle;
      }
      
      public function set maxPanAngle(param1:Number) : void
      {
         if(_maxPanAngle == param1)
         {
            return;
         }
         _maxPanAngle = param1;
         panAngle = Math.max(_minPanAngle,Math.min(_maxPanAngle,_panAngle));
      }
      
      public function get minTiltAngle() : Number
      {
         return _minTiltAngle;
      }
      
      public function set minTiltAngle(param1:Number) : void
      {
         if(_minTiltAngle == param1)
         {
            return;
         }
         _minTiltAngle = param1;
         tiltAngle = Math.max(_minTiltAngle,Math.min(_maxTiltAngle,_tiltAngle));
      }
      
      public function get maxTiltAngle() : Number
      {
         return _maxTiltAngle;
      }
      
      public function set maxTiltAngle(param1:Number) : void
      {
         if(_maxTiltAngle == param1)
         {
            return;
         }
         _maxTiltAngle = param1;
         tiltAngle = Math.max(_minTiltAngle,Math.min(_maxTiltAngle,_tiltAngle));
      }
      
      public function get yFactor() : Number
      {
         return _yFactor;
      }
      
      public function set yFactor(param1:Number) : void
      {
         if(_yFactor == param1)
         {
            return;
         }
         _yFactor = param1;
         notifyUpdate();
      }
      
      public function get wrapPanAngle() : Boolean
      {
         return _wrapPanAngle;
      }
      
      public function set wrapPanAngle(param1:Boolean) : void
      {
         if(_wrapPanAngle == param1)
         {
            return;
         }
         _wrapPanAngle = param1;
         notifyUpdate();
      }
      
      override public function update() : void
      {
         if(_tiltAngle != _currentTiltAngle || _panAngle != _currentPanAngle)
         {
            notifyUpdate();
            if(_wrapPanAngle)
            {
               if(_panAngle < 0)
               {
                  _panAngle = _panAngle % 360 + 360;
               }
               else
               {
                  _panAngle = _panAngle % 360;
               }
               if(_panAngle - _currentPanAngle < -180)
               {
                  _currentPanAngle = _currentPanAngle - 360;
               }
               else if(_panAngle - _currentPanAngle > 180)
               {
                  _currentPanAngle = _currentPanAngle + 360;
               }
            }
            if(hasTweenStep)
            {
               _currentTiltAngle = _currentTiltAngle + (_tiltAngle - _currentTiltAngle) / (steps + 1);
               _currentPanAngle = _currentPanAngle + (_panAngle - _currentPanAngle) / (steps + 1);
            }
            else
            {
               _currentTiltAngle = _tiltAngle;
               _currentPanAngle = panAngle;
            }
            if(Math.abs(tiltAngle - _currentTiltAngle) < 0.01 && Math.abs(_panAngle - _currentPanAngle) < 0.01)
            {
               _currentTiltAngle = _tiltAngle;
               _currentPanAngle = _panAngle;
            }
         }
         var _loc1_:Vector3D = !!lookAtObject?lookAtObject.position:!!lookAtPosition?lookAtPosition:_origin;
         targetObject.x = _loc1_.x + distance * Math.sin(_currentPanAngle * 0.0174532925199433) * Math.cos(_currentTiltAngle * 0.0174532925199433);
         targetObject.z = _loc1_.z + distance * Math.cos(_currentPanAngle * 0.0174532925199433) * Math.cos(_currentTiltAngle * 0.0174532925199433);
         targetObject.y = _loc1_.y + distance * Math.sin(_currentTiltAngle * 0.0174532925199433) * yFactor;
         super.update();
      }
   }
}
