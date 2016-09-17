package nslm2.modules.funnies.tencent
{
   import game.ui.TencentModule.TencentRenewalModuleUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import proto.QqGetTokenReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.QqGetTokenRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class TencentRenewalModule extends TencentRenewalModuleUI
   {
       
      
      public function TencentRenewalModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.txt_toQQVipOfficalBg.buttonMode = true;
         txt_toQQVipOfficalBg.fillAlpha = 0;
         this.txt_toQQVipOfficalBg.addEventListener("click",txt_toQQVipOffical_onClick);
         this.img_bg.skin = UrlLib.getQQVipImg("img_bg");
         this.txt_toQQVipOffical.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710102:60710602);
         this.img_title2.skin = UrlLib.getQQVipImg("continue_title");
         this.img_renewalBg.skin = UrlLib.getTencentImg("continue_bg");
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               this.btn_charge_yellow.visible = true;
               this.btn_charge_blue.visible = false;
               this.btn_charge_yellow.skin = SkinLib.qqVipAssets("renewal");
               this.list_rewards.dataSource = WealthUtil.costStrToArr(DefindConsts.YELLOW_DAY_CONTINUE);
               break;
            case 1:
               this.btn_charge_yellow.visible = false;
               this.btn_charge_blue.visible = true;
               this.btn_charge_blue.skin = SkinLib.qqVipAssets("renewal");
               this.list_rewards.dataSource = WealthUtil.costStrToArr(DefindConsts.BLUE_DAY_CONTINUE);
         }
         this.btn_get.visible = false;
         this.btn_charge_blue.buttonMode = true;
         this.btn_charge_blue.addEventListener("click",server_qqGetToken);
         this.label_hint.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710113:60710613);
         this.label_ps.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710114:60710614);
      }
      
      private function txt_toQQVipOffical_onClick(... rest) : void
      {
         QQVipUtils.toOffical();
      }
      
      public function server_qqGetToken(... rest) : void
      {
         var _loc2_:QqGetTokenReq = new QqGetTokenReq();
         _loc2_.token = 0;
         ServerEngine.ins.send(2106,_loc2_,server_getToken_cpl);
      }
      
      private function server_getToken_cpl(param1:QqGetTokenRes, param2:ServerEvent) : void
      {
         QQVipUtils.openToQQVipAPIContinue(param1.mid,param1.token);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
