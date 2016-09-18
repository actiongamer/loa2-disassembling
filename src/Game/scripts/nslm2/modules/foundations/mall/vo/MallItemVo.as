package nslm2.modules.foundations.mall.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.mall.util.MallUtil;
   
   public class MallItemVo
   {
       
      
      public var id:int;
      
      public var buyCount:int;
      
      public var buyCountGlobal:int;
      
      public var stcMallItemVo:StcMallItemVo;
      
      public var isSpecial:Boolean;
      
      public var isHotSale:Boolean;
      
      public var isNew:Boolean;
      
      public var position:int;
      
      public var disCount:String;
      
      public var banner:String;
      
      public function MallItemVo()
      {
         super();
      }
      
      public function get price() : WealthVo
      {
         var _loc1_:WealthVo = WealthUtil.parseCostStr(stcMallItemVo.now_price,true);
         return _loc1_;
      }
      
      public function get canBuyCount() : int
      {
         var _loc3_:int = stcMallItemVo.max_buy;
         _loc3_ = _loc3_ == 0?999:int(_loc3_);
         var _loc4_:* = -1;
         var _loc2_:int = MallUtil.getBuyLimit(stcMallItemVo,1);
         var _loc1_:int = MallUtil.getBuyLimit(stcMallItemVo,2);
         if(_loc2_)
         {
            _loc4_ = int(_loc2_ - buyCount);
         }
         if(_loc1_)
         {
            _loc3_ = _loc1_ - buyCountGlobal;
         }
         if(_loc4_ != -1)
         {
            if(_loc3_ < _loc4_)
            {
               _loc4_ = _loc3_;
            }
            return _loc4_;
         }
         return _loc3_;
      }
   }
}
