package org.specter3d.frameEventTrigger
{
   import org.specter3d.utils.HashMap;
   import away3d.errors.AbstractMethodError;
   
   public class FrameEventTriggerBase
   {
       
      
      private var _eventsMap:HashMap;
      
      protected var _target:String;
      
      private var _attach:String;
      
      protected var _events:String;
      
      public function FrameEventTriggerBase()
      {
         _eventsMap = new HashMap();
         super();
      }
      
      public final function get attach() : String
      {
         return _attach;
      }
      
      public function init(param1:String, param2:String, param3:String) : void
      {
         _target = param1;
         _attach = param2;
         _events = param3;
         parse();
      }
      
      protected function parse() : void
      {
         throw new AbstractMethodError();
      }
      
      public final function getUnitByFrame(param1:uint) : ITriggerUnit
      {
         return _eventsMap.getValue(param1) as ITriggerUnit;
      }
      
      public final function get target() : String
      {
         return _target;
      }
      
      public final function addUnit(param1:uint, param2:ITriggerUnit) : void
      {
         _eventsMap.put(param1,param2);
      }
      
      public final function removeUnit(param1:uint) : void
      {
         _eventsMap.remove(param1);
      }
      
      public final function getTagList() : Array
      {
         return _eventsMap.keySet();
      }
   }
}
