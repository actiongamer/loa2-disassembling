package nslm2.modules.footstones.assistantModules.subAssistants.battlefield
{
   import game.ui.assistantModules.panels.AssisBattlefieldPanelUI;
   import nslm2.modules.footstones.assistantModules.interfaces.IAssisPanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.vos.AssistantBattlefieldSettingVo;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.subAssistants.battlefield.consts.AssistantBattlefieldConsts;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.MathUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class AssisBattlefieldPanel extends AssisBattlefieldPanelUI implements IAssisPanel
   {
       
      
      public function AssisBattlefieldPanel()
      {
         super();
         initLanguage();
         init();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function initLanguage() : void
      {
         this.txt_60200001.text = LocaleMgr.ins.getStr(60200001);
         this.txt_60200013.text = LocaleMgr.ins.getStr(60200013);
         this.txt_60200018.text = LocaleMgr.ins.getStr(60200018);
         this.check_autoLineUp.label = LocaleMgr.ins.getStr(60200011);
         this.check_attack.label = LocaleMgr.ins.getStr(60200014);
         this.check_notAttackBuff.label = LocaleMgr.ins.getStr(60200015);
         this.check_fightValue.label = LocaleMgr.ins.getStr(60200016);
         this.check_lowHpPer.label = LocaleMgr.ins.getStr(60200017);
         this.radio_60200019.label = LocaleMgr.ins.getStr(60200019);
         this.radio_60200020.label = LocaleMgr.ins.getStr(60200020);
         this.radio_60200021.label = LocaleMgr.ins.getStr(60200021);
         this.radio_60200022.label = LocaleMgr.ins.getStr(60200022);
         this.txt_60200023.text = LocaleMgr.ins.getStr(60200023);
         this.radio_60200024.label = LocaleMgr.ins.getStr(60200024);
         this.radio_60200025.label = LocaleMgr.ins.getStr(60200025);
         this.radio_60200027.label = LocaleMgr.ins.getStr(60200027);
         this.check_monUp.label = LocaleMgr.ins.getStr(50500172);
         this.check_monDown.label = LocaleMgr.ins.getStr(50500173);
         this.check_monLeft.label = LocaleMgr.ins.getStr(50500174);
         this.check_monRight.label = LocaleMgr.ins.getStr(50500175);
         btn_save.label = LocaleMgr.ins.getStr(60200009);
      }
      
      private function getData() : AssistantBattlefieldSettingVo
      {
         var _loc1_:AssistantBattlefieldSettingVo = AssistantModel.ins.getSetting(50500);
         if(_loc1_ == null)
         {
            _loc1_ = new AssistantBattlefieldSettingVo();
         }
         return _loc1_;
      }
      
      private function init() : void
      {
         var _loc1_:AssistantBattlefieldSettingVo = getData();
         this.check_autoLineUp.selected = _loc1_.autoLineUp;
         this.check_attack.selected = _loc1_.needAttackPlayer;
         this.check_notAttackBuff.selected = _loc1_.notAttackBuffPlayer;
         this.check_fightValue.selected = _loc1_.onlyAttackLowerFightValue;
         this.txt_fightValue.num = _loc1_.lowerFightValue;
         this.check_lowHpPer.selected = _loc1_.notAttackLowHp;
         this.txt_lowHpPer.num = _loc1_.lowHpPer;
         if(_loc1_.cryAutoMode == 0)
         {
            this.radio_gatherMode.selectedIndex != -1;
         }
         else
         {
            this.radio_gatherMode.selectedIndex = AssistantBattlefieldConsts.CRY_MODE_ARRAY.indexOf(_loc1_.cryAutoMode);
         }
         this.radio_flagMode.selectedIndex = AssistantBattlefieldConsts.FLAG_MODE_ARRAY.indexOf(_loc1_.flagAutoMode);
         this.check_monUp.selected = _loc1_.needKillUpMon;
         this.check_monDown.selected = _loc1_.needKillDownMon;
         this.check_monLeft.selected = _loc1_.needKillLeftMon;
         this.check_monRight.selected = _loc1_.needKillRightMon;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_save === _loc2_)
         {
            saveSetting();
            ObserverMgr.ins.sendNotice("closeSettingPanel");
         }
      }
      
      public function saveSetting() : void
      {
         var _loc1_:AssistantBattlefieldSettingVo = getData();
         _loc1_.autoLineUp = this.check_autoLineUp.selected;
         if(this.radio_gatherMode.selectedIndex != -1)
         {
            _loc1_.cryAutoMode = AssistantBattlefieldConsts.CRY_MODE_ARRAY[this.radio_gatherMode.selectedIndex];
         }
         _loc1_.needAttackPlayer = this.check_attack.selected;
         _loc1_.notAttackBuffPlayer = this.check_notAttackBuff.selected;
         _loc1_.onlyAttackLowerFightValue = this.check_fightValue.selected;
         _loc1_.lowerFightValue = uint(this.txt_fightValue.num);
         _loc1_.notAttackLowHp = this.check_lowHpPer.selected;
         _loc1_.lowHpPer = MathUtil.maxMin(uint(this.txt_lowHpPer.num),100,0);
         _loc1_.flagAutoMode = AssistantBattlefieldConsts.FLAG_MODE_ARRAY[this.radio_flagMode.selectedIndex];
         _loc1_.needKillUpMon = this.check_monUp.selected;
         _loc1_.needKillDownMon = this.check_monDown.selected;
         _loc1_.needKillLeftMon = this.check_monLeft.selected;
         _loc1_.needKillRightMon = this.check_monRight.selected;
         AssistantModel.ins.saveSetting(50500,_loc1_);
      }
   }
}
