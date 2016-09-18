package nslm2.modules.cultivates.skin
{
   import flash.events.EventDispatcher;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import game.ui.roleInfos.NpcPropVo;
   import proto.Item;
   import nslm2.utils.Uint64Util;
   import proto.HeroSkinInfoRes;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import com.netease.protobuf.UInt64;
   import proto.ItemReduce;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   
   public class SkinModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.skin.SkinModel;
       
      
      public var activeArr:Array;
      
      public var usedArr:Array;
      
      public var inactiveArr:Array;
      
      public var skinAddProp:Array;
      
      public var skinAddFight:Number = 0;
      
      public var usingSkinId:uint;
      
      private var totalArr:Array;
      
      private var _curHeroInfo:HeroInfo;
      
      public var initFlg:Boolean = true;
      
      public function SkinModel()
      {
         activeArr = [];
         usedArr = [];
         inactiveArr = [];
         skinAddProp = NpcPropVo.getEmptyPopArr(1,5,0);
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.skin.SkinModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.skin.SkinModel();
         }
         return _ins;
      }
      
      public function set curHeroInfo(param1:HeroInfo) : void
      {
         _curHeroInfo = param1;
         usingSkinId = 0;
         var _loc4_:int = 0;
         var _loc3_:* = usedArr;
         for each(var _loc2_ in usedArr)
         {
            if(StcMgr.ins.getItemVo(_loc2_).extend_4 == StcMgr.ins.getNpcVo(_curHeroInfo.baseInfo.baseId).node.toString())
            {
               usingSkinId = _loc2_;
            }
         }
         updateAbilityAndProp();
      }
      
      private function updateAbilityAndProp() : void
      {
         if(curHeroInfo == null)
         {
            return;
         }
         this.skinAddProp = NpcPropVo.getEmptyPopArr(1,5,0);
         this.skinAddFight = 0;
         var _loc3_:int = 0;
         var _loc2_:* = totalArr;
         for each(var _loc1_ in totalArr)
         {
            if(int(StcMgr.ins.getItemVo(_loc1_.itemId).extend_4) == StcMgr.ins.getNpcVo(_curHeroInfo.baseInfo.baseId).node && (_loc1_.isEquiped || _loc1_.place > 0))
            {
               this.skinAddFight = this.skinAddFight + Uint64Util.toNumber(_loc1_.ability);
               this.skinAddProp = NpcPropVo.addProp(skinAddProp,NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_loc1_.itemId)));
            }
         }
      }
      
      public function get curHeroInfo() : HeroInfo
      {
         return _curHeroInfo;
      }
      
      public function parseInfo(param1:HeroSkinInfoRes) : void
      {
         if(!param1)
         {
            return;
         }
         totalArr = param1.info;
         activeArr = [];
         usedArr = [];
         inactiveArr = [];
         this.skinAddFight = 0;
         this.skinAddProp = NpcPropVo.getEmptyPopArr(1,5,0);
         var _loc4_:int = 0;
         var _loc3_:* = param1.info;
         for each(var _loc2_ in param1.info)
         {
            if(_loc2_.isEquiped)
            {
               usedArr.push(_loc2_.itemId);
               skinAddFight = skinAddFight + Uint64Util.toNumber(_loc2_.ability);
               this.skinAddProp = NpcPropVo.addProp(skinAddProp,NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_loc2_.itemId)));
            }
            else if(_loc2_.place > 0)
            {
               activeArr.push(_loc2_.itemId);
               skinAddFight = skinAddFight + Uint64Util.toNumber(_loc2_.ability);
               this.skinAddProp = NpcPropVo.addProp(skinAddProp,NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_loc2_.itemId)));
            }
            else
            {
               inactiveArr.push(_loc2_.itemId);
            }
            if(!BagModel.ins.getItemById(_loc2_.id))
            {
               BagModel.ins.add([_loc2_]);
            }
         }
         updateAbilityAndProp();
         BagModel.ins.order();
      }
      
      public function isActive(param1:uint) : Boolean
      {
         return activeArr.indexOf(param1) != -1;
      }
      
      public function isUsed(param1:uint) : Boolean
      {
         return usedArr.indexOf(param1) != -1;
      }
      
      public function canActive(param1:uint) : Boolean
      {
         return inactiveArr.indexOf(param1) != -1;
      }
      
      public function canActiveByNpcId(param1:uint) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = getSkinAvailArrByNpcId(param1);
         for each(var _loc2_ in getSkinAvailArrByNpcId(param1))
         {
            if(canActive(_loc2_.id))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasActivatedSkin() : Boolean
      {
         return activeArr.length > 0;
      }
      
      public function changeFashion(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            return;
         }
         switch(int(param1) - 1)
         {
            case 0:
               usingSkinId = param2;
               ArrayUtil.removeItem(this.activeArr,param2);
               if(this.usedArr.indexOf(param2) == -1)
               {
                  this.usedArr.push(param2);
               }
               curHeroInfo.baseInfo.skin = param2;
               break;
            case 1:
               usingSkinId = 0;
               ArrayUtil.removeItem(this.usedArr,param2);
               if(this.activeArr.indexOf(param2) == -1)
               {
                  this.activeArr.push(param2);
               }
               curHeroInfo.baseInfo.skin = 0;
         }
         this.dispatchEvent(new MzEvent("evtFashionUsingChange",["OK"]));
         ObserverMgr.ins.sendNotice("evtFashionUsingChange");
      }
      
      public function get fashionSuitList() : Array
      {
         return StcMgr.ins.getVoArrByMultiColumnValue("static_item",["kind","extend_4"],[14,StcMgr.ins.getNpcVo(curHeroInfo.baseInfo.baseId).node.toString()]);
      }
      
      public function getSkinAvailArrByNpcId(param1:int) : Array
      {
         return StcMgr.ins.getVoArrByMultiColumnValue("static_item",["kind","extend_4"],[14,StcMgr.ins.getNpcVo(param1).node.toString()]);
      }
      
      public function getSkinListByNodeId(param1:int) : Array
      {
         return StcMgr.ins.getVoArrByMultiColumnValue("static_item",["kind","extend_1"],[14,param1]);
      }
      
      public function getEquppiedSkinIdByNpcId(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = usedArr;
         for each(var _loc2_ in usedArr)
         {
            if(StcMgr.ins.getItemVo(_loc2_).extend_4 == param1.toString())
            {
               return _loc2_;
            }
         }
         return 0;
      }
      
      public function getActivedCountNodeId(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Array = activeArr.concat(usedArr);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(StcMgr.ins.getItemVo(_loc4_).extend_1 == param1.toString())
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function onDataChangeOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = totalArr;
         for each(var _loc2_ in totalArr)
         {
            if(_loc2_.itemId == param1)
            {
               _loc2_.place = 1;
               this.skinAddFight = this.skinAddFight + Uint64Util.toNumber(_loc2_.ability);
               this.skinAddProp = NpcPropVo.addProp(this.skinAddProp,NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_loc2_.itemId)));
            }
         }
         updateAbilityAndProp();
         this.activateFashion(param1);
         this.dispatchEvent(new MzEvent("evtActivateCpl",param1));
      }
      
      public function activateFashion(param1:int) : void
      {
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1);
         ArrayUtil.removeItem(this.inactiveArr,param1);
         if(this.activeArr.indexOf(param1) == -1)
         {
            this.activeArr.push(param1);
         }
         var _loc4_:UInt64 = BagModel.ins.getIdBySid(param1);
         var _loc2_:ItemReduce = new ItemReduce();
         _loc2_.id = _loc4_;
         QuickUseModel.ins.removeQuickUse([_loc2_]);
      }
      
      public function getFightValue(param1:int) : Number
      {
         var _loc4_:int = 0;
         var _loc3_:* = totalArr;
         for each(var _loc2_ in totalArr)
         {
            if(_loc2_.itemId == param1)
            {
               return Uint64Util.toNumber(_loc2_.ability);
            }
         }
         return 0;
      }
   }
}
