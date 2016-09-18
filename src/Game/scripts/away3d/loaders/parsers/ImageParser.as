package away3d.loaders.parsers
{
   import flash.display.Bitmap;
   import flash.utils.ByteArray;
   import flash.display.Loader;
   import away3d.textures.BitmapTexture;
   import §away3d:arcane§._fileName;
   import flash.events.Event;
   
   public class ImageParser extends ParserBase
   {
       
      
      private var _byteData:ByteArray;
      
      private var _startedParsing:Boolean;
      
      private var _doneParsing:Boolean;
      
      private var _loader:Loader;
      
      public function ImageParser()
      {
         super("binary");
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "jpg" || param1 == "jpeg" || param1 == "png" || param1 == "gif" || param1 == "bmp";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         if(param1 is Bitmap)
         {
            return true;
         }
         if(!(param1 is ByteArray))
         {
            return false;
         }
         var _loc2_:ByteArray = param1 as ByteArray;
         _loc2_.position = 0;
         if(_loc2_.readUnsignedShort() == 65496)
         {
            return true;
         }
         _loc2_.position = 0;
         if(_loc2_.readShort() == 16973)
         {
            return true;
         }
         _loc2_.position = 1;
         if(_loc2_.readUTFBytes(3) == "PNG")
         {
            return true;
         }
         _loc2_.position = 0;
         if(_loc2_.readUTFBytes(3) == "GIF" && _loc2_.readShort() == 14393 && _loc2_.readByte() == 97)
         {
            return true;
         }
         return false;
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc1_:* = null;
         if(_data is Bitmap)
         {
            _loc1_ = new BitmapTexture(Bitmap(_data).bitmapData);
            finalizeAsset(_loc1_,_fileName);
            return true;
         }
         _byteData = getByteData();
         if(!_startedParsing)
         {
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener("complete",onLoadComplete);
            _loader.loadBytes(_byteData);
            _startedParsing = true;
         }
         return _doneParsing;
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         var _loc2_:BitmapTexture = new BitmapTexture(Bitmap(_loader.content).bitmapData);
         _loader.contentLoaderInfo.removeEventListener("complete",onLoadComplete);
         _doneParsing = true;
         finalizeAsset(_loc2_,_fileName);
      }
   }
}
