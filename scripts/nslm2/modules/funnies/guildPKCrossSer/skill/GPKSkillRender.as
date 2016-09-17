package nslm2.modules.funnies.guildPKCrossSer.skill
{
   import game.ui.guildPKCrossSer.GPKSkillRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class GPKSkillRender extends GPKSkillRenderUI
   {
       
      
      public function GPKSkillRender()
      {
         super();
      }
      
      private function get vo() : GPKSkillvo
      {
         return dataSource as GPKSkillvo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         this.img_bg.skin = UrlLib.gpkcUrl("img_skill_bg" + (vo.id + 1) + ".png");
      }
   }
}
