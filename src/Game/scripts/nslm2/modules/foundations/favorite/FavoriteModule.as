package nslm2.modules.foundations.favorite
{
   import game.ui.favoriteModule.FavoriteModuleUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.URLUtils;
   import com.mz.core.configs.ClientConfig;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class FavoriteModule extends FavoriteModuleUI
   {
       
      
      private const ADD_FAVORITE:int = 0;
      
      private const REWARD_AVALIABLE:int = 1;
      
      private const REWARD_GOT:int = 2;
      
      private var _status:int = 0;
      
      public function FavoriteModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_title.text = LocaleMgr.ins.getStr(999000233);
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(DefindConsts.WEB_SAVE_DROP);
         this.list_reward.repeatX = _loc1_.length;
         this.list_reward.dataSource = _loc1_;
         this.img_block.skin = UrlLib.getFavoriteImg();
         if(!VipModel.ins.canGetFavoriteReward)
         {
            _status = 2;
            this.btn_down.disabled = true;
            this.btn_down.label = LocaleMgr.ins.getStr(999000234);
         }
         if(VipModel.ins.addedToFavorite)
         {
            _status = 1;
            this.btn_down.label = LocaleMgr.ins.getStr(999000235);
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_close !== _loc3_)
         {
            if(this.btn_down === _loc3_)
            {
               addFavorite();
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(60520);
         }
      }
      
      private function addFavorite() : void
      {
         if(_status == 0)
         {
            VipModel.ins.addedToFavorite = true;
            _status = 1;
            this.btn_down.label = LocaleMgr.ins.getStr(999000235);
            URLUtils.openWindow(ClientConfig.mainPageURL);
         }
         else if(_status == 1)
         {
            this.btn_down.disabled = true;
            ServerEngine.ins.send(6501,null,cplHandler);
         }
      }
      
      private function cplHandler() : void
      {
         _status = 2;
         VipModel.ins.canGetFavoriteReward = false;
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.dataSource as Array);
         this.btn_down.label == LocaleMgr.ins.getStr(999000234);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60520,false));
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
   }
}
