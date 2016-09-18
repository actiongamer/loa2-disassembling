package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import away3d.loaders.parsers.utils.ParserUtil;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import away3d.events.AssetEvent;
   
   public class DDSParsers extends ParserBase
   {
       
      
      private var _Flags:int;
      
      private var _FourCC:int;
      
      private var _Size1:int;
      
      private var _Size2:int;
      
      private var _depth:int;
      
      private var _dxtFormat:int;
      
      private var _height:int;
      
      private var _output:ByteArray;
      
      private var _sig1:int;
      
      private var _sig2:int;
      
      private var _sig3:int;
      
      private var _sig4:int;
      
      private var _width:int;
      
      private var input:ByteArray;
      
      public function DDSParsers()
      {
         super("binary");
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "dds";
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(input)
         {
            return false;
         }
         input = ParserUtil.toByteArray(_data);
         input.position = 0;
         input.endian = "littleEndian";
         _output = new ByteArray();
         _output.endian = "littleEndian";
         readHeader(input);
         if(!checkHeader())
         {
            trace("解析DDS错误");
            dispatchAssetEvent(null);
            finishParsing();
            return false;
         }
         _output.length = _width * _height * 4;
         if(_dxtFormat == 1)
         {
            DecompressDXT1(input);
         }
         else if(_dxtFormat == 2)
         {
            DecompressDXT5(input);
         }
         else
         {
            dispatchAssetEvent(null);
            finishParsing();
            return false;
         }
         if(_output)
         {
            _output.position = 0;
            _loc2_ = _width;
            _loc3_ = _height;
            _loc1_ = new BitmapData(_loc2_,_loc3_,true,0);
            _loc1_.setPixels(new Rectangle(0,0,_loc2_,_loc3_),_output);
            dispatchAssetEvent(_loc1_);
            input.clear();
            input = null;
            finishParsing();
            return true;
         }
         dispatchAssetEvent(null);
         finishParsing();
         return false;
      }
      
      private function DecompressDXT1(param1:ByteArray) : void
      {
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc18_:int = 0;
         var _loc20_:int = 0;
         var _loc19_:int = 0;
         var _loc21_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc12_:int = 0;
         var _loc17_:int = 0;
         var _loc10_:* = 0;
         var _loc13_:* = 0;
         var _loc7_:* = 0;
         var _loc14_:* = 0;
         var _loc11_:* = undefined;
         var _loc6_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>(4,true);
         var _loc3_:Vector.<int> = new Vector.<int>(4,true);
         var _loc4_:Vector.<int> = new Vector.<int>(4,true);
         var _loc5_:Vector.<int> = new Vector.<int>(4,true);
         _loc2_[3] = 255;
         _loc3_[3] = 255;
         _loc4_[3] = 255;
         _loc16_ = 0;
         while(_loc16_ < _depth)
         {
            _loc18_ = 0;
            while(_loc18_ < _height)
            {
               _loc20_ = 0;
               while(_loc20_ < _width)
               {
                  _loc19_ = param1.readUnsignedShort();
                  _loc21_ = param1.readUnsignedShort();
                  _loc15_ = param1.readUnsignedInt();
                  DxtcReadColor(_loc19_,_loc2_);
                  DxtcReadColor(_loc21_,_loc3_);
                  if(_loc19_ > _loc21_)
                  {
                     _loc4_[2] = (2 * _loc2_[2] + _loc3_[2] + 1) / 3;
                     _loc4_[1] = (2 * _loc2_[1] + _loc3_[1] + 1) / 3;
                     _loc4_[0] = (2 * _loc2_[0] + _loc3_[0] + 1) / 3;
                     _loc5_[2] = (_loc2_[2] + 2 * _loc3_[2] + 1) / 3;
                     _loc5_[1] = (_loc2_[1] + 2 * _loc3_[1] + 1) / 3;
                     _loc5_[0] = (_loc2_[0] + 2 * _loc3_[0] + 1) / 3;
                     _loc5_[3] = 255;
                  }
                  else
                  {
                     _loc4_[2] = (_loc2_[2] + _loc3_[2]) / 2;
                     _loc4_[1] = (_loc2_[1] + _loc3_[1]) / 2;
                     _loc4_[0] = (_loc2_[0] + _loc3_[0]) / 2;
                     _loc5_[2] = (_loc2_[2] + 2 * _loc3_[2] + 1) / 3;
                     _loc5_[1] = (_loc2_[1] + 2 * _loc3_[1] + 1) / 3;
                     _loc5_[0] = (_loc2_[0] + 2 * _loc3_[0] + 1) / 3;
                     _loc5_[3] = 0;
                  }
                  _loc9_ = 0;
                  _loc8_ = 0;
                  while(_loc8_ < 4)
                  {
                     _loc12_ = 0;
                     while(_loc12_ < 4)
                     {
                        _loc17_ = _loc9_ * 2;
                        _loc10_ = _loc15_ & 3 << _loc9_ * 2;
                        _loc13_ = _loc10_ >> _loc17_;
                        if(_loc17_ > 0)
                        {
                           _loc7_ = 2147483648 >> _loc17_ - 1;
                           _loc7_ = int(~_loc7_);
                        }
                        else
                        {
                           _loc7_ = int(4294967295);
                        }
                        _loc14_ = _loc13_ & _loc7_;
                        switch(int(_loc14_))
                        {
                           case 0:
                              _loc11_ = _loc2_;
                              break;
                           case 1:
                              _loc11_ = _loc3_;
                              break;
                           case 2:
                              _loc11_ = _loc4_;
                              break;
                           case 3:
                              _loc11_ = _loc5_;
                        }
                        if(_loc20_ + _loc12_ < _width && _loc18_ + _loc8_ < _height)
                        {
                           _loc6_ = _loc16_ * (_height * _width * 4) + (_loc18_ + _loc8_) * (_width * 4) + (_loc20_ + _loc12_) * 4;
                           _output.position = _loc6_;
                           _output.writeByte(_loc11_[2]);
                           _output.writeByte(_loc11_[1]);
                           _output.writeByte(_loc11_[0]);
                           _output.writeByte(_loc11_[3]);
                        }
                        _loc9_++;
                        _loc12_++;
                     }
                     _loc8_++;
                  }
                  _loc20_ = _loc20_ + 4;
               }
               _loc18_ = _loc18_ + 4;
            }
            _loc16_++;
         }
      }
      
      private function DecompressDXT5(param1:ByteArray) : void
      {
         var _loc20_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc2_:int = 0;
         var _loc17_:* = 0;
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         var _loc21_:int = 0;
         var _loc11_:* = 0;
         var _loc14_:* = 0;
         var _loc8_:* = 0;
         var _loc16_:* = 0;
         var _loc12_:* = undefined;
         var _loc7_:int = 0;
         var _loc18_:* = 0;
         var _loc19_:Vector.<int> = new Vector.<int>(8,true);
         var _loc15_:Vector.<int> = new Vector.<int>(6,true);
         var _loc3_:Vector.<int> = new Vector.<int>(4,true);
         var _loc4_:Vector.<int> = new Vector.<int>(4,true);
         var _loc5_:Vector.<int> = new Vector.<int>(4,true);
         var _loc6_:Vector.<int> = new Vector.<int>(4,true);
         _loc20_ = 0;
         while(_loc20_ < _depth)
         {
            _loc22_ = 0;
            while(_loc22_ < _height)
            {
               _loc23_ = 0;
               while(_loc23_ < _width)
               {
                  if(!(_loc22_ >= _height || _loc23_ >= _width))
                  {
                     _loc19_[0] = param1.readUnsignedByte();
                     _loc19_[1] = param1.readUnsignedByte();
                     _loc15_[0] = param1.readUnsignedByte();
                     _loc15_[1] = param1.readUnsignedByte();
                     _loc15_[2] = param1.readUnsignedByte();
                     _loc15_[3] = param1.readUnsignedByte();
                     _loc15_[4] = param1.readUnsignedByte();
                     _loc15_[5] = param1.readUnsignedByte();
                     _loc2_ = param1.readUnsignedInt();
                     DxtcReadColors(_loc2_,_loc3_,_loc4_);
                     _loc17_ = uint(param1.readUnsignedInt());
                     _loc5_[2] = (2 * _loc3_[2] + _loc4_[2] + 1) / 3;
                     _loc5_[1] = (2 * _loc3_[1] + _loc4_[1] + 1) / 3;
                     _loc5_[0] = (2 * _loc3_[0] + _loc4_[0] + 1) / 3;
                     _loc6_[2] = (_loc3_[2] + 2 * _loc4_[2] + 1) / 3;
                     _loc6_[1] = (_loc3_[1] + 2 * _loc4_[1] + 1) / 3;
                     _loc6_[0] = (_loc3_[0] + 2 * _loc4_[0] + 1) / 3;
                     _loc10_ = 0;
                     _loc9_ = 0;
                     _loc13_ = 0;
                     _loc9_ = 0;
                     while(_loc9_ < 4)
                     {
                        _loc13_ = 0;
                        while(_loc13_ < 4)
                        {
                           _loc21_ = _loc10_ * 2;
                           _loc11_ = _loc17_ & 3 << _loc10_ * 2;
                           _loc14_ = _loc11_ >> _loc21_;
                           if(_loc21_ > 0)
                           {
                              _loc8_ = 2147483648 >> _loc21_ - 1;
                              _loc8_ = int(~_loc8_);
                           }
                           else
                           {
                              _loc8_ = int(4294967295);
                           }
                           _loc16_ = _loc14_ & _loc8_;
                           switch(int(_loc16_))
                           {
                              case 0:
                                 _loc12_ = _loc3_;
                                 break;
                              case 1:
                                 _loc12_ = _loc4_;
                                 break;
                              case 2:
                                 _loc12_ = _loc5_;
                                 break;
                              case 3:
                                 _loc12_ = _loc6_;
                           }
                           if(_loc23_ + _loc13_ < _width && _loc22_ + _loc9_ < _height)
                           {
                              _loc7_ = _loc20_ * (_height * _width * 4) + (_loc22_ + _loc9_) * (_width * 4) + (_loc23_ + _loc13_) * 4;
                              _output.position = _loc7_;
                              _output.writeByte(_loc12_[2]);
                              _output.writeByte(_loc12_[1]);
                              _output.writeByte(_loc12_[0]);
                           }
                           _loc10_++;
                           _loc13_++;
                        }
                        _loc9_++;
                     }
                     if(_loc19_[0] > _loc19_[1])
                     {
                        _loc19_[2] = (6 * _loc19_[0] + 1 * _loc19_[1] + 3) / 7;
                        _loc19_[3] = (5 * _loc19_[0] + 2 * _loc19_[1] + 3) / 7;
                        _loc19_[4] = (4 * _loc19_[0] + 3 * _loc19_[1] + 3) / 7;
                        _loc19_[5] = (3 * _loc19_[0] + 4 * _loc19_[1] + 3) / 7;
                        _loc19_[6] = (2 * _loc19_[0] + 5 * _loc19_[1] + 3) / 7;
                        _loc19_[7] = (1 * _loc19_[0] + 6 * _loc19_[1] + 3) / 7;
                     }
                     else
                     {
                        _loc19_[2] = (4 * _loc19_[0] + 1 * _loc19_[1] + 2) / 5;
                        _loc19_[3] = (3 * _loc19_[0] + 2 * _loc19_[1] + 2) / 5;
                        _loc19_[4] = (2 * _loc19_[0] + 3 * _loc19_[1] + 2) / 5;
                        _loc19_[5] = (1 * _loc19_[0] + 4 * _loc19_[1] + 2) / 5;
                        _loc19_[6] = 0;
                        _loc19_[7] = 255;
                     }
                     _loc18_ = _loc15_[0] | _loc15_[1] << 8 | _loc15_[2] << 16;
                     _loc9_ = 0;
                     while(_loc9_ < 2)
                     {
                        _loc13_ = 0;
                        while(_loc13_ < 4)
                        {
                           if(_loc23_ + _loc13_ < _width && _loc22_ + _loc9_ < _height)
                           {
                              _loc7_ = _loc20_ * (_height * _width * 4) + (_loc22_ + _loc9_) * (_width * 4) + (_loc23_ + _loc13_) * 4 + 3;
                              _output.position = _loc7_;
                              _output.writeByte(_loc19_[_loc18_ & 7]);
                           }
                           _loc18_ = _loc18_ >> 3;
                           _loc13_++;
                        }
                        _loc9_++;
                     }
                     _loc18_ = _loc15_[3] | _loc15_[4] << 8 | _loc15_[5] << 16;
                     _loc9_ = 2;
                     while(_loc9_ < 4)
                     {
                        _loc13_ = 0;
                        while(_loc13_ < 4)
                        {
                           if(_loc23_ + _loc13_ < _width && _loc22_ + _loc9_ < _height)
                           {
                              _loc7_ = _loc20_ * (_height * _width * 4) + (_loc22_ + _loc9_) * (_width * 4) + (_loc23_ + _loc13_) * 4 + 3;
                              _output.position = _loc7_;
                              _output.writeByte(_loc19_[_loc18_ & 7]);
                           }
                           _loc18_ = _loc18_ >> 3;
                           _loc13_++;
                        }
                        _loc9_++;
                     }
                     _loc23_ = _loc23_ + 4;
                     continue;
                  }
                  break;
               }
               _loc22_ = _loc22_ + 4;
            }
            _loc20_++;
         }
      }
      
      private function DxtcReadColor(param1:int, param2:Vector.<int>) : void
      {
         var _loc4_:* = param1 & 31;
         var _loc3_:* = (param1 & 2016) >> 5;
         var _loc5_:* = (param1 & 63488) >> 11;
         var _loc8_:* = _loc5_ << 3 | _loc5_ >> 2;
         var _loc7_:* = _loc3_ << 2 | _loc3_ >> 3;
         var _loc6_:* = _loc4_ << 3 | _loc5_ >> 2;
         param2[0] = _loc8_;
         param2[1] = _loc7_;
         param2[2] = _loc6_;
      }
      
      private function DxtcReadColors(param1:int, param2:Vector.<int>, param3:Vector.<int>) : void
      {
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc8_:* = 0;
         var _loc13_:* = 0;
         var _loc10_:* = 0;
         var _loc9_:* = 0;
         var _loc4_:* = param1 & 255;
         var _loc5_:* = (param1 & 65280) >> 8;
         var _loc6_:* = (param1 & 16711680) >> 16;
         var _loc7_:* = (param1 & 4278190080) >> 24;
         _loc8_ = _loc4_ & 31;
         _loc12_ = (_loc4_ & 224) >> 5 | (_loc5_ & 7) << 3;
         _loc11_ = (_loc5_ & 248) >> 3;
         _loc9_ = _loc6_ & 31;
         _loc10_ = (_loc6_ & 224) >> 5 | (_loc7_ & 7) << 3;
         _loc13_ = (_loc7_ & 248) >> 3;
         param2[0] = _loc11_ << 3 | _loc11_ >> 2;
         param2[1] = _loc12_ << 2 | _loc12_ >> 3;
         param2[2] = _loc8_ << 3 | _loc8_ >> 2;
         param3[0] = _loc13_ << 3 | _loc13_ >> 2;
         param3[1] = _loc10_ << 2 | _loc10_ >> 3;
         param3[2] = _loc9_ << 3 | _loc9_ >> 2;
      }
      
      private function checkHeader() : Boolean
      {
         if(_sig1 != 68 || _sig2 != 68 || _sig3 != 83)
         {
            return false;
         }
         if(_width == 0 || _height == 0)
         {
            return false;
         }
         if(_Flags != 4)
         {
            return false;
         }
         if(_FourCC == 827611204)
         {
            _dxtFormat = 1;
         }
         else if(_FourCC == 894720068)
         {
            _dxtFormat = 2;
         }
         else
         {
            trace(false,"dds format error");
            return false;
         }
         return true;
      }
      
      private function dispatchAssetEvent(param1:*) : void
      {
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",param1));
         }
      }
      
      private function readHeader(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         _sig1 = param1.readUnsignedByte();
         _sig2 = param1.readUnsignedByte();
         _sig3 = param1.readUnsignedByte();
         _sig4 = param1.readUnsignedByte();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         _height = param1.readUnsignedInt();
         _width = param1.readUnsignedInt();
         param1.readUnsignedInt();
         _depth = param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         _loc2_ = 0;
         while(_loc2_ < 10)
         {
            param1.readUnsignedInt();
            _loc2_++;
         }
         param1.readUnsignedInt();
         _Flags = param1.readUnsignedInt();
         _FourCC = param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         param1.readUnsignedInt();
         if(_depth == 0)
         {
            _depth = 1;
         }
      }
   }
}
