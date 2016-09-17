package nslm2.modules.footstones.roleLvlUpModule.model
{
   import nslm2.modules.footstones.roleLvlUpModule.vo.RolePreLvlInfoVo;
   import nslm2.modules.footstones.roleLvlUpModule.vo.PropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import com.mz.core.utils.ArrayUtil;
   
   public class RoleLvlUpModel
   {
      
      private static var _ins:nslm2.modules.footstones.roleLvlUpModule.model.RoleLvlUpModel;
       
      
      public var preVo:RolePreLvlInfoVo;
      
      public function RoleLvlUpModel()
      {
         preVo = new RolePreLvlInfoVo();
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.roleLvlUpModule.model.RoleLvlUpModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.roleLvlUpModule.model.RoleLvlUpModel();
         }
         return _ins;
      }
      
      public function get propListData() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:PropVo = new PropVo();
         _loc2_.name = LocaleMgr.ins.getStr(999000139);
         _loc2_.oldValue = preVo.preLvl;
         _loc2_.newValue = PlayerModel.ins.level;
         _loc1_.push(_loc2_);
         _loc2_ = new PropVo();
         _loc2_.name = LocaleMgr.ins.getStr(999000140);
         _loc2_.oldValue = preVo.preStamina;
         _loc2_.newValue = PlayerModel.ins.stamina;
         _loc1_.push(_loc2_);
         _loc2_ = new PropVo();
         _loc2_.name = LocaleMgr.ins.getStr(999000141);
         _loc2_.oldValue = preVo.preStaminaMax;
         _loc2_.newValue = PlayerModel.ins.staminaMax;
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      public function get functionListData() : Array
      {
         var _loc7_:* = null;
         var _loc1_:* = 0;
         var _loc6_:int = 0;
         var _loc3_:Array = [];
         var _loc2_:Array = StcMgr.ins.getTabelArr("static_function");
         var _loc4_:int = PlayerModel.ins.level;
         _loc2_.sortOn("level",16);
         var _loc5_:int = _loc2_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc2_[_loc6_];
            if(_loc7_.level >= _loc4_ && _loc7_.is_show && _loc7_.isopen)
            {
               _loc3_.push(_loc7_);
               _loc1_ = _loc6_;
            }
            if(_loc3_.length <= 2)
            {
               _loc6_++;
               continue;
            }
            break;
         }
         if(!_loc1_)
         {
            _loc1_ = int(_loc2_.length);
         }
         while(_loc3_.length < 3)
         {
            _loc1_--;
            _loc7_ = _loc2_[_loc1_];
            if(_loc7_.is_show && ArrayUtil.indexByAttr(_loc3_,"id",_loc7_.id) == -1 && _loc7_.isopen)
            {
               _loc3_.push(_loc7_);
            }
         }
         return _loc3_;
      }
   }
}
