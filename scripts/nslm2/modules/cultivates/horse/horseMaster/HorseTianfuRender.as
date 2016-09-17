package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorseTianfuRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.modules.cultivates.horse.HorseService;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   
   public class HorseTianfuRender extends HorseTianfuRenderUI
   {
       
      
      public function HorseTianfuRender()
      {
         super();
      }
      
      private function get vo() : StcHorseupgradeVo
      {
         return this.dataSource as StcHorseupgradeVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         var _loc5_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            _loc2_ = HorseUtil.getRank(HorseService.ins.masterLevel);
            if(vo.level <= _loc2_)
            {
               this.filters = null;
            }
            else
            {
               this.filters = [FilterUtil.grayFilter()];
            }
            _loc6_ = LocaleMgr.ins.getStr(vo.talentdesc).split("+");
            _loc4_ = vo.talent.split(":")[0];
            _loc3_ = uint(NpcPropVo.getValueColorByPropId(_loc4_));
            _loc5_ = _loc6_[0] + TextFieldUtil.htmlText2("+" + _loc6_[1],_loc3_);
            this.txt_name.text = "[" + LocaleMgr.ins.getStr(vo.talentname) + "] " + _loc5_ + "（" + LocaleMgr.ins.getStr(vo.name) + LocaleMgr.ins.getStr(30300013) + "）";
         }
      }
   }
}
