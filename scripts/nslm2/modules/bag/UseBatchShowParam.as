package nslm2.modules.bag
{
   import nslm2.common.vo.WealthVo;
   
   public class UseBatchShowParam
   {
       
      
      public var wealthVo:WealthVo;
      
      public var defaultCount:int = 0;
      
      public var maxCount:int;
      
      public var title:String;
      
      public var useHandler;
      
      public function UseBatchShowParam()
      {
         super();
      }
   }
}
