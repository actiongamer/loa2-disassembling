package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.renzhengs.weiXinAndPhones.RenZhengWeiXinPanelUI;
   import nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengWeiXinPanel;
   import game.ui.renzhengs.weiXinAndPhones.RenZhengPhonePanelUI;
   import nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengPhonePanel;
   import game.ui.renzhengs.vipAuths.RenZhengVipRenderUI;
   import nslm2.modules.funnies.renZhengs.vipAuths.RenZhengVipRender;
   import game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI;
   import nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengXunLeiPhonePanel;
   
   public class RegRuntime_RenZhengs
   {
       
      
      public function RegRuntime_RenZhengs()
      {
         super();
         View.runtimeClassMap[RenZhengWeiXinPanelUI] = RenZhengWeiXinPanel;
         View.runtimeClassMap[RenZhengPhonePanelUI] = RenZhengPhonePanel;
         View.runtimeClassMap[RenZhengVipRenderUI] = RenZhengVipRender;
         View.runtimeClassMap[RenZhengXunLeiPhonePanelUI] = RenZhengXunLeiPhonePanel;
      }
   }
}
