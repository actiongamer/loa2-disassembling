package nslm2.modules.footstones.linkModules
{
   import morn.customs.components.TopModuleView;
   import flash.utils.Dictionary;
   import flash.events.TextEvent;
   import nslm2.modules.footstones.textLinks.handlers.LinkHandlerBase;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.textLinks.handlers.PlayerLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.StcHeroLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.StcItemLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.ItemLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.StcHorseLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.OpenPopModuleOverLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.FangChenMiLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.TeamGuajiInviteHandler;
   import nslm2.modules.footstones.textLinks.handlers.GuildInviteLinkHanlder;
   import nslm2.modules.footstones.textLinks.handlers.WealthVoLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.BattlefieldInviteLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.TreasureLinkHandler;
   import nslm2.modules.footstones.textLinks.handlers.HeroShardDonateLinkHandler;
   
   public class LinkModule extends TopModuleView
   {
       
      
      private var handlerDict:Dictionary;
      
      public function LinkModule()
      {
         handlerDict = new Dictionary();
         super();
         UIMgr.stage.addEventListener("link",textLinkHandler);
         this.regLinkHandler(new LinkConfigVo(1,PlayerLinkHandler));
         this.regLinkHandler(new LinkConfigVo(2,StcHeroLinkHandler));
         this.regLinkHandler(new LinkConfigVo(4,StcItemLinkHandler));
         this.regLinkHandler(new LinkConfigVo(3,ItemLinkHandler));
         this.regLinkHandler(new LinkConfigVo(5,StcHorseLinkHandler));
         this.regLinkHandler(new LinkConfigVo(531,OpenPopModuleOverLinkHandler));
         this.regLinkHandler(new LinkConfigVo(11,FangChenMiLinkHandler));
         this.regLinkHandler(new LinkConfigVo(7,TeamGuajiInviteHandler));
         this.regLinkHandler(new LinkConfigVo(8,GuildInviteLinkHanlder));
         this.regLinkHandler(new LinkConfigVo(9,WealthVoLinkHandler));
         this.regLinkHandler(new LinkConfigVo(10,BattlefieldInviteLinkHandler));
         this.regLinkHandler(new LinkConfigVo(99,TreasureLinkHandler));
         this.regLinkHandler(new LinkConfigVo(1000,HeroShardDonateLinkHandler));
      }
      
      private function textLinkHandler(param1:TextEvent) : void
      {
         this.parse(param1.text);
      }
      
      private function parse(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1)
         {
            _loc4_ = param1.split("|");
            _loc5_ = _loc4_.shift();
            if(int(_loc5_) != 0)
            {
               if(handlerDict[_loc5_] != undefined)
               {
                  _loc2_ = handlerDict[_loc5_];
                  _loc3_ = new _loc2_.handlerClass();
                  _loc3_.init(_loc4_);
                  _loc3_.exec();
               }
               else
               {
                  Log.warn(this,"evtKind为[" + _loc5_ + "]的处理器没有注册！");
               }
            }
         }
      }
      
      public function regLinkHandler(param1:LinkConfigVo) : void
      {
         if(handlerDict[param1.kind] == undefined)
         {
            handlerDict[param1.kind] = param1;
         }
         else
         {
            Log.warn(this,param1.kind,"处理器已经注册过了");
         }
      }
   }
}
