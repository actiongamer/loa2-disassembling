package nslm2.common.scene.multiLayer.configs
{
   class BgConfigVoUtil
   {
       
      
      function BgConfigVoUtil()
      {
         super();
      }
      
      public static function parseXMLStr(param1:String, param2:String) : String
      {
         if(param1 == "" || param1 == null)
         {
            return param2;
         }
         return String(param1);
      }
      
      public static function parseXMLInt(param1:String, param2:int) : int
      {
         if(param1 == "" || param1 == null)
         {
            return param2;
         }
         return int(param1);
      }
      
      public static function parseXMLNumber(param1:String, param2:Number) : Number
      {
         if(param1 == "" || param1 == null)
         {
            return param2;
         }
         var _loc3_:Number = param1;
         if(isNaN(_loc3_))
         {
            return param2;
         }
         return _loc3_;
      }
   }
}
