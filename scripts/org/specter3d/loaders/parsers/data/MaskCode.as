package org.specter3d.loaders.parsers.data
{
   public class MaskCode
   {
       
      
      private var _index:int;
      
      private var _attrName:String;
      
      public function MaskCode(param1:String)
      {
         super();
         this._attrName = param1;
      }
      
      public function set index(param1:int) : void
      {
         _index = param1;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function toString() : String
      {
         return _attrName;
      }
   }
}
