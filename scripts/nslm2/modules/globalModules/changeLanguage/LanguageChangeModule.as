package nslm2.modules.globalModules.changeLanguage
{
   import game.ui.languageChange.LanguageChangeModuleUI;
   
   public class LanguageChangeModule extends LanguageChangeModuleUI
   {
      
      private static var _instance:nslm2.modules.globalModules.changeLanguage.LanguageChangeModule;
       
      
      public function LanguageChangeModule()
      {
         super();
         init();
      }
      
      public static function get instance() : nslm2.modules.globalModules.changeLanguage.LanguageChangeModule
      {
         if(_instance == null)
         {
            _instance = new nslm2.modules.globalModules.changeLanguage.LanguageChangeModule();
         }
         return _instance;
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         if(App.languageAry.length % 4 > 0)
         {
            _loc1_ = App.languageAry.length / 4 + 1;
         }
         else
         {
            _loc1_ = App.languageAry.length / 4;
         }
         this.bg.height = 90 * _loc1_ + 70;
         this.flagList.height = 90 * _loc1_;
         this.flagList.dataSource = App.languageAry;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
