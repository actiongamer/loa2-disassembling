package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonTargetRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.battles.guildDungeons.GuildDungeonService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildDungeonTargetRender extends GuildDungeonTargetRenderUI
   {
       
      
      public function GuildDungeonTargetRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.radio_target.preCondHandler = GuildModel.ins.isPresident;
      }
      
      public function get vo() : StcFamilyStageChapterVo
      {
         return dataSource as StcFamilyStageChapterVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.img_icon.skin = UrlLib.headIcon(this.vo.icon.toString());
            this.radio_target.selected = this.vo.id == GuildDungeonModel.ins.tomorrowChapterId;
            this.txt_fightValue.text = LocaleMgr.ins.getStr(this.vo.tuijianzhandouli);
            this.txt_chapterName.text = LocaleMgr.ins.getStr(this.vo.name);
            this.list_drops.dataSource = WealthUtil.costStrToArr(this.vo.showreward);
            if(GuildDungeonModel.ins.chapterCanFight(this.vo.id))
            {
               this.txt_condi.visible = false;
               this.radio_target.visible = true;
               radioTxt.visible = true;
            }
            else
            {
               this.txt_condi.text = GuildDungeonModel.ins.chapterCondStr(this.vo.id);
               this.txt_condi.visible = true;
               this.radio_target.visible = false;
               radioTxt.visible = false;
            }
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.radio_target === _loc2_)
         {
            if(this.radio_target.selected == true)
            {
               return;
            }
            if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
            {
               GuildDungeonService.ins.familyStageChapterSelect(this.vo.id);
               ModuleMgr.ins.closeModule(40722);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(40710515));
            }
         }
      }
   }
}
