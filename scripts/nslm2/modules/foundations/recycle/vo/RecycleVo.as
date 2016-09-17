package nslm2.modules.foundations.recycle.vo
{
   import nslm2.common.vo.WealthVo;
   import proto.PanelBaseInfo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.utils.Uint64Util;
   import com.netease.protobuf.UInt64;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   
   public class RecycleVo
   {
       
      
      public var wealthVo:WealthVo;
      
      public var heroBaseInfo:PanelBaseInfo;
      
      public var isSelected:Boolean;
      
      public var petInfoVo:PetInfoVo;
      
      public function RecycleVo()
      {
         super();
      }
      
      public function get quality() : int
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(heroBaseInfo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(heroBaseInfo.baseId);
            return _loc2_.quality;
         }
         if(wealthVo && wealthVo.item)
         {
            _loc1_ = StcMgr.ins.getItemVo(wealthVo.item.itemId);
            if(_loc1_)
            {
               return _loc1_.quality;
            }
         }
         if(wealthVo && wealthVo.treasure)
         {
            _loc1_ = StcMgr.ins.getItemVo(wealthVo.treasure.baseId);
            if(_loc1_)
            {
               return _loc1_.quality;
            }
         }
         return 0;
      }
      
      public function get fightValue() : int
      {
         if(heroBaseInfo)
         {
            return Uint64Util.toNumber(heroBaseInfo.ability);
         }
         if(wealthVo && wealthVo.item)
         {
            return Uint64Util.toNumber(wealthVo.item.ability);
         }
         return 0;
      }
      
      public function get id() : UInt64
      {
         if(heroBaseInfo)
         {
            return heroBaseInfo.id;
         }
         if(wealthVo && wealthVo.item)
         {
            return wealthVo.item.id;
         }
         if(wealthVo && wealthVo.treasure)
         {
            return wealthVo.treasure.id;
         }
         return null;
      }
      
      public function get tupoLvl() : int
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(heroBaseInfo)
         {
            _loc1_ = StcMgr.ins.getNpcVo(heroBaseInfo.baseId);
            if(_loc1_)
            {
               _loc2_ = _loc1_.tupo;
            }
         }
         return _loc2_;
      }
      
      public function get phaseLvl() : int
      {
         var _loc1_:int = 0;
         if(heroBaseInfo)
         {
            _loc1_ = heroBaseInfo.shengjie;
         }
         return _loc1_;
      }
      
      public function get strenLvl() : int
      {
         var _loc1_:* = null;
         if(wealthVo && wealthVo.item)
         {
            _loc1_ = StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId);
            if(_loc1_)
            {
               return _loc1_.level;
            }
         }
         return 0;
      }
      
      public function get jinlianLvl() : int
      {
         var _loc1_:* = null;
         if(wealthVo && wealthVo.item)
         {
            _loc1_ = StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId);
            if(_loc1_)
            {
               return _loc1_.level;
            }
         }
         return 0;
      }
   }
}
