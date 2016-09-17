package nslm2.modules.roleInfos
{
   import proto.HeroInfo;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleInfoVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class RoleInfoModel
   {
      
      private static var _ins:nslm2.modules.roleInfos.RoleInfoModel;
       
      
      public var needRefreshHeroBaseInfo:Boolean;
      
      private var _heroInfo:HeroInfo;
      
      public var equipBoxPos:Array;
      
      public var updateYuanFenDataAfterEffect:Boolean;
      
      public function RoleInfoModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.roleInfos.RoleInfoModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.roleInfos.RoleInfoModel();
         }
         return _ins;
      }
      
      public function get heroInfo() : HeroInfo
      {
         return _heroInfo;
      }
      
      public function set heroInfo(param1:HeroInfo) : void
      {
         _heroInfo = param1;
         if(param1)
         {
            if(param1 != HeroModel.ins.playerHero && HeroInfoUtil.isPlayerHero(param1.baseInfo.id))
            {
               HeroModel.ins.playerHero = param1;
            }
         }
      }
      
      public function getHeroSkillDataArr() : Array
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:Array = [];
         if(_heroInfo)
         {
            _loc2_ = _heroInfo.baseInfo.skill;
            _loc4_ = _loc2_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc1_ = _loc2_[_loc5_];
               _loc3_.push(StcMgr.ins.getSkillVo(_loc1_));
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function showRoleInfoModule(param1:int = 30100, param2:HeroInfo = null) : void
      {
         var _loc7_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc4_:RoleInfoModuleParam = new RoleInfoModuleParam();
         _loc4_.heroInfo = param2;
         if(_loc4_.heroInfo == null)
         {
            if(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo)
            {
               _loc4_.heroInfo = nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo;
            }
            else
            {
               _loc4_.heroInfo = PlayerModel.ins.playerInfo.playerHero;
            }
         }
         _loc4_.subPanelId = param1;
         if(ModuleMgr.ins.isShow(30100) == true)
         {
            _loc7_ = ModuleMgr.ins.popLayer.moduleList;
            _loc3_ = _loc7_.length;
            _loc6_ = [];
            _loc8_ = _loc3_ - 1;
            while(_loc8_ >= 0)
            {
               if(_loc7_[_loc8_].configVo.moduleId != 30100)
               {
                  _loc6_.push(_loc7_[_loc8_].configVo.moduleId);
                  _loc8_--;
                  continue;
               }
               break;
            }
            var _loc10_:int = 0;
            var _loc9_:* = _loc6_;
            for each(var _loc5_ in _loc6_)
            {
               ModuleMgr.ins.closeModule(_loc5_);
            }
            ObserverMgr.ins.sendNotice("role_info_change_tab",_loc4_.subPanelId);
            ObserverMgr.ins.sendNotice("msg_role_select_changed",_loc4_.heroInfo);
         }
         else
         {
            ModuleMgr.ins.showModule(30100,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}
