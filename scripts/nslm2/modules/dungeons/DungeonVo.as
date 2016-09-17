package nslm2.modules.dungeons
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.battles.battle.FPUtil;
   import proto.Reward;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   
   public class DungeonVo
   {
       
      
      private var _dungeonId:int;
      
      public var unitHash:DictHash;
      
      public var subSceneRate:Number = 0.5;
      
      public var dropGold:int;
      
      public var drops:Array;
      
      public var battleRandom:Array;
      
      private var dropHash:DictHash;
      
      private var _subSceneMax:int = 0;
      
      private var _isBossScene:Boolean;
      
      public var checkIsBossScene:Boolean;
      
      public var isElevator:Boolean;
      
      public function DungeonVo(param1:int)
      {
         super();
         this._dungeonId = param1;
         unitHash = new DictHash();
      }
      
      public function get dungeonId() : int
      {
         return _dungeonId;
      }
      
      public function get stcStageVo() : StcStageVo
      {
         return StcMgr.ins.getStageVo(this.dungeonId);
      }
      
      public function get scriptId() : String
      {
         return stcStageVo.drama_script_1;
      }
      
      public function get subSceneW() : int
      {
         return ClientConfig.SCENE_FIXED_W * subSceneRate;
      }
      
      public function countDropList() : void
      {
         var _loc9_:int = 0;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = subSceneMax;
         _loc9_ = 0;
         while(_loc9_ < _loc5_)
         {
            _loc4_ = monsterIdArr(_loc9_);
            _loc7_ = _loc4_.length;
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc4_[_loc6_];
               if(_loc8_ != 0)
               {
                  _loc2_.push(_loc9_ + "_" + FPUtil.genBattleId(0,_loc6_));
               }
               _loc6_++;
            }
            _loc9_++;
         }
         dropHash = new DictHash();
         var _loc1_:Array = drops.concat();
         _loc5_ = _loc1_.length;
         _loc9_ = _loc5_ - 1;
         while(_loc9_ >= 0)
         {
            _loc3_ = _loc1_[_loc9_];
            if(_loc3_.dropType != 20)
            {
               _loc1_.splice(_loc9_,1);
            }
            _loc9_--;
         }
         countDropList2(_loc2_,[],_loc1_);
      }
      
      public function getUnitDropArr(param1:UnitVo, param2:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:String = param2 + "_" + param1.id;
         if(this.dropHash && this.dropHash.containsKey(_loc4_))
         {
            _loc3_ = dropHash.getValue(_loc4_);
            dropHash.remove(_loc4_);
            return _loc3_;
         }
         return [];
      }
      
      private function countDropList2(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(param3.length == 0)
         {
            return;
         }
         if(param2.length == 0)
         {
            param2 = param1.concat();
         }
         _loc4_ = param3.shift() as Reward;
         _loc5_ = MathUtil.randomInt(param2.length - 1,0);
         _loc6_ = param2[_loc5_];
         if(dropHash.containsKey(_loc6_) == false)
         {
            dropHash.put(_loc6_,[]);
         }
         (dropHash.getValue(_loc6_) as Array).push(_loc4_);
         ArrayUtil.removeItemAt(param2,_loc5_);
         countDropList2(param1,param2,param3);
      }
      
      public function get subSceneMax() : int
      {
         if(stcStageVo == null)
         {
            return 1;
         }
         if(_subSceneMax == 0)
         {
            if(this.stcStageVo.monster_id2 == 0)
            {
               this._subSceneMax = 1;
            }
            else if(this.stcStageVo.monster_id3 == 0)
            {
               this._subSceneMax = 2;
            }
            else
            {
               this._subSceneMax = 3;
            }
         }
         return _subSceneMax;
      }
      
      public function monsterGroupId(param1:int) : int
      {
         var _loc2_:int = 0;
         if(!stcStageVo)
         {
            return 0;
         }
         switch(int(param1))
         {
            case 0:
               _loc2_ = this.stcStageVo.monster_id1;
               break;
            case 1:
               _loc2_ = this.stcStageVo.monster_id2;
               break;
            case 2:
               _loc2_ = this.stcStageVo.monster_id3;
         }
         return _loc2_;
      }
      
      public function monsterGroupVo(param1:int) : StcNpcGroupVo
      {
         var _loc2_:int = monsterGroupId(param1);
         var _loc3_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(_loc2_);
         if(_loc3_)
         {
            return _loc3_;
         }
         new StcLackFatal(this,"static_npc_group",_loc2_);
         return null;
      }
      
      public function get isBossScene() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(checkIsBossScene == false)
         {
            if(stcStageVo == null)
            {
               checkIsBossScene = false;
            }
            else
            {
               checkIsBossScene = true;
               _loc1_ = this.subSceneMax;
               _loc2_ = 0;
               while(_loc2_ < _loc1_)
               {
                  if(this.monsterGroupVo(_loc2_).kind == 2)
                  {
                     _isBossScene = true;
                     break;
                  }
                  _loc2_++;
               }
            }
         }
         return _isBossScene;
      }
      
      public function monsterIdArr(param1:int) : Array
      {
         return this.monsterGroupVo(param1).formation_group.split("|");
      }
   }
}
