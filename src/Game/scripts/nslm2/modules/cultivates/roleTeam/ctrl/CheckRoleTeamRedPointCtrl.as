package nslm2.modules.cultivates.roleTeam.ctrl
{
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   
   public class CheckRoleTeamRedPointCtrl
   {
      
      private static var _ins:nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
       
      
      private var hasVacantTeamPos:Boolean;
      
      private var hasVacantYuanJunPos:Boolean;
      
      private var showRedPointHeroIDArr:Array;
      
      private var canTupoHeroIdArr:Array;
      
      public function CheckRoleTeamRedPointCtrl()
      {
         showRedPointHeroIDArr = [];
         canTupoHeroIdArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl();
         }
         return _ins;
      }
      
      public function checkEquip() : void
      {
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc9_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         showRedPointHeroIDArr = [];
         canTupoHeroIdArr = [];
         var _loc6_:Array = HeroModel.ins.teamHeroInfoArr;
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc7_ = _loc6_[_loc8_];
            _loc9_ = false;
            _loc3_ = RoleTeamUtil.toEquipVoArr(_loc7_.items,0,_loc7_.baseInfo.baseId);
            _loc2_ = RoleTeamUtil.toEquipBaoWuVoArr(_loc7_.baowu,0,_loc7_.baseInfo.baseId);
            var _loc12_:int = 0;
            var _loc11_:* = _loc3_;
            for each(var _loc1_ in _loc3_)
            {
               if(!_loc1_.wealthVo)
               {
                  if(BagModel.ins.hasEquipInBg(_loc1_.place))
                  {
                     _loc9_ = true;
                     _loc5_ = true;
                     break;
                  }
               }
               else if(BagModel.ins.hasBetterEquip(_loc1_.wealthVo,_loc7_.baseInfo.baseId))
               {
                  _loc9_ = true;
                  _loc5_ = true;
                  break;
               }
            }
            var _loc14_:int = 0;
            var _loc13_:* = _loc2_;
            for each(_loc1_ in _loc2_)
            {
               if(!_loc1_.wealthVo)
               {
                  if(TreasureModel.ins.hasTreasureInBg(_loc1_.place))
                  {
                     _loc9_ = true;
                     _loc4_ = true;
                     break;
                  }
               }
               else if(TreasureModel.ins.hasBetterTreasure(_loc1_.wealthVo))
               {
                  _loc9_ = true;
                  break;
               }
            }
            if(_loc9_)
            {
               showRedPointHeroIDArr.push(_loc8_);
            }
            _loc8_++;
         }
         if(showRedPointHeroIDArr.length > 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30810,true));
         }
         else if(!hasVacantTeamPos && !hasVacantYuanJunPos)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30810,false));
         }
         if(_loc5_)
         {
            FloatBubbleUtil.changeShow(3,true);
         }
         else
         {
            FloatBubbleUtil.changeShow(3,false);
         }
         if(_loc4_)
         {
            FloatBubbleUtil.changeShow(5,true);
         }
         else
         {
            FloatBubbleUtil.changeShow(5,false);
         }
         FloatBubbleUtil.initCheck();
         ObserverMgr.ins.sendNotice("role_team_show_role_team_red_point",showRedPointHeroIDArr);
      }
      
      public function checkTeamAndSupporter() : void
      {
         var _loc2_:int = HeroModel.ins.teamHeroInfoArr.length;
         var _loc3_:int = RoleTeamModel.ins.getOpenTeamPosCnt();
         hasVacantTeamPos = false;
         hasVacantYuanJunPos = false;
         if(_loc3_ > _loc2_)
         {
            if(HeroModel.ins.hasCanJoinTeamHero())
            {
               hasVacantTeamPos = true;
            }
         }
         var _loc4_:int = HeroModel.ins.YuanJunCnt;
         var _loc1_:int = RoleTeamModel.ins.getOpenYuanjunPosCnt();
         if(_loc1_ > _loc4_)
         {
            if(HeroModel.ins.hasCanJoinTeamHero(true))
            {
               hasVacantYuanJunPos = true;
               ObserverMgr.ins.sendNotice("role_team_switch_supporter_red_point",true);
            }
            else
            {
               ObserverMgr.ins.sendNotice("role_team_switch_supporter_red_point",false);
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("role_team_switch_supporter_red_point",false);
         }
         if(hasVacantYuanJunPos || hasVacantTeamPos)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30810,true));
         }
         else if(!showRedPointHeroIDArr.length)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30810,false));
         }
      }
      
      public function checkAndSwitchHeroShowRedPoi() : void
      {
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30701,HeroModel.ins.haveTupoHeros() || HeroModel.ins.haveCanPhaseUpTalent() || BagModel.ins.heroPiecesCanActive() || RoleLevelUpUtil.chekHasNeedPromptLevelUpHero() || HeroModel.ins.haveCanAwakeHeros()));
      }
      
      public function checkAll() : void
      {
         checkEquip();
         checkTeamAndSupporter();
         if(hasVacantTeamPos || hasVacantYuanJunPos || showRedPointHeroIDArr.length > 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30810,true));
         }
      }
   }
}
