package nslm2.modules.cultivates.lotteryHeroModules
{
   import morn.core.components.Image;
   import flash.geom.Point;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   
   public class LHConsts
   {
      
      private static var _ins:nslm2.modules.cultivates.lotteryHeroModules.LHConsts;
      
      public static var GET_REWARD_ICON:Image;
      
      public static const STATE_NONE:int = 4;
      
      public static const STATE_INDEX:int = 1;
      
      public static const STATE_NORMAL:int = 11;
      
      public static const STATE_ADVAN:int = 12;
      
      public static const STATE_SCECE_RESULT_EFF:int = 31;
      
      public static const STATE_RESULT_NORMAL:int = 32;
      
      public static const STATE_RESULT_ADVAN:int = 33;
      
      public static const LOTTERY_ID_ONE_COIN:int = 1000;
      
      public static const LOTTERY_ID_TEN_COIN:int = 1010;
      
      public static const LOTTERY_ID_ONE_DIAMOND:int = 2000;
      
      public static const LOTTERY_ID_TEN_DIAMOND:int = 2010;
      
      public static const highHeroQuality:int = 4;
      
      public static const FREE_TIMES_MAX:int = 3;
      
      public static const MSG_LOTTERY_HERO_GET_REWARD_CLOSE:String = "MSG_LOTTERY_HERO_GET_REWARD_CLOSE";
      
      public static const MSG_LOTTERY_HERO_GET_REWARD_PROMPT:String = "MSG_LOTTERY_HERO_GET_REWARD_PROMPT";
      
      public static const MSG_LOTTERY_HERO_GET_REWARD:String = "MSG_LOTTERY_HERO_GET_REWARD";
      
      public static const MSG_LOTTERY_HERO_TEST:String = "MSG_LOTTERY_HERO_TEST";
      
      public static const MSG_LOTTERY_HERO:String = "msg_lottery_hero";
      
      public static const MSG_LOTTERY_DIRECT:String = "msg_lottery_direct";
      
      public static const MSG_LOTTERY_HIGH_NAME:String = "MSG_LOTTERY_HIGH_NAME";
      
      public static const MSG_LOTTERY_HERO_CLOSE:String = "msg_lottery_hero_close";
      
      public static const MSG_LOTTERY_HERO_CHANGE_MAGIC_POINT:String = "MSG_LOTTERY_HERO_CHANGE_MAGIC_POINT";
      
      public static const EVT_RESULT_AGAIN:String = "evt_result_again";
      
      public static const EVT_RESULT_CLOSE:String = "evtResultClose";
      
      public static const EVT_RETRY:String = "evtRetry";
      
      public static const LOTTERY_ENTER_LOTTERY:String = "lottery_enter_lottery";
      
      public static const LOTTERY_BACK_TO_FIRST:String = "lottery_back_to_first";
      
      public static const LOTTERY_LIGHT_INITPOINT:Point = new Point(-293,-321);
      
      public static const LOTTERY_LIGHT_ENDPOINT:Point = new Point(121,185);
       
      
      public var costTypeNormal:WealthVo;
      
      public var costTypeAdvancedItem:WealthVo;
      
      public var costTypeAdvancedDiamond:WealthVo;
      
      public function LHConsts()
      {
         super();
         costTypeNormal = WealthVo.parseCostStr(StcMgr.ins.getLotteryVo(1000).cost_res);
         var _loc1_:StcLotteryVo = StcMgr.ins.getLotteryVo(2000);
         costTypeAdvancedItem = WealthVo.parseCostStr(_loc1_.spare_cost_res);
         costTypeAdvancedDiamond = WealthVo.parseCostStr(_loc1_.cost_res);
      }
      
      public static function get ins() : nslm2.modules.cultivates.lotteryHeroModules.LHConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.lotteryHeroModules.LHConsts();
         }
         return _ins;
      }
   }
}
