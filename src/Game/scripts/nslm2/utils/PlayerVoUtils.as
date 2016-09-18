package nslm2.utils
{
   import nslm2.common.vo.PlayerVo;
   import nslm2.common.model.PlayerModel;
   import proto.PlayerInfo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.fightPlayer.UnitVo;
   import proto.PlayerBaseInfo;
   import proto.PanelBaseInfo;
   import proto.BattlePlayer;
   
   public class PlayerVoUtils
   {
       
      
      public function PlayerVoUtils()
      {
         super();
      }
      
      public static function curPlayerVo() : PlayerVo
      {
         var _loc2_:PlayerInfo = PlayerModel.ins.playerInfo;
         var _loc1_:PlayerVo = new PlayerVo();
         _loc1_.playerId = _loc2_.id;
         _loc1_.name = _loc2_.name;
         _loc1_.level = _loc2_.playerHero.baseInfo.level;
         _loc1_.baseId = _loc2_.playerHero.baseInfo.baseId;
         _loc1_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(_loc1_.playerId,_loc2_.playerHero.baseInfo.baseId);
         _loc1_.vipInfoVo = PlayerModel.ins.vipInfoVo;
         return _loc1_;
      }
      
      public static function unitVoToVo(param1:UnitVo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = Uint64Util.fromString(param1.id);
         _loc2_.baseId = param1.stcNpcVo.id;
         _loc2_.name = param1.name;
         _loc2_.level = !!param1.serVo?param1.serVo.level:int(param1.stcNpcVo.level);
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(_loc2_.playerId,param1.stcNpcVo.id);
         return _loc2_;
      }
      
      public static function unitVoArrToVoArr(param1:Array) : Array
      {
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_.push(unitVoToVo(_loc2_));
         }
         return _loc3_;
      }
      
      public static function playerBaseInfoArrToVoArr(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(playerBaseInfoToVo(_loc3_));
         }
         return _loc2_;
      }
      
      public static function playerBaseInfoToVo(param1:PlayerBaseInfo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.id;
         _loc2_.baseId = param1.npcId;
         _loc2_.name = param1.name;
         _loc2_.level = param1.lv;
         _loc2_.militaryRank = param1.militaryRank;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.id,param1.npcId);
         _loc2_.fightValue = Uint64Util.toNumber(param1.ability);
         return _loc2_;
      }
      
      public static function panelBaseInfoToVo(param1:PanelBaseInfo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.baseId = param1.baseId;
         _loc2_.level = param1.level;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.id,param1.baseId);
         _loc2_.shengjieLv = param1.shengjie;
         return _loc2_;
      }
      
      public static function panelBaseInfoArrToVoArr(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(panelBaseInfoToVo(_loc3_));
         }
         return _loc2_;
      }
      
      public static function battlePlayerToPlayerVo(param1:BattlePlayer) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.baseId = param1.npcId;
         _loc2_.level = param1.level;
         _loc2_.name = param1.name;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(null,param1.npcId);
         return _loc2_;
      }
   }
}
