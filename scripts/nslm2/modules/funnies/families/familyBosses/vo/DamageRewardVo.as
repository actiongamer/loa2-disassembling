package nslm2.modules.funnies.families.familyBosses.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcFamilyBossRewardVo;
   import nslm2.utils.WealthUtil;
   
   public class DamageRewardVo
   {
       
      
      public var stcVo:StcFamilyBossRewardVo;
      
      public var status:int;
      
      public var crtDmg:int;
      
      public function DamageRewardVo()
      {
         super();
      }
      
      public function get needDmg() : int
      {
         return stcVo.damage;
      }
      
      public function get reward() : Array
      {
         return WealthUtil.dropGroupIDToWealthVoArr(stcVo.dmg_drop);
      }
      
      public function get id() : int
      {
         return stcVo.id;
      }
   }
}
