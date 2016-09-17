package nslm2.modules.funnies.arenas
{
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   
   public class ArenaModel
   {
      
      private static var _ins:nslm2.modules.funnies.arenas.ArenaModel;
       
      
      private var _showSimpleFight:Boolean = true;
      
      private var _stcVoArr:Array;
      
      public function ArenaModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.arenas.ArenaModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.arenas.ArenaModel();
         }
         return _ins;
      }
      
      public function set showSimpleFight(param1:Boolean) : void
      {
         _showSimpleFight = param1;
      }
      
      public function get showSimpleFight() : Boolean
      {
         return _showSimpleFight && canUseSimpleFight();
      }
      
      public function canUseSimpleFight() : Boolean
      {
         return PlayerModel.ins.level >= 35;
      }
      
      public function get stcIdArr() : Array
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(_stcVoArr == null)
         {
            this._stcVoArr = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",1);
         }
         var _loc3_:Array = countLevelArr(_stcVoArr);
         if(PlayerModel.ins.level <= _loc3_[0])
         {
            _loc5_ = _loc3_[0];
            _loc3_[0];
         }
         else
         {
            _loc4_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc2_ = _loc3_[_loc7_];
               if(PlayerModel.ins.level >= _loc3_[_loc7_])
               {
                  _loc5_ = _loc3_[_loc7_];
                  _loc7_++;
                  continue;
               }
               break;
            }
         }
         var _loc6_:Array = [];
         _loc4_ = this._stcVoArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc1_ = _stcVoArr[_loc7_];
            if(_loc1_.conditionLevel == _loc5_)
            {
               _loc6_.push(_loc1_.id);
            }
            _loc7_++;
         }
         return _loc6_;
      }
      
      private function countLevelArr(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = param1[_loc6_];
            _loc5_ = _loc2_.conditionLevel;
            if(_loc3_.indexOf(_loc5_) == -1)
            {
               _loc3_.push(_loc5_);
            }
            _loc6_++;
         }
         _loc3_.sort(16);
         return _loc3_;
      }
   }
}
