package nslm2.modules.foundations.chatModules.chatSendBoxes
{
   import game.ui.chatModules.chatSendBoxes.ChatSendBoxUI;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import nslm2.common.ui.components.comps2d.BtnPopBind;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.geom.Point;
   import com.mz.core.mgrs.UIMgr;
   import flash.text.TextField;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.chatModules.ChatModel;
   
   public class ChatSendBox extends ChatSendBoxUI
   {
      
      public static const EVT_SEND_TEXT:String = "evtSendText";
       
      
      public var sendText:nslm2.modules.foundations.chatModules.chatSendBoxes.ChatSendTxt;
      
      private var textPromptBind:TextPromptBind;
      
      private var btn_faceBind:BtnPopBind;
      
      public function ChatSendBox()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         sendText = new nslm2.modules.foundations.chatModules.chatSendBoxes.ChatSendTxt(ChatModel.ins.chat_inputCharMax);
         sendText.setSize(this.placeTxtSend.width,this.placeTxtSend.height + 2);
         placeTxtSend.replaceWithDisplay(sendText);
         sendText.y = sendText.y - 2;
         this.sendText.addEventListener("enter",onSendText);
         this.txt_sendPrompt.text = LocaleMgr.ins.getStr(10500000);
         if(ClientConfig.isChineseLang() == false)
         {
            this.txt_sendPrompt.text = LocaleMgr.ins.getStr(10500005);
         }
         textPromptBind = new TextPromptBind(this.sendText.textfield,this.txt_sendPrompt);
         this.btn_faceBind = new BtnPopBind(this.btn_face,this.faceSelectPanel);
         this.faceSelectPanel.addEventListener("face_click_event",this.face_selectHandler);
         this.faceSelectPanel.visible = false;
      }
      
      public function get faceSelectPanel() : ChatFaceSelectPanel
      {
         return faceSelectPanelUI as ChatFaceSelectPanel;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_face !== _loc3_)
         {
            if(this.btn_send === _loc3_)
            {
               onSendText();
            }
         }
         else
         {
            this.btn_faceBind.switchPop();
         }
      }
      
      private function onSendText(... rest) : void
      {
         this.dispatchEvent(new Event("evtSendText"));
      }
      
      public function clear() : void
      {
         this.sendText.clear();
      }
      
      override public function dispose() : void
      {
         if(btn_faceBind)
         {
            btn_faceBind.dispose();
            btn_faceBind = null;
         }
         textPromptBind.dispose();
         super.dispose();
      }
      
      private function face_selectHandler(param1:Event) : void
      {
         var _loc2_:* = 0;
         if(sendText.numSprites < 5)
         {
            _loc2_ = uint((param1.target as ChatFaceSelectPanel).currentFaceId);
            sendText.insertSprite(ReflectUtil.createDisplayObjectSmart("png.ui_ChannelChat_Face" + _loc2_),sendText.textfield.caretIndex);
         }
         else if(ClientConfig.isRuLang())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000197),ModuleMgr.ins.toGlobalPoi(this).add(new Point(this.width / 2 + 200,-50)));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000197),ModuleMgr.ins.toGlobalPoi(this).add(new Point(this.width / 2)));
         }
         UIMgr.stage.focus = sendText.textfield;
         if(sendText.isSpriteAt(sendText.caretIndex))
         {
            sendText.caretIndex++;
         }
         sendText.dispatchEvent(new MouseEvent("click"));
      }
      
      public function getContent() : String
      {
         return this.sendText.getContent();
      }
      
      public function focus() : void
      {
         if(UIMgr.stage.focus is TextField == false)
         {
            UIMgr.stage.focus = this.sendText.textfield;
         }
      }
   }
}
