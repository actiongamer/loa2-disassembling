package nslm2.modules.cultivates.pet.model
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import proto.PetInfo;
   import nslm2.utils.ProtoUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.common.vo.WealthVo;
   
   public class PetModel extends EventDispatcher implements IDispose
   {
      
      private static var _ins:nslm2.modules.cultivates.pet.model.PetModel;
      
      public static var maxStar:int = 15;
       
      
      private var petInfoDic:DictHash;
      
      private var _petListArr:Array;
      
      private var petStaticDic:DictHash;
      
      private var _followPetId:int;
      
      public var onBattlePetID:int;
      
      public var crtPetId:int;
      
      public var crtPetSkinId:int;
      
      public var avatar:UIUnit3D;
      
      public var panel3D:UIPanel3D;
      
      public var curSkinVo:StcPetStatusVo;
      
      public var lastUpdatePet:PetInfoVo;
      
      public function PetModel()
      {
         super();
         petInfoDic = new DictHash();
      }
      
      public static function get ins() : nslm2.modules.cultivates.pet.model.PetModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.pet.model.PetModel();
         }
         return _ins;
      }
      
      public static function getStarLightArray(param1:int, param2:Boolean = false) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < maxStar)
         {
            if(_loc4_ < param1)
            {
               _loc3_.push("StarLightOn");
            }
            else if(!param2)
            {
               _loc3_.push("StarLightOff");
            }
            else
            {
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get followPetId() : int
      {
         return SceneModel.ins.playerRole.pet != null?SceneModel.ins.playerRole.pet.id:0;
      }
      
      public function initPetInfo() : void
      {
         var _loc1_:* = null;
         petStaticDic = new DictHash();
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_npc","kind",21);
         _loc2_.sortOn("id",16);
         _petListArr = [];
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            _loc1_ = new PetInfoVo(_loc3_.id);
            petStaticDic.put(_loc1_.id,_loc1_);
            _petListArr.push(_loc1_);
         }
         sortPetList();
      }
      
      public function sortPetList() : void
      {
         if(_petListArr)
         {
            _petListArr.sort(sortPet);
         }
      }
      
      public function sortPet(param1:PetInfoVo, param2:PetInfoVo) : int
      {
         if(param1.id == onBattlePetID)
         {
            return -1;
         }
         if(param2.id == onBattlePetID)
         {
            return 1;
         }
         if(getPetInfo(param1.id) && !getPetInfo(param2.id))
         {
            return -1;
         }
         if(!getPetInfo(param1.id) && getPetInfo(param2.id))
         {
            return 1;
         }
         if(param1.stcVo.quality > param2.stcVo.quality)
         {
            return -1;
         }
         if(param1.stcVo.quality < param2.stcVo.quality)
         {
            return 1;
         }
         if(param1.id < param2.id)
         {
            return -1;
         }
         return 1;
      }
      
      public function getPetInfo(param1:int) : PetInfo
      {
         return petInfoDic.getValue(param1);
      }
      
      public function get crtPetInfo() : PetInfo
      {
         return petInfoDic.getValue(crtPetId);
      }
      
      public function get crtBattlePetInfo() : PetInfo
      {
         return petInfoDic.getValue(onBattlePetID);
      }
      
      public function get crtPetInfoVo() : PetInfoVo
      {
         return getStaticData(crtPetId);
      }
      
      public function updatePetInfo(param1:PetInfo) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:PetInfo = petInfoDic.getValue(param1.id);
         if(_loc3_)
         {
            ProtoUtils.copyParams(param1,_loc3_);
         }
         else
         {
            petInfoDic.put(param1.id,param1);
            _loc2_ = getStaticData(param1.id);
            if(_loc2_)
            {
               _loc2_.petInfo = param1;
            }
         }
         lastUpdatePet = getStaticData(param1.id);
         if(param1.position >= 7)
         {
            onBattlePetID = param1.id;
         }
         sortPetList();
         ObserverMgr.ins.sendNotice("update_pet_info",_loc3_);
         PetUtil.checkPetRedPoint();
      }
      
      public function updateAllPetInfo(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            updatePetInfo(_loc2_);
         }
      }
      
      public function get petListArr() : Array
      {
         if(!_petListArr)
         {
            initPetInfo();
         }
         return _petListArr;
      }
      
      public function getStaticData(param1:int) : PetInfoVo
      {
         if(petStaticDic == null)
         {
            initPetInfo();
         }
         return petStaticDic.getValue(param1);
      }
      
      public function changeFashion(param1:int) : void
      {
         crtPetInfo.status = param1;
         this.dispatchEvent(new MzEvent("evtFashionUsingChange",["OK"]));
         ObserverMgr.ins.sendNotice("evtFashionUsingChange");
      }
      
      public function canSelectPetList() : Array
      {
         var _loc1_:Array = petListArr;
         return _loc1_.filter(selectFilterFunc);
      }
      
      private function selectFilterFunc(param1:PetInfoVo, param2:int, param3:Array) : Boolean
      {
         return param1.petInfo && param1.petInfo.position <= 0;
      }
      
      public function getCanProtectPetList() : Array
      {
         var _loc1_:Array = petListArr;
         return _loc1_.filter(selectProtectFilterFunc);
      }
      
      public function haveProtectPetList() : Boolean
      {
         var _loc1_:Array = petListArr;
         return _loc1_.some(selectProtectFilterFunc);
      }
      
      private function selectProtectFilterFunc(param1:PetInfoVo, param2:int, param3:Array) : Boolean
      {
         return param1.id != onBattlePetID && param1.petInfo && param1.petInfo.position == 0;
      }
      
      public function dispose() : void
      {
         avatar = null;
         panel3D = null;
      }
      
      public function crtPetIsUsed() : Boolean
      {
         return crtPetId == onBattlePetID || crtPetInfo && crtPetInfo.position > 0;
      }
      
      public function getPetInfoByPosition(param1:int) : PetInfoVo
      {
         if(petStaticDic == null)
         {
            initPetInfo();
         }
         var _loc4_:int = 0;
         var _loc3_:* = petStaticDic.array;
         for each(var _loc2_ in petStaticDic.array)
         {
            if(_loc2_.petInfo && _loc2_.petInfo.position == param1)
            {
               return _loc2_;
            }
         }
         return new PetInfoVo(0);
      }
      
      public function get activatedPetArr() : Array
      {
         var _loc1_:Array = petListArr;
         return _loc1_.filter(filterActivatedPet);
      }
      
      private function filterActivatedPet(param1:PetInfoVo, param2:int, param3:Array) : Boolean
      {
         return param1.petInfo;
      }
      
      public function isActive(param1:int) : Boolean
      {
         return this.crtPetInfo && this.crtPetInfo.allStatus.indexOf(param1) != -1 || param1 == crtPetId;
      }
      
      public function isUsed(param1:int) : Boolean
      {
         return this.crtPetInfo && this.crtPetInfo.status == param1;
      }
      
      public function haveItemToActive() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",crtPetId);
         for each(var _loc1_ in StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",crtPetId))
         {
            if(crtPetInfo && crtPetInfo.allStatus.indexOf(_loc1_.id) == -1)
            {
               return canActive(WealthUtil.costStrToVo(_loc1_.item).sid);
            }
         }
         return false;
      }
      
      public function hasActivatedSkin() : Boolean
      {
         return this.crtPetInfo && this.crtPetInfo.allStatus.length > 1;
      }
      
      public function canActive(param1:uint) : Boolean
      {
         return BagModel.ins.getStcCount(param1) > 0;
      }
      
      public function onDataChangeOne(param1:uint) : void
      {
         if(crtPetInfo)
         {
            if(crtPetInfo.allStatus.indexOf(param1) == -1)
            {
               crtPetInfo.allStatus.push(param1);
            }
            crtPetInfoVo.initPetSkinPorpArr();
         }
         this.dispatchEvent(new MzEvent("evtActivateCpl",param1));
      }
      
      public function initStatus(param1:int = 0) : int
      {
         return (StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",!!param1?param1:int(crtPetId)).sortOn("condition")[0] as StcPetStatusVo).id;
      }
      
      public function get canRebornPetList() : Array
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc3_:Array = petListArr;
         _loc3_ = _loc3_.filter(filterCanRebornFunc);
         var _loc4_:int = _loc3_.length;
         var _loc1_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc6_];
            _loc2_ = new RecycleVo();
            _loc2_.petInfoVo = _loc5_;
            _loc2_.wealthVo = WealthUtil.PetToVo(_loc5_.petInfo);
            _loc1_.push(_loc2_);
            _loc6_++;
         }
         return _loc1_;
      }
      
      private function filterCanRebornFunc(param1:PetInfoVo, param2:int, param3:Array) : Boolean
      {
         return param1.petInfo && param1.petInfo.position == 0 && (param1.petInfo.grade > 1 || param1.petInfo.star > 0 || param1.petInfo.level > 1);
      }
      
      public function getModelByNpcId(param1:int) : uint
      {
         var _loc2_:PetInfo = getPetInfo(param1);
         if(_loc2_)
         {
            return StcMgr.ins.getPetStatusVo(_loc2_.status).model;
         }
         return 0;
      }
      
      public function getRenderVo(param1:int, param2:int = 0) : WealthVo
      {
         if(param1 % crtPetId == 1)
         {
            return WealthUtil.createNpcVo(!!param2?StcMgr.ins.getPetStatusVo(param1).node:int(crtPetId));
         }
         return WealthUtil.costStrToVo(StcMgr.ins.getPetStatusVo(param1).item);
      }
      
      public function getCanProtectPetAllList() : Array
      {
         var _loc1_:Array = petListArr;
         return _loc1_.filter(selectProtectFilterFunc2);
      }
      
      private function selectProtectFilterFunc2(param1:PetInfoVo, param2:int, param3:Array) : Boolean
      {
         return param1.id != onBattlePetID && param1.petInfo;
      }
      
      public function checkHaveUnEquipPet() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:int = 0;
         var _loc3_:* = petListArr;
         for each(var _loc2_ in petListArr)
         {
            if(_loc2_.petInfo)
            {
               _loc1_ = true;
            }
            if(_loc2_.petInfo && onBattlePetID == _loc2_.id)
            {
               return false;
            }
         }
         return _loc1_;
      }
   }
}
