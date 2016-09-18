package nslm2.modules.fightPlayer
{
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FPConsts
   {
      
      public static const SCALE_USE_BIG_TEX:Number = 3.5;
      
      public static const ACTIONTYPE_IDLE:int = 0;
      
      public static const ACTIONTYPE_MOVE:int = 1;
      
      public static const ACTIONTYPE_NORMAL_ATTACK_FRONT:int = 2;
      
      public static const ACTIONTYPE_NORMAL_ATTACK_REAR:int = 3;
      
      public static const ACTIONTYPE_GET_DAMAGE:int = 4;
      
      public static const ACTIONTYPE_MOVE_BACK:int = 5;
      
      public static const ACTIONTYPE_DIE:int = 6;
      
      public static const ACTIONTYPE_BATTLE_FINISH:int = 7;
      
      public static const ACTIONTYPE_MOVE_END:int = 8;
      
      public static const ACTIONTYPE_NORMAL_ATTACK_REAR_END:int = 9;
      
      public static const ACTIONTYPE_MOVE_BACK_END:int = 10;
      
      public static const ACTIONTYPE_SKILL_FRONT:int = 11;
      
      public static const ACTIONTYPE_MULTI_ATK_POINT:int = 12;
      
      public static const ACTIONTYPE_SKILL_REAR:int = 13;
      
      public static const ACTIONTYPE_BULLET_FLY:int = 14;
      
      public static const ACTIONTYPE_SKILL_EFFECT_BEGIN:int = 15;
      
      public static const ACTIONTYPE_SKILL_EFFECT_END:int = 16;
      
      public static const ACTIONTYPE_TURN_BEGIN:int = 17;
      
      public static const ACTIONTYPE_RAGE_SYNC:int = 18;
      
      public static const ACTIONTYPE_FREEZE_ALL_EXCEPT:int = 19;
      
      public static const ACTIONTYPE_UNFREEZE_ALL:int = 20;
      
      public static const ACTIONTYPE_UNFREEZE_ONE:int = 21;
      
      public static const ACTIONTYPE_BLOCK:int = 22;
      
      public static const ACTIONTYPE_DODGE:int = 23;
      
      public static const ACTIONTYPE_GET_HEAL:int = 24;
      
      public static const ACTIONTYPE_BUFF_UPDATE:int = 25;
      
      public static const ACTIONTYPE_BUFF_REMOVE:int = 26;
      
      public static const ACTIONTYPE_AIM_AT:int = 28;
      
      public static const ACTIONTYPE_SKILL_REAR_END:int = 29;
      
      public static const ACTIONTYPE_ABSORB_DAM:int = 31;
      
      public static const ACTIONTYPE_HP_SYNC:int = 32;
      
      public static const ACTIONTYPE_REBORN:int = 33;
      
      public static const ACTIONTYPE_VALUE_CHG:int = 34;
      
      public static const ACTIONTYPE_SKILL_INIT:int = 35;
      
      public static const ACTIONTYPE_SUMMON:int = 36;
      
      public static const ACTIONTYPE_BUFF_ADD:int = 37;
      
      public static const ACTIONTYPE_IMMUNE_DAM:int = 38;
      
      public static const FIGHTRESULT_NO_END:int = 0;
      
      public static const FIGHTRESULT_ATK_WIN:int = 1;
      
      public static const FIGHTRESULT_DEF_WIN:int = 2;
      
      public static const FIGHTRESULT_DRAW:int = 3;
      
      public static const PLAY_MODE_MANUAL:int = 0;
      
      public static const PLAY_MODE_AUTO:int = 1;
      
      public static const PLAY_MODE_REPLAY:int = 2;
      
      public static const PLAY_MODE_PVP:int = 3;
      
      public static const PLAY_MODE_SKILL_TEST:int = 4;
      
      public static const DAM_TYPE_NORMAL:int = 0;
      
      public static const DAM_TYPE_CRIT:int = 1;
      
      public static const DAM_TYPE_BLOCK:int = 2;
      
      public static const NPC_TYPE_SUMMON:int = 20;
      
      public static const NPC_TYPE_BOSS:int = 12;
      
      public static const NPC_TYPE_PET:int = 21;
      
      public static const SKILL_KIND_BIG:int = 1;
      
      public static const SKILL_KIND_NORMAL:int = 10;
      
      public static const MsPerFrame:int = 17;
      
      public static const ANGRY_MAX:int = 1000;
      
      public static const SUFFIX_ACT:String = "act";
      
      public static const SUFFIX_s3d:String = "s3d";
      
      public static const ACT_STD_3:String = "std_3";
      
      public static const ACT_STD:String = "std_2";
      
      public static const ACT_HURT:String = "hurt_1";
      
      public static const ACT_HURT_BACK:String = "hurt_3";
      
      public static const ACT_HURT_DOWN:String = "hurt_4";
      
      public static const ACT_DODGE:String = "dodge";
      
      public static const ACT_BLOCK:String = "hurt_1";
      
      public static const ACT_DEAD:String = "dead";
      
      public static const SKILL_1:String = "skill_1";
      
      public static const SKILL_2:String = "skill_2";
      
      public static const SKILL_3:String = "skill_3";
      
      public static const WIN:String = "win";
      
      public static const RUN:String = "run";
      
      public static const RUN_3:String = "run_3";
      
      public static const WEAK:String = "std_2";
      
      public static const REBORN:String = "relive";
      
      public static const ACT_GO:String = "go";
      
      public static const ACT_BACK:String = "back";
      
      public static const speed_label:Array = [LocaleMgr.ins.getStr(999000104),LocaleMgr.ins.getStr(999000105)];
      
      public static const RIDE_1:String = "ride_1";
      
      public static const RIDE_2:String = "ride_2";
      
      public static const RIDE_3:String = "ride_3";
      
      public static const WING_RIDE:String = "ride";
      
      public static const UI_DEFAULT_STD:String = "std_3";
      
      public static const ACT_ARR_TYPE_BASE:int = 1;
      
      public static const ACT_ARR_TYPE_BASE_FORCE:int = 11;
      
      public static const ACT_ARR_TYPE_ALL:int = 55;
      
      public static const S3D_ACT_BA1:String = "s3d_act1.ba";
      
      public static const S3D_ACT_BA2:String = "s3d_act2.ba";
      
      public static const S3D_ACT_FIRST_BATTLE:String = "s3d_act_firstBattle.ba";
      
      public static const S3D_ACT_FIRST_BATTLE_OTHER:String = "s3d_act_firstBattle_other.ba";
      
      public static const DXT:String = "dxt";
      
      public static const FP_SPEED_LOCAL_DATA:String = "FP_SPEED_LOCAL_DATA";
      
      public static const FP_AUTOFIRE_LOCAL_DATA:String = "FP_AUTOFIRE_LOCAL_DATA";
       
      
      public function FPConsts()
      {
         super();
      }
      
      public static function get speed_value() : Array
      {
         if(EnvConfig.ins.ptId == 2306)
         {
            return [30,38,20];
         }
         return [37,48,20];
      }
   }
}
