package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GetRewardProgressBar extends GetRewardProgressBarUI
   {
       
      
      public var oriH:int;
      
      public var oriY:int;
      
      public var oriBottom:int;
      
      public var oriH2:int;
      
      private var _value:int = -1;
      
      public function GetRewardProgressBar()
      {
         super();
         this.toolTip = LocaleMgr.ins.getStr(11900033,[DefindConsts.LOTTERY_POINT_ONCE]);
         this.progressBar_bg.mask = this.progressBar_mask2;
         this.progressBar_eff.mask = this.progressBar_mask;
         this.progressBar_bg.cacheAsBitmap = true;
         this.progressBar_eff.cacheAsBitmap = true;
         this.progressBar_mask.cacheAsBitmap = true;
         oriY = this.progressBar_mask.y;
         oriH = this.progressBar_mask.height;
         oriBottom = oriY + oriH;
         oriH2 = this.progressBar_mask2.height;
         this.value = 0;
      }
      
      public function get value() : int
      {
         return _value;
      }
      
      public function set value(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(_value != param1)
         {
            _value = param1;
            _value = Math.min(_value,DefindConsts.LOTTERY_POINT_FULL);
            if(_value <= 200)
            {
               _loc2_ = _value / 200 * 0.333333333333333;
            }
            else if(_value < 500)
            {
               _loc2_ = 0.333333333333333 + (_value - 200) / 300 * 0.333333333333333;
            }
            else
            {
               _loc2_ = 0.666666666666667 + (_value - 500) / 500 * 0.333333333333333;
            }
            this.progressBar_mask.height = Math.ceil(this.oriH * _loc2_);
            this.progressBar_mask2.height = this.progressBar_mask.height + (oriH2 - oriH);
            var _loc3_:* = oriBottom - this.progressBar_mask.height;
            this.progressBar_mask.y = _loc3_;
            this.progressBar_mask2.y = _loc3_;
            this.progressBar_eff.y = this.progressBar_mask.y - 5;
         }
      }
   }
}
