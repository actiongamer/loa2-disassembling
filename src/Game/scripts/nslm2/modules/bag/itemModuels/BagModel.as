package nslm2.modules.bag.itemModuels
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.DictHash;
   import proto.NormalBagRes;
   import proto.Item;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import proto.PlayerDataNotify;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.cultivates.horse.HorseConsts;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import proto.ItemReduce;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.model.HeroModel;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.vos.StcAuctionVo;
   
   public class BagModel
   {
      
      private static var _ins:nslm2.modules.bag.itemModuels.BagModel;
      
      public static const HERO_POSITION:String = "HERO_POSITION";
      
      public static const HERO_PIECE_STATE:String = "HERO_PIECE_STATE";
       
      
      private var itemLib:DictHash;
      
      private var sidCountLib:Object;
      
      public var newItemArr:Vector.<Item>;
      
      public var firstEquipId:UInt64;
      
      private var allAuctionItemID:Array;
      
      public function BagModel()
      {
         itemLib = new DictHash();
         sidCountLib = {};
         newItemArr = new Vector.<Item>();
         super();
      }
      
      public static function get ins() : nslm2.modules.bag.itemModuels.BagModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.bag.itemModuels.BagModel();
         }
         return _ins;
      }
      
      public static function itemOrderSortFunc(param1:Object, param2:Object) : int
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1.itemId);
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param2.itemId);
         if((_loc4_.kind == 51 || _loc4_.kind == 72 || _loc4_.kind == 52 && !PetModel.ins.getPetInfo(int(_loc4_.extend_2))) && param1.count >= _loc4_.equipPieceComposeCount)
         {
            return 1;
         }
         if((_loc3_.kind == 51 || _loc3_.kind == 72 || _loc3_.kind == 52 && !PetModel.ins.getPetInfo(int(_loc3_.extend_2))) && param2.count >= _loc3_.equipPieceComposeCount)
         {
            return -1;
         }
         if(_loc4_.quality > _loc3_.quality)
         {
            return 1;
         }
         if(_loc4_.quality < _loc3_.quality)
         {
            return -1;
         }
         if(_loc4_.kind < _loc3_.kind)
         {
            return 1;
         }
         if(_loc4_.kind > _loc3_.kind)
         {
            return -1;
         }
         if(_loc4_.id < _loc3_.id)
         {
            return 1;
         }
         if(_loc4_.id > _loc3_.id)
         {
            return -1;
         }
         if(param1.count < param2.count)
         {
            return 1;
         }
         if(param1.count > param2.count)
         {
            return -1;
         }
         return Uint64Util.compareValue(param1.id,param2.id);
      }
      
      public function init(param1:NormalBagRes) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         newItemArr.length = 0;
         sidCountLib = {};
         if(param1 && param1.items)
         {
            _loc4_ = param1.items.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc2_ = param1.items[_loc5_];
               if(_loc2_.count != 0)
               {
                  itemLib.put(Uint64Util.toString(_loc2_.id),_loc2_);
                  _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
                  if(_loc3_.kind == 31)
                  {
                     TreasureModel.ins.initExpTreuasres([_loc2_]);
                  }
                  sidCountLib[_loc2_.itemId] = getStcCount(_loc2_.itemId) + _loc2_.count;
               }
               _loc5_++;
            }
         }
         this.order();
         RecycleModel.ins.initIdleEquipList();
      }
      
      public function onDataChange(param1:PlayerDataNotify) : void
      {
         if(param1.addItems)
         {
            this.add(param1.addItems);
            QuickUseModel.ins.addQuickUse(param1.addItems);
         }
         if(param1.reduceItems)
         {
            this.reduce(param1.reduceItems);
            QuickUseModel.ins.removeQuickUse(param1.reduceItems);
         }
      }
      
      public function add(param1:Array) : void
      {
         var _loc9_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc18_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc12_:int = 0;
         var _loc2_:* = null;
         var _loc19_:* = null;
         var _loc14_:* = null;
         var _loc17_:* = null;
         var _loc6_:* = null;
         var _loc8_:int = param1.length;
         var _loc5_:Array = [];
         _loc12_ = 0;
         while(_loc12_ < _loc8_)
         {
            _loc2_ = param1[_loc12_];
            if(_loc2_.count != 0)
            {
               _loc19_ = Uint64Util.toString(_loc2_.id);
               _loc14_ = this.itemLib.getValue(_loc19_);
               if(_loc14_ == null)
               {
                  _loc14_ = _loc2_;
                  _loc17_ = Uint64Util.toString(_loc14_.id);
                  itemLib.put(_loc17_,_loc14_);
                  newItemArr.push(_loc14_);
                  _loc6_ = StcMgr.ins.getItemVo(_loc14_.itemId);
                  if(!_loc14_.isEquiped && BagConsts.EQUIP_PLACE.indexOf(_loc6_.kind) >= 0)
                  {
                     _loc5_.push(_loc14_);
                  }
                  NGUtil.checkNewStcItemId(_loc14_.itemId);
               }
               else
               {
                  _loc14_.count = _loc14_.count + _loc2_.count;
                  _loc6_ = StcMgr.ins.getItemVo(_loc14_.itemId);
               }
               sidCountLib[_loc14_.itemId] = getStcCount(_loc14_.itemId) + _loc2_.count;
               ObserverMgr.ins.sendNotice("msg_item_num_change",_loc14_);
               if(_loc6_.kind == 31)
               {
                  TreasureModel.ins.addExpTreasure(_loc14_,_loc2_.count);
               }
               if(BagConsts.EQUIP_TREASURE_PLACE.indexOf(_loc6_.kind) >= 0)
               {
                  _loc9_ = true;
               }
               if(_loc6_.kind == 51 || _loc6_.kind == 72)
               {
                  _loc15_ = true;
               }
               if(_loc6_.kind == 81)
               {
                  _loc10_ = true;
               }
               if(_loc6_.kind == 32)
               {
                  _loc13_ = true;
               }
               if(_loc6_.kind == 10 || _loc6_.kind == 12)
               {
                  FashionModel.ins.newFashionArr.push(_loc14_.itemId);
                  FashionModel.ins.addCanActivateFashion(_loc14_.itemId);
               }
               if(_loc6_.kind == 15 || _loc6_.kind == 16)
               {
                  App.render.callLater(ObserverMgr.ins.sendNotice,["acc_make_cpl"]);
               }
               if(_loc6_.id == HorseConsts.MASTER_COST_ITEM_ID || _loc6_.kind == 11)
               {
                  _loc11_ = true;
               }
               if(_loc6_.kind == 33)
               {
                  _loc3_ = true;
               }
               if(_loc6_.kind == 21)
               {
                  _loc7_ = true;
               }
               if(_loc6_.kind == 61)
               {
                  NGUtil.checkRuneNg(true,true);
               }
               if(_loc6_.kind == 82)
               {
                  _loc16_ = true;
               }
               if(_loc6_.id == DialModel.getIns(60800).getCurCostItemId() || _loc6_.id == DialModel.getIns(60810).getCurCostItemId())
               {
                  _loc20_ = true;
               }
               if(_loc6_.kind == 52 || _loc6_.kind == 39 || _loc6_.id == 60610 || _loc6_.kind == 54)
               {
                  _loc4_ = true;
               }
               if(_loc6_.kind == 38)
               {
                  _loc18_ = true;
               }
               if(_loc6_.id == 83210)
               {
                  LuckTreeService.ins.checkRedPoint();
               }
            }
            _loc12_++;
         }
         if(_loc5_.length)
         {
            RecycleModel.ins.addIdleEquip(_loc5_);
         }
         checkWhenChange(_loc15_,_loc9_,_loc11_,_loc3_,_loc7_,_loc10_,_loc13_,_loc16_,_loc20_,_loc18_,_loc4_);
         ObserverMgr.ins.sendNotice("notice_refresh_module_need_resource_data");
      }
      
      public function reduce(param1:Array) : void
      {
         var _loc18_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc17_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc10_:int = 0;
         var _loc2_:* = null;
         var _loc16_:* = null;
         var _loc12_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = param1.length;
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc2_ = param1[_loc10_];
            _loc16_ = Uint64Util.toString(_loc2_.id);
            _loc12_ = this.itemLib.getValue(_loc16_);
            if(_loc12_ == null)
            {
               new LackItemIdFatal(this,_loc16_);
            }
            else
            {
               _loc12_.count = _loc12_.count - _loc2_.count;
               if(_loc12_.count <= 0)
               {
                  itemLib.remove(_loc16_);
               }
               sidCountLib[_loc12_.itemId] = getStcCount(_loc12_.itemId) - _loc2_.count;
               ObserverMgr.ins.sendNotice("msg_item_num_change",_loc12_);
               _loc5_ = StcMgr.ins.getItemVo(_loc12_.itemId);
               if(_loc5_.kind == 31)
               {
                  TreasureModel.ins.removeExpTreasure(_loc12_.id,_loc2_.count);
               }
               if(BagConsts.EQUIP_PLACE.indexOf(_loc5_.kind) >= 0)
               {
                  RecycleModel.ins.removeIdleEquip(_loc12_.id);
               }
               if(BagConsts.EQUIP_TREASURE_PLACE.indexOf(_loc5_.kind) >= 0)
               {
                  _loc18_ = true;
               }
               if(_loc5_.kind == 81)
               {
                  _loc18_ = true;
                  _loc8_ = true;
               }
               if(_loc5_.kind == 32)
               {
                  _loc11_ = true;
               }
               if(_loc5_.kind == 38)
               {
                  _loc15_ = true;
               }
               if(_loc5_.kind == 51 || _loc5_.kind == 72)
               {
                  _loc13_ = true;
               }
               if(_loc5_.id == HorseConsts.MASTER_COST_ITEM_ID)
               {
                  _loc9_ = true;
               }
               if(_loc5_.kind == 33)
               {
                  _loc3_ = true;
               }
               if(_loc5_.kind == 21)
               {
                  _loc6_ = true;
               }
               if(_loc5_.kind == 82)
               {
                  _loc14_ = true;
               }
               if(_loc5_.id == DialModel.getIns(60800).getCurCostItemId() || _loc5_.id == DialModel.getIns(60810).getCurCostItemId())
               {
                  _loc17_ = true;
               }
               if(_loc5_.kind == 52 || _loc5_.kind == 39 || _loc5_.id == 60610 || _loc5_.kind == 54)
               {
                  _loc4_ = true;
               }
            }
            _loc10_++;
         }
         checkWhenChange(_loc13_,_loc18_,_loc9_,_loc3_,_loc6_,_loc8_,_loc11_,_loc14_,_loc17_,_loc15_,_loc4_);
      }
      
      public function checkWhenChange(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(11000,equipPieceCanCompose));
         }
         if(param2)
         {
            CheckRoleTeamRedPointCtrl.ins.checkEquip();
         }
         if(param3)
         {
            HorseService.ins.checkWhenChange();
         }
         if(param4)
         {
            MilitaryModel.ins.checkWhenChange();
         }
         if(param5 || param6 || param7 || param8 || param10)
         {
            CheckRoleTeamRedPointCtrl.ins.checkEquip();
            CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         }
         if(param6)
         {
            NewerAlertModel.ins.checkCanTupo();
         }
         if(param7)
         {
            RoleLevelUpUtil.chekHasNeedPromptLevelUpHero();
         }
         if(param9)
         {
            DialModel.getIns(60800).checkRedPoint();
            DialModel.getIns(60810).checkRedPoint();
         }
         if(param11)
         {
            PetUtil.checkPetRedPoint();
         }
      }
      
      public function order() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         this.newItemArr.length = 0;
         var _loc2_:Array = itemLib.array.concat();
         _loc2_.sort(itemOrderSortFunc);
         itemLib.clear();
         sidCountLib = {};
         var _loc4_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = _loc2_[_loc5_];
            _loc3_ = Uint64Util.toString(_loc1_.id);
            itemLib.put(_loc3_,_loc1_);
            sidCountLib[_loc1_.itemId] = getStcCount(_loc1_.itemId) + _loc1_.count;
            ObserverMgr.ins.sendNotice("msg_item_num_change",_loc1_);
            _loc5_++;
         }
      }
      
      public function getCountById(param1:UInt64) : Number
      {
         return (itemLib.getValue(param1) as Item).count;
      }
      
      public function getStcCount(param1:int) : Number
      {
         if(sidCountLib.hasOwnProperty(param1) == false)
         {
            sidCountLib[param1] = 0;
         }
         return sidCountLib[param1];
      }
      
      public function getItemById(param1:UInt64) : Item
      {
         return this.itemLib.getValue(Uint64Util.toString(param1));
      }
      
      public function getIdBySid(param1:int) : UInt64
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.itemLib.array;
         for each(var _loc2_ in this.itemLib.array)
         {
            if(_loc2_.itemId == param1)
            {
               return _loc2_.id;
            }
         }
         return Uint64Util.fromNumber(0);
      }
      
      public function get itemArr() : Array
      {
         return this.itemLib.array;
      }
      
      public function toWealthVoArr() : Array
      {
         return WealthUtil.itemArrToWealthVoArr(this.itemLib.array);
      }
      
      public function getEquipByPosAtBag(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = this.itemLib.array.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = this.itemLib.array[_loc6_];
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.itemId);
            if(_loc3_.isEquiped == false && _loc4_.kind == param1)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc3_));
            }
            _loc6_++;
         }
         _loc2_.sort(WealthUtil.sortEquipOrTreasure);
         if(_loc2_.length)
         {
            firstEquipId = (_loc2_[0] as WealthVo).item.id;
         }
         return _loc2_;
      }
      
      private function sortEquip(param1:WealthVo, param2:WealthVo) : int
      {
         if(Uint64Util.toInt(param1.item.ability) > Uint64Util.toInt(param2.item.ability))
         {
            return -1;
         }
         if(Uint64Util.toInt(param1.item.ability) == Uint64Util.toInt(param2.item.ability))
         {
            if(param1.quality > param2.quality)
            {
               return -1;
            }
            return 1;
         }
         return 1;
      }
      
      public function hasEquipInBg(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = this.itemLib.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.itemLib.array[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(_loc2_.isEquiped == false && _loc3_.kind == param1)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function hasBetterEquip(param1:WealthVo, param2:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = this.itemLib.array.length;
         var _loc3_:Boolean = WealthUtil.isMengYueEquipOrTreasure(param2,param1.sid);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this.itemLib.array[_loc6_];
            if(isBetterEquip(param1,_loc4_,param2))
            {
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public function isBetterEquip(param1:WealthVo, param2:Item, param3:int) : Boolean
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param2.itemId);
         if(!param2.isEquiped && _loc4_.kind == param1.item.place)
         {
            if(WealthUtil.compareEquipOrTreausre(param1.sid,_loc4_.id,param3))
            {
               return true;
            }
         }
         return false;
      }
      
      public function stcItemIdArrToItemWealthVoArr(param1:Array) : Array
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
            _loc2_ = _loc2_.concat(stcItemIdToItemWealthVoArr(_loc3_));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function stcItemIdToItemArr(param1:int) : Array
      {
         return ArrayUtil.findArrByAttr(this.itemLib.array,Item.ITEMID.name,param1);
      }
      
      public function stcItemIdToItemWealthVoArr(param1:int) : Array
      {
         return WealthUtil.itemArrToWealthVoArr(stcItemIdToItemArr(param1));
      }
      
      public function countWealthVoSortTempProp(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = 0;
            _loc2_ = param1[_loc7_];
            _loc5_ = _loc2_.stcItemVo;
            _loc3_ = HeroModel.ins.getPanelBaseInfoByStcNpcId(_loc5_.heroPiece_stcNpcId);
            if(_loc3_ && _loc3_.place != 0)
            {
               _loc2_.extraData["HERO_POSITION"] = _loc3_.position;
               if(HeroModel.ins.isReinforcements(_loc3_.place) == false)
               {
                  _loc4_ = 2;
               }
               else
               {
                  _loc4_ = 1;
               }
            }
            else
            {
               _loc2_.extraData["HERO_POSITION"] = 9999;
            }
            _loc2_.extraData["HERO_PIECE_STATE"] = _loc4_;
            _loc7_++;
         }
         return param1;
      }
      
      public function getHeroPiecesArr() : Array
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc4_:int = this.itemArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.itemArr[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(_loc3_.kind == 21 && _loc3_.heroPiece_stcNpcId != 0)
            {
               _loc1_.push(WealthUtil.itemToVo(_loc2_));
            }
            _loc5_++;
         }
         return _loc1_;
      }
      
      public function getHeroPiecesArrByQuality(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = this.itemArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = this.itemArr[_loc6_];
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.itemId);
            if(_loc4_.kind == 21 && _loc4_.heroPiece_stcNpcId != 0 && param1.indexOf(_loc4_.quality.toString()) >= 0)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc3_));
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function heroPiecesCanActive() : Boolean
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = this.itemArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.itemArr[_loc4_];
            _loc2_ = StcMgr.ins.getItemVo(_loc1_.itemId);
            if(_loc2_.kind == 21)
            {
               if(this.getStcCount(_loc1_.itemId) >= _loc2_.heroPieceNeed)
               {
                  return true;
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      public function getRunesArr() : Array
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc4_:int = this.itemArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.itemArr[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(_loc3_.kind == 61)
            {
               _loc1_.push(WealthUtil.itemToVo(_loc2_));
            }
            _loc5_++;
         }
         return _loc1_;
      }
      
      public function getFashionAccArr(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = this.itemArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = this.itemArr[_loc6_];
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.itemId);
            if(param1 < 1 && _loc4_.kind == 15)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc3_));
            }
            if(param1 > -1 && _loc4_.kind == 16)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc3_));
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function getRuneArrByType(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == 0)
         {
            return getRunesArr();
         }
         var _loc2_:Array = [];
         var _loc5_:int = this.itemArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = this.itemArr[_loc6_];
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.itemId);
            if(_loc4_.kind == 61 && int(_loc4_.extend_1) == param1)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc3_));
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function get equipPieceCanCompose() : Boolean
      {
         var $canComposeArr:Array = nslm2.modules.bag.itemModuels.BagModel.ins.itemArr.filter(function(param1:Item, ... rest):Boolean
         {
            var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1.itemId);
            if((_loc3_.kind == 51 || _loc3_.kind == 72) && param1.count >= _loc3_.equipPieceComposeCount)
            {
               return true;
            }
            return false;
         });
         return $canComposeArr.length > 0;
      }
      
      public function itemCanCompose(param1:int) : Boolean
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc2_)
         {
            return _loc2_.kind == 21 || _loc2_.kind == 51;
         }
         return false;
      }
      
      public function getTreasurePieces() : Array
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = this.itemArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = this.itemArr[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc1_.itemId);
            if(_loc3_.kind == 72)
            {
               _loc2_.push(WealthUtil.itemToVo(_loc1_));
            }
            _loc5_++;
         }
         _loc2_.sortOn("quality",16);
         return _loc2_;
      }
      
      public function getAuctionItem() : Array
      {
         var _loc1_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(!allAuctionItemID)
         {
            _loc1_ = StcMgr.ins.getTabelArr("static_auction");
            allAuctionItemID = [];
            var _loc9_:int = 0;
            var _loc8_:* = _loc1_;
            for each(var _loc7_ in _loc1_)
            {
               allAuctionItemID.push(_loc7_.itemid);
            }
         }
         var _loc3_:Array = [];
         var _loc5_:int = this.itemArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.itemArr[_loc6_];
            _loc4_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(allAuctionItemID.indexOf(_loc2_.itemId) >= 0)
            {
               _loc3_.push(WealthUtil.itemToVo(_loc2_));
            }
            _loc6_++;
         }
         _loc3_.sortOn("quality",16 | 2);
         return _loc3_;
      }
      
      public function hasCanComposePet() : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc4_:int = this.itemArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.itemArr[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(_loc3_.kind == 52 && _loc2_.count >= _loc3_.heroPieceNeed && !PetModel.ins.getPetInfo(_loc3_.heroPiece_stcNpcId))
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
   }
}
