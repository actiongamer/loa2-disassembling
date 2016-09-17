package nslm2.modules.foundations.miniApp
{
   import game.ui.miniAppModule.MiniAppModuleUI;
   import com.mz.core.configs.EnvConfig;
   import morn.core.utils.URLUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class MiniAppModule extends MiniAppModuleUI
   {
       
      
      public function MiniAppModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_title.text = LocaleMgr.ins.getStr(999000310);
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(931000);
         this.list_reward.repeatX = _loc1_.length;
         this.list_reward.dataSource = _loc1_;
         this.img_block.skin = UrlLib.getClientDownImg();
         if(VipModel.ins.isUsingClient)
         {
            this.btn_down.label = LocaleMgr.ins.getStr(999000311);
         }
         else
         {
            this.btn_down.label = LocaleMgr.ins.getStr(999000312);
         }
      }
      
      public static function downMiniApp() : void
      {
         var _loc1_:String = "";
         if(!(int(EnvConfig.ins.ptId) - 590))
         {
            _loc1_ = "http://static.gtarcade.net/micro_client/mm2/loa2/LoA2.exe";
         }
         _loc1_ = encodeURI(_loc1_);
         URLUtils.openWindow(_loc1_);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_close !== _loc3_)
         {
            if(this.btn_down === _loc3_)
            {
               download();
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function download() : void
      {
         if(VipModel.ins.isUsingClient == false)
         {
            downMiniApp();
         }
         else
         {
            ServerEngine.ins.send(6502,null,cplHandler);
         }
      }
      
      private function cplHandler() : void
      {
         VipModel.ins.canGetClientDownGift = false;
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.dataSource as Array);
         this.btn_down.label = LocaleMgr.ins.getStr(999000313);
         this.btn_down.disabled = true;
         NpcFuncService.ins.changeCount(this.moduleId,0);
         NpcFuncService.ins.getVo(this.moduleId).extra = true;
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
   }
}
