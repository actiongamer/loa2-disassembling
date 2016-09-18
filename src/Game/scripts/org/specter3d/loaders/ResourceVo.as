package org.specter3d.loaders
{
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import morn.core.handlers.HandlerList;
   import flash.events.ProgressEvent;
   
   public class ResourceVo extends EventDispatcher
   {
      
      public static const URL:String = "url";
      
      public static const START:String = "start";
      
      public static const FINISH:String = "finish";
       
      
      var group:String;
      
      var token:String;
      
      var asynToken:String;
      
      var loadTime:int;
      
      private var _url:String;
      
      public var rawBa:ByteArray;
      
      private var _pure_url:String;
      
      public var level:int = 1;
      
      public var callBackFunction:Function;
      
      public var handlers:HandlerList;
      
      public function ResourceVo(param1:String = null, param2:int = 1, param3:Function = null)
      {
         handlers = new HandlerList();
         super();
         _url = AssetLib.operationUrlByVersion(param1);
         level = param2;
         callBackFunction = param3;
         _pure_url = param1;
      }
      
      public function setRawBa(param1:ByteArray) : ResourceVo
      {
         this.rawBa = param1;
         return this;
      }
      
      public function set url(param1:String) : void
      {
         _url = param1;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function get pure_url() : String
      {
         return _pure_url;
      }
      
      public function progressing(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
   }
}
