package nslm2.modules.foundations.chatModules.chatSendBoxes
{
   import com.riaidea.text.RichTextField;
   import com.mz.core.interFace.IDispose;
   import flash.events.KeyboardEvent;
   import com.mz.core.event.MzEvent;
   import org.specter3d.utils.StringUtil;
   import nslm2.utils.CheckFilterWords;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import morn.customs.FilterLib;
   
   public class ChatSendTxt extends RichTextField implements IDispose
   {
       
      
      private var isKeyEnterDown:Boolean;
      
      public function ChatSendTxt(param1:int, param2:Boolean = false)
      {
         super();
         var _loc3_:TextFormat = new TextFormat(Styles.fontName,12,16777215);
         _loc3_.leading = 6;
         this.lineHeight = 15;
         this.textfield.maxChars = param1;
         this.textfield.multiline = param2;
         this.textfield.wordWrap = param2;
         this.autoScroll = true;
         this.html = true;
         this.type = "input";
         this.defaultTextFormat = _loc3_;
         this.textfield.filters = [FilterLib.BORDER_BLACK];
         textfield.addEventListener("keyDown",onTextFieldKeyDown);
         textfield.addEventListener("keyUp",onTextFieldKeyUp);
      }
      
      private function onTextFieldKeyDown(param1:KeyboardEvent) : void
      {
         if(isKeyEnterDown == false)
         {
            if(param1.keyCode == 13)
            {
               dispatchEvent(new MzEvent("enter"));
               isKeyEnterDown = true;
            }
         }
      }
      
      private function onTextFieldKeyUp(param1:KeyboardEvent) : void
      {
         isKeyEnterDown = false;
      }
      
      public function dispose() : void
      {
         this.clear();
         textfield.removeEventListener("keyDown",onTextFieldKeyDown);
         textfield.removeEventListener("keyUp",onTextFieldKeyUp);
      }
      
      public function getContent() : String
      {
         var _loc1_:String = StringUtil.replaceAll1(this.text,"<","*");
         if(_loc1_.indexOf("//") == -1)
         {
            _loc1_ = CheckFilterWords.ins.filterWord_bak(_loc1_);
         }
         return _loc1_ + "^#@" + ChatUtils.faceToStr(this.getSpriteArray());
      }
   }
}
