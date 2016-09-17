package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import game.ui.chatModules.ChatHistoryPanelS2UI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mediators.RollMediator;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import morn.core.components.ScrollBar;
   import proto.PublicTalkNotify;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ChatHistoryPanelS2 extends ChatHistoryPanelS2UI implements IObserver
   {
      
      public static const CONTENT_CHANGE:String = "contentChange";
      
      public static const VGap:int = 8;
      
      public static const scrollTick:int = 10;
       
      
      private var rollMed:RollMediator;
      
      private var contentBox:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryContentS2;
      
      public var boxScrollBarCtrl:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatScrollBarS2;
      
      private var renderArr:Array;
      
      public var contentHeight:int;
      
      private var _actived:Boolean = false;
      
      public function ChatHistoryPanelS2()
      {
         renderArr = [];
         super();
         contentBox = new nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryContentS2(this.placeHistory.width);
         contentBox.x = placeHistory.x;
         contentBox.top = 20;
         contentBox.bottom = 6;
         this.placeHistory.replaceWithDisplay(contentBox);
         boxScrollBarCtrl = new nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatScrollBarS2(contentBox,this.boxScrollBar);
         ObserverMgr.ins.regObserver(this);
         this.changeHistorySize();
         rollMed = new RollMediator(this,boxScrollBar_onRoll);
         this.boxScrollBar.alpha = 0;
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
      
      private function changeHistorySize() : void
      {
         this.height = 450 - ChatConsts.chat_bottom - 24;
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_game_resize"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_game_resize" === _loc3_)
         {
            this.changeHistorySize();
            contentBox.dispatchContentChangeEvent();
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
         ObserverMgr.ins.unregObserver(this);
         rollMed.dispose();
         rollMed = null;
         super.dispose();
      }
   }
}
