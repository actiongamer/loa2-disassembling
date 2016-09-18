package nslm2.inits
{
   import nslm2.common.configs.StcLanguageConfig;
   
   public class InitConfigVo
   {
      
      public static const INIT_ASSET:int = 6;
       
      
      public var key;
      
      public var weight:int;
      
      public var subTip:String;
      
      public function InitConfigVo(param1:*, param2:int)
      {
         super();
         this.key = param1;
         this.weight = param2;
      }
      
      public function toString() : String
      {
         var _loc1_:* = key;
         if(6 !== _loc1_)
         {
            return String(this.key);
         }
         return StcLanguageConfig.ins.getLanguage(999000003);
      }
   }
}
