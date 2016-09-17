package nslm2.modules.foundations.guildModule.view.panel.shardDonate
{
   import game.ui.guildModules.guildShardDonate.GuildShardDonateViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerDataNotify;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.FamilyHeroDonationReceiveRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyHeroDonateCase;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import proto.FamilyHeroDonatePlayer.DonateItem;
   import nslm2.utils.WealthUtil;
   import proto.FamilyHeroDonatePlayer.DonateMessage;
   import nslm2.utils.RTools;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildHeroShardDonatePanel extends GuildShardDonateViewUI implements IViewStackPage, IObserver
   {
       
      
      public function GuildHeroShardDonatePanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
         switchEventListeners(true);
      }
      
      private function onBtnClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_ask !== _loc2_)
         {
            if(this.btn_donate === _loc2_)
            {
               ServerEngine.ins.send(10023,null,onFamilyHeroDonationReceiveResult);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(1000001,null,40700);
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(8004,playerDataNofifyHandler);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(8004,playerDataNofifyHandler);
         }
      }
      
      private function playerDataNofifyHandler(param1:PlayerDataNotify, param2:ServerEvent) : void
      {
         if(param1.cmd == 10022)
         {
            FloatUtil.floatPlayerDataChange(param2.dataNotifyCacheVo);
         }
      }
      
      private function onFamilyHeroDonationReceiveResult(param1:FamilyHeroDonationReceiveRes) : void
      {
         FloatUtil.showGetItemsDisplayPanel(list_chest.dataSource as Array);
         GuildModel.ins.panelRes.list = param1.list;
         GuildModel.ins.panelRes.ply = param1.ply;
         ObserverMgr.ins.sendNotice("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL");
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         GuildServiceHandler.ins.reqHeroShardPanelInfo();
         ServerEngine.ins.addAlwayHandler(10024,updateDonateInfo);
      }
      
      private function updateDonateInfo(param1:Object = null) : void
      {
         GuildServiceHandler.ins.reqHeroShardPanelInfo();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
         ServerEngine.ins.removeAlwayHandler(10024,updateDonateInfo);
      }
      
      public function getFocusNotices() : Array
      {
         return ["GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL" === _loc3_)
         {
            refreshMsg();
            refreshCollectItem();
            refreshDonateBaseInfo();
            refreshRightList();
         }
      }
      
      private function updateCDTime() : void
      {
         var _loc1_:int = GuildModel.ins.panelRes.ply.donateStamp - ServerTimer.ins.second + int(StcMgr.ins.getDefineVo("FAMILY_DONATE_CD").define_value);
         if(_loc1_ <= 0)
         {
            TimerManager.ins.clearTimer(updateCDTime);
            this.txtAskCD.visible = false;
            this.img_redPoint_1.visible = GuildModel.ins.panelRes.ply.launchLimit > 0;
            btn_ask.disabled = GuildModel.ins.panelRes.ply.launchLimit <= 0;
         }
         else
         {
            txtAskCD.text = TimeUtils.getSimpleTimeStr(_loc1_);
         }
      }
      
      private function refreshDonateBaseInfo() : void
      {
         if(GuildModel.ins.panelRes.ply.donateStamp > 0)
         {
            TimerManager.ins.clearTimer(updateCDTime);
            TimerManager.ins.doLoop(1000,updateCDTime);
            this.txtAskCD.visible = true;
            this.img_redPoint_1.visible = false;
            btn_ask.disabled = true;
            updateCDTime();
         }
         else
         {
            this.txtAskCD.visible = false;
            this.img_redPoint_1.visible = GuildModel.ins.panelRes.ply.launchLimit > 0;
            btn_ask.disabled = GuildModel.ins.panelRes.ply.launchLimit <= 0;
         }
         btn_ask.label = LocaleMgr.ins.getStr(999004009) + " (" + GuildModel.ins.panelRes.ply.launchLimit + "/" + StcMgr.ins.getDefineVo("FAMILY_DONATE_MAX_LAUNCH").define_value + ")";
         this.txtDonateNum.text = LocaleMgr.ins.getStr(999004010) + " (" + GuildModel.ins.panelRes.ply.donateLimit + "/" + StcMgr.ins.getDefineVo("FAMILY_DONATE_MAX_GIVE").define_value + ")";
      }
      
      private function refreshRightList() : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         _loc4_ = null;
         var _loc2_:* = null;
         var _loc1_:int = listDonate.vScrollBar.value;
         _loc6_ = 0;
         _loc8_ = 0;
         var _loc7_:Boolean = false;
         var _loc3_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < listDonate.numChildren)
         {
            if(listDonate.getChildAt(_loc8_) is ShardDonateRender)
            {
               _loc3_.push(listDonate.getChildAt(_loc8_));
            }
            else
            {
               listDonate.removeChildAt(_loc8_);
            }
            _loc8_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc6_] as ShardDonateRender;
            if(!_loc4_.visible)
            {
               listDonate.removeChild(_loc4_);
            }
            else
            {
               _loc7_ = false;
               _loc8_ = 0;
               while(_loc8_ < GuildModel.ins.panelRes.list.fddatas.length)
               {
                  _loc5_ = GuildModel.ins.panelRes.list.fddatas[_loc8_];
                  if(_loc5_.id == _loc4_.vo.id)
                  {
                     _loc7_ = true;
                     break;
                  }
                  _loc8_++;
               }
               if(!_loc7_)
               {
                  _loc4_.fadeOut();
               }
            }
            _loc6_++;
         }
         if(GuildModel.ins.panelRes.list.fddatas.length > 0)
         {
            GuildModel.ins.panelRes.list.fddatas.sortOn("id",16 | 2);
            _loc8_ = 0;
            while(_loc8_ < GuildModel.ins.panelRes.list.fddatas.length)
            {
               _loc5_ = GuildModel.ins.panelRes.list.fddatas[_loc8_];
               _loc6_ = 0;
               while(_loc6_ < listDonate.numChildren)
               {
                  _loc7_ = false;
                  if(listDonate.getChildAt(_loc6_) is ShardDonateRender)
                  {
                     _loc4_ = listDonate.getChildAt(_loc6_) as ShardDonateRender;
                     if(_loc4_.vo.id == _loc5_.id)
                     {
                        _loc7_ = true;
                        break;
                     }
                  }
                  _loc6_++;
               }
               if(!_loc7_)
               {
                  _loc4_ = new ShardDonateRender(_loc5_);
                  _loc4_.y = _loc8_ * 155 + 10;
                  listDonate.addChild(_loc4_);
               }
               else
               {
                  TweenLite.to(_loc4_,0.3,{"y":_loc8_ * 155 + 10});
                  _loc4_.updateInfo(_loc5_);
               }
               _loc8_++;
            }
            _loc2_ = new Sprite();
            _loc2_.y = _loc8_ * 155 + 10;
            listDonate.addChild(_loc2_);
            listDonate.commitMeasure();
            listDonate.scrollTo(0,_loc1_);
         }
      }
      
      private function refreshCollectItem() : void
      {
         var _loc1_:* = null;
         if(GuildModel.ins.panelRes.ply.receiveList.length > 0)
         {
            _loc1_ = [];
            var _loc4_:int = 0;
            var _loc3_:* = GuildModel.ins.panelRes.ply.receiveList;
            for each(var _loc2_ in GuildModel.ins.panelRes.ply.receiveList)
            {
               _loc1_.push(WealthUtil.createItemVo(_loc2_.itemId,_loc2_.num));
            }
            list_chest.dataSource = _loc1_;
            btn_donate.disabled = false;
         }
         else
         {
            list_chest.dataSource = [];
            btn_donate.disabled = true;
         }
      }
      
      private function refreshMsg() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(GuildModel.ins.panelRes.ply.donateMessage.length > 0)
         {
            _loc2_ = "";
            _loc3_ = GuildModel.ins.panelRes.ply.donateMessage.length - 1;
            while(_loc3_ >= 0)
            {
               _loc1_ = GuildModel.ins.panelRes.ply.donateMessage[_loc3_];
               _loc2_ = _loc2_ + (TimeUtils.getFullTimeStrCN(_loc1_.stamp,true,true,RTools.cl(false,true)) + "\n");
               if(PlayerModel.ins.isCurPlayer(_loc1_.userId))
               {
                  _loc2_ = _loc2_ + (TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999004000),458496) + " " + LocaleMgr.ins.getStr(999004008) + " " + WealthUtil.createItemVo(_loc1_.itemId,1).qualityName + "\n");
               }
               else
               {
                  _loc2_ = _loc2_ + (TextFieldUtil.htmlText2(_loc1_.userName,458496) + " " + LocaleMgr.ins.getStr(999004008) + " " + WealthUtil.createItemVo(_loc1_.itemId,1).qualityName + "\n");
               }
               _loc3_--;
            }
            this.logTxt.text = _loc2_;
            this.logPanel.refresh();
         }
         else
         {
            this.logTxt.text = "";
            this.logPanel.refresh();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         switchEventListeners(false);
      }
   }
}
