package nslm2.modules.battles.battle.text
{
   import flash.display.DisplayObjectContainer;
   
   public class TextAniQueue
   {
       
      
      private var _list:Vector.<nslm2.modules.battles.battle.text.TextAniUp>;
      
      private var _flag:Boolean = false;
      
      public function TextAniQueue()
      {
         super();
         _list = new Vector.<nslm2.modules.battles.battle.text.TextAniUp>();
      }
      
      public function play(param1:TextView, param2:DisplayObjectContainer, param3:Number, param4:Number, param5:Boolean) : void
      {
         var _loc6_:nslm2.modules.battles.battle.text.TextAniUp = new nslm2.modules.battles.battle.text.TextAniUp(param1,param2,param3,param4,param5,onComp);
         _list.unshift(_loc6_);
         var _loc8_:int = param4 - 230;
         _loc6_.x = param3;
         var _loc10_:int = 0;
         var _loc9_:* = _list;
         for each(var _loc7_ in _list)
         {
            _loc7_.y = _loc8_;
            _loc8_ = _loc8_ - 30;
         }
      }
      
      private function onComp(param1:nslm2.modules.battles.battle.text.TextAniUp) : void
      {
         var _loc2_:int = _list.indexOf(param1);
         if(_loc2_ >= 0)
         {
            _list.splice(_loc2_,1);
         }
      }
   }
}
