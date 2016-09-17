package nslm2.modules.foundations.mall.consts
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.roleInfos.vo.RoleInfoSubConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MallConsts
   {
      
      public static const MALL_BUY_LIMIT_SELF:int = 1;
      
      public static const MALL_BUY_LIMIT_SERVER:int = 2;
      
      public static const BANNER_CHANGE_DELAY:int = 3000;
      
      public static const SINGLE_CAN_BUY_COUNT:int = 999;
      
      public static const BUY_GOLDEN_DIAMOND_SHOP_ID:int = 90000;
      
      public static const VISIBLE_LIST_GOLDEN_PAGE:String = "visibleListGoldenPage";
      
      public static const kind_firstPage:int = 9999;
      
      public static const kind_surface:int = 1;
      
      public static const kind_item:int = 2;
      
      public static const kind_material:int = 3;
      
      public static const kind_golden:int = 5;
      
      private static var _ins:nslm2.modules.foundations.mall.consts.MallConsts;
       
      
      private var lib:DictHash;
      
      public function MallConsts()
      {
         var _loc1_:* = null;
         lib = new DictHash();
         super();
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 9999;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11200200);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 5;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11200500);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 2;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11200202);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 3;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11200203);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 1;
         _loc1_.nameCN = LocaleMgr.ins.getStr(11200201);
         lib.put(_loc1_.subId,_loc1_);
      }
      
      public static function get subIdAll() : Array
      {
         return [9999,5,1,2,3];
      }
      
      public static function get needShowSubIdArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = subIdAll;
         for each(var _loc2_ in subIdAll)
         {
            if(_loc2_ != 5)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function get ins() : nslm2.modules.foundations.mall.consts.MallConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.mall.consts.MallConsts();
         }
         return _ins;
      }
      
      public static function getGoldenDiamondCountPerCopy() : int
      {
         var _loc2_:* = null;
         var _loc1_:StcMallItemVo = StcMgr.ins.getMallItemVo(90000);
         if(_loc1_)
         {
            _loc2_ = WealthUtil.parseCostStr(_loc1_.items);
            return _loc2_.count;
         }
         return 1;
      }
      
      public function getVo(param1:int) : RoleInfoSubConfigVo
      {
         return lib.getValue(param1);
      }
   }
}
