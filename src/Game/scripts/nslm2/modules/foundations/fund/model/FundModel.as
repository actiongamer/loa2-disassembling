package nslm2.modules.foundations.fund.model
{
   import nslm2.mgrs.stcMgrs.vos.StcOpenFundVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class FundModel
   {
      
      private static var _ins:nslm2.modules.foundations.fund.model.FundModel;
       
      
      public var hasfund:Boolean;
      
      public var allcount:uint;
      
      public var getrewards:Array;
      
      public var getwelfare:Array;
      
      private const OPEN_FUND_TABLE_ARR:Array = StcMgr.ins.getOpenFundTable().array;
      
      private var _fundArr:Array;
      
      private var _welfareArr:Array;
      
      public function FundModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.fund.model.FundModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.fund.model.FundModel();
         }
         return _ins;
      }
      
      public function getFundArr() : Array
      {
         if(!_fundArr)
         {
            _fundArr = OPEN_FUND_TABLE_ARR.filter(filterFund);
         }
         return _fundArr;
      }
      
      private function filterFund(param1:StcOpenFundVo, param2:int, param3:Array) : Boolean
      {
         if(param1.rewardtype == 100)
         {
            return true;
         }
         return false;
      }
      
      public function getWelfareArr() : Array
      {
         if(!_welfareArr)
         {
            _welfareArr = OPEN_FUND_TABLE_ARR.filter(filterWelfare);
         }
         return _welfareArr;
      }
      
      private function filterWelfare(param1:StcOpenFundVo, param2:int, param3:Array) : Boolean
      {
         if(param1.rewardtype == 101)
         {
            return true;
         }
         return false;
      }
   }
}
