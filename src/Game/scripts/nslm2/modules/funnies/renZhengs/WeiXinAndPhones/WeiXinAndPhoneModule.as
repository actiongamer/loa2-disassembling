package nslm2.modules.funnies.renZhengs.WeiXinAndPhones
{
   import game.ui.renzhengs.weiXinAndPhones.WeiXinAndPhoneModuleUI;
   import flash.geom.Point;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class WeiXinAndPhoneModule extends WeiXinAndPhoneModuleUI
   {
       
      
      public var imgTitleOriPoi:Point;
      
      public function WeiXinAndPhoneModule()
      {
         super();
         imgTitleOriPoi = new Point(this.img_title1.x,this.img_title1.y);
      }
      
      public function get panelWeiXin() : RenZhengWeiXinPanel
      {
         return this.panel_weiXinUI as RenZhengWeiXinPanel;
      }
      
      public function get panelPhone() : RenZhengPhonePanel
      {
         return this.panel_phoneUI as RenZhengPhonePanel;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         if(EnvConfig.ins.showDevModule)
         {
            this.tab.labels = LocaleMgr.ins.getStr(60760001) + "," + LocaleMgr.ins.getStr(60760002);
         }
         else
         {
            this.tab.labels = LocaleMgr.ins.getStr(60760001);
         }
         this.tab.selectedIndex = 0;
         this.img_bg1.skin = UrlLib.renZhengWeiXinAndPhone("img_bg1");
         this.panelBg.bgCustom.addChild(this.img_bg1);
         this.img_bg2.skin = UrlLib.renZhengWeiXinAndPhone("img_bg2");
         this.img_bg3.skin = UrlLib.renZhengWeiXinAndPhone("img_bg3");
         this.tab.userChangeHandler = tab_changeHandler;
         this.panelPhone.init();
         this.panelWeiXin.init();
         this.tab_changeHandler();
         super.preShow(param1);
      }
      
      private function tab_changeHandler() : void
      {
         var _loc1_:int = this.tab.selectedIndex;
         if(_loc1_ == 0)
         {
            this.list_gift.array = WealthUtil.costStrToArr(DefindConsts.MOBILE_CERTIFY);
            this.img_title1.skin = UrlLib.renZhengWeiXinAndPhone("img_titletxt1");
            this.img_title1.x = imgTitleOriPoi.x - 19;
            this.img_title1.y = imgTitleOriPoi.y - 10;
            this.panelPhone.visible = true;
            this.panelWeiXin.visible = false;
         }
         else
         {
            this.list_gift.array = WealthUtil.costStrToArr(DefindConsts.WEIXIN_CERTIFY);
            this.img_title1.skin = UrlLib.renZhengWeiXinAndPhone("img_titletxt2");
            this.img_title1.x = imgTitleOriPoi.x;
            this.img_title1.y = imgTitleOriPoi.y;
            this.panelPhone.visible = false;
            this.panelWeiXin.visible = true;
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
   }
}
