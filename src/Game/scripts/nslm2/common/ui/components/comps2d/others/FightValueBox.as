package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.props.FightValueBoxUI;
   import com.mz.core.interFace.IFightValueBox;
   import com.greensock.TweenLite;
   
   public class FightValueBox extends FightValueBoxUI implements IFightValueBox
   {
      
      private static var _insForDraw:nslm2.common.ui.components.comps2d.others.FightValueBox;
       
      
      private var _tweenValue:Number;
      
      public function FightValueBox()
      {
         super();
      }
      
      public static function get insForDraw() : nslm2.common.ui.components.comps2d.others.FightValueBox
      {
         if(_insForDraw == null)
         {
            _insForDraw = new nslm2.common.ui.components.comps2d.others.FightValueBox();
         }
         return _insForDraw;
      }
      
      public function get value() : Number
      {
         if(this.txt_fightValue.value)
         {
            return this.txt_fightValue.value;
         }
         return 0;
      }
      
      public function set value(param1:Number) : void
      {
         this.txt_fightValue.value = param1;
      }
      
      public function get tweenValue() : Number
      {
         return _tweenValue;
      }
      
      public function set tweenValue(param1:Number) : void
      {
         _tweenValue = param1;
         if(insForDraw.txt_fightValue)
         {
            TweenLite.to(this,0.3,{
               "value":_tweenValue,
               "overwrite":2
            });
         }
         else
         {
            this.value = param1;
            callLater(commitMeasure);
         }
      }
   }
}
