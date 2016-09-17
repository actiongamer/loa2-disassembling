package nslm2.modules.cultivates.treasure
{
   import nslm2.modules.cultivates.horse.horseMaster.HorseShengjieCplModule;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BaoWu;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class TreasureFuwenKeyinCplModule extends HorseShengjieCplModule
   {
       
      
      public function TreasureFuwenKeyinCplModule()
      {
         super();
         this.moduleFadeInType = 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.txt_title1.text = LocaleMgr.ins.getStr(30616009);
         var _loc3_:BaoWu = param1 as BaoWu;
         var _loc2_:StcBaowuFuwenKeyinVo = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(_loc3_.baseId).quality,_loc3_.fuwenkeyin + 1]);
         this.txt_lvCur.text = LocaleConsts.gradeStr(int((_loc2_.level - 1) / 10));
         this.txt_lvNext.text = LocaleConsts.gradeStr(int(_loc2_.level / 10));
         this.txt_desc.text = LocaleMgr.ins.getStr(30616010,[int(_loc2_.fuwen_attr * 100) + "%"]);
         this.preShowCpl();
      }
   }
}
