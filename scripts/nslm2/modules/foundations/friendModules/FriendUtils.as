package nslm2.modules.foundations.friendModules
{
   import com.netease.protobuf.UInt64;
   import proto.PlayerFriendApplyReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerFriendApplyRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ProtoUtils;
   import proto.Para;
   import proto.PlayerBaseInfo;
   import proto.GameFriendData;
   import nslm2.common.vo.PlayerVo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   
   public class FriendUtils
   {
       
      
      public function FriendUtils()
      {
         super();
      }
      
      public static function friendApply(param1:UInt64, param2:String) : void
      {
         var _loc3_:PlayerFriendApplyReq = new PlayerFriendApplyReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(7024,_loc3_,server_friendapplyCpl);
      }
      
      public static function server_friendapplyCpl(param1:PlayerFriendApplyRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10602004,ProtoUtils.parseParaArr([param1.content])));
      }
      
      public static function floatMsg_applyAll() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10601007));
      }
      
      public static function floatMsg_applyAgree(param1:String) : void
      {
         var _loc2_:Para = new Para();
         _loc2_.player = new PlayerBaseInfo();
         _loc2_.player.name = param1;
         AlertUtil.float(LocaleMgr.ins.getStr(10603006,ProtoUtils.parseParaArr([_loc2_])));
      }
      
      public static function floatMsg_applyRefuse(param1:String) : void
      {
         var _loc2_:Para = new Para();
         _loc2_.player = new PlayerBaseInfo();
         _loc2_.player.name = param1;
         AlertUtil.float(LocaleMgr.ins.getStr(10603008,ProtoUtils.parseParaArr([_loc2_])));
      }
      
      public static function floatMsg_applyAgreeAll() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10603009));
      }
      
      public static function floatMsg_applyRefuseAll() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10603010));
      }
      
      public static function createGameFriendData(param1:UInt64, param2:String) : GameFriendData
      {
         var _loc3_:GameFriendData = new GameFriendData();
         _loc3_.id = param1;
         _loc3_.name = param2;
         return _loc3_;
      }
      
      public static function gameFrienDataToPlayerVo(param1:GameFriendData, param2:Boolean = true) : PlayerVo
      {
         var _loc3_:PlayerVo = new PlayerVo();
         _loc3_.playerId = param1.id;
         _loc3_.name = param1.name;
         if(param2 == false)
         {
            _loc3_.baseId = param1.baseid;
            _loc3_.fightValue = Uint64Util.toNumber(param1.ability);
            _loc3_.level = param1.level;
            _loc3_.headerIconUrl = UrlLib.headIcon(!!_loc3_.stcNpcVo?_loc3_.stcNpcVo.head_id:String(DefindConsts.roleBaseModel3DId_male));
            _loc3_.signatue = param1.signatue;
            _loc3_.offtime = param1.offtime;
            _loc3_.gmtype = param1.gmType;
            _loc3_.vipInfoVo = VipUtils.qqInfoToVipInfoVo(param1.qqInfo);
         }
         return _loc3_;
      }
      
      public static function createTempFriendData(param1:UInt64, param2:String, param3:int, param4:int, param5:UInt64, param6:int) : GameFriendData
      {
         var _loc7_:GameFriendData = new GameFriendData();
         _loc7_.id = param1;
         _loc7_.name = param2;
         _loc7_.baseid = param4;
         _loc7_.gmType = param3;
         if(param5 == null)
         {
            param5 = new UInt64();
         }
         _loc7_.ability = param5;
         _loc7_.level = 1;
         _loc7_.offtime = 0;
         _loc7_.signatue = "";
         return _loc7_;
      }
   }
}
