package nslm2.common.vo
{
   import com.netease.protobuf.UInt64;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class PlayerVo
   {
       
      
      public var playerId:UInt64;
      
      public var disID:int;
      
      private var _baseId:int;
      
      public var stcNpcVo:StcNpcVo;
      
      public var joinTime:uint;
      
      public var name:String;
      
      private var _gmtype:int;
      
      public var level:int;
      
      public var fightValue:Number;
      
      public var vipInfoVo:nslm2.common.vo.VipInfoVo;
      
      public var militaryRank:int;
      
      private var _headerIconUrl:String;
      
      public var signatue:String;
      
      public var offtime:int;
      
      public var shengjieLv:int;
      
      public function PlayerVo()
      {
         super();
      }
      
      public function get gmtype() : int
      {
         return _gmtype;
      }
      
      public function set gmtype(param1:int) : void
      {
         _gmtype = param1;
      }
      
      public function get baseId() : int
      {
         return _baseId;
      }
      
      public function set baseId(param1:int) : void
      {
         if(_baseId != param1)
         {
            _baseId = param1;
            this.stcNpcVo = StcMgr.ins.getNpcVo(_baseId);
         }
      }
      
      public function get quality() : int
      {
         if(stcNpcVo == null)
         {
            return 1;
         }
         if(EnvConfig.ins.useServer && playerId != null && PlayerModel.ins.playerInfo && HeroModel.ins.isCurPlayerHero(this.playerId))
         {
            return MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank);
         }
         return stcNpcVo.quality;
      }
      
      public function get militaryQuality() : int
      {
         if(militaryRank != 0)
         {
            return MilitaryModel.ins.getPlayerQuality(militaryRank);
         }
         return quality;
      }
      
      public function set headerIconUrl(param1:String) : void
      {
         _headerIconUrl = param1;
      }
      
      public function get headerIconUrl() : String
      {
         if(_headerIconUrl == null && baseId != 0)
         {
            _headerIconUrl = HeroInfoUtil.getHeadIconUrl(null,baseId);
         }
         return _headerIconUrl;
      }
   }
}
