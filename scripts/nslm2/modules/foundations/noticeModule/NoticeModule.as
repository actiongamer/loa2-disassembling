package nslm2.modules.foundations.noticeModule
{
   import game.ui.noticeModules.NoticeModuleViewUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.noticeModule.model.NoticeModel;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.geom.Rectangle;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.noticeModule.view.NoticeSubView;
   import nslm2.modules.foundations.noticeModule.view.NotifySubView;
   
   public class NoticeModule extends NoticeModuleViewUI
   {
      
      public static const BTN_EXPAND_Y:int = 636;
      
      public static const BTN_MINI_Y:int = 622;
      
      public static const DISPLAY_TIME:int = 6;
       
      
      public var MINIMAL_Y:int = -568;
      
      public var HIDE_Y:int = -620;
      
      public var EXPAND_Y:int = -40;
      
      private var isMinimal:Boolean = true;
      
      private var isHide:Boolean = true;
      
      private var isHideContent:Boolean = false;
      
      private var subViewStack:ViewStack;
      
      private var model:NoticeModel;
      
      public function NoticeModule()
      {
         model = NoticeModel.ins;
         super();
         this.parts.push(new BtnLongBarCtrl(btn_up,img_btnBar));
         btn_up.clickHandler = btnClickHander;
         btn_up.y = 636;
         btn_up.scaleY = -1;
         this.centerX = 0;
         y = MINIMAL_Y;
         subViewStack = new ViewStack();
         subViewStack.x = 22;
         subViewStack.y = 204;
         DisplayUtils.addChildBelow(subViewStack,miniNoticeBar);
         subViewStack.subViewClasses = [NoticeSubView,NotifySubView];
         tabBar.selectHandler = tabBarSelectHandler;
         miniNoticeBar.txt_content.text = "";
         if(model.noticeArr.length || uint(model.noticeArr.length))
         {
            if(isHide)
            {
               show();
            }
         }
         else
         {
            hide();
         }
         btn_close.clickHandler = hideContent;
      }
      
      private function hideMe() : void
      {
         minimal();
      }
      
      private function tabBarSelectHandler(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
      }
      
      private function btnClickHander() : void
      {
         if(!isHideContent && !isMinimal)
         {
            hideContent();
         }
         else
         {
            expand();
         }
      }
      
      private function expand() : void
      {
         isMinimal = false;
         isHideContent = false;
         miniNoticeBar.visible = false;
         btn_up.y = 622;
         btn_up.scaleY = 1;
         subViewStack.visible = true;
         ObserverMgr.ins.sendNotice("notice_show_new_notice");
         TweenLite.to(this,0.3,{
            "y":EXPAND_Y,
            "ease":Back.easeOut
         });
         TweenLite.killDelayedCallsTo(hideContent);
      }
      
      private function minimal() : void
      {
         subViewStack.visible = false;
         isMinimal = true;
         miniNoticeBar.visible = true;
         btn_up.y = 636;
         btn_up.scaleY = -1;
         TweenLite.to(this,0.3,{
            "y":MINIMAL_Y,
            "ease":Back.easeInOut
         });
         TweenLite.delayedCall(6,hideContent);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["notice_show_new_notice","notice_show_new_notify"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("notice_show_new_notice" !== _loc4_)
         {
            if("notice_show_new_notify" !== _loc4_)
            {
               if("MSG_POP_MODULE_HOLE" === _loc4_)
               {
                  _loc3_ = param2 as Rectangle;
                  if(_loc3_)
                  {
                     if(this.parent)
                     {
                        this.setVisibleList("STATIC_MODULE_FOR_HOLE_3D",false);
                     }
                  }
                  else
                  {
                     this.setVisibleList("STATIC_MODULE_FOR_HOLE_3D",true);
                  }
               }
            }
            else
            {
               showNewNotify();
            }
         }
         else
         {
            showNewNotice();
         }
      }
      
      private function showNewNotice() : void
      {
         var _loc1_:* = null;
         if(isHide || isHideContent)
         {
            show();
         }
         if(isMinimal)
         {
            miniNoticeBar.txt_type.text = LocaleMgr.ins.getStr(999000326);
            if(model.getLastNotice())
            {
               _loc1_ = model.getLastNotice().content;
               miniNoticeBar.txt_content.text = _loc1_;
            }
            tabBar.selectedIndex = 0;
         }
      }
      
      private function show() : void
      {
         isHide = false;
         isHideContent = false;
         minimal();
      }
      
      private function hide() : void
      {
         isHide = true;
         this.y = -this.height;
      }
      
      private function hideContent() : void
      {
         isHideContent = true;
         miniNoticeBar.visible = false;
         btn_up.y = 636;
         btn_up.scaleY = -1;
         TweenLite.to(this,0.3,{"y":HIDE_Y});
      }
      
      private function showNewNotify() : void
      {
         if(isHide || isHideContent)
         {
            show();
         }
         if(isMinimal)
         {
            tabBar.selectedIndex = 1;
            miniNoticeBar.txt_type.text = LocaleMgr.ins.getStr(999000327);
            miniNoticeBar.txt_content.text = model.getLastNotify().content;
         }
      }
   }
}
