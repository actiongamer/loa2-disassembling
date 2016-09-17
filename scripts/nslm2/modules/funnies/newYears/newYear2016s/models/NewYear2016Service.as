package nslm2.modules.funnies.newYears.newYear2016s.models
{
   import flash.events.EventDispatcher;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.utils.ServerTimer;
   import proto.SpringLoginInfoRes;
   import proto.SpringWelcomeGodInfoRes;
   import proto.SpringWelfareInfoRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import morn.core.handlers.Handler;
   import proto.SpringBeatBossNumRes;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpringFirecrackerRewardVo;
   import proto.SpringWelfareInfoRes.GetRewadInfo;
   import com.mz.core.utils.ArrayUtil;
   import proto.SpringLoginReq;
   import proto.SpringFireCrackerReq;
   import proto.SpringFireCrackerRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.SpringGetGodRewardRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import proto.SpringGetWelfareRewardReq;
   import proto.SpringFightBossStartRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016BossFightModuleShowParam;
   import proto.SpringFightBossEndReq;
   import proto.SpringFightBossEndRes;
   import proto.SpringBeatBossLastRankRes;
   import proto.SpringGetBeatBossRankRewardRes;
   
   public class NewYear2016Service extends EventDispatcher
   {
      
      public static const GOD_FIRE_CRACKER_STC_ITEM_ID:int = 83010;
      
      public static const DAILY_MAX:int = 10;
      
      public static const GOD_WISH_VALUE_TOTAL:int = 100;
      
      public static const EVT_LOGIN_INFO_GET_REWARD:String = "EVT_LOGIN_INFO_GET_REWARD";
      
      public static const EVT_WELCOME_GOD_USE_FIRE_CRACKER:String = "EVT_WELCOME_GOD_USE_FIRE_CRACKER";
      
      public static const EVT_WELCOME_GOD_GET_REWARD:String = "EVT_WELCOME_GOD_GET_REWARD";
      
      public static const EVT_WELFARE_INFO_NOTIFY:String = "EVT_WELFARE_INFO_NOTIFY";
      
      public static const EVT_WELFARE_GET_REWARD:String = "EVT_WELFARE_GET_REWARD";
      
      private static var _ins:nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
       
      
      public var loginInfoRes:SpringLoginInfoRes;
      
      public var bossNum:int;
      
      public var welcomeGodInfoRes:SpringWelcomeGodInfoRes;
      
      public var welfareInfoRes:SpringWelfareInfoRes;
      
      private var initHandler;
      
      private var springLoginGetDay:int;
      
      private var springFireCrackerNum:int;
      
      public var welfare_id:int;
      
      public function NewYear2016Service()
      {
         super();
         ServerEngine.ins.addAlwayHandler(6253,server_bossNum_notify);
         ServerEngine.ins.addAlwayHandler(6245,server_welfareInfo_notify);
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service();
         }
         return _ins;
      }
      
      public function get nowLoginIndex() : int
      {
         var _loc2_:int = 0;
         var _loc1_:FuncOpenTimeVo = NpcFuncService.ins.getOpenTimeVo(13311);
         if(_loc1_)
         {
            _loc2_ = Math.floor((ServerTimer.ins.second - _loc1_.startTime) / 86400);
            if(!(_loc2_ >= 0 && _loc2_ < 10))
            {
               _loc2_ = 0;
            }
         }
         else
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      public function countNpcFuncCountAll() : void
      {
         this.countNpcFuncCount_daily();
         this.countNpcFuncCount_boss();
         this.countNpcFuncCount_god1();
         this.countNpcFuncCount_god2();
         this.countNpcFuncCount_main();
      }
      
      public function countNpcFuncCount_daily() : void
      {
         NpcFuncService.ins.changeCount(13311,!!this.canGetDailyLogin()?1:0);
      }
      
      public function countNpcFuncCount_boss() : void
      {
      }
      
      public function countNpcFuncCount_god1() : void
      {
         NpcFuncService.ins.changeCount(13313,!!this.canGetWelcomeGod()?1:0);
      }
      
      public function countNpcFuncCount_god2() : void
      {
         NpcFuncService.ins.changeCount(13314,!!this.canGetWelfareReward()?1:0);
      }
      
      public function countNpcFuncCount_main() : void
      {
         if(NpcFuncService.ins.getVo(13311).count > 0 || NpcFuncService.ins.getVo(13312).count > 0 || NpcFuncService.ins.getVo(13313).count > 0 || NpcFuncService.ins.getVo(13314).count > 0)
         {
            NpcFuncService.ins.changeCount(13310,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13310,0);
         }
      }
      
      public function init(param1:*) : void
      {
         this.initHandler = param1;
         getLoginInfo();
      }
      
      public function initBeatBossNum(param1:int) : void
      {
         this.bossNum = param1;
      }
      
      public function getLoginInfo() : void
      {
         if(NpcFuncService.ins.isOpenTime(13311))
         {
            ServerEngine.ins.send(6242,null,server_loginInfo_cpl);
         }
         else
         {
            this.getWelcomeGodInfo();
         }
      }
      
      private function server_loginInfo_cpl(param1:SpringLoginInfoRes, param2:ServerEvent) : void
      {
         loginInfoRes = param1;
         this.getWelcomeGodInfo();
      }
      
      public function server_bossNum(param1:Function) : void
      {
         if(NpcFuncService.ins.isOpenTime(13312))
         {
            ServerEngine.ins.send(6253,null,new Handler(server_bossNum_cpl,[param1]));
         }
         else
         {
            this.getWelcomeGodInfo();
         }
      }
      
      private function server_bossNum_cpl(param1:*, param2:SpringBeatBossNumRes, param3:ServerEvent) : void
      {
         bossNum = param2.num;
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      private function server_bossNum_notify(param1:SpringBeatBossNumRes) : void
      {
         bossNum = param1.num;
      }
      
      public function getWelcomeGodInfo() : void
      {
         if(NpcFuncService.ins.isOpenTime(13313))
         {
            ServerEngine.ins.send(6243,null,server_godInfo_cpl);
         }
         else
         {
            this.initCpl();
         }
      }
      
      private function server_godInfo_cpl(param1:SpringWelcomeGodInfoRes, param2:ServerEvent) : void
      {
         this.welcomeGodInfoRes = param1;
         this.getWelfareInfo();
      }
      
      private function getWelfareInfo() : void
      {
         if(NpcFuncService.ins.isOpenTime(13313))
         {
            ServerEngine.ins.send(6245,null,server_welfareInfo_cpl);
         }
         else
         {
            this.initCpl();
         }
      }
      
      private function server_welfareInfo_cpl(param1:SpringWelfareInfoRes, param2:ServerEvent) : void
      {
         this.welfareInfoRes = param1;
         this.validateWelfareInfoRes();
         this.initCpl();
      }
      
      private function server_welfareInfo_notify(param1:SpringWelfareInfoRes) : void
      {
         this.welfareInfoRes = param1;
         this.validateWelfareInfoRes();
         this.dispatchEvent(new Event("EVT_WELFARE_INFO_NOTIFY"));
      }
      
      private function validateWelfareInfoRes() : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc6_:Array = StcMgr.ins.getSpringFirecrackerRewardTable().array;
         _loc6_.sortOn("id",16);
         var _loc5_:Array = welfareInfoRes.getRew;
         var _loc8_:Array = [];
         var _loc4_:int = _loc6_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc2_ = _loc6_[_loc7_];
            _loc1_ = new GetRewadInfo();
            _loc1_.id = _loc2_.id;
            _loc3_ = ArrayUtil.findByAttr(_loc5_,GetRewadInfo.ID.name,_loc2_.id);
            if(_loc3_)
            {
               _loc1_.get = _loc3_.get;
            }
            else
            {
               _loc1_.get = false;
            }
            _loc8_.push(_loc1_);
            _loc7_++;
         }
         this.welfareInfoRes.getRew = _loc8_;
      }
      
      private function initCpl() : void
      {
         this.countNpcFuncCount_daily();
         this.countNpcFuncCount_boss();
         this.countNpcFuncCount_god1();
         this.countNpcFuncCount_god2();
         this.countNpcFuncCount_main();
         if(this.initHandler)
         {
            Handler.execute(initHandler);
            initHandler = null;
         }
      }
      
      public function server_springLogin(param1:uint) : void
      {
         var _loc2_:SpringLoginReq = new SpringLoginReq();
         springLoginGetDay = param1;
         _loc2_.day = param1;
         ServerEngine.ins.send(6249,_loc2_,server_springLogin_cpl);
      }
      
      private function server_springLogin_cpl(param1:*, param2:ServerEvent) : void
      {
         this.loginInfoRes.loginInfos[springLoginGetDay - 1] = 1;
         this.countNpcFuncCount_daily();
         this.countNpcFuncCount_main();
         this.dispatchEvent(new Event("EVT_LOGIN_INFO_GET_REWARD"));
      }
      
      public function server_springFireCracker(param1:uint) : void
      {
         var _loc2_:SpringFireCrackerReq = new SpringFireCrackerReq();
         springFireCrackerNum = param1;
         _loc2_.num = param1;
         ServerEngine.ins.send(6247,_loc2_,server_fireCracker_cpl);
      }
      
      private function server_fireCracker_cpl(param1:SpringFireCrackerRes, param2:ServerEvent) : void
      {
         var _loc3_:int = param1.wishValue - this.welcomeGodInfoRes.wishValue;
         this.welfareInfoRes.total = this.welfareInfoRes.total + _loc3_;
         AlertUtil.float(LocaleMgr.ins.getStr(13310103,[springFireCrackerNum,_loc3_]));
         this.welcomeGodInfoRes.wishValue = param1.wishValue;
         this.countNpcFuncCount_god1();
         this.countNpcFuncCount_god2();
         this.countNpcFuncCount_main();
         this.dispatchEvent(new Event("EVT_WELCOME_GOD_USE_FIRE_CRACKER"));
      }
      
      public function server_getWelcomeGodReward() : void
      {
         ServerEngine.ins.send(6244,null,server_godReward_cpl);
      }
      
      private function server_godReward_cpl(param1:SpringGetGodRewardRes, param2:ServerEvent) : void
      {
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.itemArrToWealthVoArr(param2.dataNotifyCacheVo.change.addItems));
         this.welcomeGodInfoRes.wishValue = param1.wishValue;
         this.countNpcFuncCount_god1();
         this.countNpcFuncCount_main();
         this.dispatchEvent(new Event("EVT_WELCOME_GOD_GET_REWARD"));
      }
      
      public function server_springGetWelfareReward(param1:int) : void
      {
         var _loc2_:SpringGetWelfareRewardReq = new SpringGetWelfareRewardReq();
         this.welfare_id = param1;
         _loc2_.id = param1;
         ServerEngine.ins.send(6248,_loc2_,server_welfareReward_cpl);
      }
      
      private function server_welfareReward_cpl(param1:*, param2:ServerEvent) : void
      {
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(StcMgr.ins.getSpringFirecrackerRewardVo(this.welfare_id).reward));
         (this.welfareInfoRes.getRew[this.welfare_id - 1] as GetRewadInfo).get = true;
         this.countNpcFuncCount_god2();
         this.countNpcFuncCount_main();
         this.dispatchEvent(new Event("EVT_WELFARE_GET_REWARD"));
      }
      
      public function server_bossStart() : void
      {
         ServerEngine.ins.send(6250,null,server_bossStart_cpl);
      }
      
      private function server_bossStart_cpl(param1:SpringFightBossStartRes, param2:ServerEvent) : void
      {
         ModuleMgr.ins.showModule(13315,new NewYear2016BossFightModuleShowParam(param1));
      }
      
      public function server_springFightBossEnd(param1:uint, param2:uint, param3:Array, param4:Function) : void
      {
         var _loc5_:SpringFightBossEndReq = new SpringFightBossEndReq();
         _loc5_.id = param1;
         _loc5_.playMode = param2;
         _loc5_.stp = param3;
         ServerEngine.ins.send(6251,_loc5_,new Handler(server_bossEnd_cpl,[param4]));
      }
      
      private function server_bossEnd_cpl(param1:*, param2:SpringFightBossEndRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_rewardRank(param1:Function) : void
      {
         ServerEngine.ins.send(6255,null,new Handler(server_rewardRank_cpl,[param1]));
      }
      
      private function server_rewardRank_cpl(param1:*, param2:SpringBeatBossLastRankRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_getBeatBossRankReward(param1:Function = null) : void
      {
         ServerEngine.ins.send(6254,null,new Handler(server_getBeatBossRankReward_cpl,[param1]));
      }
      
      private function server_getBeatBossRankReward_cpl(param1:*, param2:SpringGetBeatBossRankRewardRes, param3:ServerEvent) : void
      {
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param2.reward));
         NpcFuncService.ins.changeCount(13312,0);
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function isOpenTimeOne() : Boolean
      {
         return NpcFuncService.ins.isOpenTime(13311) || NpcFuncService.ins.isOpenTime(13312) || NpcFuncService.ins.isOpenTime(13313);
      }
      
      public function canGetDailyLogin() : Boolean
      {
         var _loc3_:int = 0;
         if(loginInfoRes == null)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         var _loc1_:int = 10;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            if(_loc3_ <= this.nowLoginIndex)
            {
               if(this.loginInfoRes.loginInfos[_loc3_] != true)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
               continue;
            }
            break;
         }
         return _loc2_;
      }
      
      public function canGetDailyLoginOne(param1:int) : Boolean
      {
         if(loginInfoRes == null)
         {
            return false;
         }
         return this.loginInfoRes.loginInfos[param1] != true;
      }
      
      public function canGetWelcomeGod() : Boolean
      {
         if(welcomeGodInfoRes)
         {
            return this.welcomeGodInfoRes.wishValue >= 100;
         }
         return false;
      }
      
      public function canGetWelfareReward() : Boolean
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         if(welfareInfoRes == null)
         {
            return false;
         }
         var _loc3_:int = this.welfareInfoRes.getRew.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = this.welfareInfoRes.getRew[_loc5_];
            _loc2_ = StcMgr.ins.getSpringFirecrackerRewardVo(_loc1_.id);
            _loc4_ = _loc2_.num;
            if(_loc1_.get == false && this.welfareInfoRes.total >= _loc4_)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
   }
}
