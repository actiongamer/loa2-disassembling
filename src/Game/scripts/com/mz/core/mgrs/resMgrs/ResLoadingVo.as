package com.mz.core.mgrs.resMgrs
{
   import morn.core.handlers.HandlerBatch;
   
   class ResLoadingVo
   {
       
      
      public var type:int;
      
      public var url:String;
      
      public var isSustained:Boolean;
      
      public var handlerBatch:HandlerBatch;
      
      function ResLoadingVo()
      {
         handlerBatch = new HandlerBatch();
         super();
      }
   }
}
