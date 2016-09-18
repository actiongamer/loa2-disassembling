package nslm2.modules.cultivates.treasure.vo
{
   import proto.BaoWu;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuStrengthVo;
   import nslm2.utils.Uint64Util;
   import com.netease.protobuf.UInt64;
   
   public class TreasureVo
   {
       
      
      public var selected:Boolean;
      
      public var baoWu:BaoWu;
      
      public var wealthVo:WealthVo;
      
      public function TreasureVo()
      {
         super();
      }
      
      public function get exp() : int
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(baoWu)
         {
            _loc4_ = StcMgr.ins.getItemVo(baoWu.baseId);
            if(_loc4_.kind != 31)
            {
               _loc3_ = TreasureUtil.getStrenVo(baoWu.level,baoWu.baseId);
               _loc1_ = _loc3_.all_exp;
            }
            _loc2_ = int(_loc4_.extend_4) + _loc1_ + Uint64Util.toInt(baoWu.exp);
         }
         return _loc2_;
      }
      
      public function get quality() : int
      {
         return wealthVo.quality;
      }
      
      public function get id() : UInt64
      {
         if(baoWu)
         {
            return baoWu.id;
         }
         return null;
      }
   }
}
