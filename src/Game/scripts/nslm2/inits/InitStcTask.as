package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.utils.ByteArray;
   import nslm2.mgrs.stcMgrs.StcCheck;
   import nslm2.mgrs.stcMgrs.vos.StcLoadingTipsVo;
   
   public class InitStcTask extends TaskBase
   {
       
      
      public function InitStcTask()
      {
         super();
      }
      
      public static function parseData(param1:String) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc6_:Array = param1.split("\n");
         var _loc4_:int = _loc6_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc6_[_loc5_];
            _loc2_.push(_loc3_.split("^"));
            _loc5_++;
         }
         return _loc2_;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         if(EnvConfig.ins.hideForBS || ClientConfig.firstBattle != 1)
         {
            if(EnvConfig.ins.useStaticDev)
            {
               _loc1_ = UrlLib.stcDev();
            }
            else
            {
               _loc1_ = UrlLib.stcAll();
            }
         }
         else
         {
            _loc1_ = UrlLib.stcFirst(EnvConfig.ins.firstBattleType);
         }
         ResMgr.ins.load(10,_loc1_,get_onComplete);
      }
      
      private function get_onComplete(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = null;
         StcMgr.ins.clear();
         var _loc8_:ByteArray = param2 as ByteArray;
         var _loc6_:ByteArray = new ByteArray();
         _loc6_.writeBytes(_loc8_,0,_loc8_.length);
         _loc6_.uncompress();
         while(true)
         {
            _loc4_ = _loc6_.readUnsignedInt();
            _loc5_ = _loc6_.readUnsignedInt();
            _loc3_ = _loc6_.readUTFBytes(_loc4_);
            _loc7_ = _loc6_.readUTFBytes(_loc5_);
            StcMgr.ins.addItemArr(_loc3_.replace(".stc",""),parseData(_loc7_));
            if(_loc6_.bytesAvailable != 0)
            {
               continue;
            }
            break;
         }
         if(EnvConfig.ins.showDevModule)
         {
            new StcCheck().check();
         }
         loadLanguageStc();
      }
      
      private function loadLanguageStc() : void
      {
         var _loc1_:* = null;
         if(EnvConfig.ins.hideForBS || ClientConfig.firstBattle != 1)
         {
            _loc1_ = UrlLib.stcLanguage();
         }
         else
         {
            _loc1_ = UrlLib.stcLanguageFirst();
         }
         ResMgr.ins.load(10,_loc1_,getLanguage_onComplete);
      }
      
      private function getLanguage_onComplete(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc12_:ByteArray = param2 as ByteArray;
         var _loc7_:ByteArray = new ByteArray();
         _loc7_.writeBytes(_loc12_,0,_loc12_.length);
         _loc7_.uncompress();
         while(true)
         {
            _loc4_ = _loc7_.readUnsignedInt();
            _loc6_ = _loc7_.readUnsignedInt();
            _loc3_ = _loc7_.readUTFBytes(_loc4_);
            _loc8_ = _loc7_.readUTFBytes(_loc6_);
            StcMgr.ins.addItemArr(_loc3_.replace(".stc",""),parseData(_loc8_));
            if(_loc7_.bytesAvailable != 0)
            {
               continue;
            }
            break;
         }
         var _loc11_:Array = StcMgr.ins.getLoadingTipsTable().array;
         var _loc9_:int = _loc11_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _loc5_ = _loc11_[_loc10_];
            _loc5_.init();
            _loc10_++;
         }
         if(ClientConfig.mainLoadingPage)
         {
            ClientConfig.mainLoadingPage.tipArr = _loc11_;
         }
         this.onComplete();
      }
   }
}
