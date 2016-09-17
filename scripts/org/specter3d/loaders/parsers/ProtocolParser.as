package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.utils.HashMap;
   import org.specter3d.loaders.parsers.data.MaskCodeSet;
   import away3d.events.AssetEvent;
   import org.specter3d.loaders.parsers.data.MaskCode;
   import org.specter3d.debug.DevLog;
   
   public class ProtocolParser extends ParserBase
   {
       
      
      private var _bytes:ByteArray;
      
      private var _maskCodeHash:HashMap;
      
      private var _position:int;
      
      private var _before:MaskCodeSet;
      
      public function ProtocolParser()
      {
         super("binary");
         _maskCodeHash = new HashMap();
      }
      
      override protected function proceedParsing() : Boolean
      {
         if(_bytes)
         {
            return false;
         }
         _bytes = getByteData();
         readData();
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_maskCodeHash));
         }
         return true;
      }
      
      private function readData() : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc5_:* = null;
         try
         {
            _loc4_ = _bytes.readUnsignedInt();
            _loc3_ = _bytes.readUnsignedInt();
            _loc2_ = _bytes.readUnsignedInt();
            _loc1_ = 0;
            _loc5_ = new MaskCodeSet(_position);
            if(_before != null)
            {
               _loc5_.before = _before;
            }
            _before = _loc5_;
            _position = _position + _loc3_;
            while(_loc1_ < _loc3_)
            {
               _loc5_.writeMaskCode(new MaskCode(_bytes.readUTFBytes(_bytes.readUnsignedInt())));
               _loc1_++;
            }
            _maskCodeHash.put(_loc4_,_loc5_);
         }
         catch(error:Error)
         {
            DevLog.error("MaskCode.解析失败 !");
         }
      }
   }
}
