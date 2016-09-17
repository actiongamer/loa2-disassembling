package nslm2.modules.battles.sceneBases
{
   import proto.BattlePlayer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import nslm2.mgrs.SoundMgr;
   
   public class BattleSceneConfigVo
   {
      
      public static const STCSTAGEID:String = "stcStageId";
      
      public static const TEAM:String = "team";
      
      public static const RIGHTGROUPID:String = "rightGroupId";
       
      
      public var mapId:int;
      
      public var mapConfigId:int;
      
      public var spArr:Array;
      
      public var stageId:int;
      
      public var battleRandom:Array;
      
      public var moduleId:int;
      
      private var _sceneCameraKind:int;
      
      public function BattleSceneConfigVo(param1:int, param2:int, param3:int, param4:Array, param5:Array, param6:int)
      {
         super();
         if(param1)
         {
            SoundMgr.ins.playBackSoundByStageId(param1);
         }
         this.stageId = param1;
         this.moduleId = param6;
         this.mapId = param2;
         this.mapConfigId = param3;
         this.battleRandom = param4;
         this.spArr = param5;
      }
      
      public function get isBossScene() : Boolean
      {
         switch(int(this.sceneCameraKind) - 1)
         {
            case 0:
               return false;
            case 1:
               return true;
         }
      }
      
      public function get sceneCameraKind() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         if(_sceneCameraKind == 0)
         {
            _sceneCameraKind = 1;
            _loc2_ = this.spArr.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc1_ = this.spArr[_loc4_];
               if(_loc1_.isAttack != 1)
               {
                  _loc3_ = StcMgr.ins.getNpcVo(int(_loc1_.npcId));
                  if(_loc3_)
                  {
                     if(_loc3_.kind == 12)
                     {
                        _sceneCameraKind = 2;
                        break;
                     }
                  }
                  else
                  {
                     new StcLackFatal(this,"static_npc",_loc1_.npcId);
                  }
               }
               _loc4_++;
            }
         }
         return _sceneCameraKind;
      }
   }
}
