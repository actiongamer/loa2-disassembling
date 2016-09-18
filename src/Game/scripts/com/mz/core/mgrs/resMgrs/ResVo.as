package com.mz.core.mgrs.resMgrs
{
   public class ResVo
   {
       
      
      public var url:String;
      
      public var type:int;
      
      public var group:int;
      
      public var priority:int;
      
      public function ResVo(param1:String, param2:int = 0, param3:int = 0, param4:int = 2)
      {
         super();
         this.url = param1;
         if(param2)
         {
            this.type = param2;
         }
         else
         {
            this.type = ResTypes.getTypeByUrl(param1);
         }
         this.group = param3;
         this.priority = param4;
      }
   }
}
