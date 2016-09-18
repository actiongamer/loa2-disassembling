package nslm2.modules.foundations.monthlyCard
{
   import game.ui.monthlyCardModule.MonthlyCardModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   
   public class MonthlyCardModule extends MonthlyCardModuleUI
   {
       
      
      public function MonthlyCardModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000317);
         refresh();
         this.img_bg.skin = UrlLib.getMonthlyCardImg("img_bg");
         this.img_gold.skin = UrlLib.getMonthlyCardImg("img_gold");
         this.img_silver.skin = UrlLib.getMonthlyCardImg("img_silver");
         this.img_title.skin = UrlLib.getMonthlyCardImg("img_title");
         this.img_person.skin = UrlLib.getMonthlyCardImg("img_person");
         this.img_descBG.skin = UrlLib.getMonthlyCardImg("img_descBG");
         this.btn_silver.clickHandler = charge;
         this.btn_gold.clickHandler = charge;
         this.label_taskLink.addEventListener("click",openTask);
         super.preShow(param1);
      }
      
      private function openTask(param1:Event) : void
      {
         ModuleMgr.ins.showModule(13000,null,this.moduleId);
      }
      
      private function refresh() : void
      {
         if(VipModel.ins.silverDay > -1)
         {
            this.btn_silver.label = LocaleMgr.ins.getStr(999000318);
            if(VipModel.ins.silverDay < 6)
            {
               this.btn_silver.disabled = false;
            }
            else
            {
               this.btn_silver.disabled = true;
            }
            this.img_silverActived.visible = true;
            this.label_silverDay.text = LocaleMgr.ins.getStr(60530001,[VipModel.ins.silverDay]);
         }
         else
         {
            this.btn_silver.label = LocaleMgr.ins.getStr(999000319);
            this.img_silverActived.visible = false;
            this.label_silverDay.text = LocaleMgr.ins.getStr(60530002);
         }
         if(VipModel.ins.goldDay > -1)
         {
            this.btn_gold.label = LocaleMgr.ins.getStr(999000318);
            if(VipModel.ins.goldDay < 6)
            {
               this.btn_gold.disabled = false;
            }
            else
            {
               this.btn_gold.disabled = true;
            }
            this.img_goldActived.visible = true;
            this.label_goldDay.text = LocaleMgr.ins.getStr(60530001,[VipModel.ins.goldDay]);
         }
         else
         {
            this.btn_gold.label = LocaleMgr.ins.getStr(999000319);
            this.img_goldActived.visible = false;
            this.label_goldDay.text = LocaleMgr.ins.getStr(60530002);
         }
      }
      
      private function charge() : void
      {
         VipModel.ins.gotoCharge();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["refreshMonthlyCard"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("refreshMonthlyCard" === _loc3_)
         {
            refresh();
         }
      }
   }
}
