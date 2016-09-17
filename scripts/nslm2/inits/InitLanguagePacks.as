package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.utils.ByteArray;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class InitLanguagePacks extends TaskBase
   {
       
      
      public function InitLanguagePacks(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         ResMgr.ins.load(10,"MornUI_Language.ba",get_onComplete);
      }
      
      private function get_onComplete(param1:String, param2:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.endian = "littleEndian";
         _loc4_.writeBytes(param2,0,param2.length);
         _loc4_.uncompress("lzma");
         while(true)
         {
            _loc3_ = _loc4_.readUnsignedInt();
            _loc6_ = _loc4_.readUTFBytes(_loc3_);
            _loc7_ = _loc4_.readUnsignedInt();
            _loc5_ = _loc4_.readUTFBytes(_loc7_);
            LocaleMgr.mornUILanguageMap.put(_loc6_,_loc5_);
            if(_loc4_.bytesAvailable != 0)
            {
               continue;
            }
            break;
         }
         this.onComplete();
      }
   }
}
