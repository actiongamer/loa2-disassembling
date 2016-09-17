package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   
   public class StcSwapActionVo extends StcVoBase
   {
      
      public static const CONDITION1COUNT:String = "condition1count";
      
      public static const CONDITION_LEVEL:String = "conditionLevel";
      
      public static const KIND_ARENA:int = 1;
      
      public static const KIND_TASK_EVERYDAY:int = 2;
      
      public static const KIND_PK_CROSS_CHEER:int = 6;
      
      public static const KIND_SE:int = 8;
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_swap_action";
       
      
      private var _condition1count:Number = NaN;
      
      private var _condition2count:Number = NaN;
      
      public var id:int;
      
      public var kind:int;
      
      public var condition:String;
      
      public var cost:String;
      
      public var drop_id:int;
      
      public var reset_kind:int;
      
      public var limit_count:int;
      
      public var desc:String;
      
      public function StcSwapActionVo()
      {
         super();
      }
      
      public function get condition1count() : int
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(isNaN(_condition1count))
         {
            _loc2_ = this.condition.split(";");
            _loc1_ = WealthUtil.parseCostStr(String(_loc2_[0]).split("|")[1]);
            _condition1count = _loc1_.count;
         }
         return _condition1count;
      }
      
      public function get condition2count() : Number
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(isNaN(_condition2count))
         {
            _loc2_ = this.condition.split(";");
            _loc1_ = String(_loc2_[1]).split("|")[1];
            _condition2count = _loc1_;
         }
         return _condition2count;
      }
      
      public function get conditionLevel() : int
      {
         return int(condition2count);
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         condition = param1[2];
         cost = param1[3];
         drop_id = param1[4];
         reset_kind = param1[5];
         limit_count = param1[6];
         desc = param1[7];
      }
   }
}
