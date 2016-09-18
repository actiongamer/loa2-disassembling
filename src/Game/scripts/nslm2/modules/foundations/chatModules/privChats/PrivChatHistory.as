package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatHistoryUI;
   import com.mz.core.mediators.RollMediator;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryContentS2;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatScrollBarS2;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import morn.core.components.ScrollBar;
   import proto.PublicTalkNotify;
   
   public class PrivChatHistory extends PrivChatHistoryUI
   {
      
      public static const CONTENT_CHANGE:String = "contentChange";
      
      public static const VGap:int = 8;
      
      public static const scrollTick:int = 10;
       
      
      private var rollMed:RollMediator;
      
      private var contentBox:ChatHistoryContentS2;
      
      public var boxScrollBarCtrl:ChatScrollBarS2;
      
      public var contentHeight:int;
      
      private var _actived:Boolean = false;
      
      public function PrivChatHistory()
      {
         super();
         contentBox = new ChatHistoryContentS2(this.placeHistory.width);
         contentBox.showSendTime = true;
         contentBox.x = placeHistory.x;
         contentBox.top = 20;
         contentBox.showChannelName = false;
         contentBox.bottom = 6;
         this.addChild(contentBox);
         this.placeHistory.dispose();
         boxScrollBarCtrl = new ChatScrollBarS2(contentBox,this.boxScrollBar);
         rollMed = new RollMediator(this,boxScrollBar_onRoll);
         this.actived = true;
      }
      
      private function boxScrollBar_onRoll(param1:Boolean) : void
      {
         if(actived)
         {
            TweenLite.to(this.boxScrollBar,0.6,{
               "alpha":(!!param1?1:0),
               "ease":Cubic.easeOut
            });
         }
      }
      
      public function get autoScroll() : Boolean
      {
         return boxScrollBarCtrl.autoScroll;
      }
      
      public function get scrollBar() : ScrollBar
      {
         return this.boxScrollBar.txt_vscrollBar;
      }
      
      public function show(param1:Array) : void
      {
         this.contentBox.show(param1);
      }
      
      public function append(param1:PublicTalkNotify) : void
      {
         this.contentBox.append(param1);
      }
      
      public function clear() : void
      {
         this.contentBox.clear();
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
         if(param1)
         {
            this.boxScrollBarCtrl.autoScroll = true;
            this.exeCallLater(this.changeSize);
         }
      }
      
      override public function dispose() : void
      {
         rollMed.dispose();
         rollMed = null;
         super.dispose();
      }
   }
}
