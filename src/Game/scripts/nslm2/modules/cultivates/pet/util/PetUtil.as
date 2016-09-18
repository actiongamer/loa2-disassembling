package nslm2.modules.cultivates.pet.util
{
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import proto.PetInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcPetStarVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcPetWakeupVo;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   
   public class PetUtil
   {
       
      
      public function PetUtil()
      {
         super();
      }
      
      public static function initBasePropList(param1:StcNpcVo) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = NPCPropConsts.ins.baseProp5List.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = NPCPropConsts.ins.baseProp5List[_loc5_];
            _loc2_.push(new NpcPropVo(_loc3_,int(param1[NPCPropConsts.ins.getStcVoPropertyName(_loc3_)])));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function initSkinPropList(param1:StcNpcVo, param2:PetInfo) : Array
      {
         var _loc3_:Array = [];
         var _loc6_:int = NPCPropConsts.ins.baseProp4List.length;
         var _loc5_:Array = [];
         if(param2)
         {
            if(param2.allStatus.length > 1)
            {
               var _loc8_:int = 0;
               var _loc7_:* = param2.allStatus;
               for each(var _loc4_ in param2.allStatus)
               {
                  _loc5_ = NpcPropVo.addProp(_loc5_,NpcPropVo.parseArrStr(StcMgr.ins.getPetStatusVo(_loc4_).attr,"",null,0,true,true));
               }
            }
            else
            {
               _loc5_ = NpcPropVo.addProp(_loc5_,NpcPropVo.createPropArrZero([1,2,17,20,32]));
            }
         }
         return _loc5_;
      }
      
      public static function initProtectPropList(param1:StcNpcVo, param2:PetInfo) : Array
      {
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc7_:int = NPCPropConsts.ins.baseProp4List.length;
         var _loc6_:Array = [];
         if(param2)
         {
            if(param2.allStatus.length > 1)
            {
               var _loc10_:int = 0;
               var _loc9_:* = param2.allStatus;
               for each(var _loc4_ in param2.allStatus)
               {
                  _loc6_ = NpcPropVo.addProp(_loc6_,NpcPropVo.parseArrStr(StcMgr.ins.getPetStatusVo(_loc4_).add,"",null,0,true,true));
               }
            }
            else
            {
               _loc6_ = NpcPropVo.addProp(_loc6_,NpcPropVo.parseArrStr(StcMgr.ins.getPetStatusVo(param2.status).add,"",null,0,true,true));
            }
         }
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = NPCPropConsts.ins.baseProp5List[_loc8_];
            NpcPropVo.getEmptyPopArr(1,5,0);
            _loc3_.push(new NpcPropVo(_loc5_,int(param1[NPCPropConsts.ins.getStcVoPropertyName(_loc5_)]),"",null,0,true));
            _loc8_++;
         }
         return _loc6_;
      }
      
      public static function getLevelVo(param1:int, param2:uint) : StcLevelVo
      {
         var _loc3_:StcLevelVo = StcMgr.ins.getVoByMultiColumnValue("static_level",["kind","level","quality"],[3,param2,StcMgr.ins.getNpcVo(param1).quality]);
         return _loc3_;
      }
      
      public static function isMaxExp(param1:PetInfo) : Boolean
      {
         var _loc3_:StcLevelVo = getLevelVo(param1.id,param1.level);
         var _loc2_:StcLevelVo = getLevelVo(param1.id,param1.level + 1);
         if(Uint64Util.toNumber(param1.exp) >= _loc3_.exp - 1 && (param1.level >= PlayerModel.ins.level || _loc2_ == null))
         {
            return true;
         }
         return false;
      }
      
      public static function getStarPropBffArr(param1:int, param2:int) : Array
      {
         var _loc3_:StcPetStarVo = getPetStarVo(param1,param2);
         if(_loc3_)
         {
            return NpcPropVo.parseArrStr(_loc3_.attr,"+");
         }
         return [];
      }
      
      public static function getPetAllSkillIdArr(param1:int, param2:int) : Array
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         var _loc3_:StcHeroShengjieVo = StcMgr.ins.getVoByColumnValue("static_hero_shengjie","level",param2) as StcHeroShengjieVo;
         var _loc6_:int = _loc8_.skillIdArr.length;
         var _loc4_:Array = [];
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc7_ = StcMgr.ins.getSkillVo(_loc8_.skillIdArr[_loc9_]);
            if(_loc7_)
            {
               _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc8_.skillIdArr[_loc9_],_loc3_.skill_level]);
               if(_loc5_)
               {
                  _loc4_.push(_loc5_.id);
               }
               else
               {
                  _loc4_.push(_loc8_.skillIdArr[_loc9_]);
               }
            }
            _loc9_++;
         }
         return _loc4_;
      }
      
      public static function getPetAllSkillVoArr(param1:int, param2:int) : Array
      {
         var _loc4_:Array = getPetAllSkillIdArr(param1,param2);
         var _loc3_:Array = SkillRenderVo.skillArrToVoArr(_loc4_,param1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_;
         for each(var _loc5_ in _loc3_)
         {
            _loc5_.isHero = false;
         }
         return _loc3_;
      }
      
      public static function getPetStarPropAddedList(param1:int, param2:int, param3:int) : Array
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:Array = getStarPropBffArr(param1,param2);
         var _loc5_:Array = getStarPropBffArr(param1,param3);
         if(_loc5_.length)
         {
            _loc6_ = _loc5_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc4_ = _loc5_[_loc8_];
               if(_loc4_ && _loc7_[_loc8_])
               {
                  _loc4_.value = _loc4_.value - _loc7_[_loc8_].value;
               }
               _loc8_++;
            }
         }
         return _loc5_;
      }
      
      public static function getPetStarVo(param1:int, param2:int) : StcPetStarVo
      {
         var _loc3_:StcPetStarVo = StcMgr.ins.getVoByMultiColumnValue("static_pet_star",["node","level"],[param1,param2]);
         return _loc3_;
      }
      
      public static function checkPetRedPoint() : void
      {
         var _loc3_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = BagModel.ins.hasCanComposePet();
         var _loc4_:Array = PetModel.ins.activatedPetArr;
         if(!_loc2_ && _loc4_.length > 0)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _loc4_;
            for each(var _loc6_ in _loc4_)
            {
               if(_loc6_.id == PetModel.ins.onBattlePetID)
               {
                  if(checkSinglePet(_loc6_.petInfo))
                  {
                     _loc2_ = true;
                     break;
                  }
               }
            }
         }
         if(!_loc2_)
         {
            _loc2_ = PetModel.ins.checkHaveUnEquipPet();
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(32000,_loc2_));
      }
      
      public static function checkSinglePet(param1:PetInfo) : Boolean
      {
         return checkCanLvlUp(param1) || checkCanStarUp(param1) || checkCanAwake(param1);
      }
      
      public static function checkCanLvlUp(param1:PetInfo) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!FuncOpenAutoCtrl.checkOpen(32010))
         {
            return false;
         }
         if(param1.level == PlayerModel.ins.level)
         {
            return false;
         }
         var _loc7_:Array = StcMgr.ins.getVoArrByColumnValue("static_item","kind",39).sortOn("quality",16);
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_;
         for each(var _loc4_ in _loc7_)
         {
            _loc2_ = BagModel.ins.getStcCount(_loc4_.id);
            if(_loc2_)
            {
               _loc3_ = _loc3_ + _loc2_ * int(_loc4_.extend_1);
            }
         }
         var _loc6_:StcLevelVo = getLevelVo(param1.id,param1.level);
         var _loc5_:int = Uint64Util.toNumber(param1.exp);
         if(_loc3_ + _loc5_ >= _loc6_.exp)
         {
            return true;
         }
         return false;
      }
      
      public static function checkCanStarUp(param1:PetInfo) : Boolean
      {
         if(!FuncOpenAutoCtrl.checkOpen(32030))
         {
            return false;
         }
         var _loc4_:StcPetStarVo = getPetStarVo(param1.id,param1.star);
         var _loc3_:int = param1.star + 1;
         var _loc2_:StcPetStarVo = getPetStarVo(param1.id,_loc3_);
         if(_loc2_)
         {
            if(_loc4_.need_level <= param1.level)
            {
               return WealthUtil.checkMeetCost(_loc4_.cost);
            }
         }
         return false;
      }
      
      public static function checkCanAwake(param1:PetInfo) : Boolean
      {
         return false;
      }
      
      public static function checkCanCompose(param1:int) : Boolean
      {
         var _loc2_:PetInfoVo = PetModel.ins.getStaticData(param1);
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(int(_loc2_.stcVo.description3));
         var _loc4_:int = _loc3_.extend_1;
         if(BagModel.ins.getStcCount(_loc3_.id) >= _loc4_)
         {
            return true;
         }
         return false;
      }
      
      public static function nodeFullEquiped(param1:PetInfo) : Boolean
      {
         return false;
      }
      
      public static function getHuyouAddOneLevel(param1:int) : int
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:StcPetWakeupVo = StcMgr.ins.getVoByMultiColumnValue("static_pet_wakeup",["kind","level"],[2,param1]);
         if(_loc2_)
         {
            _loc4_ = NpcPropVo.parseArrStr(_loc2_.attr);
            _loc3_ = _loc4_[0];
            return _loc3_.value * 100;
         }
         return 0;
      }
      
      public static function getHuyouUped(param1:uint, param2:int) : int
      {
         return param1 * 100 / getBaseAddPercent(param2);
      }
      
      public static function getBaseAddPercent(param1:int) : int
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",param1);
         _loc2_.sortOn("id",16);
         var _loc3_:StcPetStatusVo = _loc2_[0];
         var _loc4_:NpcPropVo = NpcPropVo.parseArrStr(_loc3_.add)[0];
         return _loc4_.value * 100;
      }
      
      public static function getPetAllAttr(param1:int, param2:int, param3:int, param4:String = "") : Array
      {
         var _loc7_:* = null;
         var _loc9_:int = 0;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc5_ == null)
         {
            return [];
         }
         var _loc6_:StcPetStarVo = StcMgr.ins.getVoByMultiColumnValue("static_pet_star",["node","level"],[_loc5_.node,param2]);
         var _loc8_:Array = NpcPropVo.parseArrStr(_loc6_.all_attr,param4);
         if(param3)
         {
            _loc7_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[2,param3]);
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               (_loc8_[_loc9_] as NpcPropVo).value = int((_loc8_[_loc9_] as NpcPropVo).value * (1 + _loc7_.glory_rating));
               _loc9_++;
            }
         }
         return _loc8_;
      }
      
      public static function getPetAllAttrByInfo(param1:PetInfo, param2:Boolean = false, param3:String = "") : Array
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(param2)
         {
            _loc4_ = NpcPropVo.parseFightProp(param1.totalGlotyProp,param3,0,true);
         }
         else
         {
            _loc4_ = NpcPropVo.parseFightProp(param1.gloryProp,param3,0,true);
         }
         _loc6_ = _loc4_.length - 1;
         while(_loc6_ >= 0)
         {
            _loc5_ = _loc4_[_loc6_] as NpcPropVo;
            if(_loc5_.propId == 3 || _loc5_.propId == 4)
            {
               _loc4_.splice(_loc6_,1);
            }
            else
            {
               _loc5_.value = int(_loc5_.value);
            }
            _loc6_--;
         }
         return _loc4_;
      }
      
      public static function getPosBuffArr(param1:int, param2:int, param3:String = "") : Array
      {
         return getPetAllAttr(param1,param2,0,param3);
      }
   }
}
