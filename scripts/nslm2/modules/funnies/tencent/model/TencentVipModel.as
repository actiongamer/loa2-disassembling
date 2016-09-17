package nslm2.modules.funnies.tencent.model
{
   import flash.events.EventDispatcher;
   import proto.QqGiftInfoRes;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import nslm2.nets.sockets.ServerEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.QqNewGiftReq;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import proto.QqDayNormalGiftReq;
   import proto.QqDayHighGiftReq;
   import com.mz.core.utils.ArrayUtil;
   import proto.BoolMap;
   import proto.QqLevelGiftReq;
   
   public class TencentVipModel extends EventDispatcher
   {
      
      public static const EVT_GET_NEW_GIFT:String = "EVT_GET_NEW_GIFT";
      
      public static const EVT_GET_GIFT_DAILY:String = "EVT_GET_GIFT_DAILY";
      
      public static const EVT_GET_GIFT_DAILY_YEAR:String = "EVT_GET_GIFT_DAILY_YEAR";
      
      public static const EVT_GET_GIFT_LEVEL_UP:String = "EVT_GET_GIFT_LEVEL_UP";
      
      public static const BLUE_NORMAL:int = 1;
      
      public static const YELLOW_NORMAL:int = 2;
      
      public static const BLUE_YEARLY:int = 3;
      
      public static const YELLOW_YEARLY:int = 4;
      
      public static const BLUE_LUX:int = 5;
      
      public static const YELLOW_LUX:int = 6;
      
      public static const TITLE_START_YELLOW:int = 60710001;
      
      public static const TITLE_START_BLUE:int = 60710501;
      
      private static var _ins:nslm2.modules.funnies.tencent.model.TencentVipModel;
      
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.tencent.model.TencentVipModel();
         }
      }
      
      public var qqGiftInfo:QqGiftInfoRes;
      
      public function TencentVipModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.tencent.model.TencentVipModel
      {
         return _ins;
      }
      
      public function curVipKind() : int
      {
         return 2;
      }
      
      public function getQQGiftInfo(param1:*) : void
      {
         ServerEngine.ins.send(2105,null,new Handler(server_giftInfo_cpl,[param1]));
      }
      
      private function server_giftInfo_cpl(param1:*, param2:QqGiftInfoRes, param3:ServerEvent) : void
      {
         qqGiftInfo = param2;
         this.reCount();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function reCount() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         if(EnvConfig.ins.vipType == 2)
         {
            if(PlayerModel.ins.vipInfoVo.curQQVip)
            {
               _loc1_ = true;
               if(qqGiftInfo.blueNewVip == false)
               {
                  _loc1_ = false;
                  NpcFuncService.ins.changeCount(60712,1);
                  _loc2_ = 1;
               }
               else
               {
                  NpcFuncService.ins.changeCount(60712,0);
               }
               if(qqGiftInfo.blueDayVip == false)
               {
                  _loc1_ = false;
                  NpcFuncService.ins.changeCount(60714,1);
                  _loc2_ = 1;
               }
               else
               {
                  NpcFuncService.ins.changeCount(60714,0);
               }
               if(PlayerModel.ins.vipInfoVo.isQQYear || PlayerModel.ins.vipInfoVo.isQQLux)
               {
                  if(qqGiftInfo.blueHighVip == false)
                  {
                     _loc1_ = false;
                     NpcFuncService.ins.changeCount(60715,1);
                     _loc2_ = 1;
                  }
                  else
                  {
                     NpcFuncService.ins.changeCount(60715,0);
                  }
               }
               else
               {
                  _loc1_ = false;
                  NpcFuncService.ins.changeCount(60715,0);
               }
               if(this.giftLevelUpWaitGet().length > 0)
               {
                  _loc1_ = false;
                  NpcFuncService.ins.changeCount(60713,1);
                  _loc2_ = 1;
               }
               else
               {
                  NpcFuncService.ins.changeCount(60713,0);
               }
            }
            else
            {
               _loc1_ = false;
               NpcFuncService.ins.changeCount(60712,0);
               NpcFuncService.ins.changeCount(60714,0);
               NpcFuncService.ins.changeCount(60715,0);
               NpcFuncService.ins.changeCount(60713,0);
            }
         }
         else if(PlayerModel.ins.vipInfoVo.curQQVip)
         {
            _loc1_ = true;
            if(qqGiftInfo.yellowNewVip == false)
            {
               _loc1_ = false;
               NpcFuncService.ins.changeCount(60712,1);
               _loc2_ = 1;
            }
            else
            {
               NpcFuncService.ins.changeCount(60712,0);
            }
            if(qqGiftInfo.yellowDayVip == false)
            {
               _loc1_ = false;
               NpcFuncService.ins.changeCount(60714,1);
               _loc2_ = 1;
            }
            else
            {
               NpcFuncService.ins.changeCount(60714,0);
            }
            if(PlayerModel.ins.vipInfoVo.isQQYear || PlayerModel.ins.vipInfoVo.isQQLux)
            {
               if(qqGiftInfo.yellowHighVip == false)
               {
                  _loc1_ = false;
                  NpcFuncService.ins.changeCount(60715,1);
                  _loc2_ = 1;
               }
               else
               {
                  NpcFuncService.ins.changeCount(60715,0);
               }
            }
            else
            {
               _loc1_ = false;
               NpcFuncService.ins.changeCount(60715,0);
            }
            if(this.giftLevelUpWaitGet().length > 0)
            {
               _loc1_ = false;
               NpcFuncService.ins.changeCount(60713,1);
               _loc2_ = 1;
            }
            else
            {
               NpcFuncService.ins.changeCount(60713,0);
            }
         }
         else
         {
            _loc1_ = false;
            NpcFuncService.ins.changeCount(60712,0);
            NpcFuncService.ins.changeCount(60714,0);
            NpcFuncService.ins.changeCount(60715,0);
            NpcFuncService.ins.changeCount(60713,0);
         }
         NpcFuncService.ins.changeCount(60710,_loc2_,_loc1_);
         if(EnvConfig.ins.vipType == 2 && PlayerModel.ins.vipInfoVo.needShowValid)
         {
            NpcFuncService.ins.changeCount(60721,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(60721,0);
         }
      }
      
      public function server_qqNewGift() : void
      {
         var _loc1_:QqNewGiftReq = new QqNewGiftReq();
         _loc1_.kind = EnvConfig.ins.vipType;
         ServerEngine.ins.send(2101,_loc1_,server_newGift_cpl);
      }
      
      private function server_newGift_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc3_:* = null;
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               this.qqGiftInfo.yellowNewVip = 1;
               _loc3_ = WealthUtil.costStrToArr(DefindConsts.YELLOW_NEW);
               break;
            case 1:
               this.qqGiftInfo.blueNewVip = 1;
               _loc3_ = WealthUtil.costStrToArr(DefindConsts.BLUE_NEW);
         }
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         reCount();
         this.dispatchEvent(new Event("EVT_GET_NEW_GIFT"));
      }
      
      public function server_qqGiftDaily() : void
      {
         var _loc1_:QqDayNormalGiftReq = new QqDayNormalGiftReq();
         _loc1_.kind = EnvConfig.ins.vipType;
         ServerEngine.ins.send(2102,_loc1_,server_normalGift_cpl);
      }
      
      private function server_normalGift_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc3_:Array = WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_LV(PlayerModel.ins.vipInfoVo.curQQVip));
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               this.qqGiftInfo.yellowDayVip = 1;
               break;
            case 1:
               this.qqGiftInfo.blueDayVip = 1;
         }
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         reCount();
         this.dispatchEvent(new Event("EVT_GET_GIFT_DAILY"));
      }
      
      public function server_qqDayHighGift() : void
      {
         var _loc1_:QqDayHighGiftReq = new QqDayHighGiftReq();
         _loc1_.kind = EnvConfig.ins.vipType;
         ServerEngine.ins.send(2103,_loc1_,server_highGift_cpl);
      }
      
      private function server_highGift_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc3_:Array = [];
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               this.qqGiftInfo.yellowHighVip = 1;
               if(PlayerModel.ins.qqInfo.isYellowyearVip)
               {
                  _loc3_ = _loc3_.concat(WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_YEAR()));
               }
               if(PlayerModel.ins.qqInfo.isYellowHighvip)
               {
                  _loc3_ = _loc3_.concat(WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_LUX()));
               }
               break;
            case 1:
               this.qqGiftInfo.blueHighVip = 1;
               if(PlayerModel.ins.qqInfo.isBlueyearVip)
               {
                  _loc3_ = _loc3_.concat(WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_YEAR()));
               }
               if(PlayerModel.ins.qqInfo.isBlueHighvip)
               {
                  _loc3_ = _loc3_.concat(WealthUtil.costStrToArr(DefindConsts.getQQVip_DAY_LUX()));
                  break;
               }
         }
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         reCount();
         this.dispatchEvent(new Event("EVT_GET_GIFT_DAILY_YEAR"));
      }
      
      public function canGetLvup(param1:int) : Boolean
      {
         var _loc2_:Array = giftLevelUpInfo();
         if(ArrayUtil.indexByAttr(_loc2_,BoolMap.KEY.name,param1) == -1)
         {
            return true;
         }
         return false;
      }
      
      public function giftLevelUpInfo() : Array
      {
         var _loc1_:* = null;
         if(EnvConfig.ins.vipType == 2)
         {
            _loc1_ = nslm2.modules.funnies.tencent.model.TencentVipModel.ins.qqGiftInfo.blueLevelVip;
         }
         else
         {
            _loc1_ = nslm2.modules.funnies.tencent.model.TencentVipModel.ins.qqGiftInfo.yellowLevelVip;
         }
         return _loc1_;
      }
      
      private function resetGiftLevelUpInfo() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = giftLevelUpInfo();
         _loc2_.splice(0,_loc2_.length);
         var _loc1_:int = 6;
         _loc4_ = 1;
         while(_loc4_ <= _loc1_)
         {
            _loc3_ = new BoolMap();
            _loc3_.key = _loc4_;
            _loc3_.value = true;
            _loc2_.push(_loc3_);
            _loc4_++;
         }
      }
      
      public function giftLevelUpWaitGet() : Array
      {
         var _loc6_:* = 0;
         var _loc5_:* = null;
         var _loc1_:Array = [];
         var _loc4_:int = Math.floor(PlayerModel.ins.level / 10);
         _loc4_ = Math.min(6,_loc4_);
         var _loc3_:* = _loc4_;
         _loc6_ = uint(1);
         while(_loc6_ <= _loc3_)
         {
            _loc1_.push(_loc6_);
            _loc6_++;
         }
         var _loc2_:Array = giftLevelUpInfo();
         _loc3_ = int(_loc2_.length);
         _loc6_ = uint(0);
         while(_loc6_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc6_];
            if(_loc5_.value)
            {
               ArrayUtil.removeItem(_loc1_,_loc5_.key);
            }
            _loc6_++;
         }
         return _loc1_;
      }
      
      public function server_qqLevelGift() : void
      {
         var _loc1_:QqLevelGiftReq = new QqLevelGiftReq();
         _loc1_.kind = EnvConfig.ins.vipType;
         _loc1_.level = 0;
         ServerEngine.ins.send(2104,_loc1_,server_levelGift_cpl);
      }
      
      private function server_levelGift_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc6_:int = 0;
         var _loc3_:Array = giftLevelUpWaitGet();
         var _loc5_:Array = [];
         var _loc4_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc5_.concat(WealthUtil.costStrToArr(DefindConsts.getQQVIP_LVUP(_loc3_[_loc6_] * 10)));
            _loc6_++;
         }
         this.resetGiftLevelUpInfo();
         FloatUtil.showGetItemsDisplayPanel(_loc5_);
         reCount();
         this.dispatchEvent(new Event("EVT_GET_GIFT_LEVEL_UP"));
      }
   }
}
