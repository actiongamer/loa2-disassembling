package nslm2.modules.foundations.vip.consts
{
   import nslm2.common.vo.VipInfoVo;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import proto.PlayerBaseInfo;
   import proto.PlayerQQInfo;
   
   public class VipUtils
   {
       
      
      public function VipUtils()
      {
         super();
      }
      
      public static function curVipInfoVo() : VipInfoVo
      {
         var _loc1_:VipInfoVo = new VipInfoVo();
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
            case 1:
               return qqInfoToVipInfoVo(PlayerModel.ins.qqInfo);
         }
      }
      
      public static function vipInfoVo(param1:PlayerBaseInfo) : VipInfoVo
      {
         var _loc2_:VipInfoVo = new VipInfoVo();
         if(param1 == null)
         {
            return _loc2_;
         }
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
            case 1:
               return qqInfoToVipInfoVo(param1.qqInfo);
         }
      }
      
      public static function qqInfoToVipInfoVo(param1:PlayerQQInfo) : VipInfoVo
      {
         var _loc2_:VipInfoVo = new VipInfoVo();
         if(param1)
         {
            switch(int(EnvConfig.ins.vipType) - 1)
            {
               case 0:
                  _loc2_.qqVip = param1.yellowVipLevel;
                  _loc2_.isQQVip = param1.isYellowVip;
                  _loc2_.isQQYear = param1.isYellowyearVip;
                  _loc2_.isQQLux = param1.isYellowHighvip;
                  break;
               case 1:
                  _loc2_.qqVip = param1.blueVipLevel;
                  _loc2_.isQQVip = param1.isBlueVip;
                  _loc2_.isQQYear = param1.isBlueyearVip;
                  _loc2_.isQQLux = param1.isBlueHighvip;
                  _loc2_.vipValid = param1.blueVipValid;
            }
         }
         return _loc2_;
      }
      
      public static function curVipLv(param1:PlayerBaseInfo) : int
      {
         if(param1 == null)
         {
            return 0;
         }
         if(param1.qqInfo)
         {
            switch(int(EnvConfig.ins.vipType) - 1)
            {
               case 0:
                  return !!param1.qqInfo.isYellowVip?param1.qqInfo.yellowVipLevel:0;
               case 1:
                  return !!param1.qqInfo.isBlueVip?param1.qqInfo.blueVipLevel:0;
            }
         }
         return 0;
      }
   }
}
