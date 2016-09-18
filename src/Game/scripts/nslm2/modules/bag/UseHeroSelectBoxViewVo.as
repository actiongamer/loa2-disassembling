package nslm2.modules.bag
{
   import nslm2.common.vo.WealthVo;
   
   public class UseHeroSelectBoxViewVo
   {
       
      
      public var wealthVo:WealthVo;
      
      public var count:uint;
      
      public var cplHandler;
      
      public var startHandler;
      
      public function UseHeroSelectBoxViewVo(param1:WealthVo, param2:int = 1, param3:* = null, param4:* = null)
      {
         super();
         wealthVo = param1;
         count = param2;
         cplHandler = param3;
         startHandler = param4;
      }
   }
}
