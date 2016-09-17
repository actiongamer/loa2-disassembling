package nslm2.modules.globalModules.changeLanguage
{
   import game.ui.languageChange.LanguageSelectItemUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.configs.StcLanguageConfig;
   import flash.events.MouseEvent;
   import proto.ChangeLanguageReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.utils.URLUtils;
   
   public class LanguageSelectItem extends LanguageSelectItemUI
   {
       
      
      private var lg:String;
      
      public function LanguageSelectItem()
      {
         super();
         this.mouseChildren = false;
         this.buttonMode = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         lg = param1 as String;
         this.flagimg.url = UrlLib.countryFlag(String(param1));
         this.nametxt.text = StcLanguageConfig.ins.getLanguage(int(App.languageCodeIdAry[App.languageAry.indexOf(param1)]));
         if(App.language == this.lg)
         {
            flaggou.visible = true;
            guang.visible = true;
         }
         else
         {
            flaggou.visible = false;
            guang.visible = false;
            this.addEventListener("click",onClick);
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var _loc2_:ChangeLanguageReq = new ChangeLanguageReq();
         if(lg == "common")
         {
            lg = "cn";
         }
         _loc2_.language = lg;
         ServerEngine.ins.send(10003,_loc2_,onChangeComplete);
      }
      
      private function onChangeComplete() : void
      {
         URLUtils.refreshCurPage();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
