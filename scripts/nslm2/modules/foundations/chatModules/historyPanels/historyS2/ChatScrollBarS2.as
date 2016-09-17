package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import game.ui.chatModules.ChatScrollBarUI;
   import morn.core.components.ScrollBar;
   import morn.core.components.Slider;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import morn.customs.expands.MornExpandUtil;
   
   public class ChatScrollBarS2 extends EventDispatcher implements IDispose
   {
      
      public static const SCROLL_BAR_CHANGE:String = "scrollBarChange";
       
      
      public var target:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryContentS2;
      
      public var scallBar:ChatScrollBarUI;
      
      private var _autoScroll:Boolean = true;
      
      private var _actived:Boolean = false;
      
      public function ChatScrollBarS2(param1:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryContentS2, param2:ChatScrollBarUI)
      {
         super();
         this.target = param1;
         this.scallBar = param2;
         scallBar.txt_vscrollBar.autoHide = false;
         MornExpandUtil.addHandlerForBtnAll(scallBar,btn_handler);
         _vScrollBar.addEventListener("change",onScrollBarChange);
         target.addEventListener("contentChange",onTextFieldScroll);
         scallBar.txt_vscrollBar.target = target;
         this.changeScroll();
      }
      
      private function get _vScrollBar() : ScrollBar
      {
         return scallBar.txt_vscrollBar;
      }
      
      public function get slider() : Slider
      {
         return scallBar.txt_vscrollBar.slider;
      }
      
      public function get autoScroll() : Boolean
      {
         return _autoScroll;
      }
      
      public function set autoScroll(param1:Boolean) : void
      {
         if(_autoScroll != param1)
         {
            _autoScroll = param1;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      protected function onTextFieldScroll(param1:Event) : void
      {
         changeScroll(this.autoScroll);
         scallBar.sendEvent("scroll");
      }
      
      public function get actived() : Boolean
      {
         return _actived;
      }
      
      public function set actived(param1:Boolean) : void
      {
         _actived = param1;
         validateVisible();
      }
      
      private function validateVisible() : void
      {
         scallBar.visible = _actived && target.needScrollBar;
      }
      
      private function changeScroll(param1:Boolean = false) : void
      {
         validateVisible();
         if(target.needScrollBar)
         {
            _vScrollBar.scrollSize = 10;
            _vScrollBar.setScroll(0,target.maxScrollV,!!param1?target.maxScrollV:int(target.scrollV));
         }
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         if(target.scrollV != _vScrollBar.value)
         {
            target.scrollV = _vScrollBar.value;
            this.autoScroll = target.scrollV == target.maxScrollV;
            this.dispatchEvent(new Event("scrollBarChange"));
         }
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(this.scallBar);
         scallBar.dispose();
      }
   }
}
