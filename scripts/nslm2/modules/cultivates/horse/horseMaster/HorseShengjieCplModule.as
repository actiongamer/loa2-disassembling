package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorseShengjieCplModuleUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class HorseShengjieCplModule extends HorseShengjieCplModuleUI
   {
       
      
      public function HorseShengjieCplModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:StcHorseupgradeVo = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",param1 as int);
         this.txt_lvCur.text = LocaleConsts.lvStr(_loc2_.level - 1);
         this.txt_lvNext.text = LocaleConsts.lvStr(_loc2_.level);
         var _loc6_:Array = LocaleMgr.ins.getStr(_loc2_.talentdesc).split("+");
         var _loc4_:int = _loc2_.talent.split(":")[0];
         var _loc3_:uint = NpcPropVo.getValueColorByPropId(_loc4_);
         var _loc5_:String = _loc6_[0] + TextFieldUtil.htmlText2("+" + _loc6_[1],_loc3_);
         this.txt_desc.text = "[" + LocaleMgr.ins.getStr(_loc2_.talentname) + "] " + _loc5_;
         this.preShowCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_confirm === _loc2_)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
   }
}
