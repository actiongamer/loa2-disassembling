package away3d.controllers
{
   import away3d.entities.Entity;
   
   public class ControllerBase
   {
       
      
      protected var _autoUpdate:Boolean = true;
      
      protected var _targetObject:Entity;
      
      public function ControllerBase(param1:Entity = null)
      {
         super();
         this.targetObject = param1;
      }
      
      protected function notifyUpdate() : void
      {
         if(_targetObject && _targetObject.implicitPartition && _autoUpdate)
         {
            _targetObject.implicitPartition.markForUpdate(_targetObject);
         }
      }
      
      public function get targetObject() : Entity
      {
         return _targetObject;
      }
      
      public function set targetObject(param1:Entity) : void
      {
         if(_targetObject == param1)
         {
            if(_targetObject && _autoUpdate)
            {
               _targetObject._controller = this;
            }
            return;
         }
         if(_targetObject && _autoUpdate)
         {
            _targetObject._controller = null;
         }
         _targetObject = param1;
         if(_targetObject && _autoUpdate)
         {
            _targetObject._controller = this;
         }
         notifyUpdate();
      }
      
      public function get autoUpdate() : Boolean
      {
         return _autoUpdate;
      }
      
      public function set autoUpdate(param1:Boolean) : void
      {
         if(_autoUpdate == param1)
         {
            return;
         }
         _autoUpdate = param1;
         if(_targetObject)
         {
            if(_autoUpdate)
            {
               _targetObject._controller = this;
            }
            else
            {
               _targetObject._controller = null;
            }
         }
      }
      
      public function update() : void
      {
      }
   }
}
