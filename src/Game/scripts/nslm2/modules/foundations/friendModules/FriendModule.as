package nslm2.modules.foundations.friendModules
{
   import game.ui.friendModules.FriendModuleUI;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   import morn.customs.components.PlayerRender;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.utils.PlayerVoUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.uiEffects.RollTweenVisibleMed;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import org.specter3d.utils.StringUtil;
   import com.greensock.TweenLite;
   import proto.GameFriendData;
   import nslm2.modules.foundations.friendModules.mains.FriendListTileRender;
   import proto.FriendSignatureReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.FriendSignatureRes;
   import com.mz.core.utils.DisplayUtils;
   import proto.FriendStaminaInfoRes;
   
   public class FriendModule extends FriendModuleUI
   {
       
      
      private var txtSearchPromptBind:TextPromptBind;
      
      public function FriendModule()
      {
         super();
      }
      
      public function get redPoiCong() : RedPointNum
      {
         return this.redPoiCongUI as RedPointNum;
      }
      
      public function get renPoiGift() : RedPointNum
      {
         return this.redPoiGiftUI as RedPointNum;
      }
      
      private function validteCanCongRedPoi() : void
      {
         redPoiCong.count = FriendService.ins.canCongIds.length;
      }
      
      private function validteGetGiftRedPoi() : void
      {
         renPoiGift.count = FriendService.ins.canGetIds.length;
      }
      
      public function get service() : FriendService
      {
         return FriendService.ins;
      }
      
      public function get playerRender() : PlayerRender
      {
         return playerRenderUI;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_add !== _loc3_)
         {
            if(this.btn_recommand !== _loc3_)
            {
               if(this.btn_gift !== _loc3_)
               {
                  if(this.btn_log !== _loc3_)
                  {
                     if(this.btn_search === _loc3_)
                     {
                        AlertUtil.floadNoOpenModule();
                     }
                  }
                  else
                  {
                     ModuleMgr.ins.showModule(10622,null,10600);
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(10621,null,10600);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(10601,null,10600);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(10602,null,10600);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         FriendService.ins.addEventListener("evtFriendList",onGetFriendList);
         FriendService.ins.getFriendList();
      }
      
      private function onGetFriendList(param1:Event) : void
      {
         FriendService.ins.removeEventListener("evtFriendList",onGetFriendList);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.x = UIMgr.gameWidth - this.width - 100;
         this.y = (UIMgr.gameHeight - this.height) / 2;
         this.panelBg.titleImgId = this.moduleId;
         this.playerRender.playerVo = PlayerVoUtils.curPlayerVo();
         this.btn_log.toolTip = LocaleMgr.ins.getStr(10600027);
         this.btn_recommand.toolTip = LocaleMgr.ins.getStr(9710601);
         this.txt_desc.maxChars = DefindConsts.FRIENDS_SIGN_MAX;
         this.txt_desc.text = FriendService.ins.signatue;
         this.txt_descPrompt.text = LocaleMgr.ins.getStr(999000253);
         this.txt_desc.addEventListener("enter",txt_desc_enter);
         this.txt_desc.addEventListener("focusOut",txt_desc_enter);
         this.parts.push(new TextPromptBind(this.txt_desc.textField,this.box_prompt));
         this.parts.push(new RollTweenVisibleMed(this.txt_desc,this.txt_desc.bg));
         tab_kindTabGroup.labels = LocaleMgr.ins.getStr(999000254);
         this.img_icon0.mouseEvent = false;
         this.img_icon1.mouseEvent = false;
         this.img_icon2.mouseEvent = false;
         if(FriendService.ins.recentlyArr.length > 0)
         {
            this.tab_kindTabGroup.selectedIndex = 1;
         }
         else
         {
            this.tab_kindTabGroup.selectedIndex = 0;
         }
         this.tab_kindTabGroup.userChangeHandler = kindTabGroup_change;
         this.list_quickSearch.visible = false;
         this.list_quickSearch.list_search.array = [];
         this.list_quickSearch.list_search.changeHandler = list_search_changeHandler;
         this.txt_search.maxChars = 6;
         this.list_quickSearch.list_search.useMouseDown = true;
         this.txt_search.text = "";
         this.txt_search.addEventListener("enter",txt_search_enter);
         this.txt_search.textField.addEventListener("change",txt_search_change);
         this.txt_search.textField.addEventListener("focusIn",txt_search_focusIn);
         this.txt_search.textField.addEventListener("focusOut",txt_search_focusOut);
         txtSearchPromptBind = new TextPromptBind(this.txt_search.textField,this.txt_searchPrompt);
         this.parts.push(new TextPromptBind(this.txt_search.textField,this.txt_searchPrompt));
         this.list_recently.selectEnable = false;
         this.list_recently.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.list_friend.selectedIndex = 0;
         this.list_friend.changeHandler = list_friend_changeHandler;
         this.list_friend.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         var _loc2_:Array = [1,2,3];
         this.list_friend.repeatY = _loc2_.length;
         this.list_friend.array = _loc2_;
         this.list_block.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.showKind();
         validteCanCongRedPoi();
         validteGetGiftRedPoi();
         this.txt_friendLimit.text = LocaleMgr.ins.getStr(30100345,[service.friendArr.length,VipModel.ins.getVipValue(10030)]);
         this.addChild(new VipHintBox(10030,200,this.txt_friendLimit.y - 19));
         super.preShow(param1);
      }
      
      private function txt_search_change(... rest) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = this.txt_search.text;
         _loc2_ = StringUtil.trim(_loc2_);
         if(_loc2_)
         {
            _loc3_ = FriendService.ins.searchFriendByKey(_loc2_);
            if(_loc3_.length > 0)
            {
               this.list_quickSearch.list_search.selectedIndex = -1;
               this.list_quickSearch.list_search.repeatY = _loc3_.length;
               this.list_quickSearch.list_search.array = _loc3_;
               this.list_quickSearch.list_search.commitMeasure();
               this.list_quickSearch.height = this.list_quickSearch.list_search.y * 2 + this.list_quickSearch.list_search.height;
               this.list_quickSearch.visible = true;
            }
            else
            {
               this.list_quickSearch.visible = false;
            }
         }
         else
         {
            this.list_quickSearch.visible = false;
         }
      }
      
      private function txt_search_focusIn(param1:Event) : void
      {
         TweenLite.killDelayedCallsTo(txt_search_focusOut2);
         this.txt_search_change();
      }
      
      private function txt_search_focusOut(param1:Event) : void
      {
         TweenLite.killDelayedCallsTo(txt_search_focusOut2);
         TweenLite.delayedCall(Config.clickDelay / 1000,txt_search_focusOut2);
      }
      
      private function txt_search_focusOut2() : void
      {
         this.list_quickSearch.visible = false;
      }
      
      private function txt_search_enter(param1:Event) : void
      {
         if(this.list_quickSearch.visible && list_quickSearch.list_search.array.length > 0)
         {
            this.txt_search.text = "";
            toPrivChat(list_quickSearch.list_search.getItem(0) as GameFriendData);
            this.list_quickSearch.visible = false;
         }
      }
      
      private function list_search_changeHandler(param1:int) : void
      {
         this.txt_search.text = "";
         txtSearchPromptBind.validate();
         this.list_quickSearch.visible = false;
         toPrivChat(list_quickSearch.list_search.getItem(param1) as GameFriendData);
      }
      
      private function toPrivChat(param1:GameFriendData) : void
      {
         ModuleMgr.ins.showModule(10540,param1.id,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            service.addEventListener("evtAddFriend",serviceHandler);
            service.addEventListener("evtRemoveFriend",serviceHandler);
            service.addEventListener("evtAddBlock",serviceHandler);
            service.addEventListener("evtRemoveBlock",serviceHandler);
            service.addEventListener("evtAddRecently",serviceHandler);
            service.addEventListener("evtRemoveRecently",serviceHandler);
            service.addEventListener("evtCanCongChange",serviceHandler);
            service.addEventListener("evtGetGiftChange",serviceHandler);
            service.addEventListener("evtChangeOfftime",serviceHandler);
         }
         else
         {
            service.removeEventListener("evtAddFriend",serviceHandler);
            service.removeEventListener("evtRemoveFriend",serviceHandler);
            service.removeEventListener("evtAddBlock",serviceHandler);
            service.removeEventListener("evtRemoveBlock",serviceHandler);
            service.removeEventListener("evtAddRecently",serviceHandler);
            service.removeEventListener("evtRemoveRecently",serviceHandler);
            service.removeEventListener("evtCanCongChange",serviceHandler);
            service.removeEventListener("evtGetGiftChange",serviceHandler);
            service.removeEventListener("evtChangeOfftime",serviceHandler);
         }
      }
      
      private function serviceHandler(param1:Event) : void
      {
         var _loc2_:* = param1.type;
         if("evtAddFriend" !== _loc2_)
         {
            if("evtRemoveFriend" !== _loc2_)
            {
               if("evtAddRecently" !== _loc2_)
               {
                  if("evtRemoveRecently" !== _loc2_)
                  {
                     if("evtAddBlock" !== _loc2_)
                     {
                        if("evtRemoveBlock" !== _loc2_)
                        {
                           if("evtCanCongChange" !== _loc2_)
                           {
                              if("evtGetGiftChange" !== _loc2_)
                              {
                                 if("evtChangeOfftime" === _loc2_)
                                 {
                                    this.validateFriendTitleNum();
                                    this.service.friendArr.sort(this.service.sortFriendPieceFun);
                                    this.showKind();
                                 }
                              }
                              else
                              {
                                 this.validteGetGiftRedPoi();
                              }
                           }
                           else
                           {
                              this.validteCanCongRedPoi();
                           }
                        }
                        else
                        {
                           this.showKind();
                        }
                     }
                     else
                     {
                        this.showKind();
                     }
                  }
                  else
                  {
                     this.showKind(false);
                  }
               }
               else
               {
                  this.showKind();
               }
            }
            else
            {
               this.txt_friendLimit.text = LocaleMgr.ins.getStr(30100345,[service.friendArr.length,VipModel.ins.getVipValue(10030)]);
               this.showKind(false);
            }
         }
         else
         {
            this.txt_friendLimit.text = LocaleMgr.ins.getStr(30100345,[service.friendArr.length,VipModel.ins.getVipValue(10030)]);
            this.showKind();
         }
      }
      
      private function kindTabGroup_change() : void
      {
         this.showKind();
      }
      
      private function get curTabId() : int
      {
         return FriendConsts.ins.mainTab[this.tab_kindTabGroup.selectedIndex];
      }
      
      private function showKind(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = curTabId;
         if(11 !== _loc3_)
         {
            if(22 !== _loc3_)
            {
               if(33 === _loc3_)
               {
                  this.list_recently.visible = false;
                  this.list_friend.visible = false;
                  this.list_block.visible = true;
                  this.txt_search.visible = false;
                  this.txt_searchPrompt.visible = false;
                  this.btn_search.visible = false;
                  service.blockArr.sort(service.sortFriendPieceFun);
                  this.list_block.array = service.blockArr;
               }
            }
            else
            {
               this.list_recently.visible = false;
               this.list_friend.visible = true;
               this.list_block.visible = false;
               this.txt_search.visible = true;
               this.txt_searchPrompt.visible = true;
               this.btn_search.visible = true;
               service.friendArr.sort(service.sortFriendPieceFun);
               service.gangfriendArr.sort(service.sortFriendPieceFun);
               if(param1 == false)
               {
                  _loc2_ = this.list_friend.scrollBar.value;
               }
               this.list_friend.subArray = [service.friendArr,service.gangfriendArr,[]];
               if(param1 == false)
               {
                  this.list_friend.scrollBar.value = _loc2_;
               }
               if(curTabId == 22)
               {
                  FriendService.ins.validateFriendOnlineCount();
                  FriendService.ins.validateGangfriendOnlineCount();
                  validateFriendTitleNum();
                  validateGangfriendTitleNum();
               }
            }
         }
         else
         {
            this.list_recently.visible = true;
            this.list_friend.visible = false;
            this.list_block.visible = false;
            this.txt_search.visible = false;
            this.txt_searchPrompt.visible = false;
            this.btn_search.visible = false;
            this.list_recently.array = FriendService.ins.recentlyArr;
         }
      }
      
      private function validateFriendTitleNum() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.list_friend.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list_friend.cells[_loc3_] as FriendListTileRender;
            _loc1_.dataSource = _loc1_.dataSource;
            _loc3_++;
         }
      }
      
      private function validateGangfriendTitleNum() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.list_friend.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list_friend.cells[_loc3_] as FriendListTileRender;
            _loc1_.dataSource = _loc1_.dataSource;
            _loc3_++;
         }
      }
      
      private function list_friend_changeHandler(param1:int, param2:int) : void
      {
         if(param1 == param2)
         {
            this.list_friend.selectedIndex = -1;
            this.list_friend_changeHandler(-1,param1);
         }
      }
      
      private function txt_desc_enter(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = this.txt_desc.text;
         if(_loc2_ != FriendService.ins.signatue)
         {
            _loc3_ = new FriendSignatureReq();
            _loc3_.content = _loc2_;
            ServerEngine.ins.send(7304,_loc3_,new Handler(server_friendSignature,[_loc2_]));
         }
      }
      
      private function server_friendSignature(param1:String, param2:FriendSignatureRes) : void
      {
         FriendService.ins.signatue = param1;
         AlertUtil.float(LocaleMgr.ins.getStr(999000255),DisplayUtils.globarCenter(this.txt_desc));
      }
      
      private function server_CplFriendStaminaInfo(param1:FriendStaminaInfoRes) : void
      {
         ModuleMgr.ins.showModule(10621,null,10600);
      }
      
      private function validateSignatue() : void
      {
         this.txt_descPrompt.style = !!this.service.signatue?"普通说明":"普通灰色";
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
