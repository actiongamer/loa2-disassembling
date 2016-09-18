package nslm2.common.ui.components.debug3d
{
   import game.ui.logModules.Param3DRenderUI;
   import com.mz.core.mediators.DragMediator;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import flash.events.KeyboardEvent;
   import com.mz.core.utils.MathUtil;
   import flash.events.MouseEvent;
   
   public class Param3DRender extends Param3DRenderUI
   {
      
      public static const PARAM_VALUE_CHANGE:String = "PARAM_VALUE_CHANGE";
      
      public static const POSITION:String = "position";
      
      public static const ROTATION:String = "rotation";
      
      public static const SCALE:String = "scale";
      
      public static const COLOR:String = "color";
       
      
      private var dragChangeMed:DragMediator;
      
      public var max:int;
      
      public var min:int;
      
      public var roundDigit:int = 0;
      
      public var step:Number = 1;
      
      public var defaultValue:Number;
      
      public var radix:int = 10;
      
      private var oldValue:Number;
      
      public var bindTarget:Object;
      
      public var bindParam:String;
      
      public function Param3DRender()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.txt_value.restrict = "-0-9.abcedfABCDEF";
         this.addEventListener("keyUp",onKey);
         dragChangeMed = new DragMediator(this.txt_value,UIMgr.stage);
         dragChangeMed.addEventListener("start",dragChangeMed_onStart);
         dragChangeMed.addEventListener("valueChange",dragChangeMed_onChange);
         this.txt_value.addEventListener("USER_CHANGE",txt_value_change);
         this.addEventListener("PARAM_VALUE_CHANGE",onParamValueChange);
         this.txt_name.addEventListener("click",txtName_onClick);
      }
      
      public function paramConfig(param1:Number, param2:Number, param3:Number, param4:int = 0, param5:* = 0) : void
      {
         max = param1;
         min = param2;
         this.step = param3;
         roundDigit = param4;
         defaultValue = param5;
      }
      
      public function set paramType(param1:String) : void
      {
         var _loc2_:* = param1;
         if("position" !== _loc2_)
         {
            if("rotation" !== _loc2_)
            {
               if("scale" !== _loc2_)
               {
                  if("color" === _loc2_)
                  {
                     max = 16777215;
                     min = 0;
                     this.step = 1;
                     roundDigit = 0;
                     defaultValue = 5666960;
                     radix = 16;
                  }
               }
               else
               {
                  max = 100;
                  min = -100;
                  this.step = 0.01;
                  roundDigit = 2;
                  defaultValue = 1;
               }
            }
            else
            {
               max = 360;
               min = -360;
               this.step = 0.5;
               roundDigit = 0;
               defaultValue = 0;
            }
         }
         else
         {
            max = 99999;
            min = -99999;
            this.step = 1;
            roundDigit = 0;
            defaultValue = 0;
         }
      }
      
      private function txt_value_change(param1:Event) : void
      {
         TweenLite.killDelayedCallsTo(this.txtValue_changeHandler);
         TweenLite.delayedCall(2,txtValue_changeHandler);
      }
      
      private function txtValue_changeHandler() : void
      {
         validate(this.value);
         this.dispatchEvent(new Event("PARAM_VALUE_CHANGE",true));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.value = param1 as Number;
      }
      
      public function get value() : Number
      {
         if(radix == 16)
         {
            return Number("0x" + this.txt_value.text);
         }
         return Number(this.txt_value.text);
      }
      
      public function set value(param1:Number) : void
      {
         this.validate(param1);
      }
      
      public function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:* = param1.keyCode;
         if(13 !== _loc2_)
         {
            if(32 === _loc2_)
            {
               this.txt_value.text = defaultValue.toString(this.radix);
               this.dispatchEvent(new Event("PARAM_VALUE_CHANGE",true));
            }
         }
         else
         {
            validate(this.value);
            this.dispatchEvent(new Event("PARAM_VALUE_CHANGE",true));
         }
      }
      
      public function dragChangeMed_onStart(param1:Event) : void
      {
         oldValue = this.value;
      }
      
      public function dragChangeMed_onChange(param1:Event) : void
      {
         var _loc2_:Number = dragChangeMed.thisMouseX - dragChangeMed.oriMouseX;
         validate(oldValue + _loc2_ * step);
         this.dispatchEvent(new Event("PARAM_VALUE_CHANGE",true));
      }
      
      private function validate(param1:Number) : void
      {
         param1 = MathUtil.round(param1,roundDigit);
         while(param1 > max)
         {
            param1 = param1 - (max - min);
         }
         while(param1 < min)
         {
            param1 = param1 + (max - min);
         }
         this.txt_value.text = MathUtil.maxMin(param1,max,min).toString(radix);
      }
      
      public function bind(param1:Object, param2:String, param3:String = null) : void
      {
         if(param3 == null)
         {
            param3 = param2;
         }
         this.txt_name.text = param3;
         this.txt_name.buttonMode = true;
         this.bindTarget = param1;
         this.bindParam = param2;
         this.txt_value.x = this.txt_name.textField.textWidth + 2;
         txtName_onClick(null);
      }
      
      private function onParamValueChange(param1:Event) : void
      {
         if(bindTarget)
         {
            bindTarget[this.bindParam] = this.value;
         }
      }
      
      private function txtName_onClick(param1:MouseEvent) : void
      {
         if(bindTarget)
         {
            this.validate(bindTarget[this.bindParam]);
         }
      }
      
      public function countAutoSize() : void
      {
         this.width = this.txt_value.x + this.txt_value.width;
      }
   }
}
