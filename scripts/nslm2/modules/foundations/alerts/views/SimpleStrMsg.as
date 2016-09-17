package nslm2.modules.foundations.alerts.views
{
   import morn.customs.components.FadeView;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import morn.core.components.Image;
   import morn.core.components.Component;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Label;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.geom.Point;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.display.BitmapData;
   
   public class SimpleStrMsg extends FadeView implements IObserver
   {
       
      
      private var isFloatEnd:Boolean;
      
      public var float_type:String;
      
      public var vo:AlertMsgVo;
      
      public var bg:Image;
      
      public var ui:Component;
      
      public var initX:int;
      
      public var isEnd:Boolean = false;
      
      public var lastMsg:nslm2.modules.foundations.alerts.views.SimpleStrMsg;
      
      private var tempBm:Bitmap;
      
      public function SimpleStrMsg(param1:AlertMsgVo)
      {
         ui = new Component();
         super();
         vo = param1;
         if(vo.content is BitmapData)
         {
            tempBm = new Bitmap(vo.content as BitmapData);
            createUIByDis(tempBm);
         }
         else if(vo.content is DisplayObject)
         {
            createUIByDis(vo.content as DisplayObject);
         }
         else
         {
            createUIByString(String(vo.content));
         }
         initX = ui.x;
         this.height = this.height;
         ObserverMgr.ins.regObserver(this);
      }
      
      private function createUIByDis(param1:DisplayObject) : void
      {
         ui.addChild(param1);
         param1.y = 2;
         this.addChild(ui);
         ui.width = ui.width;
         ui.height = ui.height + 2;
         createBg();
      }
      
      private function createUIByString(param1:String) : void
      {
         param1 = TextFieldUtil.removeUnderline(param1);
         var _loc2_:Label = new Label();
         _loc2_.isHtml = true;
         _loc2_.autoSize = "left";
         _loc2_.font = "Microsoft YaHei,微软雅黑";
         _loc2_.size = 24;
         _loc2_.color = 16046112;
         _loc2_.labelFilterKind = "黑色1像素描边";
         _loc2_.text = param1;
         createUIByDis(_loc2_);
      }
      
      private function createBg() : void
      {
         if(!vo.useBg)
         {
         }
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         ui.alpha = 0;
         this.alpha = 1;
         TweenLite.to(ui,0.3,{
            "alpha":1,
            "overwrite":0
         });
         TweenLite.to(ui,0.2,{
            "scaleY":1.3,
            "scaleY":1.3,
            "x":initX - ui.width * 0.15,
            "ease":Cubic.easeOut,
            "overwrite":0
         });
         TweenLite.to(ui,0.3,{
            "delay":0.2,
            "scaleY":1,
            "scaleY":1,
            "x":initX,
            "ease":Cubic.easeOut,
            "overwrite":0
         });
         TweenLite.delayedCall(1.2,this.float1cpl);
      }
      
      private function float1cpl() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(this.isDisposed)
         {
            return;
         }
         if(this.isFloatEnd)
         {
            this.dispose();
            return;
         }
         if(vo.toGlobalPoi)
         {
            _loc1_ = this.parent.globalToLocal(vo.toGlobalPoi);
            TweenLite.to(this,0.5,{
               "x":_loc1_.x,
               "y":_loc1_.y,
               "scaleX":0.1,
               "scaleY":0.1,
               "ease":Cubic.easeOut,
               "overwrite":0,
               "onStart":this.toGloStart,
               "onComplete":float2cpl
            });
         }
         else
         {
            _loc2_ = vo.floatChangeY == -1?-50:vo.floatChangeY;
            TweenLite.to(ui,1,{
               "y":ui.y + _loc2_,
               "alpha":0,
               "ease":Cubic.easeOut,
               "overwrite":0,
               "onComplete":this.dispose
            });
         }
      }
      
      private function float2cpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(this.isFloatEnd)
         {
            this.dispose();
            return;
         }
         this.toGloCpl();
      }
      
      public function toUp(param1:int) : void
      {
         TweenLite.to(this,0.1,{
            "y":param1 - this.height,
            "overwrite":0
         });
         if(this.lastMsg && lastMsg.isEnd == false && lastMsg.isDisposed == false)
         {
            this.lastMsg.toUp(param1 - this.height);
         }
      }
      
      private function fadeIn2() : void
      {
      }
      
      override public function fadeView_fadeInCpl() : void
      {
      }
      
      override public function fadeOut() : void
      {
      }
      
      public function toGloStart() : void
      {
         isEnd = true;
      }
      
      public function toGloCpl() : void
      {
         if(this.vo.handler != null)
         {
            Handler.execute(this.vo.handler);
         }
         this.dispose();
      }
      
      override public function dispose() : void
      {
         isEnd = true;
         if(tempBm)
         {
            DisplayUtils.removeSelf(tempBm);
            tempBm.bitmapData.dispose();
            tempBm.bitmapData = null;
            tempBm = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["SIMPLE_STR_MSG_FLOAT_MSG_STOP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("SIMPLE_STR_MSG_FLOAT_MSG_STOP" === _loc3_)
         {
            this.isFloatEnd = true;
         }
      }
   }
}
