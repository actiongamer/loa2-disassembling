package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import morn.core.components.View;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import nslm2.modules.foundations.chatModules.ChatChannelVo;
   import nslm2.common.model.PlayerModel;
   import flash.display.DisplayObject;
   
   public class ChatHistoryContentS2 extends View
   {
      
      public static const CONTENT_CHANGE:String = "contentChange";
      
      public static const VGap:int = 8;
      
      public static const scrollTick:int = 10;
       
      
      public var showSendTime:Boolean;
      
      public var showChannelName:Boolean = true;
      
      private var renderArr:Array;
      
      private var _contentH:int;
      
      public function ChatHistoryContentS2(param1:int)
      {
         renderArr = [];
         super();
         this.width = param1;
         this.scrollRect = new Rectangle(0,0,param1,height);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         var _loc2_:Rectangle = scrollRect;
         _loc2_.height = param1;
         this.scrollRect = _loc2_;
      }
      
      private function drawBg() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0);
         this.graphics.drawRect(0,0,this.scrollRect.width,this.contentHeight);
         this.graphics.endFill();
      }
      
      public function dispatchContentChangeEvent() : void
      {
         this.dispatchEvent(new Event("contentChange"));
      }
      
      public function get contentHeight() : int
      {
         return _contentH;
      }
      
      public function set contentHeight(param1:int) : void
      {
         _contentH = param1;
         drawBg();
      }
      
      public function show(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         this.clear();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _append(_loc2_);
            _loc4_++;
         }
         this.dispatchContentChangeEvent();
      }
      
      public function append(param1:PublicTalkNotify) : void
      {
         _append(param1);
         dispatchContentChangeEvent();
      }
      
      private function _append(param1:PublicTalkNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:ChatChannelVo = ChatConsts.ins.getChannelVo(param1.pindao);
         if(_loc2_.showSimple)
         {
            _loc3_ = new ChatHistoryRenderSimple();
         }
         else if(PlayerModel.ins.isCurPlayer(param1.playerId))
         {
            _loc3_ = new ChatHistoryRenderRight();
            _loc3_.x = this.width - _loc3_.width;
            (_loc3_ as ChatHistoryRenderRight).showSendTime = this.showSendTime;
         }
         else
         {
            _loc3_ = new ChatHistoryRenderLeft();
            (_loc3_ as ChatHistoryRenderLeft).showSendTime = this.showSendTime;
         }
         _loc3_.showChannelName = this.showChannelName;
         _loc3_.vo = param1;
         this.addChild(_loc3_ as DisplayObject);
         renderArr.push(_loc3_);
         _loc3_.y = contentHeight + 8;
         contentHeight = _loc3_.y + _loc3_.height;
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = renderArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = renderArr[_loc3_];
            _loc2_.dispose();
            _loc3_++;
         }
         renderArr = [];
         this.contentHeight = 0;
      }
      
      public function get needScrollBar() : Boolean
      {
         return contentHeight > this.height;
      }
      
      public function get maxScrollV() : int
      {
         return Math.ceil((this.contentHeight - this.height) / 10);
      }
      
      public function set scrollV(param1:int) : void
      {
         var _loc2_:Rectangle = scrollRect;
         _loc2_.y = param1 * 10;
         this.scrollRect = _loc2_;
      }
      
      public function get scrollV() : int
      {
         return Math.ceil(this.scrollRect.y) / 10;
      }
   }
}
