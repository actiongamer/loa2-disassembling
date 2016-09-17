package nslm2.modules.battles.battle
{
   import away3d.containers.ObjectContainer3D;
   import com.mz.core.utils.DictHash;
   
   public class BattleStartVo
   {
       
      
      public var container:ObjectContainer3D;
      
      public var unitViews:DictHash;
      
      public var heads:nslm2.modules.battles.battle.BattleHeadPortrait;
      
      public var maps;
      
      public var isBoss:Boolean;
      
      public var playMode:int;
      
      public var replayStp:Array;
      
      public var seeds:Array;
      
      public var isAttack:int;
      
      public var isDeadFall:Boolean = false;
      
      public var isWinAct:Boolean = true;
      
      public var reportKind:int;
      
      public function BattleStartVo()
      {
         super();
      }
      
      public function clear() : void
      {
         container = null;
         unitViews = null;
         heads = null;
         maps = null;
         replayStp = null;
         seeds = null;
      }
   }
}
