package nslm2.modules.battles.guildDungeons
{
   import nslm2.modules.Chapters.DungeonMapBaseModule;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import morn.core.components.Component;
   import morn.core.components.List;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import morn.core.events.UIEvent;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.Chapters.DungeonInfoPanelCtrl;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class GuildDungeonModule extends DungeonMapBaseModule
   {
       
      
      private var _dungeonMapContent:nslm2.modules.battles.guildDungeons.GuildMapContentPanel;
      
      private var _dungeonInfoPanel:nslm2.modules.battles.guildDungeons.GuildDungeonInfoPanel;
      
      private var _panel3D:UIPanel3D;
      
      public function GuildDungeonModule()
      {
         _dungeonMapContent = new nslm2.modules.battles.guildDungeons.GuildMapContentPanel();
         _dungeonInfoPanel = new nslm2.modules.battles.guildDungeons.GuildDungeonInfoPanel();
         super();
      }
      
      override protected function get content() : Component
      {
         return _dungeonMapContent;
      }
      
      override protected function get listMap() : List
      {
         return _dungeonMapContent.list_map;
      }
      
      public function get model() : GuildDungeonModel
      {
         return GuildDungeonModel.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(EnvConfig.ins.useServer)
         {
            GuildDungeonService.ins.familyStageEnterChapter();
            GuildDungeonService.ins.familyDamageRank();
         }
         else
         {
            moduleServerCpl();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.img_bg.addEventListener("imageLoaded",onImageLoaded);
            model.addEventListener("evtGetInfoCpl",onGetInfoCpl);
         }
         else
         {
            this.img_bg.removeEventListener("imageLoaded",onImageLoaded);
            model.removeEventListener("evtGetInfoCpl",onGetInfoCpl);
         }
      }
      
      private function onGetInfoCpl(param1:MzEvent) : void
      {
         if(GuildModel.ins.guildInfo == null)
         {
            GuildServiceHandler.ins.reqGuildinfo();
         }
         else
         {
            this.moduleServerCpl();
         }
      }
      
      private function onImageLoaded(param1:UIEvent) : void
      {
         if(this.img_bg.bitmapData)
         {
            this.panelBg.titleImgId = this.moduleId;
            _panel3D = new UIPanel3D(this);
            DisplayUtils.addChildAbove(_panel3D,this.img_bg);
            _panel3D.initByImage(this.img_bg,this.panelBg);
            GuildDungeonModel.ins.panel3D = _panel3D;
            _panel3D.visible = false;
            _dungeonMapContent.init();
            _dungeonMapContent.x = 6;
            _dungeonMapContent.y = 32;
            this.parts.push(new DungeonInfoPanelCtrl(_dungeonInfoPanel,this));
            this.addChild(new VipHintBox(10600,56,100));
            this.preShowCpl();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.bgCustom.addChildAt(this.img_bg,0);
         this.img_bg.skin = UrlLib.guildMapBg(GuildDungeonModel.ins.todayChapterId);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("guild_notice_update_guild_info" === _loc3_)
         {
            this.moduleServerCpl();
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         _panel3D.visible = true;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(_panel3D)
         {
            _panel3D.dispose();
            _panel3D = null;
            GuildDungeonModel.ins.panel3D = null;
         }
         super.preClose(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("guild_notice_update_guild_info");
      }
   }
}
