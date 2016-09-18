package nslm2.common.vo
{
   public class CommonBuyVo
   {
       
      
      public var costVo:nslm2.common.vo.WealthVo;
      
      public var itemVo:nslm2.common.vo.WealthVo;
      
      public var limitCanBuyCount:int;
      
      public function CommonBuyVo(param1:nslm2.common.vo.WealthVo, param2:nslm2.common.vo.WealthVo, param3:int)
      {
         super();
         costVo = param1;
         itemVo = param2;
         limitCanBuyCount = param3;
      }
   }
}
