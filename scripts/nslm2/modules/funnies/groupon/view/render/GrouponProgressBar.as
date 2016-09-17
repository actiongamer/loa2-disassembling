package nslm2.modules.funnies.groupon.view.render
{
   import game.ui.groupon.render.GrouponProgressBarUI;
   import nslm2.modules.funnies.groupon.vo.DiscountVo;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class GrouponProgressBar extends GrouponProgressBarUI
   {
       
      
      public var oriH:int;
      
      public var oriY:int;
      
      public var oriBottom:int;
      
      public var oriH2:int;
      
      private var _value:int = -1;
      
      private var _data:Array;
      
      private var progressValue:Number = 0;
      
      private var SEPERATE_VALUE:Number;
      
      public function GrouponProgressBar()
      {
         super();
         parts.push(new ProgressBarCtrl(progressBar,0.93,false));
      }
      
      public function set value(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         if(_value != param1)
         {
            progressValue = 0;
            _value = param1;
            _loc3_ = _data.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = _data[_loc5_];
               if(_value >= _loc2_.activateCount)
               {
                  progressValue = progressValue + SEPERATE_VALUE;
                  _loc5_++;
                  continue;
               }
               if(_loc5_ > 0)
               {
                  _loc4_ = _data[_loc5_ - 1];
                  progressValue = progressValue + (_value - _loc4_.activateCount) / (_loc2_.activateCount - _loc4_.activateCount) * SEPERATE_VALUE;
               }
               else
               {
                  progressValue = _value / _loc2_.activateCount * SEPERATE_VALUE;
               }
               break;
            }
            progressBar.value = progressValue;
         }
      }
      
      public function init(param1:Array) : void
      {
         _data = param1.concat();
         _data.shift();
         var _loc2_:int = _data.length;
         (_data[_loc2_ - 1] as DiscountVo).showSplit = false;
         SEPERATE_VALUE = 1 / _loc2_;
         list_split.repeatX = _loc2_;
         list_split.spaceX = this.width / _loc2_;
         list_split.x = this.width / _loc2_;
         list_split.dataSource = _data;
      }
   }
}
