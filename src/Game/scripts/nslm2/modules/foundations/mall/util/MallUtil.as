package nslm2.modules.foundations.mall.util
{
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import proto.mallItem;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class MallUtil
   {
       
      
      public function MallUtil()
      {
         super();
      }
      
      public static function getBuyLimit(param1:StcMallItemVo, param2:int) : int
      {
         var _loc6_:* = null;
         var _loc3_:String = param1.num_con;
         var _loc4_:Array = _loc3_.split("|");
         var _loc8_:int = 0;
         var _loc7_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            _loc6_ = _loc5_.split(":");
            if(_loc6_.length > 1 && _loc6_[0] == param2)
            {
               return _loc6_[1];
            }
         }
         return 0;
      }
      
      public static function parseMallItemToMallItemVo(param1:mallItem) : MallItemVo
      {
         var _loc3_:MallItemVo = new MallItemVo();
         var _loc2_:StcMallItemVo = new StcMallItemVo();
         _loc2_.items = param1.items;
         _loc2_.old_price = param1.oldPrice;
         _loc2_.now_price = param1.nowPrice;
         _loc2_.buy_con = param1.buyCon;
         _loc2_.num_con = param1.numCon;
         _loc2_.position = param1.position;
         _loc2_.max_buy = getCanBuyMaxCount(_loc2_.items);
         _loc3_.stcMallItemVo = _loc2_;
         _loc3_.id = param1.id;
         _loc3_.position = param1.position;
         _loc3_.disCount = param1.discount;
         _loc3_.banner = param1.banner;
         return _loc3_;
      }
      
      public static function getCanBuyMaxCount(param1:String) : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = StcMgr.ins.getMallItemTable().array;
         for each(var _loc2_ in StcMgr.ins.getMallItemTable().array)
         {
            if(_loc2_.items == param1)
            {
               return _loc2_.max_buy;
            }
         }
         return 999;
      }
   }
}
