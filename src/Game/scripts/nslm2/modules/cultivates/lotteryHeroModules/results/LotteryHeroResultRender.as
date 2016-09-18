package nslm2.modules.cultivates.lotteryHeroModules.results
{
   import game.ui.lotteryHeroModules.results.LotteryHeroResultRenderUI;
   
   public class LotteryHeroResultRender extends LotteryHeroResultRenderUI
   {
       
      
      public function LotteryHeroResultRender()
      {
         super();
      }
      
      public function showImgNew(param1:Boolean) : void
      {
         this.imgNew.visible = param1;
      }
   }
}
