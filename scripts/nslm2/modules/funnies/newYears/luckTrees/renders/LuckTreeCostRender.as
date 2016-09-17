package nslm2.modules.funnies.newYears.luckTrees.renders
{
   import game.ui.newYears.luckTrees.renders.LuckTreeCostRenderUI;
   
   public class LuckTreeCostRender extends LuckTreeCostRenderUI
   {
       
      
      public function LuckTreeCostRender()
      {
         super();
      }
      
      override protected function validateTxtNum() : void
      {
         super.validateTxtName();
         if(wealthVo.kind == 20)
         {
            this.ref_txt_num.text = wealthVo.showCount.toString();
            this.ref_txt_num.x = this.img_icon.width + 2;
            this.img_icon.url = wealthVo.iconUrl();
         }
         else
         {
            this.ref_txt_num.text = wealthVo.showName + ":" + wealthVo.showCount;
            this.img_icon.visible = false;
         }
      }
   }
}
