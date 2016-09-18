package away3d.textures
{
   import flash.utils.ByteArray;
   
   public class ATFData
   {
      
      public static const TYPE_NORMAL:int = 0;
      
      public static const TYPE_CUBE:int = 1;
       
      
      public var type:int;
      
      public var format:String;
      
      public var width:int;
      
      public var height:int;
      
      public var numTextures:int;
      
      public var data:ByteArray;
      
      public var parsingError:Boolean = false;
      
      public function ATFData(param1:ByteArray)
      {
         var _loc5_:* = false;
         var _loc4_:* = 0;
         super();
         var _loc2_:String = param1.readUTFBytes(3);
         if(_loc2_ != "ATF" || param1.length == 0)
         {
            parsingError = true;
         }
         if(param1[6] == 255)
         {
            param1.position = 12;
         }
         else
         {
            param1.position = 6;
         }
         var _loc6_:uint = param1.readUnsignedByte();
         var _loc3_:* = _loc6_ >> 7;
         var _loc7_:* = _loc6_ & 127;
         switch(int(_loc7_))
         {
            case 0:
            case 1:
               format = "bgra";
               break;
            case 2:
            case 3:
               format = "compressed";
               break;
            case 4:
            case 5:
               format = "compressedAlpha";
               break;
            default:
            default:
            default:
            default:
            default:
            default:
            case 12:
            case 13:
               throw new Error("Invalid ATF format");
         }
         switch(int(_loc3_))
         {
            case 0:
               type = 0;
               break;
            case 1:
               type = 1;
         }
         this.width = Math.pow(2,param1.readUnsignedByte());
         this.height = Math.pow(2,param1.readUnsignedByte());
         this.numTextures = param1.readUnsignedByte();
         this.data = param1;
         if(param1[5] != 0 && param1[6] == 255)
         {
            _loc5_ = (param1[5] & 1) == 1;
            _loc4_ = param1[5] >> 1 & 127;
            this.numTextures = !!_loc5_?1:_loc4_;
         }
      }
      
      public function dispose() : void
      {
         if(data)
         {
            data.clear();
            data = null;
         }
      }
   }
}
