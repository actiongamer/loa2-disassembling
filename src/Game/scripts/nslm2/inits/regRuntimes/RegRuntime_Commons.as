package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.commons.icons.labels.WealthRenderLabelS0UI;
   import nslm2.common.ui.components.comps2d.icons.labels.WealthRenderLabelS0;
   import nslm2.common.ui.components.comps2d.icons.labels.WealthRenderLabelS1;
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   import nslm2.modules.globalModules.facebook.view.FBBtnView;
   import game.ui.languageChange.LanguageSelectItemUI;
   import nslm2.modules.globalModules.changeLanguage.LanguageSelectItem;
   
   public class RegRuntime_Commons
   {
       
      
      public function RegRuntime_Commons()
      {
         super();
         View.runtimeClassMap[WealthRenderLabelS0UI] = WealthRenderLabelS0;
         View.runtimeClassMap[WealthRenderLabelS0UI] = WealthRenderLabelS1;
         View.runtimeClassMap[BtnFaceBookUI] = FBBtnView;
         View.runtimeClassMap[LanguageSelectItemUI] = LanguageSelectItem;
      }
   }
}
