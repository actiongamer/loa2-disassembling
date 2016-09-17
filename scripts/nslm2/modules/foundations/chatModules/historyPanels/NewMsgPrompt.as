package nslm2.modules.foundations.chatModules.historyPanels
{
   import morn.core.components.Component;
   import com.riaidea.text.RichTextField;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import morn.customs.FilterLib;
   
   public class NewMsgPrompt extends Component
   {
       
      
      private var rtf:RichTextField;
      
      public var scrollV:int;
      
      public function NewMsgPrompt(param1:int, param2:int)
      {
         rtf = new RichTextField();
         super();
         var _loc3_:TextFormat = new TextFormat(Styles.fontName,12,16777215);
         _loc3_.leading = 6;
         rtf.textfield.multiline = true;
         rtf.textfield.wordWrap = true;
         rtf.textfield.selectable = false;
         rtf.autoScroll = false;
         rtf.html = true;
         rtf.type = "dynamic";
         rtf.defaultTextFormat = _loc3_;
         rtf.textfield.filters = [FilterLib.BORDER_BLACK];
         rtf.setSize(param1,param2);
         var _loc4_:Boolean = false;
         rtf.mouseEnabled = _loc4_;
         rtf.mouseChildren = _loc4_;
         this.addChild(rtf);
         rtf.x = 4;
         rtf.y = 3;
         this.buttonMode = true;
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         rtf.clear();
         rtf = null;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function show(param1:PublicTalkNotify, param2:int) : void
      {
         this.visible = true;
         rtf.clear();
         if(param1.parseResultVoMsg == null)
         {
            param1.parseResultVoMsg = ChatUtils.processMsg(param1);
         }
         var _loc3_:ChatParseResultVo = param1.parseResultVoMsg;
         rtf.append(_loc3_.msg,_loc3_.faceArr);
         this.scrollV = param2;
      }
   }
}
