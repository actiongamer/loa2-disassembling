package nslm2.modules.foundations.vip.model
{
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.ClientConfig;
   import flash.events.Event;
   import morn.core.utils.URLUtils;
   import com.mz.core.mgrs.UIMgr;
   import proto.QqAddgoodsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.QqAddgoodsRes;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcVipVo;
   import nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.vip.service.VipService;
   import nslm2.modules.foundations.vip.vo.VipVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   
   public class VipModel
   {
      
      private static var _ins:nslm2.modules.foundations.vip.model.VipModel;
       
      
      public var currentDiamond:int = -1;
      
      public var buyStatusArr:Array;
      
      public var canGetGameLikeReward:Boolean = true;
      
      private const KEYWORD_ARRAY1:Array = [LocaleMgr.ins.getStr(999000372),LocaleMgr.ins.getStr(999000373)];
      
      private const KEYWORD_ARRAY2:Array = [LocaleMgr.ins.getStr(999000374),LocaleMgr.ins.getStr(999000375),LocaleMgr.ins.getStr(999000376),LocaleMgr.ins.getStr(999000377),LocaleMgr.ins.getStr(999000378)];
      
      private var stc:Array;
      
      public var firstCharge:Boolean;
      
      public var canGetFavoriteReward:Boolean = true;
      
      public var canGetFirstChargeReward:Boolean = true;
      
      public var canGetClientDownGift:Boolean;
      
      public var addedToFavorite:Boolean = false;
      
      public var haveCharged:Boolean = false;
      
      public var silverDay:int = -1;
      
      public var goldDay:int = -1;
      
      public function VipModel()
      {
         stc = StcMgr.ins.getVipTable().array.sortOn("sort",16);
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.vip.model.VipModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.vip.model.VipModel();
         }
         return _ins;
      }
      
      public function gotoCharge() : void
      {
         if(EnvConfig.ins.showQQModule)
         {
            ModuleMgr.ins.showModule(60723);
         }
         else if(EnvConfig.ins.ptId == 2303 && ClientConfig.gameId == "160")
         {
            CallJsMrg.ins.bigPointCharge();
         }
         else if(ClientConfig.gameId == "186")
         {
            if(ClientConfig.airData)
            {
               bpPayBack = function(param1:Event):void
               {
                  var _loc2_:Object = JSON.parse(String(urlLoader.data));
                  if(_loc2_ != null && _loc2_.hasOwnProperty("shop_url"))
                  {
                     URLUtils.openWindow(_loc2_.shop_url);
                  }
               };
               var urlLoader:URLLoader = new URLLoader();
               var urlRequest:URLRequest = new URLRequest(ClientConfig.airData.bp_charge);
               urlLoader.addEventListener("complete",bpPayBack);
               urlLoader.load(urlRequest);
            }
            else
            {
               CallJsMrg.ins.bigPointCharge();
            }
         }
         else if(EnvConfig.ins.ptId == 686 && ClientConfig.gameId == "181")
         {
            CallJsMrg.ins.ruXpCharge();
         }
         else if(EnvConfig.ins.ptId == 2306)
         {
            CallJsMrg.ins.japanCharge();
         }
         else
         {
            URLUtils.openWindow(ClientConfig.chargeURL);
         }
      }
      
      public function showPopWin() : void
      {
         URLUtils.callJS("popWin.showWin(686,556,\"充值\",\"http://pay.youzu.com/gamePay?game_id=135&server_id=" + ClientConfig.district + "&account=" + ClientConfig.playId + "\")");
         UIMgr.stage.addEventListener("mouseDown",closePopWin);
      }
      
      private function closePopWin(... rest) : void
      {
         URLUtils.callJS("popWin.closeWin()");
         UIMgr.stage.removeEventListener("mouseDown",closePopWin);
      }
      
      public function qq_addGoods(param1:int) : void
      {
         var _loc2_:QqAddgoodsReq = new QqAddgoodsReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(2100,_loc2_,qq_addGoods_cpl);
      }
      
      private function qq_addGoods_cpl(param1:QqAddgoodsRes) : void
      {
         QQVipUtils.buy(param1.urlParams,EnvConfig.ins.isQQTest);
      }
      
      public function getDiamondPrice(param1:String) : int
      {
         if(int(param1) != 0)
         {
            return StcMgr.ins.getGlobalPriceVo(int(param1)).price;
         }
         return 0;
      }
      
      public function get needDiamond() : int
      {
         var _loc2_:StcVipVo = StcMgr.ins.getVipVo(10000);
         var _loc3_:int = currentDiamond;
         var _loc1_:int = 15;
         while(_loc1_ > 0 && _loc3_ - getDiamondPrice(_loc2_["vip_" + _loc1_]) < 0)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function get isUsingClient() : Boolean
      {
         if(EnvConfig.ins.ptId == 15)
         {
            if(EnvConfig.ins.weiDuan == 1)
            {
               return true;
            }
            return false;
         }
         if(EnvConfig.ins.showQQModule)
         {
            if(QQWeiDuanGiftService.ins.checkIsFromWeiDuan())
            {
               return true;
            }
            return false;
         }
         if(EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 2303 || EnvConfig.ins.ptId == 2284 || EnvConfig.ins.ptId == 2283 || EnvConfig.ins.ptId == 2302)
         {
            if(EnvConfig.ins.weiDuan > 0)
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      public function haveGiftsToBuy() : Boolean
      {
         var _loc1_:int = 0;
         if(buyStatusArr)
         {
            _loc1_ = 0;
            while(_loc1_ < PlayerModel.ins.vip)
            {
               if(!buyStatusArr[_loc1_])
               {
                  return true;
               }
               _loc1_++;
            }
         }
         else
         {
            VipService.ins.getCurrentDiamond();
         }
         return false;
      }
      
      public function haveGetVip0Gift() : Boolean
      {
         if(buyStatusArr)
         {
            return buyStatusArr[0];
         }
         return false;
      }
      
      public function getVipValueArr(param1:VipVo, param2:Boolean = false) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < stc.length)
         {
            if((stc[_loc4_] as StcVipVo).is_show != 0 || param2)
            {
               _loc3_.push(addExternalInfo(LocaleMgr.ins.getStr(stc[_loc4_].name),addToArr(param1.vip_level,_loc4_),_loc4_));
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function addExternalInfo(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:String = checkIsZero(param2);
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < KEYWORD_ARRAY1.length)
         {
            if(param1.indexOf(KEYWORD_ARRAY1[_loc5_]) != -1)
            {
               if(param1 == LocaleMgr.ins.getStr(999000379))
               {
                  return _loc4_ == "-"?_loc4_:_loc4_ + LocaleMgr.ins.getStr(999000380);
               }
               return _loc4_ == "-"?_loc4_:_loc4_ + LocaleMgr.ins.getStr(999000381);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < KEYWORD_ARRAY2.length)
         {
            if(param1.indexOf(KEYWORD_ARRAY2[_loc5_]) != -1)
            {
               if(param1 == LocaleMgr.ins.getStr(999000377) || param1 == LocaleMgr.ins.getStr(999000378))
               {
                  return param2 * 100 + "%";
               }
               return _loc4_ == "-"?_loc4_:_loc4_ + "%";
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function checkIsZero(param1:String) : String
      {
         return int(param1) == 0?"-":param1;
      }
      
      private function addToArr(param1:int, param2:int) : String
      {
         switch(int(param1) - -1)
         {
            case 0:
               return LocaleMgr.ins.getStr((stc[param2] as StcVipVo).name);
            case 1:
               return (stc[param2] as StcVipVo).vip_0;
            case 2:
               return (stc[param2] as StcVipVo).vip_1;
            case 3:
               return (stc[param2] as StcVipVo).vip_2;
            case 4:
               return (stc[param2] as StcVipVo).vip_3;
            case 5:
               return (stc[param2] as StcVipVo).vip_4;
            case 6:
               return (stc[param2] as StcVipVo).vip_5;
            case 7:
               return (stc[param2] as StcVipVo).vip_6;
            case 8:
               return (stc[param2] as StcVipVo).vip_7;
            case 9:
               return (stc[param2] as StcVipVo).vip_8;
            case 10:
               return (stc[param2] as StcVipVo).vip_9;
            case 11:
               return (stc[param2] as StcVipVo).vip_10;
            case 12:
               return (stc[param2] as StcVipVo).vip_11;
            case 13:
               return (stc[param2] as StcVipVo).vip_12;
            case 14:
               return (stc[param2] as StcVipVo).vip_13;
            case 15:
               return (stc[param2] as StcVipVo).vip_14;
            case 16:
               return (stc[param2] as StcVipVo).vip_15;
         }
      }
      
      public function getVipValue(param1:int, param2:int = -1) : String
      {
         var _loc3_:* = 0;
         var _loc4_:StcVipVo = StcMgr.ins.getVipVo(param1);
         if(param2 > -1 && param2 < 16)
         {
            _loc3_ = param2;
         }
         else
         {
            _loc3_ = int(PlayerModel.ins.vip);
         }
         switch(int(_loc3_))
         {
            case 0:
               return _loc4_.vip_0;
            case 1:
               return _loc4_.vip_1;
            case 2:
               return _loc4_.vip_2;
            case 3:
               return _loc4_.vip_3;
            case 4:
               return _loc4_.vip_4;
            case 5:
               return _loc4_.vip_5;
            case 6:
               return _loc4_.vip_6;
            case 7:
               return _loc4_.vip_7;
            case 8:
               return _loc4_.vip_8;
            case 9:
               return _loc4_.vip_9;
            case 10:
               return _loc4_.vip_10;
            case 11:
               return _loc4_.vip_11;
            case 12:
               return _loc4_.vip_12;
            case 13:
               return _loc4_.vip_13;
            case 14:
               return _loc4_.vip_14;
            case 15:
               return _loc4_.vip_15;
         }
      }
      
      public function getNextUpValue(param1:int, param2:int = -1) : String
      {
         var _loc4_:Number = getVipValue(param1);
         var _loc5_:int = 15 - PlayerModel.ins.vip;
         var _loc3_:* = -1;
         while(_loc5_ > 0)
         {
            _loc3_ = Number(getVipValue(param1,15 - _loc5_ + 1));
            if(_loc3_ <= _loc4_)
            {
               _loc5_--;
               continue;
            }
            break;
         }
         return _loc5_ == false?_loc5_.toString():15 - _loc5_ + 1 + "," + (_loc3_ == -1?Number(getVipValue(param1,15 - _loc5_ + 1)):Number(_loc3_));
      }
      
      public function getVipGiftItemArr(param1:int = -1) : Array
      {
         var _loc2_:* = 0;
         var _loc3_:* = null;
         if(param1 > -1 && param1 < 16)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = int(PlayerModel.ins.vip);
         }
         var _loc4_:Array = WealthUtil.dropGroupIDToWealthVoArr(int(getVipValue(10010,_loc2_).split("|")[0]));
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            if(_loc5_.kind == 1)
            {
               _loc3_ = _loc5_;
            }
         }
         if(_loc3_)
         {
            _loc4_.splice(_loc4_.indexOf(_loc3_),1);
            _loc4_.push(_loc3_);
         }
         return _loc4_;
      }
      
      public function getVipGiftPrice(param1:int = -1) : String
      {
         var _loc2_:* = 0;
         if(param1 > -1 && param1 < 16)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = int(PlayerModel.ins.vip);
         }
         return getVipValue(10010,_loc2_).split("|")[1];
      }
   }
}
