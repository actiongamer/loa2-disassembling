package nslm2.modules.roleInfos.tupos
{
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.HeroTuPoReq;
   import morn.core.utils.StringUtils;
   import morn.core.handlers.Handler;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.HeroModel;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.HeroInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import flash.utils.setTimeout;
   import nslm2.utils.Uint64Util;
   
   public class RoleTupoUtil
   {
      
      private static var _confirmHandler;
      
      private static var _tupoVo:StcTupoVo;
       
      
      public function RoleTupoUtil()
      {
         super();
      }
      
      public static function doTupo(param1:StcTupoVo, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         _confirmHandler = param2;
         _tupoVo = param1;
         if(!canTupo(RoleInfoModel.ins.heroInfo,true))
         {
            ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
            return;
         }
         var _loc5_:HeroTuPoReq = new HeroTuPoReq();
         _loc5_.hero = RoleInfoModel.ins.heroInfo.baseInfo.id;
         if(StringUtils.isNull(param1.cost_hero))
         {
            Handler.execute(_confirmHandler,[_loc5_]);
         }
         else
         {
            _loc4_ = autoSelectFeedHero();
            _loc3_ = WealthUtil.parseCostStr(param1.cost_hero);
            if(_loc4_.length < _loc3_.count)
            {
               if(int(_loc3_.stcNpcVo.get_point) != 0)
               {
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(_loc3_.stcNpcVo.get_point)),30100);
               }
               else
               {
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_PIECE_LESS_ID)),30100);
               }
               ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
               return;
            }
            _loc5_.cost = getSelectHeroIdArr(_loc4_);
            _loc5_.num = getDefaultHeroCnt(_loc4_);
            ModuleMgr.ins.showModule(30112,new RoleTupoConfirmVo(new Handler(_confirmHandler,[_loc5_]),handlerNo,_loc4_),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private static function handlerNo() : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
      }
      
      public static function autoSelectFeedHero() : Array
      {
         var _loc2_:WealthVo = WealthUtil.parseCostStr(_tupoVo.cost_hero);
         var _loc1_:Array = HeroModel.ins.getTupoFeedHeroArr(_loc2_.stcNpcVo.id).sort(sortSubFunc);
         if(_loc1_)
         {
            return _loc1_.slice(0,_loc2_.showCount);
         }
         return [];
      }
      
      public static function getDefaultHeroCnt(param1:Array) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(HeroModel.ins.isDefaultHero(_loc2_))
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      public static function getSelectHeroIdArr(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(_loc3_.id);
         }
         return _loc2_;
      }
      
      public static function getNeedGodhoodArr(param1:StcTupoVo) : Array
      {
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc5_:Array = param1.cost_item.split("|");
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for each(var _loc2_ in _loc5_)
         {
            _loc4_ = StcMgr.ins.getItemVo(_loc2_);
            if(_loc4_)
            {
               _loc3_.push(WealthUtil.createItemVo(_loc2_,int(_loc4_.extend_1)));
            }
         }
         return _loc3_;
      }
      
      public static function canTupo(param1:HeroInfo, param2:Boolean = true) : Boolean
      {
         var _loc3_:* = null;
         var _loc10_:int = 0;
         var _loc5_:StcTupoVo = StcMgr.ins.getTupoVo(param1.baseInfo.baseId);
         var _loc9_:Array = WealthUtil.costStrToArr(_loc5_.cost_res);
         var _loc12_:int = 0;
         var _loc11_:* = _loc9_;
         for each(var _loc4_ in _loc9_)
         {
            if(PlayerModel.ins.getCountByWealthVo(_loc4_) < _loc4_.showCount)
            {
               if(param2)
               {
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc4_),ModuleMgr.ins.popLayer.curModuleId);
               }
               return false;
            }
         }
         if(StringUtils.isNull(_loc5_.cost_hero) == false)
         {
            _loc3_ = WealthUtil.parseCostStr(_loc5_.cost_hero);
         }
         if(_loc3_ && HeroModel.ins.getHeroCount(_loc3_.stcNpcVo.id) < _loc3_.count)
         {
            if(param2)
            {
               if(int(_loc3_.stcNpcVo.get_point) != 0)
               {
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(_loc3_.stcNpcVo.get_point)),30100);
               }
               else
               {
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_PIECE_LESS_ID)),30100);
               }
            }
            return false;
         }
         var _loc8_:Array = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(param1.baseInfo.baseId));
         var _loc7_:Array = param1.baseInfo.tupoItem;
         var _loc6_:int = _loc7_.length;
         while(_loc10_ < _loc6_)
         {
            if(_loc7_[_loc10_] == 0)
            {
               if(_loc8_[_loc10_] && PlayerModel.ins.getCountByWealthVo(_loc8_[_loc10_]) < _loc8_[_loc10_].count)
               {
                  if(param2)
                  {
                     ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc8_[_loc10_]),ModuleMgr.ins.popLayer.curModuleId);
                  }
                  return false;
               }
               if(param2)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(999000513));
               }
               return false;
            }
            _loc10_++;
         }
         return true;
      }
      
      public static function needShowRedPoint(param1:HeroInfo, param2:Boolean = true) : Boolean
      {
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         if(canTupo(param1,param2))
         {
            return true;
         }
         var _loc5_:Array = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(param1.baseInfo.baseId));
         var _loc4_:int = _loc5_.length;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(param1.baseInfo),(_loc5_[_loc6_] as WealthVo).sid);
            if(_loc3_ == 3)
            {
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public static function getGodhoodEquipState(param1:PanelBaseInfo, param2:int) : int
      {
         var _loc8_:int = 0;
         var _loc6_:StcTupoVo = StcMgr.ins.getTupoVo(param1.baseId);
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(param2);
         var _loc3_:Array = param1.tupoItem;
         var _loc7_:Array = getNeedGodhoodArr(_loc6_);
         var _loc4_:int = _loc7_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            if((_loc7_[_loc8_] as WealthVo).sid == param2)
            {
               if(_loc3_[_loc8_] == true)
               {
                  return 1;
               }
               if(PlayerModel.ins.getCountByWealthVo(_loc7_[_loc8_]) >= int(_loc5_.extend_1))
               {
                  if(param1.level >= _loc5_.need_level)
                  {
                     return 3;
                  }
                  return 2;
               }
               return 4;
            }
            _loc8_++;
         }
         return 0;
      }
      
      public static function getTupoNeedMaterial(param1:StcTupoVo) : Array
      {
         var _loc3_:* = null;
         var _loc2_:StcTupoVo = getStcTupoVo(param1.hero_node,param1.tupo_level - 1);
         if(_loc2_)
         {
            _loc3_ = WealthUtil.costStrToArrExceptGold(_loc2_.cost_res).concat(WealthUtil.costStrToArrExceptGold(_loc2_.cost_hero)).concat(RoleTupoUtil.getNeedGodhoodArr(_loc2_));
         }
         return _loc3_;
      }
      
      public static function getTupoNeedHero(param1:StcTupoVo) : WealthVo
      {
         var _loc3_:* = null;
         var _loc2_:StcTupoVo = getStcTupoVo(param1.hero_node,param1.tupo_level - 1);
         if(_loc2_)
         {
            _loc3_ = WealthUtil.parseCostStr(_loc2_.cost_hero);
         }
         return _loc3_;
      }
      
      public static function getTupoNeedItem(param1:StcTupoVo) : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1)
         {
            _loc2_ = getStcTupoVo(param1.hero_node,param1.tupo_level - 1);
            if(_loc2_)
            {
               _loc3_ = WealthUtil.costStrToArrExceptGold(_loc2_.cost_res).concat(RoleTupoUtil.getNeedGodhoodArr(_loc2_));
            }
            return _loc3_;
         }
         return [];
      }
      
      public static function isNeedItem(param1:StcTupoVo, param2:int) : Boolean
      {
         var _loc3_:Array = WealthUtil.costStrToArrExceptGold(param1.cost_res).concat(WealthUtil.costStrToArrExceptGold(param1.cost_hero)).concat(RoleTupoUtil.getNeedGodhoodArr(param1));
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(_loc4_.stcItemVo && _loc4_.stcItemVo.id == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getUnlockSkillId(param1:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:* = undefined;
         var _loc3_:StcTupoVo = StcMgr.ins.getTupoVo(param1);
         var _loc2_:StcTupoVo = getStcTupoVo(_loc3_.hero_node,_loc3_.tupo_level - 1);
         if(_loc2_ == null || _loc3_.skill_count == _loc2_.skill_count)
         {
            return 0;
         }
         _loc5_ = StcMgr.ins.getNpcVo(param1);
         _loc4_ = new <int>[_loc5_.skill_id1,_loc5_.skill_id2,_loc5_.skill_id3,_loc5_.skill_id4];
         return _loc4_[_loc3_.skill_count - 1];
      }
      
      public static function getStcNpcVoByNodeAndTupoLv(param1:int, param2:int) : StcNpcVo
      {
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_npc","node",param1);
         return ArrayUtil.findByAttr(_loc3_,"tupo",param2);
      }
      
      public static function getStcTupoVo(param1:int, param2:int) : StcTupoVo
      {
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_tupo","hero_node",param1);
         return ArrayUtil.findByAttr(_loc3_,"tupo_level",param2);
      }
      
      public static function getHeroPropVoArr(param1:StcNpcVo) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = NPCPropConsts.ins.baseProp4List.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = NPCPropConsts.ins.baseProp4List[_loc6_];
            _loc3_ = NPCPropConsts.ins.getStcVoPropertyName(_loc4_);
            _loc2_.push(new NpcProp2Vo(_loc4_,param1[_loc3_],0));
            _loc6_++;
         }
         return _loc2_;
      }
      
      public static function addNextPropVoArr(param1:Array, param2:StcNpcVo) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param2)
         {
            _loc5_ = param1.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = param1[_loc6_];
               _loc3_ = NPCPropConsts.ins.getStcVoPropertyName(_loc4_.propId);
               _loc4_.valueNext = param2[_loc3_] - _loc4_.value;
               _loc6_++;
            }
         }
         return param1;
      }
      
      public static function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:* = param1;
         if(10020 !== _loc4_)
         {
            if(10040 !== _loc4_)
            {
               if(10041 !== _loc4_)
               {
                  if(10042 !== _loc4_)
                  {
                     return 1;
                  }
                  return ngCheckIndex(3);
               }
               return ngCheckIndex(2);
            }
            return ngCheckIndex(1);
         }
         if(param2 && param2.length != 0)
         {
            return ngSpecialCheck(param2);
         }
         return ngCheckIndex(0);
      }
      
      public static function ngCheckAll(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc10_:int = 0;
         var _loc8_:* = null;
         var _loc5_:int = 0;
         var _loc11_:HeroInfo = RoleInfoModel.ins.heroInfo;
         var _loc9_:Array = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(_loc11_.baseInfo.baseId));
         var _loc7_:int = _loc9_.length;
         var _loc4_:Boolean = false;
         var _loc6_:Boolean = true;
         if(_loc7_ > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc7_)
            {
               _loc8_ = _loc9_[_loc10_];
               _loc5_ = getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc11_.baseInfo),_loc8_.sid);
               if(_loc5_ != 3 && _loc5_ != 1)
               {
                  _loc4_ = true;
               }
               if(_loc5_ != 1)
               {
                  _loc6_ = false;
               }
               _loc10_++;
            }
            if(_loc4_)
            {
               NGUtil.gm_gotoId(param2[1]);
               return 4;
            }
            if(_loc6_)
            {
               setTimeout(NGUtil.gm_gotoId,1,param2[0]);
               return 4;
            }
            return 1;
         }
         return 0;
      }
      
      private static function ngSpecialCheck(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc6_:HeroInfo = RoleInfoModel.ins.heroInfo;
         var _loc5_:Array = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(_loc6_.baseInfo.baseId));
         var _loc4_:Array = _loc6_.baseInfo.tupoItem;
         var _loc3_:int = _loc4_.length;
         if(_loc5_.length > 0)
         {
            _loc2_ = getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc6_.baseInfo),(_loc5_[0] as WealthVo).sid);
            switch(int(_loc2_) - 1)
            {
               case 0:
                  NGUtil.gm_gotoId(param1[0]);
                  return 4;
               default:
                  return 0;
               case 2:
                  return 1;
            }
         }
         else
         {
            return 0;
         }
      }
      
      private static function ngCheckIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc6_:HeroInfo = RoleInfoModel.ins.heroInfo;
         var _loc5_:Array = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(_loc6_.baseInfo.baseId));
         var _loc4_:Array = _loc6_.baseInfo.tupoItem;
         var _loc3_:int = _loc4_.length;
         if(_loc5_.length > 0)
         {
            _loc2_ = getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc6_.baseInfo),(_loc5_[param1] as WealthVo).sid);
            if(_loc2_ == 3)
            {
               return 1;
            }
            return 0;
         }
         return 0;
      }
      
      private static function sortSubFunc(param1:PanelBaseInfo, param2:PanelBaseInfo) : int
      {
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param2.baseId);
         if(Uint64Util.toNumber(param1.ability) > Uint64Util.toNumber(param2.ability))
         {
            return 1;
         }
         if(Uint64Util.toNumber(param1.ability) < Uint64Util.toNumber(param2.ability))
         {
            return -1;
         }
         if(param1.level > param2.level)
         {
            return 1;
         }
         if(param1.level < param2.level)
         {
            return -1;
         }
         if(param1.shengjie > param2.shengjie)
         {
            return 1;
         }
         return -1;
      }
   }
}
