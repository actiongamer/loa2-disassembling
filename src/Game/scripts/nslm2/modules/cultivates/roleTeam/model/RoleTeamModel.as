package nslm2.modules.cultivates.roleTeam.model
{
   import com.netease.protobuf.UInt64;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   import proto.HeroInfo;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.roleInfos.equipPanels.MengYueEffectVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class RoleTeamModel
   {
      
      private static var _ins:nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
       
      
      public var selectedHeroId:UInt64;
      
      public var crtHeroId:UInt64;
      
      public var crtHeroNodeId:int;
      
      public var selectedPos:int = 1;
      
      public var selectedYuanJunPos:int = 1;
      
      public var posOpenLvl:Array;
      
      public var yuanJunOpenLvl:Array;
      
      public var equipMasterIndex:int;
      
      public var blockFloatMsg:Boolean;
      
      private var heroModel:HeroModel;
      
      public function RoleTeamModel()
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         heroModel = HeroModel.ins;
         super();
         posOpenLvl = [];
         yuanJunOpenLvl = [];
         var _loc1_:String = DefindConsts.POSITION_QUEST_LEVEL;
         var _loc6_:String = DefindConsts.ALLIANCE_QUEST_LEVEL;
         var _loc5_:Array = _loc1_.split("|");
         var _loc7_:int = _loc5_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_ = _loc5_[_loc8_];
            _loc2_ = _loc4_.split(":")[0];
            posOpenLvl[_loc2_] = _loc4_.split(":")[1];
            _loc8_++;
         }
         _loc5_ = _loc6_.split("|");
         _loc7_ = _loc5_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_ = _loc5_[_loc8_];
            _loc2_ = _loc4_.split(":")[0];
            yuanJunOpenLvl[_loc2_] = _loc4_.split(":")[1];
            _loc8_++;
         }
      }
      
      public static function get ins() : nslm2.modules.cultivates.roleTeam.model.RoleTeamModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.roleTeam.model.RoleTeamModel();
         }
         return _ins;
      }
      
      public function getOpenTeamPosCnt() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = PlayerModel.ins.level;
         var _loc3_:int = posOpenLvl.length;
         _loc5_ = 1;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = posOpenLvl[_loc5_];
            if(_loc2_ <= _loc1_)
            {
               _loc4_++;
               _loc5_++;
               continue;
            }
            break;
         }
         return _loc4_;
      }
      
      public function getOpenYuanjunPosCnt() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = PlayerModel.ins.level;
         var _loc3_:int = yuanJunOpenLvl.length;
         _loc5_ = 1;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = yuanJunOpenLvl[_loc5_];
            if(_loc2_ <= _loc1_)
            {
               _loc4_++;
               _loc5_++;
               continue;
            }
            break;
         }
         return _loc4_;
      }
      
      public function updateHeroInfo(param1:Array, param2:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc7_:Array = [];
         var _loc11_:int = 0;
         var _loc10_:* = param1;
         for each(var _loc4_ in param1)
         {
            _loc9_ = heroModel.heroInfoDic.getValue(Uint64Util.toString(_loc4_.baseInfo.id));
            if(_loc9_)
            {
               _loc6_ = ArrayUtil.differenceBetweenArrs(_loc4_.baseInfo.mengyue,_loc9_.baseInfo.mengyue);
            }
            else
            {
               _loc6_ = ArrayUtil.differenceBetweenArrs(_loc4_.baseInfo.mengyue,[]);
            }
            if(_loc6_.length > 0)
            {
               _loc3_ = new MengYueEffectVo();
               _loc3_.heroBaseInfo = _loc4_.baseInfo;
               _loc3_.mengYueId = _loc6_[0];
               if(!(!param2 && Uint64Util.equal(selectedHeroId,_loc4_.baseInfo.id)))
               {
                  if(!HeroModel.ins.isCurPlayerHero(_loc4_.baseInfo.id))
                  {
                     _loc7_.push(_loc3_);
                  }
               }
            }
            if(Uint64Util.equal(selectedHeroId,_loc4_.baseInfo.id))
            {
               _loc5_ = _loc4_;
            }
            heroModel.onChangeOne(_loc4_);
         }
         var _loc8_:* = _loc7_.length == 0;
         if(!param2)
         {
            ObserverMgr.ins.sendNotice("role_team_notice_change_member",_loc5_);
         }
         else
         {
            ObserverMgr.ins.sendNotice("role_team_notice_change_yuanjun",_loc8_);
         }
         if(!param2)
         {
            ObserverMgr.ins.sendNotice("role_team_notice_show_mengyue_tip",_loc7_);
         }
         else
         {
            ObserverMgr.ins.sendNotice("role_team_notice_show_mengyue_tip_yuanjun",_loc7_);
         }
         CheckRoleTeamRedPointCtrl.ins.checkAll();
         RoleLevelUpUtil.chekHasNeedPromptLevelUpHero();
         NewerAlertModel.ins.checkCanTupo();
      }
      
      public function dispose() : void
      {
         selectedHeroId = null;
         crtHeroId = null;
         selectedPos = 1;
         selectedYuanJunPos = 1;
         crtHeroNodeId = 0;
      }
   }
}
