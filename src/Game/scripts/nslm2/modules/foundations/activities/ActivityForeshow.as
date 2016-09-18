package nslm2.modules.foundations.activities
{
   import game.ui.activities.ActivityForeshowUI;
   import morn.core.components.Image;
   import flash.display.Sprite;
   import morn.core.components.RadioGroup;
   import flash.utils.Timer;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.mgrs.stcMgrs.vos.StcNewFunctionVo;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import morn.core.components.RadioButton;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.events.UIEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ActivityForeshow extends ActivityForeshowUI
   {
       
      
      private var curImage:Image;
      
      private var newImage:Image;
      
      private var mask:Sprite;
      
      private var stcNewFuncList:Array;
      
      private var curDisIndex:int = -1;
      
      private var nextDisIndex:int = -1;
      
      private var radioGroup:RadioGroup;
      
      private const IMG_WIDTH:int = 645;
      
      private const IMG_HEIGHT:int = 400;
      
      private var timer:Timer;
      
      private var isInTween:Boolean = false;
      
      private var isClickRadio:Boolean = false;
      
      public function ActivityForeshow()
      {
         stcNewFuncList = [];
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         this.btnLeft.addEventListener("click",onLeft);
         this.btnRight.addEventListener("click",onRight);
         this.addEventListener("rollOver",onMouseRoll);
         this.addEventListener("rollOut",onMouseRoll);
         btnLeft.alpha = 0;
         btnRight.alpha = 0;
         mask = new Sprite();
         mask.graphics.beginFill(0,1);
         mask.graphics.drawRect(0,0,645,400);
         mask.x = imgBox.x;
         mask.y = imgBox.y;
         imgBox.mask = mask;
         panelBg.addChildAt(imgBox,2);
         panelBg.addChildAt(mask,3);
         this.addEventListener("click",onImgClick);
         stcNewFuncList = ActivityModel.ins.getForeshowFuncList();
         initRadioBtn();
         _loc2_ = 0;
         while(_loc2_ < stcNewFuncList.length)
         {
            if((stcNewFuncList[_loc2_] as StcNewFunctionVo).function_id == ActivityModel.ins.initForeshowFuncId)
            {
               updateCurDisIndex(_loc2_,false);
               break;
            }
            _loc2_++;
         }
         if(curDisIndex == -1)
         {
            updateCurDisIndex(0,false);
         }
         timer = new Timer(7000);
         timer.addEventListener("timer",onTimer);
         timer.start();
         this.preShowCpl();
      }
      
      protected function onMouseRoll(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.type == "rollOver"?1:0;
         TweenLite.to(this.btnLeft,0.6,{
            "alpha":_loc2_,
            "ease":Cubic.easeOut
         });
         TweenLite.to(this.btnRight,0.6,{
            "alpha":_loc2_,
            "ease":Cubic.easeOut
         });
      }
      
      private function resetTimer() : void
      {
         timer.reset();
         timer.start();
      }
      
      protected function onTimer(param1:TimerEvent) : void
      {
         if(stcNewFuncList.length <= 1)
         {
            return;
         }
         if(curDisIndex < stcNewFuncList.length - 1)
         {
            updateCurDisIndex(curDisIndex + 1,false);
         }
         else
         {
            updateCurDisIndex(0,false);
         }
      }
      
      protected function onImgClick(param1:MouseEvent) : void
      {
         if(stcNewFuncList.length <= 1)
         {
            return;
         }
         var _loc2_:Rectangle = new Rectangle(imgBox.x,imgBox.y,645,400);
         var _loc3_:Point = new Point(this.mouseX,this.mouseY);
         if(_loc2_.containsPoint(_loc3_))
         {
            if(curDisIndex < stcNewFuncList.length - 1)
            {
               updateCurDisIndex(curDisIndex + 1,false);
            }
            else
            {
               updateCurDisIndex(0,false);
            }
            resetTimer();
         }
      }
      
      private function initRadioBtn() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(stcNewFuncList.length == 0)
         {
            return;
         }
         radioGroup = new RadioGroup();
         radioGroup.space = 10;
         radioGroup.initItems();
         _loc2_ = 0;
         while(_loc2_ < stcNewFuncList.length)
         {
            _loc1_ = new RadioButton();
            _loc1_.style = "Radio圆形";
            radioGroup.addItem(_loc1_);
            _loc2_++;
         }
         this.addChild(radioGroup);
         radioGroup.x = this.width / 2 - radioGroup.width / 2;
         radioGroup.y = rbBack.y + rbBack.height / 2 - radioGroup.height / 2;
         radioGroup.selectHandler = new Handler(onSelected);
      }
      
      private function updateCurDisIndex(param1:int, param2:Boolean) : void
      {
         this.isClickRadio = param2;
         if(isInTween)
         {
            return;
         }
         isInTween = true;
         nextDisIndex = param1;
         var _loc3_:StcNewFunctionVo = stcNewFuncList[param1] as StcNewFunctionVo;
         var _loc4_:String = UrlLib.activityForeshowImg(_loc3_.pic);
         newImage = new Image();
         newImage.addEventListener("imageLoaded",onImgLoaded);
         newImage.skin = _loc4_;
      }
      
      private function onImgLoaded(param1:UIEvent) : void
      {
         newImage.removeEventListener("imageLoaded",onImgLoaded);
         newImage.width = 645;
         newImage.height = 400;
         imgBox.addChildAt(newImage,0);
         if(curDisIndex == -1)
         {
            doEndTween();
         }
         else if(nextDisIndex > curDisIndex)
         {
            newImage.x = 645;
            TweenLite.to(newImage,0.5,{"x":0});
            TweenLite.to(curImage,0.5,{
               "x":-645,
               "onComplete":doEndTween
            });
         }
         else
         {
            newImage.x = -645;
            TweenLite.to(newImage,0.5,{"x":0});
            TweenLite.to(curImage,0.5,{
               "x":645,
               "onComplete":doEndTween
            });
         }
      }
      
      private function doEndTween() : void
      {
         curDisIndex = nextDisIndex;
         nextDisIndex = -1;
         var _loc1_:StcNewFunctionVo = stcNewFuncList[curDisIndex] as StcNewFunctionVo;
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_loc1_.title);
         this.txtDesc.text = LocaleMgr.ins.getStr(_loc1_.des);
         if(curImage && curImage.parent)
         {
            curImage.parent.removeChild(curImage);
         }
         curImage = newImage;
         newImage = null;
         this.btnLeft.disabled = curDisIndex == 0;
         this.btnRight.disabled = curDisIndex == stcNewFuncList.length - 1;
         if(radioGroup.selectedIndex != -1 && radioGroup.selectedIndex != curDisIndex && isClickRadio)
         {
            isInTween = false;
            updateCurDisIndex(radioGroup.selectedIndex,false);
         }
         else
         {
            isInTween = false;
            radioGroup.selectedIndex = curDisIndex;
            this.isClickRadio = false;
         }
      }
      
      private function onSelected(param1:int) : void
      {
         if(curDisIndex != param1)
         {
            updateCurDisIndex(param1,true);
            resetTimer();
         }
      }
      
      protected function onRight(param1:MouseEvent) : void
      {
         if(curDisIndex < stcNewFuncList.length - 1)
         {
            updateCurDisIndex(curDisIndex + 1,false);
            resetTimer();
         }
      }
      
      protected function onLeft(param1:MouseEvent) : void
      {
         if(curDisIndex > 0)
         {
            updateCurDisIndex(curDisIndex - 1,false);
            resetTimer();
         }
      }
      
      protected function onClose(param1:MouseEvent) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function dispose() : void
      {
         this.btnLeft.removeEventListener("click",onLeft);
         this.btnRight.removeEventListener("click",onRight);
         this.removeEventListener("rollOver",onMouseRoll);
         this.removeEventListener("rollOut",onMouseRoll);
         radioGroup = null;
         mask = null;
         if(newImage)
         {
            TweenLite.killTweensOf(newImage);
         }
         if(curImage)
         {
            TweenLite.killTweensOf(curImage);
         }
         timer.removeEventListener("timer",onTimer);
         timer.stop();
         timer = null;
         super.dispose();
      }
   }
}
