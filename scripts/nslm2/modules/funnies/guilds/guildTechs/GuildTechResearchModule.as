package nslm2.modules.funnies.guilds.guildTechs
{
   import game.ui.guildTechs.GuildTechResearchModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import proto.FamilyTechItem;
   import com.mz.core.event.MzEvent;
   
   public class GuildTechResearchModule extends GuildTechResearchModuleUI
   {
       
      
      public function GuildTechResearchModule()
      {
         super();
      }
      
      public function get service() : GuildTechService
      {
         return GuildTechService.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this.txt_tip.text = LocaleMgr.ins.getStr(999000425,[TextFieldUtil.htmlText2(service.infoRes.highestlevel,458496)]);
         this.refreshFund();
         this.list.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         var _loc2_:Array = service.infoRes.items.concat();
         _loc2_.sort(listSortFunc);
         this.list.array = _loc2_;
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.ins.getFilterArr(301)[0]).addHandler(breath_cb));
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            service.addEventListener("RESEARCH_START",onResearchStart);
            service.addEventListener("RESEARCH_CPL",onResearchCpl);
         }
         else
         {
            service.removeEventListener("RESEARCH_START",onResearchStart);
            service.removeEventListener("RESEARCH_CPL",onResearchCpl);
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
               _loc2_ = this.list.cells[_loc4_] as GuildTechResearchRender;
               _loc2_.breath_cb(param1);
               _loc4_++;
            }
         }
      }
      
      private function refreshFund() : void
      {
         this.txt_tip2.text = LocaleMgr.ins.getStr(999000426) + TextFieldUtil.htmlText2(String(GuildModel.ins.guildInfo.fund),458496);
      }
      
      private function refreshListItem(param1:FamilyTechItem) : void
      {
         this.list.refresh();
      }
      
      private function listSortFunc(param1:FamilyTechItem, param2:FamilyTechItem) : int
      {
         if(service.curReshStcVo)
         {
            if(service.curReshStcVo.techtype == param1.techtype)
            {
               return -1;
            }
            if(service.curReshStcVo.techtype == param2.techtype)
            {
               return 1;
            }
         }
         return listSortFunc2(param1,param2);
      }
      
      private function listSortFunc2(param1:FamilyTechItem, param2:FamilyTechItem) : int
      {
         if(param1.techtype < param2.techtype)
         {
            return -1;
         }
         if(param1.techtype > param2.techtype)
         {
            return 1;
         }
         return 0;
      }
      
      private function onResearchStart(param1:MzEvent) : void
      {
         this.refreshFund();
         refreshListItem(param1.data);
      }
      
      private function onResearchCpl(param1:MzEvent) : void
      {
         onResearchStart(param1);
      }
   }
}
