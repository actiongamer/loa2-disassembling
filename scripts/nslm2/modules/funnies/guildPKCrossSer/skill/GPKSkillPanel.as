package nslm2.modules.funnies.guildPKCrossSer.skill
{
   import game.ui.guildPKCrossSer.GPKSkillPanelUI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GPKSkillPanel extends GPKSkillPanelUI
   {
       
      
      public function GPKSkillPanel()
      {
         super();
         this.img_bg0.skin = UrlLib.gpkcUrl("img_skill_bg0.png");
         this.list_item.itemRender = GPKSkillRender;
         initList();
         this.btn_rank.label = LocaleMgr.ins.getStr(99900132);
         this.btn_rank.clickHandler = clickhandler;
      }
      
      private function clickhandler() : void
      {
         ModuleMgr.ins.showOrCloseModule(40769,null,this.moduleId);
      }
      
      private function initList() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc1_.push(new GPKSkillvo(_loc2_));
            _loc2_++;
         }
         this.list_item.dataSource = _loc1_;
      }
   }
}
