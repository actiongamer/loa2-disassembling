package nslm2.modules.foundations.chatModules.historyPanels.historyS3
{
   import game.ui.chatModules.ChatHistoryPanelS3UI;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatHistoryTxtS1;
   import com.mz.core.mediators.RollMediator;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatScrollBarS1;
   import morn.core.components.Image;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import morn.core.components.ScrollBar;
   
   public class ChatHistoryPanelS3 extends ChatHistoryPanelS3UI
   {
       
      
      public var contentBox:ChatHistoryTxtS1;
      
      private var rollMed:RollMediator;
      
      public var boxScrollBarCtrl:ChatScrollBarS1;
      
      private var chatBG:Image;
      
      private var basicHeight1:int = 0;
      
      private var basicHeight2:int = 0;
      
      private var basicHeight3:int = 0;
      
      private var basicY1:int = -77;
      
      private var basicY2:int = 0;
      
      private var count:int;
      
      private var _actived:Boolean = false;
      
      public function ChatHistoryPanelS3()
      {
         super();
         contentBox = new ChatHistoryTxtS1();
         contentBox.setSize(this.placeHistory.width,this.placeHistory.height);
         this.placeHistory.replaceWithDisplay(this.contentBox);
         boxScrollBarCtrl = new ChatScrollBarS1(this.contentBox,this.boxScrollBar);
         this.boxScrollBar.visible = false;
         this.boxScrollBar.txt_vscrollBar.mouseWheelEnable = false;
         this.contentBox.addEventListener("mouseWheel",onMouseWhell);
         rollMed = new RollMediator(this,boxScrollBar_onRoll);
         this.scrollBar.alpha = 0;
         this.scrollBar.value = scrollBar.max;
         scrollBar.commitMeasure();
         basicHeight1 = this.height;
         basicHeight2 = this.placeHistory.height;
      }
      
      public function setImgChatBG(param1:Image) : void
      {
         this.chatBG = param1;
         basicHeight3 = param1.height;
         basicY2 = param1.y;
      }
      
      public function setHeight(param1:Boolean = false) : void
      {
         if(param1 == false)
         {
            height = basicHeight1;
            scrollBar.height = basicHeight1;
            placeHistory.height = basicHeight2;
            chatBG.height = basicHeight3;
            chatBG.y = basicY2;
            this.y = basicY1;
         }
         else
         {
            height = basicHeight1 + 70;
            scrollBar.height = basicHeight1 + 70;
            placeHistory.height = basicHeight2 + 70;
            chatBG.height = basicHeight3 + 70;
            chatBG.y = basicY2 - 70;
            this.y = basicY1 - 70;
         }
         contentBox.setSize(this.placeHistory.width,this.placeHistory.height);
         this.commitMeasure();
         var _loc2_:Number = scrollBar.value;
         scrollBar.value = -1;
         scrollBar.value = _loc2_;
      }
      
      protected function onMouseWhell(param1:MouseEvent) : void
      {
         boxScrollBar.txt_vscrollBar.value = boxScrollBar.txt_vscrollBar.value + (param1.delta > 0?-1:1);
         if(boxScrollBar.txt_vscrollBar.value < boxScrollBar.txt_vscrollBar.max && boxScrollBar.txt_vscrollBar.value > boxScrollBar.txt_vscrollBar.min)
         {
            param1.stopPropagation();
         }
      }
      
      private function boxScrollBar_onRoll(param1:Boolean) : void
      {
         if(actived)
         {
            TweenLite.to(this.scrollBar,0.6,{
               "alpha":(!!param1?1:0),
               "ease":Cubic.easeOut
            });
         }
      }
      
      public function append(param1:PublicTalkNotify) : void
      {
         count = Number(count) + 1;
         if(param1.parseResultVoMsg == null)
         {
            param1.parseResultVoMsg = ChatUtils.processMsg(param1);
         }
         var _loc2_:ChatParseResultVo = param1.parseResultVoMsg;
         contentBox.append(_loc2_.msg,_loc2_.faceArr);
      }
      
      public function clear() : void
      {
         count = 0;
         this.contentBox.clear();
      }
      
      public function get autoScroll() : Boolean
      {
         return contentBox.autoScroll;
      }
      
      public function get scrollBar() : ScrollBar
      {
         return this.boxScrollBar.txt_vscrollBar;
      }
      
      public function get actived() : Boolean
      {
         return _actived;
      }
      
      public function set actived(param1:Boolean) : void
      {
         _actived = param1;
         this.visible = param1;
         this.boxScrollBarCtrl.actived = param1;
      }
      
      override public function dispose() : void
      {
         rollMed.dispose();
         rollMed = null;
         this.contentBox.removeEventListener("mouseWheel",onMouseWhell);
         super.dispose();
      }
   }
}
