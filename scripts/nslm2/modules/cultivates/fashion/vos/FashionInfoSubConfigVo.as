package nslm2.modules.cultivates.fashion.vos
{
   public class FashionInfoSubConfigVo
   {
       
      
      public var subId:int;
      
      public var nameCN:String;
      
      public var avatarVisible:Boolean;
      
      public var showAccList:Boolean;
      
      public var bgUrl:String;
      
      public function FashionInfoSubConfigVo(param1:int, param2:String, param3:Boolean, param4:Boolean, param5:String)
      {
         super();
         subId = param1;
         nameCN = param2;
         avatarVisible = param3;
         showAccList = param4;
         bgUrl = param5;
      }
   }
}
