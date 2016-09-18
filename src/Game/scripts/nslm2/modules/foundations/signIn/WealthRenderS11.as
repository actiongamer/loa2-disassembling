package nslm2.modules.foundations.signIn
{
   import game.ui.commons.icons.WealthRenderS11UI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class WealthRenderS11 extends WealthRenderS11UI implements IObserver
   {
       
      
      private var specialEffect:BmcSpriteSheet;
      
      public function WealthRenderS11()
      {
         super();
      }
      
      override protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
            {
               ref_img_icon.smoothing = true;
               this.ref_img_icon.url = wealthVo.iconUrl(this.ref_img_icon.width);
               if(wealthVo.kind == 3 || wealthVo.kind == 4)
               {
                  if(specialEffect == null)
                  {
                     specialEffect = new BmcSpriteSheet();
                     specialEffect.init(800000,1,"all",true);
                     specialEffect.scaleAll = 0.7;
                     specialEffect.x = -14;
                     specialEffect.y = -9;
                  }
                  this.addChild(specialEffect);
               }
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
      }
   }
}
