package nslm2.modules.funnies.newYears.luckTrees.renders
{
   import game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI;
   
   public class PersonTreeRewardIcon extends PersonTreeRewardIconUI
   {
       
      
      public function PersonTreeRewardIcon()
      {
         super();
         this.img_icon.mask = this.img_mask;
      }
      
      public function clone() : PersonTreeRewardIcon
      {
         var _loc1_:PersonTreeRewardIcon = new PersonTreeRewardIcon();
         _loc1_.dataSource = this.dataSource;
         return _loc1_;
      }
   }
}
