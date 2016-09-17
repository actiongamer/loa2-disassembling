package nslm2.modules.foundations.gameMaster
{
   import game.ui.gameMasterModule.GameMasterModuleUI;
   import morn.core.components.Image;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import morn.core.utils.URLUtils;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mediators.RollMediator;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class GameMasterModule extends GameMasterModuleUI
   {
       
      
      private var flyImg:Image;
      
      public function GameMasterModule()
      {
         super();
         this.img_light1.alpha = 0;
         this.img_light2.alpha = 0;
         this.parts.push(new RollMediator(this.img_online,rollHandler1));
         this.parts.push(new RollMediator(this.img_gamehelp,rollHandler2));
         this.img_person.skin = UrlLib.getGameMasterImg("img_person");
         this.img_title.skin = UrlLib.getGameMasterImg("img_title");
         this.img_online.skin = UrlLib.getGameMasterImg("img_online");
         this.img_gamehelp.skin = UrlLib.getGameMasterImg("img_gamehelp");
         this.img_bg.skin = UrlLib.getGameMasterImg("img_bg");
         if(EnvConfig.ins.ptId == 15)
         {
            this.img_QRcode.skin = UrlLib.getGameMasterImg("img_QRcode15",false);
         }
         else
         {
            this.img_QRcode.skin = UrlLib.getGameMasterImg("img_QRcode",true);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.img_online.buttonMode = true;
         this.img_gamehelp.buttonMode = true;
         this.img_online.addEventListener("click",onlineHandler);
         this.img_gamehelp.addEventListener("click",helpHandler);
         this.img_QRcode.buttonMode = true;
         this.img_QRcode.addEventListener("click",codeHandler);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9013200);
         this.box1.addEventListener("click",onlineHandler1);
         this.box2.addEventListener("click",onlineHandler2);
         this.box3.addEventListener("click",onlineHandler2);
         super.preShow();
      }
      
      private function onlineHandler1(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.ptId == 15)
         {
            URLUtils.openWindow("http://gamebbs.xunlei.com/forum.php?mod=forumdisplay&fid=1821");
         }
         else
         {
            URLUtils.openWindow("http://bbs.youzu.com/forum.php?gid=2506");
         }
      }
      
      protected function onlineHandler2(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.ptId == 15)
         {
            URLUtils.openWindow("http://niu.xunlei.com/cs/feedback.html");
         }
         else
         {
            AlertUtil.alert(LocaleMgr.ins.getStr(999000269));
         }
      }
      
      private function codeHandler(param1:Event) : void
      {
         this.img_QRcode.mouseEvent = false;
         if(!flyImg)
         {
            flyImg = new Image();
            flyImg.skin = img_QRcode.skin;
            flyImg.height = img_QRcode.height;
            flyImg.width = img_QRcode.width;
            flyImg.x = img_QRcode.x;
            flyImg.y = img_QRcode.y;
            this.mouseEvent = false;
            addChild(flyImg);
         }
         else
         {
            flyImg.visible = true;
         }
         TweenLite.to(flyImg,0.7,{
            "x":283,
            "y":150.5,
            "width":258,
            "height":258,
            "onComplete":addHandler
         });
      }
      
      private function addHandler() : void
      {
         UIMgr.stage.addEventListener("click",stage_click);
      }
      
      protected function stage_click(param1:MouseEvent) : void
      {
         UIMgr.stage.removeEventListener("click",stage_click);
         this.mouseEvent = true;
         this.img_QRcode.mouseEvent = true;
         flyImg.visible = false;
         flyImg.height = img_QRcode.height;
         flyImg.width = img_QRcode.width;
         flyImg.x = img_QRcode.x;
         flyImg.y = img_QRcode.y;
      }
      
      private function onlineHandler(param1:Event) : void
      {
         if(EnvConfig.ins.ptId == 15)
         {
            URLUtils.openWindow("http://niu.xunlei.com/cs/feedback.html");
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(13200908),handlerYes);
         }
      }
      
      private function handlerYes() : void
      {
         URLUtils.openWindow("http://kf.youzu.com/online/login");
      }
      
      private function helpHandler(param1:Event) : void
      {
         ModuleMgr.ins.showModule(13201,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function rollHandler1(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(img_light1,0.2,{"alpha":1});
         }
         else
         {
            TweenLite.to(img_light1,0.2,{"alpha":0});
         }
      }
      
      private function rollHandler2(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(img_light2,0.2,{"alpha":1});
         }
         else
         {
            TweenLite.to(img_light2,0.2,{"alpha":0});
         }
      }
   }
}
