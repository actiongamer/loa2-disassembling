package com.mz.core.utils2
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import org.qrcode.QRCode;
   import flash.geom.Rectangle;
   
   public class QRUBitmap extends Bitmap
   {
      
      private static const URL:String = "http://weixin.qq.com/r/rEN9ZZjEVsUprdwG9xa_?server_id={0}&player_id={0}";
       
      
      public function QRUBitmap(param1:BitmapData = null, param2:Boolean = false, param3:Rectangle = null, param4:String = "auto", param5:Boolean = false)
      {
         super(param1,param4,param5);
      }
      
      public static function createImg(param1:*, param2:*) : BitmapData
      {
         var _loc3_:String = "http://weixin.qq.com/r/rEN9ZZjEVsUprdwG9xa_?server_id={0}&player_id={0}".replace("{0}",param1);
         _loc3_ = _loc3_.replace("{0}",param2);
         var _loc4_:QRCode = new QRCode();
         _loc4_.encode(_loc3_);
         return _loc4_.bitmapData;
      }
      
      public function init(param1:String, param2:String) : void
      {
         this.bitmapData = createImg(param1,param2);
      }
   }
}
