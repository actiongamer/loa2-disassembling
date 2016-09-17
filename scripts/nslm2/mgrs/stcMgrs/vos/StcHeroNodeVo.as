package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import morn.core.utils.StringUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class StcHeroNodeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_node";
       
      
      public var id:int;
      
      public var isRare:int;
      
      public var highCost:String;
      
      public var lowCost:String;
      
      public var battleLimit:String;
      
      public function StcHeroNodeVo()
      {
         super();
      }
      
      public function get fromHighCostArr() : Array
      {
         if(!StringUtils.isNull(this.highCost))
         {
            return WealthUtil.costStrToArr(this.highCost);
         }
         return [];
      }
      
      public function get fromLowCostArr() : Array
      {
         if(!StringUtils.isNull(this.lowCost))
         {
            return WealthUtil.costStrToArr(this.lowCost);
         }
         return [];
      }
      
      public function get getBattleLimitNpcNameArr() : Array
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         if(StringUtils.isNull(this.battleLimit))
         {
            return [];
         }
         var _loc3_:Array = this.battleLimit.split("|");
         var _loc2_:int = _loc3_.length;
         var _loc1_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = StcMgr.ins.getNpcVo(_loc3_[_loc5_]);
            _loc1_.push(LocaleMgr.ins.getStr(_loc4_.name));
            _loc5_++;
         }
         return _loc1_;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         isRare = param1[1];
         highCost = param1[2];
         lowCost = param1[3];
         battleLimit = param1[4];
      }
   }
}
