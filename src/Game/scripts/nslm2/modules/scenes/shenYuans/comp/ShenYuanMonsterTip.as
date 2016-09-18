package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanMosnterTipUI;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianMonsterVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class ShenYuanMonsterTip extends ShenYuanMosnterTipUI
   {
       
      
      private var monstVO:StcNvshendianMonsterVo;
      
      public function ShenYuanMonsterTip()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         txt_monsterName.text = LocaleMgr.ins.getStr(StcMgr.ins.getNpcGroupVo(param1.id).name);
         var _loc4_:Array = StcMgr.ins.getNpcGroupVo(param1.id).formation_group.split("|");
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc2_ in _loc4_)
         {
            if(_loc2_ > 0)
            {
               _loc3_ = _loc3_ + StcMgr.ins.getNpcVo(_loc2_).combat_power;
            }
         }
         txt_power.value = _loc3_;
      }
   }
}
