package nslm2.modules.foundations.miniApp
{
   import game.ui.miniAppModule.MiniAppModule1UI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.configs.ClientConfig;
   import morn.core.utils.URLUtils;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class MiniAppModule1 extends MiniAppModule1UI
   {
       
      
      private var btnGetEff:BmcSpriteSheet;
      
      public function MiniAppModule1()
      {
         var _loc1_:* = null;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000310);
         var _loc2_:Array = WealthUtil.dropGroupIDToWealthVoArr(931000);
         this.list_reward.repeatX = _loc2_.length;
         this.list_reward.dataSource = _loc2_;
         this.img_block.skin = UrlLib.getClientDownImg();
         img_selectWin.visible = false;
         img_selectMac.visible = false;
         if(VipModel.ins.isUsingClient == false)
         {
            this.box_down.visible = true;
            this.btn_downWin.label = LocaleMgr.ins.getStr(999000312);
            this.btn_downMac.label = LocaleMgr.ins.getStr(999000312);
            this.btn_get.visible = false;
         }
         else
         {
            this.box_down.visible = false;
            this.btn_get.visible = true;
            if(VipModel.ins.canGetClientDownGift == false)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(999000313);
               this.btn_get.disabled = true;
            }
            else
            {
               _loc1_ = new BmcSpriteSheet();
               btnGetEff = new BmcSpriteSheet();
               _loc1_.init(115002,1,"all",true);
               this.addChild(_loc1_);
               _loc1_.x = btn_get.x - 9;
               _loc1_.y = btn_get.y - 10;
               this.btn_get.label = LocaleMgr.ins.getStr(999000311);
               this.btn_get.disabled = false;
            }
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_get !== _loc4_)
         {
            if(this.btn_downWin !== _loc4_)
            {
               if(this.btn_downMac === _loc4_)
               {
                  if(ClientConfig.gameId == "186")
                  {
                     if(ClientConfig.language == "pl")
                     {
                        _loc3_ = "http://goo.gl/kZ2TrG?v=" + ClientConfig.version;
                     }
                     else if(ClientConfig.language == "it")
                     {
                        _loc3_ = "http://goo.gl/Jn5G11?v=" + ClientConfig.version;
                     }
                     else if(ClientConfig.language == "tr")
                     {
                        _loc3_ = "http://goo.gl/2mAzAI?v=" + ClientConfig.version;
                     }
                     else
                     {
                        _loc3_ = "http://goo.gl/TNcWOS?v=" + ClientConfig.version;
                     }
                  }
                  else if(ClientConfig.gameId == "160")
                  {
                     _loc3_ = "http://static.gtarcade.net/micro_client/mm2/loa2/LoA2.dmg?v=" + ClientConfig.version;
                  }
                  _loc3_ = encodeURI(_loc3_);
                  URLUtils.openWindow(_loc3_);
               }
            }
            else
            {
               _loc3_ = "";
               if(ClientConfig.gameId == "186")
               {
                  if(ClientConfig.language == "pl")
                  {
                     _loc3_ = "http://goo.gl/LwdEx9?v=" + ClientConfig.version;
                  }
                  else if(ClientConfig.language == "it")
                  {
                     _loc3_ = "http://goo.gl/ETbG1n?v=" + ClientConfig.version;
                  }
                  else if(ClientConfig.language == "tr")
                  {
                     _loc3_ = "http://goo.gl/ee9Lrj?v=" + ClientConfig.version;
                  }
                  else
                  {
                     _loc3_ = "http://goo.gl/EDdcDf?v=" + ClientConfig.version;
                  }
               }
               else if(ClientConfig.gameId == "160")
               {
                  _loc3_ = "http://static.gtarcade.net/micro_client/mm2/loa2/LoA2.exe?v=" + ClientConfig.version;
               }
               _loc3_ = encodeURI(_loc3_);
               URLUtils.openWindow(_loc3_);
            }
         }
         else
         {
            ServerEngine.ins.send(6502,null,cplHandler);
         }
      }
      
      private function cplHandler() : void
      {
         if(btnGetEff)
         {
            btnGetEff.visible = false;
         }
         VipModel.ins.canGetClientDownGift = false;
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.dataSource as Array);
         this.btn_get.label = LocaleMgr.ins.getStr(999000313);
         this.btn_get.disabled = true;
         NpcFuncService.ins.changeCount(this.moduleId,0);
         NpcFuncService.ins.getVo(60510).extra = true;
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
   }
}
