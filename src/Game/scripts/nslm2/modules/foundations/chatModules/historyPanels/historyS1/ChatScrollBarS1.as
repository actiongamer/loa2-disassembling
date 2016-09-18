package nslm2.modules.foundations.chatModules.historyPanels.historyS1
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import com.riaidea.text.RichTextField;
   import game.ui.chatModules.ChatScrollBarUI;
   import morn.core.components.ScrollBar;
   import flash.text.TextField;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import morn.customs.expands.MornExpandUtil;
   
   public class ChatScrollBarS1 extends EventDispatcher implements IDispose
   {
      
      public static const SCROLL_BAR_CHANGE:String = "scrollBarChange";
       
      
      public var target:RichTextField;
      
      public var scallBar:ChatScrollBarUI;
      
      private var _actived:Boolean = false;
      
      public function ChatScrollBarS1(param1:RichTextField, param2:ChatScrollBarUI)
      {
         super();
         this.target = param1;
         this.scallBar = param2;
         scallBar.txt_vscrollBar.autoHide = false;
         MornExpandUtil.addHandlerForBtnAll(scallBar,btn_handler);
         _vScrollBar.addEventListener("change",onScrollBarChange);
         _textField.addEventListener("scroll",onTextFieldScroll);
         scallBar.txt_vscrollBar.target = _textField;
         this.changeScroll();
      }
      
      private function get _vScrollBar() : ScrollBar
      {
         return scallBar.txt_vscrollBar;
      }
      
      private function get _textField() : TextField
      {
         return target.textfield;
      }
      
      public function get autoScroll() : Boolean
      {
         return this.target.autoScroll;
      }
      
      public function set autoScroll(param1:Boolean) : void
      {
         if(this.target.autoScroll != param1)
         {
            this.target.autoScroll = param1;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      protected function onTextFieldScroll(param1:Event) : void
      {
         changeScroll();
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
         if(param1)
         {
            this.autoScroll = true;
         }
      }
      
      private function validateVisible() : void
      {
         scallBar.visible = _actived && _vScrollBar && _textField.maxScrollV > 1;
      }
      
      private function changeScroll() : void
      {
         validateVisible();
         _vScrollBar.scrollSize = 1;
         _vScrollBar.setScroll(1,_textField.maxScrollV,_textField.scrollV);
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         if(_textField.scrollV != _vScrollBar.value)
         {
            _textField.removeEventListener("scroll",onTextFieldScroll);
            _textField.scrollV = _vScrollBar.value;
            _textField.addEventListener("scroll",onTextFieldScroll);
            this.autoScroll = _textField.scrollV == _textField.maxScrollV;
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
