package nslm2.modules.battles.battlefields.vos
{
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   
   public class BattleFlagInfoData
   {
       
      
      private var _id:int;
      
      public var ownerId:UInt64;
      
      public var leftCnt:int;
      
      public var outTimeStamp:uint;
      
      public var refreshStamp:uint;
      
      private var name:String;
      
      public var maxCnt:int;
      
      public function BattleFlagInfoData()
      {
         super();
      }
      
      public function get showName() : String
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:String = "";
         if(ownerId)
         {
            _loc1_ = BattlefieldModel.ins.getBgStagePlayerInfo(ownerId).side;
            _loc2_ = LocaleMgr.ins.getStr(50500900 + _loc1_);
            _loc3_ = name + "(" + _loc2_ + ")";
         }
         else
         {
            _loc3_ = name;
         }
         return _loc3_;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set id(param1:int) : void
      {
         if(_id == param1)
         {
            return;
         }
         _id = param1;
         var _loc3_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(_id);
         if(_loc3_.display_npc)
         {
            name = LocaleMgr.ins.getStr(_loc3_.name);
         }
         else
         {
            name = "npc配置错误";
         }
         var _loc2_:StcBgresGatherVo = StcMgr.ins.getVoByColumnValue("static_bgres_gather","display_npc",_loc3_.display_npc);
         if(_loc2_)
         {
            maxCnt = _loc2_.total_yield;
         }
      }
   }
}
