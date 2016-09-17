package nslm2.modules.foundations.chatModules.localChatHistory
{
   import game.ui.chatModules.localChatHistory.ChatHistoryPanelLocalUI;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import nslm2.modules.foundations.chatModules.ChannelGroupVo;
   import nslm2.modules.foundations.chatModules.LocalTalkDataVo;
   import morn.core.components.VScrollBar;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.IChatHistoryRender;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import nslm2.modules.foundations.chatModules.ChatChannelVo;
   import nslm2.common.model.PlayerModel;
   import flash.display.DisplayObject;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderSimple;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderRight;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderLeft;
   import flash.display.Sprite;
   
   public class ChatHistoryPanelLocal extends ChatHistoryPanelLocalUI
   {
      
      private static const SIMPLE:String = "simple";
      
      private static const LEFT:String = "left";
      
      private static const RIGHT:String = "right";
       
      
      public var showSendTime:Boolean = true;
      
      private var chatDataListAll:Array;
      
      private var curShowDataList:Array;
      
      private var _curGroupId:int = 0;
      
      private var bottomItemIndex:int;
      
      private var curItemIndex:int;
      
      private var tempDisRenders:Array;
      
      private var disRenderDic:Dictionary;
      
      private var renderPool:Object;
      
      private var count:int = 0;
      
      public function ChatHistoryPanelLocal()
      {
         tempDisRenders = [];
         super();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(255,1);
         _loc1_.graphics.drawRect(this.placeHistory.x,this.placeHistory.y,this.placeHistory.width,this.placeHistory.height);
         _loc1_.graphics.endFill();
         this.addChild(_loc1_);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(255,0);
         _loc2_.graphics.drawRect(this.placeHistory.x,this.placeHistory.y,this.placeHistory.width,this.placeHistory.height);
         _loc2_.graphics.endFill();
         this.contentBox.addChild(_loc2_);
         this.contentBox.mask = _loc1_;
         disRenderDic = new Dictionary();
         this.contentBox.addEventListener("mouseWheel",onMouseWhell);
         scrollBar.addEventListener("change",onScrollChange);
      }
      
      public function show(param1:Array) : void
      {
         chatDataListAll = param1;
         curShowDataList = chatDataListAll;
         initFromBottomToTop();
      }
      
      public function setGroupId(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(_curGroupId == param1)
         {
            return;
         }
         if(param1 == 1000)
         {
            curShowDataList = chatDataListAll;
         }
         else
         {
            curShowDataList = [];
            _loc2_ = ChatConsts.ins.getChannelGroupVo(param1);
            _loc4_ = 0;
            while(_loc4_ < chatDataListAll.length)
            {
               _loc3_ = chatDataListAll[_loc4_] as LocalTalkDataVo;
               if(_loc2_.channelArr.indexOf(_loc3_.pindao) >= 0)
               {
                  curShowDataList.push(_loc3_);
               }
               _loc4_++;
            }
         }
         _curGroupId = param1;
         initFromBottomToTop();
      }
      
      public function get scrollBar() : VScrollBar
      {
         return boxScrollBar.txt_vscrollBar;
      }
      
      public function initFromBottomToTop() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = this.height;
         _loc4_ = curShowDataList.length - 1;
         while(_loc4_ >= 0)
         {
            _loc3_ = curShowDataList[_loc4_] as LocalTalkDataVo;
            _loc2_ = addNewRenderByVo(_loc3_);
            _loc2_.y = _loc1_ - _loc2_.height;
            _loc1_ = _loc2_.y;
            if(_loc1_ >= 0)
            {
               _loc4_--;
               continue;
            }
            break;
         }
         bottomItemIndex = _loc4_ - 1;
         curItemIndex = bottomItemIndex;
         scrollBar.max = bottomItemIndex;
         scrollBar.min = 0;
         scrollBar.value = bottomItemIndex;
         scrollBar.commitMeasure();
      }
      
      protected function onMouseWhell(param1:MouseEvent) : void
      {
         curItemIndex = curItemIndex - param1.delta;
         if(curItemIndex > bottomItemIndex)
         {
            curItemIndex = bottomItemIndex;
         }
         else if(curItemIndex < 0)
         {
            curItemIndex = 0;
         }
         scrollBar.value = curItemIndex;
      }
      
      protected function onScrollChange(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         tempDisRenders = [];
         curItemIndex = scrollBar.value;
         if(scrollBar.value >= bottomItemIndex)
         {
            _loc2_ = this.height;
            _loc6_ = curShowDataList.length - 1;
            while(_loc6_ >= 0)
            {
               _loc5_ = curShowDataList[_loc6_] as LocalTalkDataVo;
               _loc4_ = addNewRenderByVo(_loc5_);
               _loc4_.y = _loc2_ - _loc4_.height;
               tempDisRenders.push(_loc5_);
               _loc2_ = _loc4_.y;
               if(_loc2_ >= 0)
               {
                  _loc6_--;
                  continue;
               }
               break;
            }
         }
         else
         {
            _loc2_ = 0;
            _loc6_ = scrollBar.value;
            while(_loc6_ < curShowDataList.length)
            {
               _loc5_ = curShowDataList[_loc6_] as LocalTalkDataVo;
               _loc4_ = addNewRenderByVo(_loc5_);
               _loc4_.y = _loc2_;
               tempDisRenders.push(_loc5_);
               _loc2_ = _loc4_.y + _loc4_.height;
               if(_loc2_ < placeHistory.height)
               {
                  _loc6_++;
                  continue;
               }
               break;
            }
         }
         var _loc8_:int = 0;
         var _loc7_:* = disRenderDic;
         for(var _loc3_ in disRenderDic)
         {
            if(tempDisRenders.indexOf(_loc3_) < 0)
            {
               delRender(disRenderDic[_loc3_] as IChatHistoryRender);
               delete disRenderDic[_loc3_];
            }
         }
         tempDisRenders = [];
      }
      
      private function addNewRenderByVo(param1:LocalTalkDataVo) : IChatHistoryRender
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(disRenderDic[param1] != null)
         {
            _loc2_ = disRenderDic[param1] as IChatHistoryRender;
         }
         else
         {
            _loc3_ = ChatConsts.ins.getChannelVo(param1.notify.pindao);
            if(_loc3_.showSimple)
            {
               _loc2_ = getRender("simple");
            }
            else if(PlayerModel.ins.isCurPlayer(param1.notify.playerId))
            {
               _loc2_ = getRender("right");
            }
            else
            {
               _loc2_ = getRender("left");
            }
            _loc2_.showChannelName = false;
            _loc2_["txtRich"].setSize(212,20);
            _loc2_.vo = param1.notify;
            this.contentBox.addChild(_loc2_ as DisplayObject);
            disRenderDic[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function getRender(param1:String) : IChatHistoryRender
      {
         var _loc2_:* = null;
         if(renderPool == null)
         {
            renderPool = {};
            renderPool["simple"] = [];
            renderPool["left"] = [];
            renderPool["right"] = [];
         }
         var _loc3_:Array = renderPool[param1] as Array;
         if(_loc3_.length > 0)
         {
            return _loc3_.shift();
         }
         count = Number(count) + 1;
         var _loc4_:* = param1;
         if("simple" !== _loc4_)
         {
            if("right" !== _loc4_)
            {
               if("left" === _loc4_)
               {
                  _loc2_ = new ChatHistoryRenderLeft();
                  (_loc2_ as ChatHistoryRenderLeft).showSendTime = this.showSendTime;
               }
            }
            else
            {
               _loc2_ = new ChatHistoryRenderRight();
               _loc2_.x = this.placeHistory.width - _loc2_.width;
               (_loc2_ as ChatHistoryRenderRight).showSendTime = this.showSendTime;
            }
         }
         else
         {
            _loc2_ = new ChatHistoryRenderSimple();
         }
         return _loc2_;
      }
      
      private function delRender(param1:IChatHistoryRender) : void
      {
         var _loc2_:* = null;
         if(param1 is ChatHistoryRenderSimple)
         {
            _loc2_ = "simple";
         }
         else if(param1 is ChatHistoryRenderRight)
         {
            _loc2_ = "right";
         }
         else
         {
            _loc2_ = "left";
         }
         (renderPool[_loc2_] as Array).push(param1);
         this.contentBox.removeChild(param1 as DisplayObject);
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = disRenderDic;
         for(var _loc1_ in disRenderDic)
         {
            delRender(disRenderDic[_loc1_] as IChatHistoryRender);
            delete disRenderDic[_loc1_];
         }
         disRenderDic = null;
         super.dispose();
      }
   }
}
