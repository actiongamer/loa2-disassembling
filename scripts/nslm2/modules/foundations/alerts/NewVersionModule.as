package nslm2.modules.foundations.alerts
{
   import game.ui.alerts.HelpAndRulePanelUI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.setting.service.SettingService;
   import com.mz.core.configs.ClientConfig;
   import flash.events.MouseEvent;
   
   public class NewVersionModule extends HelpAndRulePanelUI
   {
       
      
      public function NewVersionModule()
      {
         super();
         btnOK.btn_ok.clickHandler = btn_handler;
         this.addEventListener("click",onMouseClick);
      }
      
      private function btn_handler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.contentPanel.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000192);
         this.txt_rule.text = "";
         if(GetNewVersionLogTask.content)
         {
            se_onVersion();
         }
         else
         {
            new GetNewVersionLogTask(false).addCompleteHandler(se_onVersion).exec();
         }
         super.preShow(param1);
      }
      
      private function se_onVersion() : void
      {
         if(this.moduleInfo.phase == 15)
         {
            validateShow();
         }
         if(GetNewVersionLogTask.needShow)
         {
            GetNewVersionLogTask.needShow = false;
            SettingService.ins.save(43,GetNewVersionLogTask.stamp);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         validateShow();
      }
      
      private function validateShow() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(GetNewVersionLogTask.content)
         {
            try
            {
               _loc2_ = JSON.parse(GetNewVersionLogTask.content);
               _loc1_ = ClientConfig.language;
               if(_loc1_ == "common")
               {
                  _loc1_ = "cn";
               }
               if(_loc2_.hasOwnProperty(_loc1_))
               {
                  this.txt_rule.text = _loc2_[_loc1_];
               }
               else if(_loc2_.hasOwnProperty("en"))
               {
                  this.txt_rule.text = _loc2_["en"];
               }
               else
               {
                  this.txt_rule.text = GetNewVersionLogTask.content;
               }
            }
            catch(error:Error)
            {
               this.txt_rule.text = GetNewVersionLogTask.content;
            }
            this.contentPanel.refresh();
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         if(param1.ctrlKey && param1.altKey)
         {
            this.txt_rule.text = LocaleMgr.ins.getStr(999000193) + "792" + "\n" + LocaleMgr.ins.getStr(999000194) + "03/15/2016 10:00:53" + "\n" + LocaleMgr.ins.getStr(999000195) + ClientConfig.version;
         }
      }
   }
}
