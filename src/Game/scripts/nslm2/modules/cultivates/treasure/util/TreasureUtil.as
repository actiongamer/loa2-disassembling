package nslm2.modules.cultivates.treasure.util
{
   import nslm2.mgrs.stcMgrs.vos.StcBaowuStrengthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.treasure.vo.TreasureRuneHoleVo;
   import proto.BaoWuFumo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.treasure.vo.TreasureNgVo;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import game.ui.roleInfos.NpcPropVo;
   
   public class TreasureUtil
   {
       
      
      public function TreasureUtil()
      {
         super();
      }
      
      public static function getStrenVo(param1:int, param2:int) : StcBaowuStrengthVo
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param2);
         var _loc3_:StcBaowuStrengthVo = StcMgr.ins.getVoByMultiColumnValue("static_baowu_strength",["quality","level"],[_loc4_.quality,param1]);
         return _loc3_;
      }
      
      public static function caculateStrenAddProp(param1:int, param2:int) : int
      {
         return param1 * param2 / 4;
      }
      
      public static function getAddtionType(param1:int) : int
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1);
         var _loc2_:String = _loc4_.extend_3;
         var _loc3_:int = _loc2_.split(":")[0];
         return _loc3_;
      }
      
      public static function getMaxOpenHoleCnt(param1:int) : int
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         return int(_loc2_.extend_2);
      }
      
      public static function pareseTreasureRuneArr(param1:Array, param2:int) : Array
      {
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [];
         var _loc6_:int = param1.length;
         var _loc4_:int = TreasureUtil.getMaxOpenHoleCnt(param2);
         _loc7_ = 1;
         while(_loc7_ <= 6)
         {
            _loc8_ = new TreasureRuneHoleVo();
            if(_loc7_ <= _loc6_)
            {
               _loc8_.status = 2;
            }
            else if(_loc7_ == _loc6_ + 1 && _loc7_ <= _loc4_)
            {
               _loc8_.status = 1;
            }
            else
            {
               _loc8_.status = 0;
            }
            _loc5_.push(_loc8_);
            _loc7_++;
         }
         var _loc10_:int = 0;
         var _loc9_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.id)
            {
               (_loc5_[_loc3_.place - 1] as TreasureRuneHoleVo).runeVo = WealthUtil.stcItemIdToHadWealthVoArr(_loc3_.id);
            }
         }
         return _loc5_;
      }
      
      public static function getMaxRuneLevel(param1:Array) : int
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc4_ = StcMgr.ins.getItemVo(_loc2_.id);
            if(_loc4_)
            {
               if(_loc3_)
               {
                  _loc3_ = Math.min(int(_loc4_.extend_2),_loc3_);
               }
               else
               {
                  _loc3_ = _loc4_.extend_2;
               }
               continue;
            }
            return 0;
         }
         return _loc3_;
      }
      
      public static function sortRune(param1:WealthVo, param2:WealthVo) : int
      {
         var _loc3_:int = param1.stcItemVo.extend_1;
         var _loc5_:int = param2.stcItemVo.extend_1;
         var _loc4_:int = param1.stcItemVo.extend_2;
         var _loc6_:int = param2.stcItemVo.extend_2;
         if(_loc4_ > _loc6_)
         {
            return -1;
         }
         if(_loc4_ < _loc6_)
         {
            return 1;
         }
         if(_loc3_ < _loc5_)
         {
            return -1;
         }
         if(_loc3_ > _loc5_)
         {
            return 1;
         }
         return 0;
      }
      
      public static function getRuneType(param1:int) : int
      {
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1);
         var _loc2_:int = _loc3_.extend_1;
         return _loc2_;
      }
      
      public static function getRuneLevel(param1:int) : int
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc2_)
         {
            return int(_loc2_.extend_2);
         }
         return 0;
      }
      
      public static function checkCanRuneNg(param1:Boolean, param2:Boolean) : Boolean
      {
         var _loc8_:Boolean = false;
         var _loc5_:* = false;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc4_:StcGuideVo = StcMgr.ins.getGuideVo(99900);
         if(_loc4_ == null || NGUtil.checkHasDone(99900))
         {
            return false;
         }
         if(PlayerModel.ins.level > 40)
         {
            NGUtil.addDone(99900);
            return false;
         }
         if(param1)
         {
            _loc3_ = HeroModel.ins.teamHeroInfoArr;
            _loc10_ = 0;
            while(_loc10_ < _loc3_.length)
            {
               _loc7_ = _loc3_[_loc10_];
               _loc9_ = RoleTeamUtil.toEquipBaoWuVoArr(_loc7_.baowu,0,_loc7_.baseInfo.baseId);
               var _loc12_:int = 0;
               var _loc11_:* = _loc9_;
               for each(var _loc6_ in _loc9_)
               {
                  if(_loc6_.wealthVo)
                  {
                     if(TreasureModel.ins.checkHasRune(_loc6_.wealthVo.treasure) == false)
                     {
                        _loc8_ = true;
                        continue;
                     }
                     NGUtil.addDone(99900);
                     NGUtil.removeWait(99900);
                     return false;
                  }
               }
               _loc10_++;
            }
         }
         else
         {
            _loc8_ = true;
         }
         if(param2)
         {
            _loc5_ = BagModel.ins.getRunesArr().length > 0;
         }
         else
         {
            _loc5_ = true;
         }
         return _loc8_ && _loc5_;
      }
      
      public static function getTreasureNgVo() : TreasureNgVo
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc1_:Array = HeroModel.ins.teamHeroInfoArr;
         _loc6_ = 0;
         while(_loc6_ < _loc1_.length)
         {
            _loc4_ = _loc1_[_loc6_];
            _loc5_ = RoleTeamUtil.toEquipBaoWuVoArr(_loc4_.baowu,0,_loc4_.baseInfo.baseId);
            var _loc8_:int = 0;
            var _loc7_:* = _loc5_;
            for each(var _loc3_ in _loc5_)
            {
               if(_loc3_.wealthVo)
               {
                  if(TreasureModel.ins.checkHasRune(_loc3_.wealthVo.treasure) == false)
                  {
                     _loc2_ = new TreasureNgVo(_loc6_,BagConsts.TREASURE_PLACE.indexOf(_loc3_.place));
                     return _loc2_;
                  }
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public static function getPorpListByStrenLvl(param1:int) : Array
      {
         var _loc2_:int = 0;
         var _loc4_:Array = NpcPropVo.parseFightProp(TreasureModel.ins.selectedTreasure.base,"+");
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc2_ = TreasureUtil.caculateStrenAddProp(_loc3_.value,param1);
            _loc3_.value = _loc3_.value + _loc2_;
         }
         return _loc4_;
      }
   }
}
