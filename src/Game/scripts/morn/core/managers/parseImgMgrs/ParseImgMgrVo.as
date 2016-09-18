package morn.core.managers.parseImgMgrs
{
   import flash.utils.ByteArray;
   
   public class ParseImgMgrVo
   {
       
      
      public var url:String;
      
      public var ba:ByteArray;
      
      public var handler;
      
      public function ParseImgMgrVo(param1:String, param2:ByteArray, param3:*)
      {
         super();
         this.url = param1;
         this.ba = param2;
         this.handler = param3;
      }
   }
}
