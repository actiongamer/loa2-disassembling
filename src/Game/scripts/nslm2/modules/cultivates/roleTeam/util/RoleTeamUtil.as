package nslm2.modules.cultivates.roleTeam.util
{
   import nslm2.modules.bag.itemModuels.BagConsts;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import com.mz.core.utils.ArrayUtil;
   import proto.Item;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.BaoWu;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class RoleTeamUtil
   {
       
      
      public function RoleTeamUtil()
      {
         super();
      }
      
      public static function toEquipVoArr(param1:Array, param2:int = 0, param3:int = 0) : Array
      {
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc6_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc4_:Array = [];
         var _loc7_:int = BagConsts.EQUIP_PLACE.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc5_ = new HeroEquipVo();
            _loc5_.place = BagConsts.EQUIP_PLACE[_loc9_];
            _loc5_.targetLvl = param2;
            _loc8_ = ArrayUtil.findByAttr(param1,Item.PLACE.name,_loc5_.place);
            if(_loc8_)
            {
               _loc5_.wealthVo = WealthUtil.itemToVo(_loc8_);
               _loc5_.wealthVo.extraData = param3;
               _loc6_ = BagModel.ins.getItemById(_loc8_.id);
               if(_loc6_)
               {
                  _loc6_.suit = _loc8_.suit;
               }
            }
            _loc4_.push(_loc5_);
            _loc9_++;
         }
         return _loc4_;
      }
      
      public static function toEquipBaoWuVoArr(param1:Array, param2:int = 0, param3:int = 0) : Array
      {
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc4_:Array = [];
         var _loc7_:int = BagConsts.TREASURE_PLACE.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc6_ = new HeroEquipVo();
            _loc6_.targetLvl = param2;
            _loc6_.place = BagConsts.TREASURE_PLACE[_loc8_];
            _loc5_ = getTreauseByPos(param1,_loc6_.place);
            if(_loc5_)
            {
               _loc6_.wealthVo = WealthUtil.treasureToVo(_loc5_);
               _loc6_.wealthVo.extraData = param3;
            }
            _loc4_.push(_loc6_);
            _loc8_++;
         }
         return _loc4_;
      }
      
      public static function getTreauseByPos(param1:Array, param2:int) : BaoWu
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.baseId).kind;
            if(_loc4_ == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}
