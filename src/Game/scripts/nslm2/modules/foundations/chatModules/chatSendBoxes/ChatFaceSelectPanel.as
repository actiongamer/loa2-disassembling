package nslm2.modules.foundations.chatModules.chatSendBoxes
{
   import game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI;
   import morn.core.components.Component;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import flash.display.MovieClip;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class ChatFaceSelectPanel extends ChatFaceSelectPanelUI
   {
      
      public static const FACE_CLICK_EVENT:String = "face_click_event";
       
      
      public var currentFaceId:uint = 0;
      
      private var selectSp:Component;
      
      private var gapSize:int = 27;
      
      private var tempRow:uint = 0;
      
      private var tempLine:uint = 0;
      
      public function ChatFaceSelectPanel()
      {
         super();
         this.placeFaceSelectPanel.visible = false;
         initUI();
      }
      
      private function initUI() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc2_:uint = placeFaceSelectPanel.x;
         var _loc3_:uint = placeFaceSelectPanel.y;
         var _loc1_:uint = gapSize;
         _loc5_ = uint(0);
         while(_loc5_ < 53)
         {
            _loc4_ = ReflectUtil.createDisplayObjectSmart("png.ui_ChannelChat_Face" + (1 + _loc5_)) as MovieClip;
            this.addChild(_loc4_);
            _loc4_.x = _loc2_ + _loc1_ * (_loc5_ % 8) + (gapSize / 2 - _loc4_.width / 2);
            _loc4_.y = _loc3_ + _loc1_ * (int(_loc5_ / 8)) + (gapSize / 2 - _loc4_.height / 2);
            _loc5_++;
         }
         createGridBg();
         this.selectSp = new Component();
         selectSp.graphics.lineStyle(0,13341521);
         selectSp.graphics.drawRect(0,0,gapSize,gapSize);
         selectSp.graphics.endFill();
         this.addChild(selectSp);
         selectSp.visible = false;
         initListener();
      }
      
      private function createGridBg() : void
      {
         tempLine = 8;
         tempRow = 7;
         this.graphics.lineStyle(1,13341521,0.5);
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ <= tempLine)
         {
            this.graphics.moveTo(_loc1_ * gapSize + this.placeFaceSelectPanel.x,this.placeFaceSelectPanel.y);
            this.graphics.lineTo(_loc1_ * gapSize + this.placeFaceSelectPanel.x,gapSize * 7 + this.placeFaceSelectPanel.y);
            this.graphics.endFill();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ <= tempRow)
         {
            this.graphics.moveTo(this.placeFaceSelectPanel.x,_loc1_ * gapSize + this.placeFaceSelectPanel.y);
            this.graphics.lineTo(gapSize * 8 + this.placeFaceSelectPanel.x,_loc1_ * gapSize + this.placeFaceSelectPanel.y);
            this.graphics.endFill();
            _loc1_++;
         }
         this.graphics.endFill();
      }
      
      public function initListener() : void
      {
         TweenLite.delayedCall(1,function():void
         {
         });
         this.addEventListener("mouseMove",selectMoveHdr);
         this.addEventListener("click",selectFaceClickHdr);
      }
      
      private function selectFaceClickHdr(param1:MouseEvent) : void
      {
         this.currentFaceId = tempLine + 1 + 8 * tempRow;
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         dispatchEvent(new Event("face_click_event"));
         this.closeClickHandler(null);
      }
      
      private function selectMoveHdr(param1:MouseEvent) : void
      {
         tempLine = int((this.mouseX - this.placeFaceSelectPanel.x) / gapSize) > 7?7:int((this.mouseX - this.placeFaceSelectPanel.x) / gapSize);
         tempRow = int((this.mouseY - this.placeFaceSelectPanel.y) / gapSize) > 6?6:int((this.mouseY - this.placeFaceSelectPanel.y) / gapSize);
         if(tempRow == 6)
         {
            tempLine = int((this.mouseX - this.placeFaceSelectPanel.x) / gapSize) > 4?4:int((this.mouseX - this.placeFaceSelectPanel.x) / gapSize);
         }
         this.selectSp.visible = true;
         this.selectSp.x = this.placeFaceSelectPanel.x + tempLine * gapSize;
         this.selectSp.y = this.placeFaceSelectPanel.y + tempRow * gapSize;
      }
      
      public function removeEventListenerHdr() : void
      {
         this.removeEventListener("mouseMove",selectMoveHdr);
         this.removeEventListener("click",selectFaceClickHdr);
      }
      
      private function closeClickHandler(param1:MouseEvent) : void
      {
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         removeEventListenerHdr();
         super.dispose();
      }
   }
}
