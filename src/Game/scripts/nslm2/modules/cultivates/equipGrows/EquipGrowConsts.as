package nslm2.modules.cultivates.equipGrows
{
   import com.mz.core.utils.DictHash;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class EquipGrowConsts
   {
      
      public static const FLOAT_OFFSET_Y:int = -50;
      
      public static const subId_stren:int = 21;
      
      public static const subId_jinglian:int = 22;
      
      public static const subIdArr:Array = [21,22];
      
      public static const EQUIP_SHOW_SELECTE_EQUIP_PANEL:String = "equip_show_selecte_equip_panel";
      
      public static const EQUIP_WEAR_EQUIP:String = "equip_wear_equip";
      
      private static var _ins:nslm2.modules.cultivates.equipGrows.EquipGrowConsts;
       
      
      private var lib:DictHash;
      
      public function EquipGrowConsts()
      {
         var _loc1_:* = null;
         lib = new DictHash();
         super();
         _loc1_ = new EquipGrowSubConfigVo();
         _loc1_.subId = 21;
         _loc1_.nameCN = LocaleMgr.ins.getStr(999000041);
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new EquipGrowSubConfigVo();
         _loc1_.subId = 22;
         _loc1_.nameCN = LocaleMgr.ins.getStr(999000042);
      }
      
      public static function get ins() : nslm2.modules.cultivates.equipGrows.EquipGrowConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.equipGrows.EquipGrowConsts();
         }
         return _ins;
      }
      
      public function getVo(param1:int) : EquipGrowSubConfigVo
      {
         return lib.getValue(param1);
      }
   }
}
