package nslm2.modules.foundations
{
   public class FloatBubbleVo
   {
       
      
      public var typeId:int;
      
      public var functionId:int;
      
      public var leastShowLevel:int;
      
      public var maxShowLevel:int;
      
      public var languageId:int;
      
      public function FloatBubbleVo(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         typeId = param1;
         functionId = param2;
         leastShowLevel = param3;
         maxShowLevel = param4;
         languageId = param5;
      }
   }
}
