package nslm2.modules.funnies.newYears.luckTrees.renders
{
   import game.ui.newYears.luckTrees.renders.PersonTreeBagRenderUI;
   
   public class PersonTreeBagRender extends PersonTreeBagRenderUI
   {
       
      
      public function PersonTreeBagRender()
      {
         super();
      }
      
      override protected function validateAll() : void
      {
         super.validateAll();
         if(this.ref_img_icon != null)
         {
            if(wealthVo)
            {
               if(wealthVo.extraData && wealthVo.extraData["isHide"])
               {
                  this.setVisibleList("isHide",false);
               }
               else
               {
                  this.setVisibleList("isHide",true);
               }
            }
         }
      }
   }
}
