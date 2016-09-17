package nslm2.modules.foundations.chatModules.historyPanels.historyS1
{
   import game.ui.chatModules.ChatHistoryPanelS1UI;
   import com.mz.core.mediators.RollMediator;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import morn.core.components.ScrollBar;
   
   public class ChatHistoryPanelS1 extends ChatHistoryPanelS1UI
   {
       
      
      public var contentBox:nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatHistoryTxtS1;
      
      private var rollMed:RollMediator;
      
      public var boxScrollBarCtrl:nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatScrollBarS1;
      
      private var count:int;
      
      private var _actived:Boolean = false;
      
      public function ChatHistoryPanelS1()
      {
         super();
         contentBox = new nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatHistoryTxtS1();
         contentBox.setSize(this.placeHistory.width,this.placeHistory.height);
         this.placeHistory.replaceWithDisplay(this.contentBox);
         boxScrollBarCtrl = new nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatScrollBarS1(this.contentBox,this.boxScrollBar);
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
      
      public function append(param1:PublicTalkNotify) : void
      {
         count = Number(count) + 1;
         if(param1.parseResultVoMsg == null)
         {
            param1.parseResultVoMsg = ChatUtils.processMsg(param1);
         }
         var _loc2_:ChatParseResultVo = param1.parseResultVoMsg;
         contentBox.res = param1;
         if(param1.pindao != 44)
         {
            contentBox.append(_loc2_.msg,_loc2_.faceArr,false,null,true);
         }
         else
         {
            contentBox.append(_loc2_.msg,_loc2_.faceArr,false,null);
         }
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
         super.dispose();
      }
   }
}
