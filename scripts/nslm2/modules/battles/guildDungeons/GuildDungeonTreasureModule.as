package nslm2.modules.battles.guildDungeons
{
   import game.ui.guildDungeon.GuildDungeonTreasureModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import com.mz.core.event.MzEvent;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.FilterUtil;
   import nslm2.utils.TimeUtils;
   
   public class GuildDungeonTreasureModule extends GuildDungeonTreasureModuleUI
   {
       
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      public function GuildDungeonTreasureModule()
      {
         super();
         switchEventListeners(true);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         GuildDungeonService.ins.familyStageRewardInfo();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            GuildDungeonModel.ins.addEventListener("evtGetTreasureInfoCpl",onRewardCpl);
            GuildDungeonModel.ins.addEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
         else
         {
            GuildDungeonModel.ins.removeEventListener("evtGetTreasureInfoCpl",onRewardCpl);
            GuildDungeonModel.ins.removeEventListener("evtGetTreasureCpl",onGetTreasureCpl);
         }
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      private function onGetTreasureCpl(param1:MzEvent) : void
      {
         setDataSource();
      }
      
      private function setDataSource() : void
      {
         this.list_reward.dataSource = ArrayUtil.packItem(GuildDungeonModel.ins.treasureDic.array.sortOn("position",16),4);
         this.list_aceReward.dataSource = GuildDungeonModel.ins.getAceRewardArr();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         setDataSource();
         this.list_reward.dataSource = ArrayUtil.packItem(GuildDungeonModel.ins.treasureDic.array.sortOn("position",16),4);
         this.list_aceReward.dataSource = GuildDungeonModel.ins.getAceRewardArr();
         if(GuildDungeonModel.ins.isAllCleared())
         {
            this.txt_title.text = LocaleMgr.ins.getStr(40710205);
            this.txt_alert.visible = false;
            this.list_reward.filters = null;
            this.list_reward.mouseEvent = true;
         }
         else
         {
            this.txt_title.text = LocaleMgr.ins.getStr(40710203);
            this.txt_alert.visible = true;
            this.list_reward.filters = [FilterUtil.grayFilter()];
            this.list_reward.mouseEvent = false;
         }
         this._textCdCtrl = new TextCDCtrlS2(this.txt_timer,textCDFormat,null);
         this._textCdCtrl.start(GuildDungeonModel.ins.nextResetTime);
         this.preShowCpl();
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000029) + TimeUtils.hisColonFullAddZero(param1);
      }
   }
}
