package nslm2.common.model
{
   public class ChangePlayerWealthVo
   {
       
      
      public var kind:int;
      
      public var count:Number;
      
      public function ChangePlayerWealthVo(param1:int, param2:Number)
      {
         super();
         this.kind = param1;
         this.count = param2;
      }
   }
}
