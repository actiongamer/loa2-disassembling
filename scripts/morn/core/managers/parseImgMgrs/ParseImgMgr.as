package morn.core.managers.parseImgMgrs
{
   import flash.display.BitmapData;
   import com.mz.core.utils.DictHash;
   import flash.utils.ByteArray;
   import com.mz.core.net.LoadByteTask;
   import flash.system.LoaderContext;
   import flash.system.ApplicationDomain;
   import morn.core.handlers.Handler;
   import morn.customs.tests.TestTimerCount;
   import flash.display.Bitmap;
   
   public class ParseImgMgr
   {
      
      private static var _ins:morn.core.managers.parseImgMgrs.ParseImgMgr;
       
      
      private var fake:BitmapData;
      
      private var isLoading:Boolean = false;
      
      private var list:DictHash;
      
      public function ParseImgMgr()
      {
         fake = new BitmapData(100,100,true,4278255360);
         list = new DictHash();
         super();
      }
      
      public static function get ins() : morn.core.managers.parseImgMgrs.ParseImgMgr
      {
         if(_ins == null)
         {
            _ins = new morn.core.managers.parseImgMgrs.ParseImgMgr();
         }
         return _ins;
      }
      
      public function add(param1:String, param2:ByteArray, param3:*) : void
      {
         var _loc4_:ParseImgMgrVo = new ParseImgMgrVo(param1,param2,param3);
         new LoadByteTask(_loc4_.ba,new LoaderContext(false,ApplicationDomain.currentDomain)).addCompleteHandler(new Handler(loadBaCpl,[_loc4_])).exec();
      }
      
      private function doLoop() : void
      {
         TestTimerCount.ins.start();
         var _loc1_:ParseImgMgrVo = list.array[0];
         new LoadByteTask(_loc1_.ba,new LoaderContext(false,ApplicationDomain.currentDomain)).addCompleteHandler(new Handler(loadBaCpl,[_loc1_])).exec();
      }
      
      private function loadBaCpl(param1:ParseImgMgrVo, param2:LoadByteTask) : void
      {
         var _loc3_:BitmapData = (param2.loader.content as Bitmap).bitmapData;
         var _loc4_:int = _loc3_.width;
         Handler.execute(param1.handler,[_loc3_]);
      }
   }
}
