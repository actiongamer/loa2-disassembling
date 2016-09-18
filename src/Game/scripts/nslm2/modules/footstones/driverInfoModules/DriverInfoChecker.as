package nslm2.modules.footstones.driverInfoModules
{
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.system.Capabilities;
   
   public class DriverInfoChecker
   {
      
      public static const DIRECTX:String = "DirectX";
      
      public static const OPENGL:String = "OpenGL";
      
      public static const USERDISABLED:String = "userDisabled";
      
      public static const UNAVAILABLE:String = "unavailable";
      
      public static const OLDDRIVER:String = "oldDriver";
       
      
      public function DriverInfoChecker()
      {
         super();
      }
      
      public function check() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:String = ClientConfig._driverInfo;
         if(_loc2_ == null || _loc2_ == "")
         {
            Log.error(this,"context3D.driverInfo is null");
            checkVersion();
         }
         else if(_loc2_.indexOf("DirectX") >= 0 || _loc2_.indexOf("OpenGL") >= 0)
         {
            checkVersion();
         }
         else
         {
            if(_loc2_.indexOf("userDisabled") >= 0)
            {
               ModuleMgr.ins.showModule(95400,1);
               Log.error(this,"context3D.driverInfo err 1",_loc2_);
               return;
            }
            _loc1_ = true;
            if(_loc1_)
            {
               ModuleMgr.ins.showModule(95400,2);
               Log.error(this,"context3D.driverInfo err 2",_loc2_);
               return;
            }
         }
      }
      
      private function checkVersion() : void
      {
         var _loc6_:Boolean = false;
         var _loc4_:uint = 11;
         var _loc1_:uint = 4;
         var _loc5_:String = Capabilities.version;
         var _loc3_:String = _loc5_.split(" ")[1];
         var _loc2_:uint = int(_loc3_.split(",")[0]);
         var _loc7_:uint = int(_loc3_.split(",")[1]);
         if(_loc2_ > _loc4_)
         {
            _loc6_ = true;
         }
         else if(_loc2_ == _loc4_ && _loc7_ >= _loc1_)
         {
            _loc6_ = true;
         }
         else
         {
            _loc6_ = false;
         }
         if(_loc6_ == false)
         {
         }
      }
   }
}
