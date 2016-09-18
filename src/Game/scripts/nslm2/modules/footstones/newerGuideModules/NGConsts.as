package nslm2.modules.footstones.newerGuideModules
{
   import com.mz.core.utils.DictHash;
   import nslm2.common.model.PlayerModel;
   
   public class NGConsts
   {
      
      public static const FIGHT_BOMB_ID:int = 90001;
      
      public static const NPG_GROUP_ID:String = "npcGroupId";
      
      public static const STAGE_NPC_RELATION_ID:String = "stageNpcRelationId";
      
      public static const sceneModuleClose:String = "sceneModuleClose";
      
      public static const FULLSCREENBTN:String = "fullScreenBtn";
      
      public static const SUB_NG_TYPE:int = 1;
      
      public static const SUB_REPEAT_NG_TYPE:int = 2;
      
      public static const checkHandlerReturn_no:int = 0;
      
      public static const checkHandlerReturn_yes:int = 1;
      
      public static const checkHandlerReturn_skip:int = 2;
      
      public static const checkHandlerReturn_pause:int = 3;
      
      public static const checkHandlerReturn_jump:int = 4;
      
      public static const JUMP_ID_NONE:int = 4444;
      
      public static const NG_ID_97168:int = 97168;
      
      public static const NG_ID_97175:int = 97175;
      
      public static const NG_ID_99150:int = 99150;
      
      public static const NG_ID_99189:int = 99189;
      
      public static const NG_NEED_OPEN_DIRECTLY:Array = [97168,97175,99150,99189];
      
      public static const NG_CHECK_10020:int = 10020;
      
      public static const NG_CHECK_10030:int = 10030;
      
      public static const NG_CHECK_10040:int = 10040;
      
      public static const NG_CHECK_10041:int = 10041;
      
      public static const NG_CHECK_10042:int = 10042;
      
      public static const NG_CHECK_10045:int = 10045;
      
      public static const NG_CHECK_10060:int = 10060;
      
      public static const NG_CHECK_10061:int = 10061;
      
      public static const NG_CHECK_10062:int = 10062;
      
      public static const NG_CHECK_10063:int = 10063;
      
      public static const NG_CHECK_10080:int = 10080;
      
      public static const NG_CHECK_10121:int = 10121;
      
      public static const NG_CHECK_10998:int = 10125;
      
      public static const NG_CHECK_10999:int = 10126;
      
      public static const NG_CHECK_10210:int = 10210;
      
      public static const NG_CHECK_10220:int = 10220;
      
      public static const NG_CHECK_20020:int = 20020;
      
      public static const NG_CHECK_20021:int = 20021;
      
      public static const NG_CHECK_20022:int = 20022;
      
      public static const NG_CHECK_20023:int = 20023;
      
      public static const NG_CHECK_20024:int = 20024;
      
      public static const NG_CHECK_20025:int = 20025;
      
      public static const NG_CHECK_20026:int = 20026;
      
      public static const NG_CHECK_99900:int = 99900;
      
      public static const NG_CHECK_20027:int = 20027;
      
      public static const NG_CHECK_20028:int = 20028;
      
      public static const NG_CHECK_20029:int = 20029;
      
      public static const NG_CHECK_20030:int = 20030;
      
      public static const NG_CHECK_20031:int = 20031;
      
      public static const NG_CHECK_20032:int = 20032;
      
      public static const NG_CHECK_20040:int = 20040;
      
      public static const NG_CHECK_20041:int = 20041;
      
      public static const NG_CHECK_99104:int = 99104;
      
      public static const NG_CHECK_20110:int = 20110;
      
      public static const NG_ID_99900:int = 99900;
      
      public static const NG_ID_99409:int = 99409;
      
      public static const NG_ID_99363:int = 99363;
      
      public static const NG_ID_99106:int = 99106;
      
      public static const NG_ID_99108:int = 99108;
      
      public static const NG_ID_99367:int = 99367;
      
      public static const NG_ID_99372:int = 99372;
      
      public static const STC_ITEM_ID_11110:int = 11110;
      
      public static const NG_ID_97107:int = 97107;
      
      public static const NG_ID_97109:int = 97109;
      
      public static const NG_ID_99155:int = 99155;
      
      public static const NG_ID_97180:int = 97180;
      
      public static const NG_ID_90100:int = 90100;
      
      public static const NG_RUNE_MAX_LEVEL:int = 40;
      
      public static const NG_FILTER_NOT_SHOW_EFFECT:Array = [20040,20023];
      
      public static const NEED_CHECK_OTHER_MODULE_SHOW:Vector.<int> = new <int>[10430,40400,10400];
      
      public static var NG_MAX_LEVEL_DICT:DictHash;
       
      
      public function NGConsts()
      {
         super();
      }
      
      public static function outLevel(param1:int) : Boolean
      {
         if(NG_MAX_LEVEL_DICT == null)
         {
            NG_MAX_LEVEL_DICT = new DictHash();
            NG_MAX_LEVEL_DICT.put(99900,40);
         }
         var _loc2_:int = NG_MAX_LEVEL_DICT.getValue(param1);
         return _loc2_ != 0 && PlayerModel.ins.level > _loc2_;
      }
   }
}
