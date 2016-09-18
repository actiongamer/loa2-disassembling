package nslm2.modules.foundations.guildModule.view.panel.main
{
   import game.ui.guildModules.mainView.GuildMainPanelUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.view.panel.verify.GuildVerifyPanel;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.guildModule.vo.GuildActivityVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Button;
   import proto.FamilyInfo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiZhiweiVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class GuildBaseInfoPanel extends GuildMainPanelUI implements IObserver, IViewStackPage
   {
       
      
      private var guildModel:GuildModel;
      
      private var verifyPanel:GuildVerifyPanel;
      
      public function GuildBaseInfoPanel()
      {
         guildModel = GuildModel.ins;
         super();
      }
      
      override protected function initialize() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         updateBaseInfo();
         list_activity.changeHandler = listActivityClickHandler;
         btn_modify.clickHandler = showChangeNoticePanel;
      }
      
      private function showChangeNoticePanel(param1:Object) : void
      {
         ModuleMgr.ins.showModule(40705,null,40700);
      }
      
      private function listActivityClickHandler(... rest) : void
      {
         var _loc2_:* = null;
         var _loc3_:GuildActivityVo = list_activity.selectedItem as GuildActivityVo;
         if(_loc3_.status == 0)
         {
            AlertUtil.floadNoOpenModule("");
         }
         switch(int(_loc3_.id) - 1)
         {
            case 0:
               if(guildModel.hasSingned)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(999000286));
                  return;
               }
               GuildServiceHandler.ins.reqSign(signCallBack);
               break;
            default:
               if(guildModel.hasSingned)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(999000286));
                  return;
               }
               GuildServiceHandler.ins.reqSign(signCallBack);
               break;
            case 2:
               if(StcMgr.ins.getFunctionVo(40740).isopen == 2)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(41210135));
                  return;
               }
               if(!FuncOpenAutoCtrl.checkOpen(40740))
               {
                  AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(40740));
                  return;
               }
               if(ModuleMgr.ins.isShow(40740))
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40740150));
                  return;
               }
               ModuleMgr.ins.showModule(40740);
               break;
            case 3:
               _loc2_ = StcMgr.ins.getFunctionVo(40760);
               if(!_loc2_.canOpen)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(300006062));
                  return;
               }
               if(PlayerModel.ins.level < _loc2_.level)
               {
                  AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(40760));
                  return;
               }
               ModuleMgr.ins.showModule(40760);
               break;
            default:
               _loc2_ = StcMgr.ins.getFunctionVo(40760);
               if(!_loc2_.canOpen)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(300006062));
                  return;
               }
               if(PlayerModel.ins.level < _loc2_.level)
               {
                  AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(40760));
                  return;
               }
               ModuleMgr.ins.showModule(40760);
               break;
            case 5:
               ModuleMgr.ins.showOrCloseModule(60300,new ShopOpenVo(40714),ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 6:
               if(FuncOpenAutoCtrl.checkOpen(40720))
               {
                  ModuleMgr.ins.showModule(40720,null,ModuleMgr.ins.popLayer.curModuleId);
               }
               else
               {
                  AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(40720));
               }
               break;
            case 7:
               ModuleMgr.ins.showModule(40750,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function signCallBack(param1:Object = null) : void
      {
         guildModel.hasSingned = true;
         updateActivityList();
         AlertUtil.float(LocaleMgr.ins.getStr(999000287));
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
      }
      
      private function doDissmiss() : void
      {
         GuildServiceHandler.ins.dismissGuild();
      }
      
      private function doExit() : void
      {
         GuildServiceHandler.ins.quickGuild();
      }
      
      private function updateBaseInfo() : void
      {
         var _loc1_:FamilyInfo = guildModel.guildInfo;
         if(!_loc1_)
         {
            return;
         }
         txt_guildName.text = TextFieldUtil.htmlText2("Lv." + _loc1_.lv,14210735) + "  " + _loc1_.name;
         txt_notice.text = _loc1_.inNotice;
         if(!_loc1_.inNotice)
         {
            _loc1_.inNotice = LocaleMgr.ins.getStr(11000867);
            txt_notice.text = LocaleMgr.ins.getStr(11000867);
         }
         updateActivityList();
         img_bg.url = GuildUtil.getFlagBgUrl(guildModel.guildInfo.flagBase);
         img_pattern.url = GuildUtil.getFlagIconUrl(guildModel.guildInfo.flagIcon);
         if(guildModel.checkHasAuthority(104))
         {
            btn_modify.visible = true;
         }
         else
         {
            btn_modify.visible = false;
         }
      }
      
      private function updateActivityList() : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:Array = [];
         _loc7_ = 1;
         while(_loc7_ <= 8)
         {
            _loc6_ = new GuildActivityVo();
            _loc6_.rewardStr = "";
            _loc6_.id = _loc7_;
            switch(int(_loc6_.id) - 1)
            {
               case 0:
                  if(guildModel.hasSingned)
                  {
                     _loc6_.status = 3;
                  }
                  else
                  {
                     _loc6_.status = 2;
                  }
                  _loc5_ = guildModel.pos;
                  if(guildModel.highPos)
                  {
                     _loc5_ = guildModel.highPos;
                  }
                  _loc4_ = StcMgr.ins.getGonghuiZhiweiVo(_loc5_);
                  if(_loc4_)
                  {
                     _loc2_ = _loc4_.reward;
                     _loc1_ = StcMgr.ins.getDropBaseVo(_loc2_).number;
                     _loc6_.rewardStr = LocaleMgr.ins.getStr(999000288) + _loc1_;
                  }
                  break;
               default:
                  if(guildModel.hasSingned)
                  {
                     _loc6_.status = 3;
                  }
                  else
                  {
                     _loc6_.status = 2;
                  }
                  _loc5_ = guildModel.pos;
                  if(guildModel.highPos)
                  {
                     _loc5_ = guildModel.highPos;
                  }
                  _loc4_ = StcMgr.ins.getGonghuiZhiweiVo(_loc5_);
                  if(_loc4_)
                  {
                     _loc2_ = _loc4_.reward;
                     _loc1_ = StcMgr.ins.getDropBaseVo(_loc2_).number;
                     _loc6_.rewardStr = LocaleMgr.ins.getStr(999000288) + _loc1_;
                  }
                  break;
               case 2:
                  if(PlayerModel.ins.level < FuncOpenAutoCtrl.getOpenLevel(40740))
                  {
                     _loc6_.rewardStr = LocaleMgr.ins.getStr(40740230);
                  }
                  else
                  {
                     _loc6_.rewardStr = "";
                  }
                  _loc6_.status = 1;
               case 3:
                  if(NpcFuncService.ins.getVo(40760) && NpcFuncService.ins.getVo(40760).count > 0)
                  {
                     _loc6_.status = 2;
                  }
                  else
                  {
                     _loc6_.status = 1;
                  }
                  break;
               default:
                  if(NpcFuncService.ins.getVo(40760) && NpcFuncService.ins.getVo(40760).count > 0)
                  {
                     _loc6_.status = 2;
                  }
                  else
                  {
                     _loc6_.status = 1;
                  }
                  break;
               case 5:
                  _loc6_.status = 1;
                  break;
               case 6:
                  if(NpcFuncService.ins.getVo(40720).count > 0)
                  {
                     _loc6_.status = 2;
                  }
                  else
                  {
                     _loc6_.status = 1;
                  }
                  break;
               case 7:
                  if(NpcFuncService.ins.getVo(40750) && NpcFuncService.ins.getVo(40750).count > 0)
                  {
                     _loc6_.status = 2;
                  }
                  else
                  {
                     _loc6_.status = 1;
                  }
                  break;
               case 8:
                  if(NpcFuncService.ins.getVo(40750) && NpcFuncService.ins.getVo(40750).count > 0)
                  {
                     _loc6_.status = 2;
                  }
                  else
                  {
                     _loc6_.status = 1;
                  }
            }
            _loc3_.push(_loc6_);
            _loc7_++;
         }
         _loc3_.sort(sortFun);
         list_activity.dataSource = _loc3_;
      }
      
      private function sortFun(param1:GuildActivityVo, param2:GuildActivityVo) : int
      {
         if(param1.status > 0 && param2.status == 0)
         {
            return -1;
         }
         if(param1.status == 0 && param2.status > 0)
         {
            return 1;
         }
         if(param1.id < param2.id)
         {
            return -1;
         }
         return 1;
      }
      
      public function updateMemberList() : void
      {
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_guild_info_panel","guild_notice_update_guild_info","guild_notice_update_member_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_guild_info_panel" !== _loc3_)
         {
            if("guild_notice_update_guild_info" !== _loc3_)
            {
               if("guild_notice_update_member_list" !== _loc3_)
               {
               }
            }
            else
            {
               updateBaseInfo();
            }
         }
         else
         {
            updateActivityList();
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         updateBaseInfo();
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
