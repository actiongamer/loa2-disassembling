package com.mz.core.mgrs.resMgrs
{
   import morn.core.utils.PathUtil;
   
   public class ResTypes
   {
      
      public static const BMD:int = 1;
      
      public static const SWF:int = 3;
      
      public static const UIBA:int = 32;
      
      public static const UIBAZ:int = 33;
      
      public static const SSD:int = 34;
      
      public static const TXT:int = 8;
      
      public static const XML:int = 82;
      
      public static const ZIP:int = 9;
      
      public static const BYTE:int = 10;
      
      public static const LUA:int = 12;
      
      public static const JSON:int = 13;
      
      public static const ZIP_BA:int = 19;
      
      public static const DB:int = 25;
      
      public static const EFFECT2D:int = 14;
      
      public static const EFF_BM:int = 15;
      
      public static const BMC_CLASS:int = 16;
      
      public static const MC_CLASS:int = 17;
       
      
      public function ResTypes()
      {
         super();
      }
      
      public static function getTypeByUrl(param1:String) : int
      {
         var _loc2_:String = PathUtil.parseSuffix(param1);
         var _loc3_:* = _loc2_;
         if("jpg" !== _loc3_)
         {
            if("png" !== _loc3_)
            {
               if("txt" !== _loc3_)
               {
                  if("xml" !== _loc3_)
                  {
                     if("swf" !== _loc3_)
                     {
                        if("zip" !== _loc3_)
                        {
                           if("json" !== _loc3_)
                           {
                              if("lua" !== _loc3_)
                              {
                                 if("ba" !== _loc3_)
                                 {
                                    if("uiba" !== _loc3_)
                                    {
                                       if("uibaz" !== _loc3_)
                                       {
                                          if("ssd" !== _loc3_)
                                          {
                                             return 0;
                                          }
                                          return 34;
                                       }
                                       return 33;
                                    }
                                    return 32;
                                 }
                                 return 19;
                              }
                              return 12;
                           }
                           return 13;
                        }
                        return 9;
                     }
                     return 3;
                  }
                  return 82;
               }
               return 8;
            }
         }
         return 1;
      }
   }
}
