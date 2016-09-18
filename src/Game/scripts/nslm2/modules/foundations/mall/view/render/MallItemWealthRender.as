package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.MallItemRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class MallItemWealthRender extends MallItemRenderUI
   {
       
      
      private var eff:BmcSpriteSheet;
      
      public function MallItemWealthRender()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 1)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + LocaleConsts.getNumberAbbr2(param1.toString(),99999);
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(wealthVo && wealthVo.kind != 0)
         {
            if(wealthVo.quality >= 5)
            {
               if(!eff)
               {
                  eff = new BmcSpriteSheet();
                  eff.x = -19;
                  eff.y = -12;
                  eff.init(800000,1,"all",true);
                  addChild(eff);
               }
            }
            else if(eff)
            {
               eff.dispose();
               eff = null;
            }
         }
      }
   }
}
