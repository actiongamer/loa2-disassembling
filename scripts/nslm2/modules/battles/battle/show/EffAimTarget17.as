package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   import com.mz.core.utils.ArrayUtil;
   
   public class EffAimTarget17 extends ShowBase
   {
       
      
      public function EffAimTarget17()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         if(GameObjectManager.effectOff)
         {
            return;
         }
         param1.aimList = ArrayUtil.removeRepeat(param1.aimList);
         var _loc3_:int = param1.aimList.shift();
         if(_loc3_ <= 0)
         {
            return;
         }
         param1.tarId = _loc3_;
         new EffTarget().start(param1,param2);
      }
   }
}
