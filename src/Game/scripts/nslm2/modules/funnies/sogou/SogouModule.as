package nslm2.modules.funnies.sogou
{
   import game.ui.sougouModule.SogouModuleUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.utils.URLUtils;
   
   public class SogouModule extends SogouModuleUI
   {
       
      
      public function SogouModule()
      {
         super();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            SougouService.ins.addEventListener("EVT_getReward",onServiceGetReward);
         }
         else
         {
            SougouService.ins.removeEventListener("EVT_getReward",onServiceGetReward);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(this.moduleId == 60751)
         {
            this.img_bg.skin = UrlLib.getSogouImg("img_bg1");
            this.txt_titleName.text = LocaleMgr.ins.getStr(999000454);
            this.img_giftGameCenter.visible = true;
            this.img_giftSkin.visible = false;
            this.img_titleGameCenter.visible = true;
            this.img_titleSkin.visible = false;
            list_reward.dataSource = WealthUtil.costStrToArr(DefindConsts.SOUGOU_DOWNLOAD);
         }
         else
         {
            this.img_bg.skin = UrlLib.getSogouImg("img_bg2");
            this.txt_titleName.text = LocaleMgr.ins.getStr(999000455);
            this.img_giftGameCenter.visible = false;
            this.img_giftSkin.visible = true;
            this.img_titleGameCenter.visible = false;
            this.img_titleSkin.visible = true;
            list_reward.dataSource = WealthUtil.costStrToArr(DefindConsts.SOUGOU_INPUT);
         }
         this.btn_close.clickHandler = new Handler(ModuleMgr.ins.closeModule,[this.moduleId]);
         this.btn_get.clickHandler = btn_clickHandler;
         refreshStatus();
         super.preShow(param1);
      }
      
      private function btn_clickHandler() : void
      {
         if(this.moduleId == 60751)
         {
            if(SougouService.ins.isFromSougouGameDating == false)
            {
               URLUtils.openWindow("http://p5.wan.sogoucdn.com/cdn/mini/setup/1282/SogouGame_0.0.0.1.exe");
            }
            else
            {
               SougouService.ins.server_sougouGetReward();
            }
         }
         else if(SougouService.ins.isFromSougouInput == false)
         {
            URLUtils.openWindow("http://dl.pinyin.sogou.com/skins/upload_images/20160108173211.ssf?dn=%E3%80%90%E6%90%9C%E7%8B%97%E6%B8%B8%E6%88%8F%E3%80%91%E5%A5%B3%E7%A5%9E%E8%81%94%E7%9B%9F2.ssf&skin_id=520424");
         }
         else
         {
            SougouService.ins.server_sougouInputGetReward();
         }
      }
      
      private function onServiceGetReward(... rest) : void
      {
         this.refreshStatus();
      }
      
      private function refreshStatus() : void
      {
         if(this.moduleId == 60751)
         {
            if(SougouService.ins.isFromSougouGameDating == false)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(999000456);
               this.btn_get.disabled = false;
            }
            else if(SougouService.ins.hadGet1)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(10700013);
               this.btn_get.disabled = true;
            }
            else
            {
               this.btn_get.label = LocaleMgr.ins.getStr(10700007);
               this.btn_get.disabled = false;
            }
         }
         else if(SougouService.ins.isFromSougouInput == false)
         {
            this.btn_get.label = LocaleMgr.ins.getStr(999000457);
            this.btn_get.disabled = false;
         }
         else if(SougouService.ins.hadGet2)
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700013);
            this.btn_get.disabled = true;
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700007);
            this.btn_get.disabled = false;
         }
      }
   }
}
