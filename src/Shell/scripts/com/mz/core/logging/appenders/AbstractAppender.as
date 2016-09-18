package com.mz.core.logging.appenders
{
   import com.mz.core.interFace.IAppender;
   
   public class AbstractAppender implements IAppender
   {
       
      
      private var _parameterExpander:Function;
      
      protected var classFilters:Array;
      
      public var useClass:Boolean;
      
      public function AbstractAppender()
      {
         super();
         useClass = true;
      }
      
      public function addClassFilter(param1:String) : void
      {
      }
      
      public function clearClassFilters() : void
      {
         classFilters = [];
      }
      
      protected function isFiltered(param1:String) : Boolean
      {
         return false;
      }
      
      public function write(param1:int, param2:String, param3:Array) : Boolean
      {
         if(isFiltered(param2))
         {
            return false;
         }
         return true;
      }
      
      public function set parameterExpander(param1:Function) : void
      {
         this._parameterExpander = param1;
      }
   }
}
