package nslm2.modules.battles.battle
{
   import com.mz.core.display.MzSprite;
   import nslm2.modules.fightPlayer.FPConsts;
   
   public class BattlePlayer extends MzSprite
   {
      
      private static var _isInit:Boolean = false;
      
      public static var CYCLES_FPS:Number = FPConsts.speed_value[0];
       
      
      private var _battleStartVo:nslm2.modules.battles.battle.BattleStartVo;
      
      public function BattlePlayer(param1:nslm2.modules.battles.battle.BattleStartVo)
      {
         super();
         _battleStartVo = param1;
      }
      
      public function play() : void
      {
         var _loc1_:int = 1;
         if(_battleStartVo.playMode == 1)
         {
            if([5,13,2,12].indexOf(_battleStartVo.reportKind) != -1)
            {
               _loc1_ = 1;
            }
            else
            {
               _loc1_ = 2;
            }
         }
         if(_loc1_ == 1)
         {
            new FightStartEff2(_Play,_battleStartVo.heads).go();
         }
         else
         {
            new FightStartEff(_Play,_battleStartVo.heads).go(_battleStartVo.unitViews);
         }
      }
      
      private function _Play() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         GameObjectManager.Instance.startup(_battleStartVo.unitViews,this);
      }
      
      public function finishImmediately() : void
      {
         GameObjectManager.Instance.finish(true);
      }
      
      public function test_btn(param1:int) : void
      {
         GameObjectManager.Instance.test_btn(param1);
      }
      
      public function pause(param1:Boolean) : void
      {
         GameObjectManager.Instance.pause(param1);
      }
      
      public function get vo() : nslm2.modules.battles.battle.BattleStartVo
      {
         return _battleStartVo;
      }
      
      override public function dispose() : void
      {
         GameObjectManager.Instance.clearPlayerTL();
         GameObjectManager.Instance.finish();
         super.dispose();
      }
   }
}
