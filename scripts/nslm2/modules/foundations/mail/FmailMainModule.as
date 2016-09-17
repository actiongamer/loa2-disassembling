package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.FMailMainModuleUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.DelMailReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.DelMailRes;
   import com.mz.core.event.MzEvent;
   import proto.GetNewGroupMailReq;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.UIMgr;
   import proto.MailData;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import nslm2.utils.WealthUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class FmailMainModule extends FMailMainModuleUI
   {
       
      
      private var _writeMailPanel:nslm2.modules.foundations.mail.WriteMailPanel;
      
      private var _readMailPanel:nslm2.modules.foundations.mail.ReadMailPanel;
      
      private var _initX:int;
      
      private var _writeFlag:Boolean = false;
      
      private var _readFlag:Boolean = false;
      
      private var _rewardInixY:int;
      
      public function FmailMainModule()
      {
         _writeMailPanel = new nslm2.modules.foundations.mail.WriteMailPanel();
         _readMailPanel = new nslm2.modules.foundations.mail.ReadMailPanel();
         super();
         switchEventListeners(true);
         this.tabGroup.selectHandler = onTabChange;
         MornExpandUtil.addHandlerForBtnAll(this,btn_onClick);
      }
      
      private function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if(btnAllDelete !== _loc6_)
         {
            if(btnDeleteReaded === _loc6_)
            {
               if(MailModel.ins.mailReadList.size == 0)
               {
                  return;
               }
               _loc4_ = new DelMailReq();
               _loc5_ = 0;
               while(_loc5_ < MailModel.ins.mailReadList.array.length)
               {
                  _loc4_.ids.push(MailModel.ins.mailReadList.array[_loc5_].id);
                  _loc5_++;
               }
               ServerEngine.ins.send(8153,_loc4_,onServerCpl_delMail);
            }
         }
         else
         {
            _loc3_ = new DelMailReq();
            _loc5_ = 0;
            while(_loc5_ < MailModel.ins.sendedMailList.array.length)
            {
               _loc3_.ids.push(MailModel.ins.sendedMailList.array[_loc5_].id);
               _loc5_++;
            }
            ServerEngine.ins.send(8153,_loc3_,onServerCpl_delMail);
         }
      }
      
      private function onServerCpl_delMail(param1:DelMailRes) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.ids.length)
         {
            MailModel.ins.delMail(param1.ids[_loc2_]);
            _loc2_++;
         }
         MailModel.ins.dispatchEvent(new MzEvent("mailDelete",param1.ids));
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(MailModel.ins.groupMailFlag)
         {
            _loc2_ = new GetNewGroupMailReq();
            ServerEngine.ins.send(8158,_loc2_);
         }
         MornExpandUtil.setCenter(this);
         _initX = this.x;
         this.listMails.selectedIndex = -1;
         updateMailModuleRedpoint();
         this.listMails.dataSource = onSort(ArrayUtil.copy(MailModel.ins.mailAllList.array));
         this.pageBar.bindList(this.listMails);
         this.panelBg.titleImgId = this.moduleId;
         this._rewardInixY = this.listAllGet.y;
         if(param1 != null)
         {
            _loc3_ = new MailInitVo();
            _loc3_.receiverNameArr = (param1 as Array)[1];
            _loc3_.kind = (param1 as Array)[0];
            this.boxMain.visible = false;
            this.panelBg.visible = false;
            DisplayUtils.removeSelf(_readMailPanel);
            _writeMailPanel.x = 0;
            _writeMailPanel.y = 0;
            this._writeMailPanel.show(_loc3_);
            this.addChild(_writeMailPanel);
            this._writeFlag = true;
            UIMgr.stage.focus = _writeMailPanel.txtRecvName.textField;
         }
         super.preShow(param1);
      }
      
      private function onSort(param1:Array) : Array
      {
         return param1.sortOn("time",2);
      }
      
      private function onReadMail(param1:MzEvent) : void
      {
         DisplayUtils.removeSelf(_writeMailPanel);
         var _loc2_:MailData = param1.data as MailData;
         _readMailPanel.x = this.width + 10;
         this.addChild(this._readMailPanel);
         this._readMailPanel.show(_loc2_);
         TweenLite.to(this,0.5,{"x":_initX - 150});
         updateMailModuleRedpoint();
         this._readFlag = true;
      }
      
      private function onWriteMail(param1:MzEvent) : void
      {
         DisplayUtils.removeSelf(_readMailPanel);
         _writeMailPanel.x = this.width + 10;
         this.addChild(this._writeMailPanel);
         this._writeMailPanel.show(param1.data as MailInitVo);
         this._writeFlag = true;
         TweenLite.to(this,0.5,{"x":_initX - 150});
         UIMgr.stage.focus = _writeMailPanel.txtRecvName.textField;
         if(param1.data as MailInitVo != null)
         {
            UIMgr.stage.focus = _writeMailPanel.txtContent.textField;
         }
      }
      
      private function onTabChange(param1:int) : void
      {
         handleReadMail();
         switch(int(param1))
         {
            case 0:
               this.listMails.dataSource = onSort(ArrayUtil.copy(MailModel.ins.mailAllList.array));
               break;
            case 1:
               this.listMails.dataSource = onSort(ArrayUtil.copy(MailModel.ins.sendedMailList.array));
         }
         updateMailModuleRedpoint();
      }
      
      public function updateMailModuleRedpoint() : void
      {
         var _loc1_:int = MailModel.ins.mailUnreadList.array.length;
         if(_loc1_ == 0)
         {
            this.imgRedPointUnread.visible = false;
         }
         else
         {
            this.imgRedPointUnread.txt_count.text = _loc1_.toString();
            this.imgRedPointUnread.visible = true;
         }
         if(tabGroup.selectedIndex == 0)
         {
            this.imgRedPointReward.visible = true;
            _loc1_ = MailModel.ins.GetRewardMailNum();
            this.btnAllGet.visible = true;
            this.btnAllGet.mouseEnabled = true;
            this.btnAllDelete.visible = false;
            this.btnAllDelete.mouseEnabled = false;
            this.btnDeleteReaded.visible = true;
            if(_loc1_ == 0)
            {
               this.imgRedPointReward.visible = false;
            }
            else
            {
               this.imgRedPointReward.txt_count.text = _loc1_.toString();
               if(this.tabGroup.selectedIndex == 0)
               {
                  this.imgRedPointReward.visible = true;
               }
            }
         }
         else
         {
            this.btnDeleteReaded.visible = false;
            this.btnAllGet.visible = false;
            this.btnAllGet.mouseEnabled = false;
            this.btnAllDelete.visible = true;
            this.btnAllDelete.mouseEnabled = true;
            this.imgRedPointReward.visible = false;
         }
         if(MailModel.ins.mailUnreadList.array.length > 0)
         {
            MailModel.ins.dispatchEvent(new MzEvent("mailHasNew",true,true));
         }
         else
         {
            MailModel.ins.dispatchEvent(new MzEvent("mailHasNew",false,true));
         }
      }
      
      private function clickWriteMail(param1:MouseEvent) : void
      {
         MailModel.ins.dispatchEvent(new MzEvent("mailWrite",null));
      }
      
      public function get pageBar() : PageBarS2
      {
         return this.pageBarUI as PageBarS2;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            switchEventListeners(false);
            _writeMailPanel.addEventListener("close",WritePanelClose);
            _readMailPanel.addEventListener("close",ReadPanelClose);
            this.txtWriteMail.addEventListener("click",clickWriteMail);
            this.addEventListener("mailRead",onReadMail);
            this.btnAllGet.addEventListener("click",onAllGet);
            MailModel.ins.addEventListener("mailWrite",onWriteMail);
            MailModel.ins.addEventListener("mailReadGetReward",onReadGetReward);
            MailModel.ins.addEventListener("mailAllGetReward",onAllGetRewardEvent);
            MailModel.ins.addEventListener("mailDelete",onDelMail);
            MailModel.ins.addEventListener("mailInfoChange",refresh);
         }
         else
         {
            _writeMailPanel.removeEventListener("close",WritePanelClose);
            _readMailPanel.removeEventListener("close",ReadPanelClose);
            this.txtWriteMail.removeEventListener("click",clickWriteMail);
            this.removeEventListener("mailRead",onReadMail);
            this.btnAllGet.removeEventListener("click",onAllGet);
            MailModel.ins.removeEventListener("mailWrite",onWriteMail);
            MailModel.ins.removeEventListener("mailReadGetReward",onReadGetReward);
            MailModel.ins.removeEventListener("mailAllGetReward",onAllGetRewardEvent);
            MailModel.ins.removeEventListener("mailDelete",onDelMail);
            MailModel.ins.removeEventListener("mailInfoChange",refresh);
         }
      }
      
      private function onDelMail(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.tabGroup.selectedIndex == 0)
         {
            _loc3_ = ArrayUtil.copy(MailModel.ins.mailAllList.array);
         }
         else
         {
            _loc3_ = ArrayUtil.copy(MailModel.ins.sendedMailList.array);
         }
         var _loc2_:Array = param1.data as Array;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            TweenLite.delayedCall(_loc4_ * 0.3,doDelMail,[_loc2_[_loc4_],_loc3_]);
            _loc4_++;
         }
         this.listMails.selectedIndex = -1;
         TweenLite.delayedCall(0.3 + _loc4_ * 0.3,selectItem,[_loc3_]);
      }
      
      private function doDelMail(param1:UInt64, param2:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = this.listMails.cells;
         for each(var _loc3_ in this.listMails.cells)
         {
            if(_loc3_.dataSource != null && Uint64Util.toString((_loc3_.dataSource as MailData).id) == Uint64Util.toString(param1))
            {
               new ListRemoveItemTweenEffect(this.listMails,this.listMails.getItemIndex(_loc3_.dataSource),param2).set_duration(0.2).set_Removeduration(0.1).exec();
            }
         }
      }
      
      private function selectItem(param1:Array) : void
      {
         var _loc2_:Array = onSort(param1);
         this.listMails.dataSource = _loc2_;
         if(!_readFlag)
         {
            return;
         }
         if(this.tabGroup.selectedIndex == 0)
         {
            if(param1.length > 0)
            {
               this.listMails.dataSource;
               this.dispatchEvent(new MzEvent("mailRead",_loc2_[this.listMails.page * this.listMails.repeatY],true));
               this.listMails.selectedIndex = this.listMails.page * this.listMails.repeatY;
            }
         }
         else if(param1.length > 0)
         {
            this.dispatchEvent(new MzEvent("mailRead",_loc2_[this.listMails.page * this.listMails.repeatY],true));
            this.listMails.selectedIndex = this.listMails.page * this.listMails.repeatY;
         }
      }
      
      private function refresh(param1:MzEvent) : void
      {
         if(this.isDisposed)
         {
            MailModel.ins.removeEventListener("mailInfoChange",refresh);
            return;
         }
      }
      
      private function onReadGetReward(param1:MzEvent) : void
      {
         updateMailModuleRedpoint();
      }
      
      private function onAllGet(param1:MouseEvent) : void
      {
         this.onAllGetRewardEvent(null);
      }
      
      private function onAllGetRewardEvent(param1:MzEvent) : void
      {
         var _loc2_:int = this.listAllGet.y;
         if(this.listAllGet.visible)
         {
            new ListIconFlyEff(this.listAllGet).set_getToTargetHandler(flyCallback).exec();
            TweenLite.to(this.listAllGet,0.3,{
               "alpha":0,
               "x":this.listAllGet.x,
               "y":_loc2_ - 100,
               "onComplete":flyCpl
            });
         }
         if(MailModel.ins.GetNowPageRewardMailNum(listMails.dataSource as Array,listMails.page) == 0)
         {
            this.listMails.mouseChildren = true;
            this.listAllGet.visible = false;
            this.btnAllGet.mouseEnabled = true;
            this.listAllGet.y = _rewardInixY;
            return;
         }
         this.listMails.mouseChildren = false;
         this.listAllGet.visible = true;
         this.btnAllGet.mouseEnabled = false;
         WritePanelClose(null);
         ReadPanelClose(null);
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = this.listMails.cells;
         for each(var _loc3_ in this.listMails.cells)
         {
            if(_loc3_.dataSource != null && (_loc3_.dataSource as MailData).status == 2 && (_loc3_.dataSource as MailData).reward.length > 0)
            {
               _loc3_.onRenderOnekeyGetReward();
               this.listAllGet.dataSource = WealthUtil.rewardArrToWealthVoArr((_loc3_.dataSource as MailData).reward);
               if(param1 == null)
               {
                  rewardFadeIn();
               }
               else
               {
                  TimerManager.ins.doOnce(300,rewardFadeIn);
               }
               this.listMails.selectedIndex = _loc4_;
               break;
            }
            _loc4_++;
         }
      }
      
      private function flyCpl() : void
      {
         this.listAllGet.y = _rewardInixY + this.listMails.selectedIndex * 60;
         updateMailModuleRedpoint();
      }
      
      private function rewardFadeIn() : void
      {
         if(tabGroup.selectedIndex == 0)
         {
            TweenLite.to(this.listAllGet,0.1,{
               "alpha":1,
               "x":this.listAllGet.x,
               "y":this._rewardInixY + this.listMails.selectedIndex * 60
            });
         }
      }
      
      private function flyCallback() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.listAllGet.dataSource.length)
         {
            if(this.listAllGet.cells[_loc1_] != null)
            {
               this.listAllGet.cells[_loc1_].visible = true;
            }
            _loc1_++;
         }
      }
      
      private function WritePanelClose(param1:Event) : void
      {
         if(this.boxMain.visible == false)
         {
            ModuleMgr.ins.closeModule(10700);
            return;
         }
         _writeFlag = false;
         if(!_writeFlag && !_readFlag)
         {
            TweenLite.to(this,0.5,{
               "x":_initX,
               "overwrite":false
            });
         }
         DisplayUtils.removeSelf(_writeMailPanel);
      }
      
      private function ReadPanelClose(param1:Event) : void
      {
         _readFlag = false;
         if(!_writeFlag && !_readFlag)
         {
            TweenLite.to(this,0.5,{
               "x":_initX,
               "overwrite":false
            });
         }
         DisplayUtils.removeSelf(_readMailPanel);
         handleReadMail();
         MailModel.ins.dispatchEvent(new MzEvent("mailInfoChange",null,true));
      }
      
      private function handleReadMail() : void
      {
         if(this.listMails.selectedItem == null)
         {
            return;
         }
         var _loc1_:MailData = this.listMails.selectedItem as MailData;
         if(_loc1_.reward.length > 0)
         {
            return;
         }
         var _loc2_:MailData = MailModel.ins.delMail(_loc1_.id);
         if(_loc2_ != null && _loc2_.content != null)
         {
            _loc2_.status = 1;
            MailModel.ins.addMail(_loc2_);
         }
         MailModel.ins.dispatchEvent(new MzEvent("mailInfoChange",null,true));
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
