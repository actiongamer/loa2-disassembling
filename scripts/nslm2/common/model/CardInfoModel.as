package nslm2.common.model
{
   import com.mz.core.utils.DictHash;
   import proto.CardInfoNotify;
   import proto.CardInfo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.ServerTimer;
   
   public class CardInfoModel
   {
      
      private static var _ins:nslm2.common.model.CardInfoModel;
       
      
      private var cardInfoDict:DictHash;
      
      public function CardInfoModel()
      {
         cardInfoDict = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.common.model.CardInfoModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.model.CardInfoModel();
         }
         return _ins;
      }
      
      public function parseNotify(param1:CardInfoNotify) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         cardInfoDict = new DictHash();
         if(param1)
         {
            _loc2_ = param1.infos.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               cardInfoDict.put((param1.infos[_loc3_] as CardInfo).itemId,param1.infos[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      public function getIdArr() : Array
      {
         filterIdArr();
         var _loc1_:Array = ArrayUtil.copy(cardInfoDict.array);
         return _loc1_.sortOn("itemId",16);
      }
      
      public function itemIsUsing(param1:int) : StcItemVo
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         filterIdArr();
         var _loc3_:Array = cardInfoDict.array;
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = StcMgr.ins.getItemVo((_loc3_[_loc5_] as CardInfo).itemId);
            if(_loc4_ && _loc4_.kind == param1)
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      private function filterIdArr() : void
      {
         var _loc2_:Array = cardInfoDict.array;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(_loc1_.endStamp <= ServerTimer.ins.second && _loc1_.residualTimes == 0)
            {
               cardInfoDict.remove(_loc1_.itemId);
            }
         }
      }
   }
}
