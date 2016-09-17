package org.specter3d.loaders.parsers.data
{
   import org.specter3d.utils.HashMap;
   
   public class MaskCodeSet
   {
       
      
      private var _beginPosition:int;
      
      private var _endPosition:int;
      
      private var _codeMap:HashMap;
      
      private var _index:int;
      
      private var _before:org.specter3d.loaders.parsers.data.MaskCodeSet;
      
      public function MaskCodeSet(param1:int = 0)
      {
         _codeMap = new HashMap();
         super();
         _beginPosition = param1;
      }
      
      public function getMaskCodeByIndex(param1:int) : MaskCode
      {
         return _codeMap.getValue(param1) as MaskCode;
      }
      
      public function get beginPosition() : int
      {
         return _beginPosition;
      }
      
      public function get codes() : Array
      {
         return _codeMap.values();
      }
      
      public function writeMaskCode(param1:MaskCode) : void
      {
         if(param1)
         {
            _endPosition = Number(_endPosition) + 1;
            param1.index = _beginPosition + Number(_endPosition);
            _codeMap.put(param1.index,param1);
         }
      }
      
      public function clear() : void
      {
         _codeMap.clear();
         _beginPosition = 0;
         _endPosition = 0;
      }
      
      public function get position() : int
      {
         return _endPosition;
      }
      
      public function get before() : org.specter3d.loaders.parsers.data.MaskCodeSet
      {
         return _before;
      }
      
      public function set before(param1:org.specter3d.loaders.parsers.data.MaskCodeSet) : void
      {
         _before = param1;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function set index(param1:int) : void
      {
         _index = param1;
      }
   }
}
