package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcStageNpcRelationVo extends StcVoBase
   {
      
      public static const STAGE_ID:String = "stage_id";
      
      public static const MOUNT_FUNC:String = "mount_func";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_stage_npc_relation";
       
      
      private var _subFuncIdArr:Array;
      
      public var id:int;
      
      public var stage_id:int;
      
      public var level:int;
      
      public var name:String;
      
      public var icon:int;
      
      public var left_head:int;
      
      public var dialog:String;
      
      public var mount_func:int;
      
      public var sub_func:String;
      
      public var display_npc:int;
      
      public var position:String;
      
      public var rule_discribe:int;
      
      public function StcStageNpcRelationVo()
      {
         super();
      }
      
      public function get subFuncIdArr() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(_subFuncIdArr == null)
         {
            _subFuncIdArr = this.sub_func.split("|");
            _loc1_ = _subFuncIdArr.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _subFuncIdArr[_loc2_] = int(_subFuncIdArr[_loc2_]);
               _loc2_++;
            }
         }
         return _subFuncIdArr;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         stage_id = param1[1];
         level = param1[2];
         name = param1[3];
         icon = param1[4];
         left_head = param1[5];
         dialog = param1[6];
         mount_func = param1[7];
         sub_func = param1[8];
         display_npc = param1[9];
         position = param1[10];
         rule_discribe = param1[11];
      }
   }
}
