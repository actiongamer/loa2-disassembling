package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldScene.panel.BattleFieldFlagInfoPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class BattleFlagInfoPanel extends BattleFieldFlagInfoPanelUI implements IObserver
   {
       
      
      public function BattleFlagInfoPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function update() : void
      {
         if(BattleFlagModel.ins.isShowCenterFlag)
         {
            (left_flagInfo as BattleFieldFlagInfoView).update(BattleFlagModel.ins.centerFlagInfo);
            right_flagInfo.visible = false;
         }
         else
         {
            (left_flagInfo as BattleFieldFlagInfoView).update(BattleFlagModel.ins.leftFlagInfo);
            (right_flagInfo as BattleFieldFlagInfoView).update(BattleFlagModel.ins.rightFlagInfo);
            right_flagInfo.visible = true;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_FLAG_STAUTS_UPDATE","MSG_MONSTER_COUNT_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_FLAG_STAUTS_UPDATE" !== _loc3_)
         {
            if("MSG_MONSTER_COUNT_CHANGE" === _loc3_)
            {
               updateMonsterCnt();
            }
         }
         else
         {
            update();
         }
      }
      
      public function updateMonsterCnt() : void
      {
         txt_monsterCnt.text = LocaleMgr.ins.getStr(50500164,[BattleFlagModel.ins.leftMonsterCnt,DefindConsts.BG_FIRE_NPC_LIMIT_NUM]);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.regObserver(this);
         super.dispose();
      }
   }
}
