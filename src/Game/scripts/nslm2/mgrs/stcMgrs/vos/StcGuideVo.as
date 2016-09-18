package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import morn.core.utils.StringUtils;
   
   public class StcGuideVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const SAVE_0:int = 0;
      
      public static const SAVE_1:int = 1;
      
      public static const SAVE_2:int = 2;
      
      public static const FUNC_ID:String = "func_id";
      
      public static const IS_OVER_CONTINUE:int = 0;
      
      public static const IS_OVER_HIDE:int = 1;
      
      public static const IS_OVER_WAIT:int = 2;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_guide";
       
      
      private var _checkId:int = -1;
      
      private var _checkParams:Array;
      
      public var id:int;
      
      public var next_id:int;
      
      public var jump_id:int;
      
      public var level:int;
      
      public var func_id:int;
      
      public var comp_id:String;
      
      public var is_over:int;
      
      public var npc_id:int;
      
      public var play_type:int;
      
      public var talk:String;
      
      public var guide_position:String;
      
      public var direction:int;
      
      public var is_save:int;
      
      public var is_unlock:int;
      
      public var lua:int;
      
      public var check:String;
      
      public var root_id:int;
      
      public var offset:String;
      
      public var talk_position:String;
      
      public var is_trigger:int;
      
      public function StcGuideVo()
      {
         super();
      }
      
      public function get compId() : String
      {
         return this.comp_id;
      }
      
      public function get scriptId() : int
      {
         return this.lua;
      }
      
      public function get compParams() : Array
      {
         var _loc1_:Array = this.comp_id.split(":");
         _loc1_.shift();
         return _loc1_;
      }
      
      public function get compFirstKey() : String
      {
         return this.comp_id.split(":")[0];
      }
      
      public function get isFindNpc() : Boolean
      {
         return this.comp_id.indexOf(":") > -1 && this.compFirstKey == "stageNpcRelationId";
      }
      
      public function get isFindNpc2() : Boolean
      {
         return this.comp_id.indexOf(":") > -1 && this.compFirstKey == "npcGroupId";
      }
      
      public function get checkId() : int
      {
         initCheck();
         return _checkId;
      }
      
      public function get checkParams() : Array
      {
         initCheck();
         return _checkParams;
      }
      
      private function initCheck() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(_checkId == -1)
         {
            _loc2_ = this.check;
            if(StringUtils.isNull(_loc2_))
            {
               _checkId = 0;
            }
            else
            {
               _loc1_ = _loc2_.split(":");
               _checkId = int(_loc1_[0]);
               if(_loc1_.length > 1)
               {
                  _checkParams = _loc1_[1].split(",");
               }
            }
         }
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         next_id = param1[1];
         jump_id = param1[2];
         level = param1[3];
         func_id = param1[4];
         comp_id = param1[5];
         is_over = param1[6];
         npc_id = param1[7];
         play_type = param1[8];
         talk = param1[9];
         guide_position = param1[10];
         direction = param1[11];
         is_save = param1[12];
         is_unlock = param1[13];
         lua = param1[14];
         check = param1[15];
         root_id = param1[16];
         offset = param1[17];
         talk_position = param1[18];
         is_trigger = param1[19];
      }
   }
}
