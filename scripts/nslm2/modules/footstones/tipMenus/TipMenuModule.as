package nslm2.modules.footstones.tipMenus
{
   import game.ui.tipMenus.TipMenuModuleUI;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import flash.events.MouseEvent;
   
   public class TipMenuModule extends TipMenuModuleUI
   {
      
      public static const BORDER:int = 10;
       
      
      public var currentMsg:nslm2.modules.footstones.tipMenus.TipMenuMsg;
      
      private var isFromClick:Boolean = false;
      
      public function TipMenuModule()
      {
         super();
         this.visible = false;
         this.list.changeHandler = list_handler;
         this.list.useMouseDown = false;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["MSG_TIP_MENU_SHOW","MSG_TIP_MENU_CLICK","MSG_TIP_MENU_CLOSE"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_TIP_MENU_CLICK" !== _loc4_)
         {
            if("MSG_TIP_MENU_SHOW" !== _loc4_)
            {
               if("MSG_TIP_MENU_CLOSE" === _loc4_)
               {
                  hide();
               }
            }
            addr114:
            return;
         }
         isFromClick = true;
         currentMsg = param2;
         _loc3_ = TipMenuConsts.ins.getMenuArr(currentMsg.kind,currentMsg.data);
         if(_loc3_ && _loc3_.length > 0)
         {
            this.list.repeatY = _loc3_.length;
            this.list.array = _loc3_;
            this.list.selectedIndex = -1;
            this.img_bg.height = this.list.height + this.list.y * 2;
            this.height = this.img_bg.height;
            this.commitMeasure();
            validatePos();
            TweenLite.killTweensOf(this);
            this.visible = true;
            this.alpha = 1;
            this.fadeIn();
            TweenLite.killDelayedCallsTo(this.addStageHandler);
            UIMgr.stage.removeEventListener("click",stageClickHdr);
            TweenLite.delayedCall(1,addStageHandler,null,true);
         }
         §§goto(addr114);
      }
      
      private function validatePos() : void
      {
         var _loc1_:int = UIMgr.root.mouseX + 4;
         var _loc2_:int = UIMgr.root.mouseY + 4;
         if(_loc1_ < 10)
         {
            _loc1_ = 10;
         }
         else if(_loc1_ > UIMgr.gameWidth - (width + 4) - 10)
         {
            _loc1_ = UIMgr.root.mouseX - (width + 4);
         }
         if(_loc2_ < 10)
         {
            _loc2_ = 10;
         }
         else if(_loc2_ > UIMgr.gameHeight - height - 10)
         {
            _loc2_ = UIMgr.gameHeight - height - 10;
         }
         this.x = _loc1_;
         this.y = _loc2_;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(10210,this);
      }
      
      private function list_handler(param1:int) : void
      {
         var _loc2_:TipMenuConfigVo = this.list.getItem(param1) as TipMenuConfigVo;
         var _loc3_:TipMenuHandlerBase = new _loc2_.handlerClass();
         _loc3_.init(_loc2_,this.currentMsg.data,this.list.getCell(param1) as TipMenuRender);
         _loc3_.addHandlers(currentMsg.handlerExec,currentMsg.handlerCpl);
         _loc3_.exec();
         hide();
      }
      
      private function addStageHandler() : void
      {
         UIMgr.stage.removeEventListener("click",stageClickHdr);
         UIMgr.stage.addEventListener("click",stageClickHdr);
      }
      
      public function stageClickHdr(param1:MouseEvent = null) : void
      {
         if(NGUtil.isOverWait())
         {
            return;
         }
         if(NGUtil.isCurFuncId(10210))
         {
            return;
         }
         if(isFromClick == true)
         {
            isFromClick = false;
            return;
         }
         this.hide();
      }
      
      private function hide() : void
      {
         UIMgr.stage.removeEventListener("click",stageClickHdr);
         TweenLite.killDelayedCallsTo(this.addStageHandler);
         this.fadeOut();
         TweenLite.to(this,0.2,{
            "x":this.x + 20,
            "alpha":0,
            "onComplete":this.panelFadeOutCpl
         });
      }
      
      private function panelFadeOutCpl() : void
      {
         this.visible = false;
      }
   }
}
