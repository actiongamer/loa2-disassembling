package nslm2.common.configs
{
   import flash.utils.Dictionary;
   import flash.system.System;
   
   public class StcLanguageConfig
   {
      
      private static var _ins:nslm2.common.configs.StcLanguageConfig;
       
      
      private var lanDic:Dictionary;
      
      public var userNames:Array;
      
      public function StcLanguageConfig()
      {
         super();
      }
      
      public static function get ins() : nslm2.common.configs.StcLanguageConfig
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.configs.StcLanguageConfig();
         }
         return _ins;
      }
      
      public function getLanguage(param1:int) : String
      {
         if(lanDic == null)
         {
            return "";
         }
         return lanDic[param1];
      }
      
      public function parseXMl(param1:XML) : void
      {
         var _loc2_:* = null;
         lanDic = new Dictionary();
         var _loc3_:XMLList = param1..lan;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(_loc2_ in _loc3_)
         {
            lanDic[int(_loc2_.@id)] = _loc2_.toString();
         }
         userNames = String(param1.names.@name).split(",");
         System.disposeXML(param1);
      }
   }
}
