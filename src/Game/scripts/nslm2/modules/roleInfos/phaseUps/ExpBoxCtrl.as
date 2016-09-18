package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.ExpBoxUI;
   import flash.display.DisplayObject;
   
   public class ExpBoxCtrl
   {
      
      public static const MAX_HEIGHT:int = 165;
       
      
      private var ui:ExpBoxUI;
      
      public var waterEff:DisplayObject;
      
      public var waterBallEff:DisplayObject;
      
      public var waterEffBaseY:int;
      
      private var _max:Number = 0;
      
      private var _exp:Number = 0;
      
      public function ExpBoxCtrl(param1:ExpBoxUI)
      {
         super();
         this.ui = param1;
      }
      
      public function get max() : Number
      {
         return _max;
      }
      
      public function set max(param1:Number) : void
      {
         if(_max != param1)
         {
            _max = param1;
         }
         ui.callLater(this.validateValue);
      }
      
      public function get exp() : Number
      {
         return _exp;
      }
      
      public function set exp(param1:Number) : void
      {
         if(_exp != param1)
         {
            _exp = param1;
         }
         ui.callLater(this.validateValue);
      }
      
      private function validateValue() : void
      {
         ui.txt_exp_value.tweenValue = this.exp;
         this.percent = this.exp / this.max;
         ui.txt_exp_value.visible = true;
      }
      
      public function showLevelTop() : void
      {
         this.percent = 1;
         ui.txt_exp_value.visible = false;
      }
      
      private function set percent(param1:Number) : void
      {
         ui.img_mask.scaleY = -param1;
         if(waterEff)
         {
            waterEff.y = waterEffBaseY - 165 * param1;
         }
      }
   }
}
