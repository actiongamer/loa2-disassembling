package nslm2.modules.battles
{
   import nslm2.modules.fightPlayer.FightSceneModule;
   import tools.embattles.EmbattleNpcVo;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class BattleTestModule extends FightSceneModule
   {
       
      
      public var battleScene:BattleSceneBase;
      
      public function BattleTestModule()
      {
         super();
      }
      
      public static function embattleToUnitVoArr(param1:Array, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Array = [];
         var _loc6_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param1[_loc7_];
            if(_loc3_.npcId != 0)
            {
               _loc4_ = new UnitVo();
               _loc4_.isMajor = _loc3_.isMajor;
               _loc4_.id = String((param2 == 1?"left":"right") + _loc7_);
               _loc4_.npc_id = _loc3_.npcId;
               if(param2 == 1)
               {
               }
               _loc4_.isAttack = param2 == 1?1:0;
               _loc4_.posId = _loc7_;
               _loc4_.hp_max = _loc4_.stcNpcVo.hp;
               _loc4_.hp = _loc4_.hp_max;
               _loc5_.push(_loc4_);
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      override public function show(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll();
         super.show(getfightUnitVos());
         preload();
      }
      
      private function getfightUnitVos() : Array
      {
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         _loc3_.push(new EmbattleNpcVo(0,3303));
         _loc3_.push(new EmbattleNpcVo(1,10003));
         _loc3_.push(new EmbattleNpcVo(3,2403));
         _loc3_.push(new EmbattleNpcVo(4,2103));
         _loc3_.push(new EmbattleNpcVo(5,2203));
         var _loc1_:Array = [];
         _loc1_.push(new EmbattleNpcVo(0,13003));
         _loc1_.push(new EmbattleNpcVo(1,3402));
         _loc1_.push(new EmbattleNpcVo(2,3103));
         _loc1_.push(new EmbattleNpcVo(3,21003));
         _loc1_.push(new EmbattleNpcVo(4,26003));
         _loc2_ = _loc2_.concat(embattleToUnitVoArr(_loc3_,1));
         _loc2_ = _loc2_.concat(embattleToUnitVoArr(_loc1_,2));
         return _loc2_;
      }
      
      private function initUI() : void
      {
      }
   }
}
