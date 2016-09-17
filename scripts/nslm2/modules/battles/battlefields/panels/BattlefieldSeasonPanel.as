package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldRank.panel.BattlefieldSeasonPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class BattlefieldSeasonPanel extends BattlefieldSeasonPanelUI implements IViewStackPage
   {
       
      
      public function BattlefieldSeasonPanel()
      {
         var _loc1_:* = NaN;
         super();
         var _loc2_:StcBgtitleIntvlVo = StcMgr.ins.getBgtitleIntvlVo(BattlefieldModel.ins.bgInfoRes.degree);
         this.topUI.txt_myGrade.text = LocaleMgr.ins.getStr(50500007,[!!_loc2_?LocaleMgr.ins.getStr(_loc2_.tite_name):LocaleMgr.ins.getStr(999000020)]);
         this.topUI.txt_myScore.text = LocaleMgr.ins.getStr(50500006,[BattlefieldModel.ins.bgInfoRes.score]);
         if(BattlefieldModel.ins.bgInfoRes.residualDay == 0)
         {
            this.topUI.txt_leftDays.text = LocaleMgr.ins.getStr(50500119);
         }
         else
         {
            this.topUI.txt_leftDays.text = LocaleMgr.ins.getStr(50500008,[BattlefieldModel.ins.bgInfoRes.residualDay]);
         }
         this.topUI.txt_victoryCnt.text = LocaleMgr.ins.getStr(50500126) + ":" + BattlefieldModel.ins.bgInfoRes.winTimes;
         if(BattlefieldModel.ins.bgInfoRes.winTimes + BattlefieldModel.ins.bgInfoRes.failTimes == 0)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = Number(BattlefieldModel.ins.bgInfoRes.winTimes / (BattlefieldModel.ins.bgInfoRes.winTimes + BattlefieldModel.ins.bgInfoRes.failTimes));
         }
         this.topUI.txt_victoryPer.text = LocaleMgr.ins.getStr(50500127) + ":" + LocaleConsts.percentStr(_loc1_);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.show();
         this.fadeIn(0,13000);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function show() : void
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_bgtitle_intvl","title_need_kind",1);
         var _loc3_:Array = _loc2_.concat();
         _loc3_.sortOn("id",16 | 2);
         this.list_task.dataSource = _loc3_;
         var _loc1_:int = ArrayUtil.indexByAttr(_loc3_,"id",BattlefieldModel.ins.bgInfoRes.degree);
         if(_loc1_ != -1)
         {
            this.list_task.scrollTo(_loc1_);
         }
      }
   }
}
