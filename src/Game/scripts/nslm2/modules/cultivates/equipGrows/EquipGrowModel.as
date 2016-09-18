package nslm2.modules.cultivates.equipGrows
{
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.HeroInfo;
   import proto.Item;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import nslm2.modules.roleInfos.equipPanels.RoleEquipPanel;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   
   public class EquipGrowModel
   {
      
      private static var _ins:nslm2.modules.cultivates.equipGrows.EquipGrowModel;
      
      public static const STAR_FROM_L_TO_R:String = "StarFromLeftToRight";
      
      public static const STAR_FROM_R_TO_L:String = "StarFromRightToLeft";
      
      public static const STAR_LIGHT_ON:String = "StarLightOn";
      
      public static const STAR_LIGHT_OFF:String = "StarLightOff";
       
      
      private var _heroInfo:HeroInfo;
      
      private var _heroInfoArr:Array;
      
      public var allEquipArr:Array;
      
      public var defaultSelectHero:HeroInfo;
      
      public var defaultSelectItem:Item;
      
      public var crtSwapEquip:Item;
      
      public var crtPanelID:int;
      
      private var _item:Item;
      
      private var _lvlUpNum:int = 0;
      
      public var RedPieceHint:Boolean = false;
      
      public function EquipGrowModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.equipGrows.EquipGrowModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.equipGrows.EquipGrowModel();
         }
         return _ins;
      }
      
      public static function getStarLightArray(param1:int, param2:int, param3:String = "StarFromLeftToRight", param4:Boolean = true) : Array
      {
         var _loc7_:int = 0;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         if(param2 == 5)
         {
            _loc6_ = String(DefindConsts.EQUIP_STAR_COUNT).split("|")[0].split(":")[1];
         }
         else if(param2 == 6)
         {
            _loc6_ = String(DefindConsts.EQUIP_STAR_COUNT).split("|")[1].split(":")[1];
         }
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            if(param3 == "StarFromLeftToRight")
            {
               if(_loc7_ < param1)
               {
                  _loc5_.push("StarLightOn");
               }
               else if(!param4)
               {
                  _loc5_.push("StarLightOff");
               }
               else
               {
                  break;
               }
            }
            else if(_loc6_ - _loc7_ < param1 + 1)
            {
               _loc5_.push("StarLightOn");
            }
            else if(!param4)
            {
               _loc5_.push("StarLightOff");
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      public function get heroInfo() : HeroInfo
      {
         return _heroInfo;
      }
      
      public function set heroInfo(param1:HeroInfo) : void
      {
         if(!param1 || !param1.baseInfo)
         {
            return;
         }
         _heroInfo = param1;
         if(param1)
         {
            if(param1 != HeroModel.ins.playerHero && HeroInfoUtil.isPlayerHero(param1.baseInfo.id))
            {
               HeroModel.ins.playerHero = param1;
            }
         }
      }
      
      public function updateHeroInfo(param1:HeroInfo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = heroInfoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = heroInfoArr[_loc4_];
            if(_loc2_.baseInfo)
            {
               if(Uint64Util.equal(param1.baseInfo.id,_loc2_.baseInfo.id))
               {
                  heroInfoArr[_loc4_] = param1;
               }
            }
            _loc4_++;
         }
      }
      
      public function get item() : Item
      {
         return _item;
      }
      
      public function get crtItemStrenVO() : StcEquipStrengthVo
      {
         if(!item)
         {
            return null;
         }
         var _loc1_:StcEquipStrengthVo = StcMgr.ins.getEquipStrengthVo(item.strengthId);
         if(_loc1_ == null)
         {
            _loc1_ = StcMgr.ins.getVoByColumnValue("static_equip_strength","level",0);
         }
         return _loc1_;
      }
      
      public function getNextStrenVO(param1:int) : StcEquipStrengthVo
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc2_ = crtItemStrenVO;
         while(true)
         {
            param1--;
            if(param1)
            {
               if(_loc2_)
               {
                  _loc3_ = StcMgr.ins.getEquipStrengthVo(_loc2_.next_id);
                  if(_loc3_)
                  {
                     _loc2_ = _loc3_;
                  }
                  else
                  {
                     _loc3_ = _loc2_;
                  }
                  continue;
               }
               break;
            }
            break;
         }
         return _loc3_;
      }
      
      public function get itemCrtStrLvl() : int
      {
         if(!crtItemStrenVO)
         {
            return 0;
         }
         return crtItemStrenVO.level;
      }
      
      public function getAddedPropList(param1:int) : Array
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc7_:int = 0;
         if(!crtItemStrenVO)
         {
            return [];
         }
         var _loc3_:Array = [];
         var _loc9_:StcEquipStrengthVo = getNextStrenVO(param1);
         var _loc6_:Array = crtEuipStrPropList;
         var _loc8_:Array = NpcPropVo.parseArrStr(_loc9_.add_growth);
         var _loc5_:int = _loc6_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = _loc6_[_loc7_];
            _loc2_ = _loc8_[_loc7_];
            _loc3_.push(new NpcPropVo(_loc4_.propId,_loc2_.value,"+"));
            _loc7_++;
         }
         return _loc3_;
      }
      
      public function getNewStrenLvl(param1:int) : int
      {
         if(!crtItemStrenVO)
         {
            return 0;
         }
         var _loc2_:int = itemCrtStrLvl + param1;
         return _loc2_;
      }
      
      public function caculateStrengthCost(param1:int = 1) : int
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         _loc2_ = crtItemStrenVO;
         while(true)
         {
            param1--;
            if(param1)
            {
               if(_loc2_)
               {
                  _loc4_ = _loc4_ + _loc2_.cost_gold;
                  _loc3_ = StcMgr.ins.getEquipStrengthVo(_loc2_.next_id);
                  _loc2_ = _loc3_;
                  continue;
               }
               break;
            }
            break;
         }
         return _loc4_;
      }
      
      public function get maxStrenLvl() : int
      {
         return PlayerModel.ins.level * 2;
      }
      
      public function set item(param1:Item) : void
      {
         _item = param1;
      }
      
      public function get crtEuipStrPropList() : Array
      {
         if(!crtItemStrenVO)
         {
            return [];
         }
         return NpcPropVo.parseArrStr(crtItemStrenVO.add_growth,"+");
      }
      
      public function get crtJingLianVO() : StcEquipJinglianVo
      {
         var _loc1_:int = item.jinglianId;
         var _loc2_:StcEquipJinglianVo = StcMgr.ins.getEquipJinglianVo(_loc1_);
         if(_loc2_ == null)
         {
            _loc2_ = StcMgr.ins.getVoByColumnValue("static_equip_jinglian","level",0);
         }
         return _loc2_;
      }
      
      public function get nextJingLianVO() : StcEquipJinglianVo
      {
         var _loc1_:StcEquipJinglianVo = StcMgr.ins.getEquipJinglianVo(crtJingLianVO.next_id);
         if(_loc1_)
         {
            return _loc1_;
         }
         return crtJingLianVO;
      }
      
      public function canLevelUpNum(param1:int, param2:int, param3:Boolean = false) : int
      {
         var _loc4_:StcEquipJinglianVo = StcMgr.ins.getEquipJinglianVo(param2);
         if(param3)
         {
            _lvlUpNum = 0;
         }
         var _loc5_:int = param1 - (!!param3?crtJingLianVO.need_exp - this.item.jinglianExp:StcMgr.ins.getEquipJinglianVo(_loc4_.id).need_exp);
         if(_loc5_ > 0)
         {
            _lvlUpNum = Number(_lvlUpNum) + 1;
            return canLevelUpNum(_loc5_,_loc4_.next_id);
         }
         return _lvlUpNum;
      }
      
      public function get heroInfoArr() : Array
      {
         return _heroInfoArr;
      }
      
      public function set heroInfoArr(param1:Array) : void
      {
         _heroInfoArr = param1;
      }
      
      public function initAllEquipList() : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = _heroInfoArr.length;
         allEquipArr = [];
         var _loc2_:Array = [];
         var _loc4_:int = 1;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = _heroInfoArr[_loc5_];
            _loc2_ = toEquipVoArr(_loc1_.items,_loc1_.baseInfo.baseId);
            _loc4_ = _loc2_.length + 1;
            allEquipArr.push(_loc2_);
            _loc5_++;
         }
      }
      
      private function toEquipVoArr(param1:Array, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc3_:Array = [];
         var _loc5_:int = RoleEquipPanel.placeArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = new HeroEquipVo();
            _loc4_.place = RoleEquipPanel.placeArr[_loc7_];
            _loc6_ = ArrayUtil.findByAttr(param1,Item.PLACE.name,_loc4_.place);
            if(_loc6_)
            {
               _loc4_.wealthVo = WealthUtil.itemToVo(_loc6_);
               _loc4_.wealthVo.extraData = param2;
            }
            else
            {
               _loc4_.wealthVo = new WealthVo();
               _loc4_.wealthVo.kind = 1;
               _loc4_.wealthVo.extraData = param2;
            }
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         return _loc3_;
      }
      
      private function sortHeroFun(param1:HeroInfo, param2:HeroInfo) : int
      {
         if(!param1.baseInfo)
         {
            return 1;
         }
         if(!param2.baseInfo)
         {
            return -1;
         }
         if(HeroModel.ins.isCurPlayerHero(param1.baseInfo.id))
         {
            return -1;
         }
         if(HeroModel.ins.isCurPlayerHero(param2.baseInfo.id))
         {
            return 1;
         }
         if(param1.baseInfo.level >= param2.baseInfo.level)
         {
            return -1;
         }
         return 1;
      }
      
      public function getDefaultSelectedHeroIndex(param1:UInt64 = null) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = _heroInfoArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _heroInfoArr[_loc5_];
            if(_loc3_.baseInfo)
            {
               if(param1)
               {
                  if(Uint64Util.equal(_loc3_.baseInfo.id,param1))
                  {
                     defaultSelectHero = _loc3_;
                     RoleInfoModel.ins.heroInfo = _loc3_;
                     return _loc5_;
                  }
               }
               else if(_loc3_.items.length > 0)
               {
                  defaultSelectHero = _loc3_;
                  RoleInfoModel.ins.heroInfo = _loc3_;
                  return _loc5_;
               }
            }
            _loc5_++;
         }
         defaultSelectHero = _heroInfoArr[0];
         return 0;
      }
      
      public function getDefaultSelectedEquipIndex(param1:int = -1, param2:int = 0) : int
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         if(param1 == -1)
         {
            return 0;
         }
         var _loc3_:Array = allEquipArr[param1];
         var _loc5_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = _loc3_[_loc6_];
            if(param2)
            {
               if(_loc4_.place == param2)
               {
                  defaultSelectItem = _loc4_.wealthVo.item;
                  return _loc6_;
               }
            }
            else if(_loc4_.wealthVo.item)
            {
               defaultSelectItem = _loc4_.wealthVo.item;
               return _loc6_;
            }
            _loc6_++;
         }
         return -1;
      }
      
      public function hasNoStrengthedEquip(param1:HeroInfo) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Array = RoleTeamUtil.toEquipVoArr(param1.items,0,param1.baseInfo.baseId);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.wealthVo)
            {
               _loc4_ = StcMgr.ins.getEquipStrengthVo(_loc2_.wealthVo.item.strengthId);
               if(_loc4_ && _loc4_.level == 0)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function dispose() : void
      {
         defaultSelectHero = null;
         defaultSelectItem = null;
         crtSwapEquip = null;
         _heroInfo = null;
         _heroInfoArr = null;
         allEquipArr = null;
         _item = null;
         crtPanelID = 0;
      }
   }
}
