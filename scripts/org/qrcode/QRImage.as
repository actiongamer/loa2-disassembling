package org.qrcode
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class QRImage
   {
       
      
      public function QRImage()
      {
         super();
      }
      
      public static function image(param1:Array, param2:int = 4, param3:int = 2) : BitmapData
      {
         var _loc12_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = param1.length;
         var _loc4_:int = param1[0].length;
         var _loc7_:int = _loc4_ + 2 * param3;
         var _loc6_:int = _loc11_ + 2 * param3;
         var _loc8_:BitmapData = new BitmapData(_loc7_,_loc6_,false,16777215);
         while(_loc10_ < _loc11_)
         {
            _loc12_ = 0;
            while(_loc12_ < _loc4_)
            {
               if(param1[_loc10_][_loc12_] == 1)
               {
                  _loc8_.setPixel(_loc12_ + param3,_loc10_ + param3,0);
               }
               _loc12_++;
            }
            _loc10_++;
         }
         var _loc5_:Matrix = new Matrix();
         _loc5_.scale(param2,param2);
         var _loc9_:BitmapData = new BitmapData(_loc7_ * param2,_loc6_ * param2,false,16777215);
         _loc9_.draw(_loc8_,_loc5_);
         _loc8_.dispose();
         return _loc9_;
      }
   }
}
