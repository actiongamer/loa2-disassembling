package nslm2.modules.battles.battle.text
{
   import flash.display.Sprite;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.DisplayObjectContainer;
   import com.greensock.TimelineLite;
   
   public class TextAniUp extends Sprite
   {
       
      
      private var _view:nslm2.modules.battles.battle.text.TextView;
      
      private var _onComp:Function;
      
      public function TextAniUp(param1:nslm2.modules.battles.battle.text.TextView, param2:DisplayObjectContainer, param3:Number, param4:Number, param5:Boolean = false, param6:Function = null)
      {
         super();
         _view = param1;
         this.x = param3;
         this.y = param4 - 200;
         _onComp = param6;
         _view.x = -_view.width / 2;
         _view.y = -_view.height / 2;
         this.addChild(_view);
         param2.addChild(this);
         var _loc7_:Number = !!param5?4:2;
         var _loc9_:String = !!param5?"+=0.6":"+=0.3";
         var _loc8_:TimelineLite = new TimelineLite();
         _loc8_.to(param1,0.1,{
            "scaleX":_loc7_,
            "scaleY":_loc7_,
            "onUpdate":updateXY
         });
         _loc8_.to(param1,0.1,{
            "scaleX":1,
            "scaleY":1,
            "onUpdate":updateXY
         });
         _loc8_.to(_view,1,{
            "alpha":0,
            "y":_view.y - 30
         },_loc9_);
         _loc8_.call(cmp);
      }
      
      private function updateXY() : void
      {
         _view.x = -_view.width / 2;
         _view.y = -_view.height / 2;
      }
      
      private function cmp() : void
      {
         _view.clearAll();
         DisplayUtils.removeSelf(this);
         _view.dispose();
         if(_onComp is Function)
         {
            _onComp(this);
            _onComp = null;
         }
      }
   }
}
