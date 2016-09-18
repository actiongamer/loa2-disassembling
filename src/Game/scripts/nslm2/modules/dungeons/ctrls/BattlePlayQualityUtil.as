package nslm2.modules.dungeons.ctrls
{
   import org.specter3d.context.AppGlobalContext;
   import com.mz.core.utils.LocalData;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.battles.battle.GameObjectManager;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.fightPlayer.UnitView;
   
   public class BattlePlayQualityUtil
   {
       
      
      public function BattlePlayQualityUtil()
      {
         super();
      }
      
      public static function switchPlayQuality() : void
      {
         switch(int(AppGlobalContext.PlayQuality) - 1)
         {
            case 0:
               changePlayQuality(3);
               break;
            case 1:
               changePlayQuality(1);
               break;
            case 2:
               changePlayQuality(2);
         }
      }
      
      public static function changePlayQuality(param1:int) : void
      {
         AppGlobalContext.PlayQuality = param1;
         validatePlayQuality();
         LocalData.insCurPlayer.save("AppGlobalContext.LOCAL_DATA_PlayQuality",AppGlobalContext.PlayQuality);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_BATTLE_PLAY_QUALITY");
      }
      
      public static function validatePlayQuality() : void
      {
         switch(int(AppGlobalContext.PlayQuality) - 1)
         {
            case 0:
               GameObjectManager.effectOff = 1;
               GameObjectManager.bulletOff = 0;
               AppGlobalContext.autoTransition = false;
               break;
            case 1:
               GameObjectManager.effectOff = 0;
               GameObjectManager.bulletOff = 0;
               AppGlobalContext.autoTransition = false;
               break;
            case 2:
               GameObjectManager.effectOff = 0;
               GameObjectManager.bulletOff = 0;
               AppGlobalContext.autoTransition = true;
         }
      }
      
      public static function switchBattlePlayQuality_hash(param1:DictHash) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.array[_loc4_];
            _loc2_.avatarBody.effectsVisible = AppGlobalContext.PlayQuality == 3;
            _loc4_++;
         }
      }
   }
}
