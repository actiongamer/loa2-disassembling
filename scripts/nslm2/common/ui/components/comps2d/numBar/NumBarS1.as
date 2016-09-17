package nslm2.common.ui.components.comps2d.numBar
{
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import com.mz.core.interFace.INumBar;
   import flash.events.MouseEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.event.MzEvent;
   import morn.customs.expands.MornExpandUtil;
   
   public class NumBarS1 extends NumBarS1UI implements INumBar
   {
      
      public static const EVT_NUMBAR_VALUE_CHANGE:String = "evt_numbar_value_change";
      
      private static const AUTO_DELAY:int = 200;
      
      private static const WIDTH_GAP:int = 3;
       
      
      private var _min:Number;
      
      private var _max:Number;
      
      private var _nowNum:Number;
      
      private var _step:Number;
      
      private var isAuto:Boolean;
      
      public function NumBarS1()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
         this.txt_input.addEventListener("change",onTextFieldChange);
      }
      
      public function init(param1:Number, param2:Number, param3:Number = 0, param4:Number = 1) : void
      {
         _min = param1;
         _max = param2;
         _nowNum = param3;
         _step = param4;
         this.txt_input.text = _nowNum.toString();
         validateBtns();
         btn_minus.setClickDelay(0);
         btn_plus.setClickDelay(0);
         btn_max.setClickDelay(0);
         btn_minus.addEventListener("mouseDown",minusMouseDownHandler);
         btn_minus.addEventListener("mouseUp",minusMouseUpHandler);
         btn_plus.addEventListener("mouseDown",plusMouseDownHandler);
         btn_plus.addEventListener("mouseUp",plusMouseUpHandler);
      }
      
      public function setBgWidth(param1:Number) : void
      {
         this.img_bg.width = param1;
         this.txt_input.width = param1;
         this.btn_plus.x = this.img_bg.x + this.img_bg.width + 3;
         this.btn_max.x = this.btn_plus.x + this.btn_plus.width + 3;
      }
      
      protected function plusMouseDownHandler(param1:MouseEvent) : void
      {
         isAuto = true;
         TimerManager.ins.doLoop(200,autoAdd);
      }
      
      protected function plusMouseUpHandler(param1:MouseEvent) : void
      {
         isAuto = true;
         TimerManager.ins.clearTimer(autoAdd);
      }
      
      protected function minusMouseUpHandler(param1:MouseEvent) : void
      {
         isAuto = false;
         TimerManager.ins.clearTimer(autoMinus);
      }
      
      protected function minusMouseDownHandler(param1:MouseEvent) : void
      {
         isAuto = true;
         TimerManager.ins.doLoop(200,autoMinus);
      }
      
      private function autoMinus() : void
      {
         if(isAuto)
         {
            changeNum(_nowNum - _step);
         }
      }
      
      private function autoAdd() : void
      {
         if(isAuto)
         {
            changeNum(_nowNum + _step);
         }
      }
      
      private function onTextFieldChange(param1:Event) : void
      {
         TweenLite.killDelayedCallsTo(this.validateInput);
         TweenLite.delayedCall(0.6,validateInput);
      }
      
      private function validateInput() : void
      {
         changeNum(int(this.txt_input.text));
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_max !== _loc2_)
         {
            if(this.btn_minus !== _loc2_)
            {
               if(this.btn_plus === _loc2_)
               {
                  changeNum(_nowNum + _step);
               }
            }
            else
            {
               changeNum(_nowNum - _step);
            }
         }
         else
         {
            changeNum(_max);
         }
      }
      
      protected function changeNum(param1:int) : void
      {
         param1 = int(param1 / _step) * _step;
         param1 = MathUtil.maxMin(param1,_max,_min);
         if(_nowNum != param1)
         {
            _nowNum = param1;
            this.txt_input.text = _nowNum.toString();
            this.dispatchEvent(new MzEvent("evt_numbar_value_change",this,true));
         }
         else
         {
            this.txt_input.text = _nowNum.toString();
         }
         validateBtns();
      }
      
      private function validateBtns() : void
      {
         this.btn_minus.disabled = _nowNum <= _min;
         var _loc1_:* = _nowNum >= _max;
         this.btn_plus.disabled = _loc1_;
         this.btn_max.disabled = _loc1_;
         if(btn_minus.disabled)
         {
            TimerManager.ins.clearTimer(autoMinus);
         }
         if(btn_plus.disabled)
         {
            TimerManager.ins.clearTimer(autoAdd);
         }
      }
      
      public function get nowNum() : Number
      {
         changeNum(int(this.txt_input.text));
         return _nowNum;
      }
   }
}
