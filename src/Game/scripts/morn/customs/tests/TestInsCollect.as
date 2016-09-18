package morn.customs.tests
{
   import com.mz.core.logging.Log;
   import morn.core.components.Component;
   import org.specter3d.loaders.parsers.data.ShareBitmapData;
   
   public class TestInsCollect
   {
      
      private static var _ins:morn.customs.tests.TestInsCollect;
       
      
      public var insArr:Array;
      
      public function TestInsCollect()
      {
         insArr = [];
         super();
      }
      
      public static function get ins() : morn.customs.tests.TestInsCollect
      {
         if(_ins == null)
         {
            _ins = new morn.customs.tests.TestInsCollect();
         }
         return _ins;
      }
      
      public function debug() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = undefined;
         Log.debug(this,insArr.length);
         var _loc2_:int = this.insArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.insArr[_loc3_];
            if(_loc1_ is Component)
            {
               Log.debug(this,debugTree(_loc1_ as Component));
            }
            else if(_loc1_ is ShareBitmapData)
            {
               Log.debug(this,(_loc1_ as ShareBitmapData).url);
            }
            _loc3_++;
         }
      }
      
      public function debugTree(param1:Component) : String
      {
         var _loc2_:String = "";
         _loc2_ = _loc2_ + (String(param1) + param1.isDisposed);
         if(param1.parent)
         {
            if(param1.parent is Component)
            {
               _loc2_ = _loc2_ + (" " + debugTree(param1.parent as Component));
            }
            else
            {
               _loc2_ = _loc2_ + (" noc " + param1.parent);
            }
         }
         return _loc2_;
      }
   }
}
