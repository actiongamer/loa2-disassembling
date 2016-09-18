package com.mz.core.mgrs
{
   import com.mz.core.configs.ClientConfig;
   import flash.utils.ByteArray;
   
   public class VerListMgr
   {
      
      public static const KEY_START_VER:String = "START_VER";
      
      private static var _ins:com.mz.core.mgrs.VerListMgr;
       
      
      public var isInit:Boolean = false;
      
      private var startVer:int = 1;
      
      private var verOb:Object;
      
      public function VerListMgr()
      {
         verOb = {};
         super();
      }
      
      public static function get ins() : com.mz.core.mgrs.VerListMgr
      {
         if(_ins == null)
         {
            _ins = new com.mz.core.mgrs.VerListMgr();
         }
         return _ins;
      }
      
      public function init(param1:String) : void
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc5_:* = null;
         if(isInit)
         {
            return;
         }
         isInit = true;
         var _loc3_:Array = param1.split("\r\n");
         _loc3_.shift();
         var _loc6_:int = _loc3_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = _loc3_[_loc7_];
            _loc2_ = _loc4_.lastIndexOf(":");
            _loc5_ = _loc4_.substring(0,_loc2_);
            if(_loc5_ == "START_VER")
            {
               startVer = int(_loc4_.substring(_loc2_ + 1,_loc4_.length));
            }
            else if(_loc5_)
            {
               verOb[_loc5_] = _loc4_.substring(_loc2_ + 1,_loc4_.length);
            }
            _loc7_++;
         }
      }
      
      public function getVer(param1:String) : int
      {
         if(isInit)
         {
            param1 = param1.replace(ClientConfig.publishPath,"");
            if(verOb.hasOwnProperty(param1))
            {
               return verOb[param1];
            }
            return startVer;
         }
         return 0;
      }
      
      public function addUrlVer(param1:String) : String
      {
         var _loc2_:String = "v=" + com.mz.core.mgrs.VerListMgr.ins.getVer(param1);
         if(param1.indexOf("?") == -1)
         {
            param1 = param1 + ("?" + _loc2_);
         }
         else
         {
            param1 = param1 + ("&" + _loc2_);
         }
         return param1;
      }
      
      public function getAllUrl(param1:String, param2:Boolean = false) : String
      {
         var _loc3_:* = null;
         var _loc4_:int = getVer(param1);
         if(param2 == false && ClientConfig.airData != null)
         {
            _loc3_ = ClientConfig.airData.checkFile(param1,_loc4_);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         var _loc5_:String = "v=" + _loc4_;
         if(param1.indexOf("?") < 0)
         {
            param1 = param1 + "?" + _loc5_;
         }
         else
         {
            param1 = param1 + "&" + _loc5_;
         }
         return ClientConfig.publishPath + param1;
      }
      
      public function saveFile(param1:String, param2:ByteArray) : void
      {
         if(ClientConfig.airData != null)
         {
            ClientConfig.airData.setFileVersion(param1,getVer(param1),param2);
         }
      }
   }
}
