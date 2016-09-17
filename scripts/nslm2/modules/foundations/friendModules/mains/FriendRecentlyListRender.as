package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendRecentlyListRenderUI;
   import com.riaidea.text.RichTextField;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatParseResultVo;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.common.uiEffects.RollTweenSelectBoxMed;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import morn.customs.FilterLib;
   
   public class FriendRecentlyListRender extends FriendRecentlyListRenderUI
   {
       
      
      private var rtf:RichTextField;
      
      public function FriendRecentlyListRender()
      {
         rtf = new RichTextField();
         super();
         this.parts.push(new RollTweenSelectBoxMed(this,this.render_player.img_roll));
         this.addEventListener("click",this_onClick);
         this.doubleClickEnabled = true;
         this.addEventListener("doubleClick",this_onDbClick);
         var _loc1_:TextFormat = new TextFormat(Styles.fontName,12,16777215);
         _loc1_.leading = 6;
         rtf.textfield.multiline = true;
         rtf.textfield.wordWrap = true;
         rtf.textfield.selectable = false;
         rtf.autoScroll = false;
         rtf.html = true;
         rtf.type = "dynamic";
         rtf.defaultTextFormat = _loc1_;
         rtf.textfield.filters = [FilterLib.BORDER_BLACK];
         rtf.setSize(this.txt_chat.width,this.txt_chat.height);
         var _loc2_:Boolean = false;
         rtf.mouseEnabled = _loc2_;
         rtf.mouseChildren = _loc2_;
         rtf.x = this.txt_chat.x;
         rtf.y = this.txt_chat.y;
         this.addChild(rtf);
         txt_chat.dispose();
         txt_chat = null;
      }
      
      public function get render_player() : FriendRecenltyListRender_Player
      {
         return this.render_playerUI as FriendRecenltyListRender_Player;
      }
      
      protected function this_onDbClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLOSE");
         ModuleMgr.ins.showModule(10540,this.chatVo.playerId,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public function get chatVo() : PrivChatHistoryVo
      {
         return this.dataSource as PrivChatHistoryVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         rtf.clear();
         if(chatVo)
         {
            this.render_player.gameFriendData = chatVo.friendData;
            _loc4_ = chatVo.recentlyFriendChat;
            if(_loc4_)
            {
               _loc3_ = _loc4_.content.content;
               if(_loc3_)
               {
                  _loc5_ = _loc4_;
                  if(_loc5_.parseResultVoContent == null)
                  {
                     _loc5_.parseResultVoContent = ChatUtils.processContent(_loc5_);
                  }
                  _loc2_ = _loc5_.parseResultVoContent;
                  rtf.append(_loc2_.msg,_loc2_.faceArr);
               }
            }
         }
      }
      
      private function this_onClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,this.render_player.playerVo));
      }
   }
}
