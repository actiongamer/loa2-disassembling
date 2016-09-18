package nslm2.modules.cultivates.lotteryHeroModules
{
   import proto.LotteryInfoRes;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.ServerTimer;
   
   public class LHModel
   {
      
      private static var _ins:nslm2.modules.cultivates.lotteryHeroModules.LHModel;
       
      
      private var _panelInfo:LotteryInfoRes;
      
      public var discount:int = 8;
      
      public var discountEndTime:int;
      
      public function LHModel()
      {
         super();
         this.discountEndTime = ServerTimer.ins.second + 25200;
      }
      
      public static function get ins() : nslm2.modules.cultivates.lotteryHeroModules.LHModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.lotteryHeroModules.LHModel();
         }
         return _ins;
      }
      
      public function get panelInfo() : LotteryInfoRes
      {
         return _panelInfo;
      }
      
      public function set panelInfo(param1:LotteryInfoRes) : void
      {
         _panelInfo = param1;
         PlayerModel.ins.changeWealth(21,_panelInfo.point);
      }
      
      public function get canGetReward() : Boolean
      {
         if(this.panelInfo && this.panelInfo.point >= int(DefindConsts.LOTTERY_POINT_FULL))
         {
            return true;
         }
         return false;
      }
   }
}
