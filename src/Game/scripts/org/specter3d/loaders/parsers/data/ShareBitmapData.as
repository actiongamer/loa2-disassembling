package org.specter3d.loaders.parsers.data
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.tests.TestInsCollect;
   import org.specter3d.debug.DevLog;
   
   public class ShareBitmapData extends BitmapData
   {
      
      private static const RECT:Rectangle = new Rectangle();
       
      
      public var url:String;
      
      private var _isDisposed:Boolean;
      
      public function ShareBitmapData(param1:int, param2:int, param3:Boolean = true, param4:uint = 4294967295)
      {
         super(param1,param2,param3,param4);
         if(EnvConfig.ins.showDebugModule)
         {
            TestInsCollect.ins.insArr.push(this);
         }
      }
      
      override public function clone() : BitmapData
      {
         return this;
      }
      
      public function dispose_real() : void
      {
         if(_isDisposed)
         {
            return;
         }
         if(EnvConfig.ins.showDebugModule)
         {
            ArrayUtil.removeItem(TestInsCollect.ins.insArr,this);
         }
         _isDisposed = true;
         super.dispose();
      }
      
      override public function dispose() : void
      {
      }
      
      public function get isDisposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function printError() : void
      {
         DevLog.error(url + "位图已销毁");
      }
      
      override public function get rect() : Rectangle
      {
         if(_isDisposed)
         {
            printError();
            return RECT;
         }
         return super.rect;
      }
      
      override public function get transparent() : Boolean
      {
         if(_isDisposed)
         {
            printError();
            return true;
         }
         return super.transparent;
      }
      
      override public function get width() : int
      {
         if(_isDisposed)
         {
            printError();
            return 0;
         }
         return super.width;
      }
      
      override public function get height() : int
      {
         if(_isDisposed)
         {
            printError();
            return 0;
         }
         return super.height;
      }
   }
}
