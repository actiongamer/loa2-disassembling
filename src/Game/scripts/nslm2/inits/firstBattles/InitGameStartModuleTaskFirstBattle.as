package nslm2.inits.firstBattles
{
   import com.mz.core.utils2.task.TaskBase;
   import tools.embattles.EmbattleNpcVo;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class InitGameStartModuleTaskFirstBattle extends TaskBase
   {
       
      
      public function InitGameStartModuleTaskFirstBattle()
      {
         super();
      }
      
      public static function emVoToUnitVoArr(param1:Array, param2:int) : Array
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
            _loc4_ = new UnitVo();
            _loc4_.isMajor = _loc3_.isMajor;
            if(_loc3_.isMajor)
            {
               _loc4_.name = ClientConfig.createRoleName;
            }
            _loc4_.id = "left" + _loc3_.pos;
            _loc4_.npc_id = _loc3_.npcId;
            _loc4_.isAttack = 1;
            _loc4_.posId = _loc3_.pos;
            _loc4_.hp_max = _loc4_.stcNpcVo.hp;
            _loc4_.hp = _loc4_.hp_max;
            _loc5_.push(_loc4_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      override public function exec() : void
      {
         var _loc2_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:* = null;
         super.exec();
         ModuleMgr.ins.showModule(10220);
         ModuleMgr.ins.showModule(90400);
         ModuleMgr.ins.showModule(96100);
         ModuleMgr.ins.showModule(90315);
         ClientConfig.isNewPlayer = true;
         var _loc5_:DungeonVo = new DungeonVo(100);
         var _loc4_:Array = String(DefindConsts.FIRSTSTAGE_CONFIG).split(":");
         if(ClientConfig.createRoleSex == 1)
         {
            _loc2_ = DefindConsts.roleBaseStcNpcId_male;
         }
         else
         {
            _loc2_ = DefindConsts.roleBaseStcNpcId_female;
         }
         var _loc1_:Array = [new EmbattleNpcVo(4,_loc2_,true),new EmbattleNpcVo(_loc4_[1] - 1,_loc4_[0])];
         var _loc6_:Array = emVoToUnitVoArr(_loc1_,1);
         var _loc7_:int = _loc6_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = _loc6_[_loc8_];
            _loc5_.unitHash.put(_loc3_.id,_loc3_);
            _loc8_++;
         }
         ModuleMgr.ins.showModule(40300,{"vo":_loc5_});
         this.onComplete();
      }
   }
}
