package nslm2.modules.funnies.guilds.guildTechs
{
   import game.ui.guildTechs.GuildTechModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import com.mz.core.event.MzEvent;
   import proto.FamilyTechItem;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   
   public class GuildTechModule extends GuildTechModuleUI
   {
       
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      private var canResearch:Boolean;
      
      public function GuildTechModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.addEventListener("INIF_INFO_CPL",onInitInfoCpl);
         service.initInfo();
      }
      
      private function onInitInfoCpl(param1:Event) : void
      {
         super.moduleServerCpl();
      }
      
      public function get service() : GuildTechService
      {
         return GuildTechService.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this._textCdCtrl = new TextCDCtrlS2(this.txt_doing,textCDFormat,txtCDCtrl_cpl);
         this.refreshResearching();
         this.pageBar.bindList(this.list);
         this.list.array = service.infoRes.items;
         this.renderMy.wealthVo = WealthUtil.createStcVo(6);
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.ins.getFilterArr(301)[0]).addHandler(breath_cb));
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
         {
            this.btn_researchOpen.visible = true;
         }
         else
         {
            this.btn_researchOpen.visible = false;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_researchOpen === _loc3_)
         {
            ModuleMgr.ins.showModule(40751,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.list && this.list.cells)
         {
            _loc3_ = this.list.cells.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.list.cells[_loc4_] as GuildTechRender;
               _loc2_.breath_cb(param1);
               _loc4_++;
            }
         }
         if(canResearch)
         {
            this.btn_researchOpen.filters = param1;
         }
         else
         {
            this.btn_researchOpen.filters = null;
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            service.addEventListener("RESEARCH_START",onResearchStart);
            service.addEventListener("STUDY_CPL",onStudyCpl);
            service.addEventListener("RESEARCH_CPL",onResearchCpl);
         }
         else
         {
            service.removeEventListener("RESEARCH_START",onResearchStart);
            service.removeEventListener("STUDY_CPL",onStudyCpl);
            service.removeEventListener("RESEARCH_CPL",onResearchCpl);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         if(this.service.curReshStcVo)
         {
            return LocaleMgr.ins.getStr(40750102,[LocaleMgr.ins.getStr(1200 + service.curReshStcVo.techtype),service.infoRes.curreshlevel,TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),16046112)]);
         }
         return "";
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.txt_doing.visible = false;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      private function onResearchStart(param1:MzEvent) : void
      {
         refreshListItem(param1.data);
         refreshResearching();
      }
      
      private function refreshResearching() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(service.infoRes.curreshitem)
         {
            this.txt_doing.visible = true;
            this._textCdCtrl.start(service.infoRes.lastreshtime);
            this.canResearch = false;
         }
         else
         {
            this.txt_doing.visible = false;
            _textCdCtrl.stop();
            this.canResearch = false;
            _loc3_ = service.infoRes.items.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = service.infoRes.items[_loc4_];
               if(_loc2_.familytechlevel < service.infoRes.highestlevel)
               {
                  _loc1_ = GuildTechService.findStcVoByTechtypeAndRank(_loc2_.techtype,_loc2_.familytechlevel + 1);
                  if(_loc1_ && GuildModel.ins.guildInfo.fund >= _loc1_.cost)
                  {
                     this.canResearch = true;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      private function onStudyCpl(param1:MzEvent) : void
      {
      }
      
      private function onResearchCpl(param1:MzEvent) : void
      {
         onResearchStart(param1);
      }
      
      private function refreshListItem(param1:FamilyTechItem) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.list.cells.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.list.cells[_loc4_] as GuildTechRender;
            if(_loc2_.vo && _loc2_.vo.techtype == param1.techtype)
            {
               _loc2_.vo = param1;
            }
            _loc4_++;
         }
      }
      
      override public function close(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.close(param1);
      }
      
      override public function dispose() : void
      {
         if(_textCdCtrl)
         {
            _textCdCtrl.dispose();
            _textCdCtrl = null;
         }
         super.dispose();
      }
   }
}
