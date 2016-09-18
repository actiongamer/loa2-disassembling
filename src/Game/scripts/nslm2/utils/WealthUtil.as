package nslm2.utils
{
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Image;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.StcLackFieldFatal;
   import nslm2.mgrs.stcMgrs.vos.StcDropBaseVo;
   import nslm2.mgrs.stcMgrs.vos.StcDropGroupVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import proto.HeroInfo;
   import proto.PanelBaseInfo;
   import proto.Reward;
   import proto.Item;
   import proto.BaoWu;
   import proto.PetInfo;
   import nslm2.common.model.HeroModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.mgrs.stcMgrs.vos.StcGlobalPriceVo;
   import com.mz.core.logging.Log;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   
   public class WealthUtil
   {
       
      
      public function WealthUtil()
      {
         super();
      }
      
      public static function toWealthStr(param1:int, param2:int, param3:int) : String
      {
         return param1 + ":" + param2 + ":" + param3;
      }
      
      public static function toStcCountVo(param1:WealthVo) : WealthVo
      {
         var _loc2_:WealthVo = param1.clone();
         _loc2_.item = null;
         _loc2_.hero = null;
         _loc2_.useStcCount = true;
         return _loc2_;
      }
      
      public static function createStcItemVo(param1:int = 0, param2:int = 1) : WealthVo
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = 20;
         _loc3_.sid = param1;
         _loc3_.count = param2;
         _loc3_.useStcCount = true;
         return _loc3_;
      }
      
      public static function createStcVo(param1:int, param2:int = 0, param3:int = 1) : WealthVo
      {
         var _loc4_:WealthVo = new WealthVo();
         _loc4_.kind = param1;
         _loc4_.sid = param2;
         _loc4_.count = param3;
         _loc4_.useStcCount = true;
         return _loc4_;
      }
      
      public static function createWealthVo(param1:int, param2:int = 0, param3:int = 1) : WealthVo
      {
         var _loc4_:WealthVo = new WealthVo();
         _loc4_.kind = param1;
         _loc4_.sid = param2;
         _loc4_.count = param3;
         return _loc4_;
      }
      
      public static function createNpcVo(param1:int, param2:int = 1) : WealthVo
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = 30;
         _loc3_.sid = param1;
         _loc3_.count = param2;
         return _loc3_;
      }
      
      public static function createItemVo(param1:int, param2:int = 1) : WealthVo
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = 20;
         _loc3_.sid = param1;
         _loc3_.count = param2;
         return _loc3_;
      }
      
      public static function countVo(param1:int, param2:int = 0) : WealthVo
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = param1;
         _loc3_.sid = param2;
         _loc3_.useStcCount = true;
         return _loc3_;
      }
      
      public static function needVo(param1:int, param2:int, param3:int) : WealthVo
      {
         var _loc4_:WealthVo = new WealthVo();
         _loc4_.kind = param1;
         _loc4_.sid = param2;
         _loc4_.count = param3;
         _loc4_.useStcCount = false;
         return _loc4_;
      }
      
      public static function createCountItemVo(param1:int) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 20;
         _loc2_.sid = param1;
         _loc2_.useStcCount = true;
         return _loc2_;
      }
      
      public static function tooltip(param1:WealthVo) : *
      {
         var _loc2_:* = param1.kind;
         if(20 !== _loc2_)
         {
            if(30 !== _loc2_)
            {
               if(0 !== _loc2_)
               {
                  return param1;
               }
               return null;
            }
            return param1;
         }
         return param1;
      }
      
      public static function changeQualitySkin(param1:Image, param2:int) : void
      {
         var _loc3_:String = param1.skin.substring(0,param1.skin.length - 1);
         param1.skin = _loc3_ + param2;
      }
      
      public static function dropBaseByGroupIdToWealthVoArr(param1:int) : Array
      {
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_drop_base","base_drop_id",param1);
         var _loc6_:int = _loc3_.length;
         if(_loc6_ == 0)
         {
            new StcLackFieldFatal(WealthUtil,"static_drop_base","base_drop_id",param1);
            return [];
         }
         _loc4_ = [];
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = _loc3_[_loc7_];
            _loc5_ = new WealthVo();
            _loc5_.kind = _loc2_.drop_type;
            _loc5_.sid = _loc2_.drop_id;
            if(_loc5_.kind == 3)
            {
               _loc5_.count = StcMgr.ins.getGlobalPriceVo(_loc2_.number).price;
            }
            else
            {
               _loc5_.count = _loc2_.number;
            }
            _loc4_.push(_loc5_);
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function dropGroupSidToWealthVoArr(param1:int) : Array
      {
         var _loc2_:* = null;
         if(param1 > 0)
         {
            _loc2_ = StcMgr.ins.getDropGroupVo(param1);
            if(_loc2_ == null)
            {
               new StcLackFatal(WealthUtil,"static_drop_group",param1);
            }
            else
            {
               return dropBaseByGroupIdToWealthVoArr(_loc2_.drop_group_id);
            }
         }
         return [];
      }
      
      public static function dropGroupIDToWealthVoArr(param1:int) : Array
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         if(param1 > 0)
         {
            _loc2_ = StcMgr.ins.getVoArrByColumnValue("static_drop_group","drop_group_id",param1);
            _loc2_.sortOn("id",16);
            _loc5_ = _loc2_.length;
            if(_loc5_ == 0)
            {
               new StcLackFieldFatal(WealthUtil,"static_drop_group","drop_group_id",param1);
               return [];
            }
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = _loc2_[_loc6_];
               _loc3_ = _loc3_.concat(dropBaseByGroupIdToWealthVoArr(_loc4_.id));
               _loc6_++;
            }
         }
         return _loc3_;
      }
      
      public static function stcItemIdArrToHadWealthVoArr(param1:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return [];
         }
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_.push(stcItemIdToHadWealthVoArr(_loc3_));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function stcItemIdToHadWealthVoArr(param1:int) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.useStcCount = true;
         _loc2_.kind = 20;
         _loc2_.sid = param1;
         return _loc2_;
      }
      
      public static function heroInfoToWealthVoArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:int = param1.length;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(heroInfoToVo(param1[_loc4_] as HeroInfo));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function heroInfoToVo(param1:HeroInfo) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 30;
         _loc2_.sid = param1.baseInfo.baseId;
         _loc2_.count = 1;
         return _loc2_;
      }
      
      public static function panelBaseInfoToVo(param1:PanelBaseInfo) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 30;
         _loc2_.sid = param1.baseId;
         _loc2_.count = 1;
         return _loc2_;
      }
      
      public static function rewardArrToWealthVoArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:int = param1.length;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(rewardToVo(param1[_loc4_] as Reward));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function rewardToVo(param1:Reward) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = param1.dropType;
         _loc2_.sid = param1.dropId;
         _loc2_.count = Uint64Util.toNumber(param1.count);
         param1.id;
         return _loc2_;
      }
      
      public static function wealthVoArrToRewardArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:int = param1.length;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(wealthVoToReward(param1[_loc4_] as WealthVo));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function wealthVoToReward(param1:WealthVo) : Reward
      {
         var _loc2_:Reward = new Reward();
         _loc2_.dropType = param1.kind;
         _loc2_.dropId = param1.sid;
         _loc2_.count = Uint64Util.fromNumber(param1.count);
         return _loc2_;
      }
      
      public static function itemToVo(param1:Item) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 20;
         _loc2_.sid = param1.itemId;
         _loc2_.count = 1;
         _loc2_.item = param1;
         return _loc2_;
      }
      
      public static function treasureToVo(param1:BaoWu) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 2121;
         _loc2_.sid = param1.baseId;
         _loc2_.count = 1;
         _loc2_.treasure = param1;
         return _loc2_;
      }
      
      public static function PetToVo(param1:PetInfo) : WealthVo
      {
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 30;
         _loc2_.sid = param1.id;
         _loc2_.count = 1;
         _loc2_.petInfo = param1;
         return _loc2_;
      }
      
      public static function costStrToArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split("|");
         var _loc5_:int = _loc4_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_.push(WealthVo.parseCostStr(_loc4_[_loc6_],param2));
            _loc6_++;
         }
         return _loc3_;
      }
      
      public static function costStrToVo(param1:String) : WealthVo
      {
         return WealthVo.parseCostStr(param1);
      }
      
      public static function parseCostStrToArr(param1:String) : Array
      {
         return costStrToArr(param1);
      }
      
      public static function costStrToArrExceptGold(param1:String) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         var _loc3_:Array = param1.split("|");
         var _loc5_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = WealthVo.parseCostStr(_loc3_[_loc6_]);
            if(_loc4_.kind != 1 && _loc4_.count)
            {
               _loc2_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public static function costStrToArrOnlyGold(param1:String) : WealthVo
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         var _loc3_:Array = param1.split("|");
         var _loc5_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = WealthVo.parseCostStr(_loc3_[_loc6_]);
            if(_loc4_.kind == 1)
            {
               return _loc4_;
            }
            _loc6_++;
         }
         return null;
      }
      
      public static function costItemStrToVo(param1:String) : WealthVo
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = 20;
         var _loc2_:Array = param1.split(":");
         _loc3_.sid = _loc2_[0];
         _loc3_.count = _loc2_[1];
         return _loc3_;
      }
      
      public static function itemArrToWealthVoArr(param1:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_.push(WealthUtil.itemToVo(_loc3_));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function isEquip(param1:WealthVo) : Boolean
      {
         return param1.kind == 20 && param1.stcItemVo.kind <= 4;
      }
      
      public static function isMengYueEquipOrTreasure(param1:int, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc6_:int = 2;
         if(param3)
         {
            _loc6_ = 3;
         }
         var _loc4_:int = StcMgr.ins.getNpcVo(param1).node;
         var _loc5_:Array = HeroModel.ins.getHeroYuanFenArr(_loc4_,_loc6_);
         if(_loc5_.length == 0)
         {
            return false;
         }
         if(ArrayUtil.indexByAttr(_loc5_,"condition",param2) >= 0)
         {
            return true;
         }
         return false;
      }
      
      public static function isMengYueHero(param1:int, param2:int) : StcMengyueVo
      {
         var _loc5_:* = null;
         var _loc4_:Array = HeroModel.ins.getHeroYuanFenArr(param2,1);
         var _loc6_:Array = [];
         var _loc10_:int = 0;
         var _loc9_:* = _loc4_;
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc5_.condition.split("|");
            if(_loc6_.indexOf(param1.toString()) >= 0)
            {
               if(_loc6_.length < 2)
               {
                  return _loc5_;
               }
               var _loc8_:int = 0;
               var _loc7_:* = _loc6_;
               for each(var _loc3_ in _loc6_)
               {
                  if(_loc3_ != param1)
                  {
                     if(!HeroModel.ins.checkHeroInTeamOrYuanJun(_loc3_))
                     {
                        return null;
                     }
                  }
               }
               return _loc5_;
            }
         }
         return null;
      }
      
      public static function parseCostStr(param1:String, param2:Boolean = true) : WealthVo
      {
         var _loc5_:* = null;
         var _loc3_:WealthVo = new WealthVo();
         var _loc4_:Array = param1.split(":");
         _loc3_.kind = _loc4_[0];
         _loc3_.sid = _loc4_[1];
         if(_loc4_.length > 2)
         {
            if(_loc3_.kind == 3 || _loc3_.kind == 4)
            {
               if(param2)
               {
                  _loc5_ = StcMgr.ins.getGlobalPriceVo(_loc4_[2]);
                  if(_loc5_)
                  {
                     _loc3_.count = _loc5_.price;
                  }
                  else
                  {
                     Log.warn(WealthUtil,"static_global_price表缺少数据(主键值:" + _loc4_[2] + ")");
                     _loc3_.count = _loc4_[2];
                  }
               }
               else
               {
                  _loc3_.count = _loc4_[2];
               }
            }
            else
            {
               _loc3_.count = _loc4_[2];
            }
         }
         else
         {
            _loc3_.count = 0;
         }
         return _loc3_;
      }
      
      public static function parseComboSignInAward(param1:String) : Array
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = param1.split("|");
         var _loc2_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = _loc4_;
         for each(var _loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split(":");
            _loc3_ = new WealthVo();
            _loc3_.kind = _loc5_[0];
            _loc3_.sid = _loc5_[1];
            if(_loc5_.length > 2)
            {
               _loc3_.count = _loc5_[2];
            }
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function isCanUseKind(param1:int) : Boolean
      {
         var _loc2_:* = param1;
         if(97 !== _loc2_)
         {
            if(99 !== _loc2_)
            {
               if(40 !== _loc2_)
               {
                  if(35 !== _loc2_)
                  {
                     if(36 !== _loc2_)
                     {
                        if(96 !== _loc2_)
                        {
                           if(1000 !== _loc2_)
                           {
                              if(1001 !== _loc2_)
                              {
                                 return false;
                              }
                           }
                           addr12:
                           return true;
                        }
                        addr11:
                        §§goto(addr12);
                     }
                     addr10:
                     §§goto(addr11);
                  }
                  addr9:
                  §§goto(addr10);
               }
               addr8:
               §§goto(addr9);
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
      
      public static function isCanSell(param1:String) : Boolean
      {
         return !StringUtils.isNull(param1);
      }
      
      public static function getPoint(param1:WealthVo) : void
      {
         if(param1.kind == 3 || param1.kind == 4)
         {
            AlertUtil.showRechargeAlert();
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(param1.kind,param1.sid),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      public static function getStcItemVo(param1:int) : StcItemVo
      {
         return StcMgr.ins.getItemVo(param1);
      }
      
      public static function compareEquipOrTreausre(param1:int, param2:int, param3:int, param4:Boolean = false) : Boolean
      {
         var _loc6_:Boolean = isMengYueEquipOrTreasure(param3,param1,param4);
         var _loc8_:Boolean = isMengYueEquipOrTreasure(param3,param2,param4);
         var _loc7_:int = getStcItemVo(param1).quality;
         var _loc5_:int = getStcItemVo(param2).quality;
         if(!_loc6_)
         {
            if(_loc5_ > _loc7_)
            {
               return true;
            }
         }
         else if(_loc8_ && _loc5_ > _loc7_)
         {
            return true;
         }
         return false;
      }
      
      public static function sortEquipOrTreasure(param1:WealthVo, param2:WealthVo) : int
      {
         var _loc12_:int = 0;
         var _loc7_:Boolean = false;
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc11_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc3_:int = 0;
         var _loc15_:int = 0;
         var _loc13_:int = RoleInfoModel.ins.heroInfo.baseInfo.baseId;
         if(param1.treasure)
         {
            _loc7_ = true;
         }
         if(!_loc7_)
         {
            _loc4_ = HeroModel.ins.getEquipedItemByKind(param1.stcItemVo.kind);
            if(_loc4_)
            {
               _loc12_ = _loc4_.itemId;
            }
         }
         else
         {
            _loc9_ = HeroModel.ins.getEquipedTreasureByKind(param1.treasure);
            if(_loc9_)
            {
               _loc12_ = _loc9_.baseId;
            }
         }
         if(_loc12_)
         {
            _loc11_ = compareEquipOrTreausre(_loc12_,param1.sid,_loc13_,_loc7_);
            _loc10_ = compareEquipOrTreausre(_loc12_,param2.sid,_loc13_,_loc7_);
            if(_loc11_ && !_loc10_)
            {
               return -1;
            }
            if(!_loc11_ && _loc10_)
            {
               return 1;
            }
         }
         var _loc14_:Boolean = isMengYueEquipOrTreasure(_loc13_,param1.sid,_loc7_);
         var _loc5_:Boolean = isMengYueEquipOrTreasure(_loc13_,param2.sid,_loc7_);
         if(_loc14_ && !_loc5_)
         {
            return -1;
         }
         if(!_loc14_ && _loc5_)
         {
            return 1;
         }
         var _loc8_:int = getStcItemVo(param1.sid).quality;
         var _loc6_:int = getStcItemVo(param2.sid).quality;
         if(_loc8_ > _loc6_)
         {
            return -1;
         }
         if(_loc8_ < _loc6_)
         {
            return 1;
         }
         if(!_loc7_)
         {
            if(param1.item.strengthId)
            {
               _loc3_ = StcMgr.ins.getEquipStrengthVo(param1.item.strengthId).level;
            }
            if(param2.item.strengthId)
            {
               _loc15_ = StcMgr.ins.getEquipStrengthVo(param2.item.strengthId).level;
            }
         }
         else
         {
            _loc3_ = param1.treasure.level;
            _loc15_ = param1.treasure.level;
         }
         if(_loc3_ > _loc15_)
         {
            return -1;
         }
         if(_loc3_ < _loc15_)
         {
            return 1;
         }
         if(!_loc7_ && Uint64Util.toInt(param1.item.ability) > Uint64Util.toInt(param2.item.ability))
         {
            return -1;
         }
         if(!_loc7_ && Uint64Util.toInt(param1.item.ability) < Uint64Util.toInt(param2.item.ability))
         {
            return 1;
         }
         if(_loc7_ && Uint64Util.toInt(param1.treasure.ability) > Uint64Util.toInt(param2.treasure.ability))
         {
            return -1;
         }
         if(_loc7_ && Uint64Util.toInt(param1.treasure.ability) < Uint64Util.toInt(param2.treasure.ability))
         {
            return 1;
         }
         return 0;
      }
      
      public static function parseCost(param1:String, param2:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Array = param1.split("|");
         var _loc6_:int = _loc5_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc4_ = _loc5_[_loc8_];
            _loc3_ = _loc4_.split(":")[0];
            _loc7_ = _loc4_.split(":")[1];
            param2[_loc3_] = _loc7_;
            _loc8_++;
         }
         return param2;
      }
      
      public static function parseDiamdondCost(param1:String, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Array = param1.split("|");
         var _loc6_:int = _loc5_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc4_ = _loc5_[_loc8_];
            _loc7_ = StcMgr.ins.getGlobalPriceVo(_loc4_.split(":")[2]).price;
            param2[_loc8_] = _loc7_;
            _loc8_++;
         }
      }
      
      public static function getRewardArrayToolTipStr(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:String = "";
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_ = _loc2_ + (TextFieldUtil.htmlText2(_loc3_.showName,ColorLib.qualityColor(_loc3_.quality)) + "*" + _loc3_.count + "\n");
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function rewardSortFun(param1:WealthVo, param2:WealthVo) : int
      {
         if(param1.kind < param2.kind)
         {
            return -1;
         }
         if(param1.kind > param2.kind)
         {
            return 1;
         }
         if(param1.sid < param2.sid)
         {
            return -1;
         }
         if(param1.sid > param2.sid)
         {
            return 1;
         }
         return 0;
      }
      
      public static function getNpcGroupName(param1:int, param2:Boolean = true) : String
      {
         var _loc3_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(param1);
         if(!_loc3_)
         {
            return "";
         }
         return getNpcName(_loc3_.display_npc,param2);
      }
      
      public static function getNpcName(param1:int, param2:Boolean = true) : String
      {
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(!_loc4_)
         {
            return "";
         }
         var _loc3_:String = LocaleMgr.ins.getStr(_loc4_.name);
         if(param2)
         {
            return TextFieldUtil.htmlText2(_loc3_,ColorLib.qualityColor(_loc4_.quality));
         }
         return _loc3_;
      }
      
      public static function getItemColorName(param1:int, param2:String = "") : String
      {
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc3_)
         {
            return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc3_.name) + param2,ColorLib.qualityColor(_loc3_.quality));
         }
         return "";
      }
      
      public static function getItemQuality(param1:int) : int
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc2_)
         {
            return _loc2_.quality;
         }
         return 0;
      }
      
      public static function rewardArrToString(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc6_:Array = WealthUtil.rewardArrToWealthVoArr(param1);
         var _loc2_:int = _loc6_.length;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = _loc6_[_loc5_];
            _loc4_.push(_loc3_.showName + "*" + _loc3_.showCount);
            _loc5_++;
         }
         return _loc4_.join(",");
      }
      
      public static function wealthVoArrToString(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = param1[_loc5_];
            _loc4_.push(_loc3_.showName + "*" + _loc3_.showCount);
            _loc5_++;
         }
         return _loc4_.join(",");
      }
      
      public static function checkMeetCost(param1:String) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Array = WealthUtil.costStrToArr(param1);
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc3_[_loc5_];
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      public static function composeWealthVoArr(param1:Array, param2:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return param2;
         }
         if(param2 == null || param2.length == 0)
         {
            return param1;
         }
         var _loc3_:int = param1.length;
         var _loc4_:int = param2.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = 0;
            while(true)
            {
               if(_loc5_ >= _loc4_)
               {
                  param2.push(param1[_loc6_]);
                  break;
               }
               if((param1[_loc6_] as WealthVo).sid == (param2[_loc5_] as WealthVo).sid && (param1[_loc6_] as WealthVo).kind == (param2[_loc5_] as WealthVo).kind)
               {
                  (param2[_loc5_] as WealthVo).count = (param2[_loc5_] as WealthVo).count + (param1[_loc6_] as WealthVo).count;
                  break;
               }
               _loc5_++;
            }
            _loc6_++;
         }
         return param2;
      }
      
      public static function indexOfKindSid(param1:Array, param2:int, param3:int) : int
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc4_.kind == param2 && _loc4_.sid == param3)
            {
               return _loc6_;
            }
            _loc6_++;
         }
         return -1;
      }
      
      public static function isEnough(param1:Array) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
   }
}
