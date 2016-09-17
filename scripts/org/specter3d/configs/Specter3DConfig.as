package org.specter3d.configs
{
   import flash.events.EventDispatcher;
   
   public class Specter3DConfig extends EventDispatcher
   {
       
      
      private var _elementType:int;
      
      private var _uid:String;
      
      private var _version:String;
      
      public function Specter3DConfig(param1:int)
      {
         super();
         this._elementType = param1;
      }
      
      public function get elementType() : int
      {
         return _elementType;
      }
      
      public function get uid() : String
      {
         return _uid;
      }
      
      public function set uid(param1:String) : void
      {
         _uid = param1;
      }
      
      public function get version() : String
      {
         return _version;
      }
      
      public function set version(param1:String) : void
      {
         _version = param1;
      }
   }
}
