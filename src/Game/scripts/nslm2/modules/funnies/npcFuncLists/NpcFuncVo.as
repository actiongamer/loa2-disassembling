package nslm2.modules.funnies.npcFuncLists
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.common.model.PlayerModel;
   
   public class NpcFuncVo
   {
      
      public static const FUNC_ID:String = "funcId";
       
      
      public var funcId:int;
      
      public var count:int;
      
      public var multiple:int;
      
      public var extra:Object;
      
      public function NpcFuncVo()
      {
         super();
      }
      
      public static function createCount(param1:int, param2:int) : NpcFuncVo
      {
         var _loc3_:NpcFuncVo = new NpcFuncVo();
         _loc3_.funcId = param1;
         _loc3_.count = param2;
         return _loc3_;
      }
      
      public static function create(param1:int, param2:int, param3:int) : NpcFuncVo
      {
         var _loc4_:NpcFuncVo = new NpcFuncVo();
         _loc4_.funcId = param1;
         _loc4_.count = param2;
         _loc4_.multiple = param3;
         return _loc4_;
      }
      
      public function get canEnter() : Boolean
      {
         var _loc1_:StcFunctionVo = StcMgr.ins.getFunctionVo(this.funcId);
         return _loc1_.canEnter;
      }
      
      public function get canOpen() : Boolean
      {
         var _loc1_:StcFunctionVo = StcMgr.ins.getFunctionVo(this.funcId);
         return _loc1_.canOpen;
      }
      
      public function get isLock() : Boolean
      {
         var _loc1_:StcFunctionVo = StcMgr.ins.getFunctionVo(this.funcId);
         return PlayerModel.ins.level < _loc1_.level;
      }
   }
}
