package nslm2.modules.dungeons.ctrls
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Component;
   import game.ui.commons.comps.others.RedPointNewUI;
   import morn.core.components.Tab;
   import morn.core.components.Button;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.modules.funnies.newYears.valentine2016.service.ValentineService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.funnies.newYears.lantern2016.service.LanternService;
   import nslm2.modules.funnies.qihoo.QihooService;
   import nslm2.modules.funnies.duowan.DuowanService;
   import nslm2.modules.funnies.sogou.SougouService;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
   import nslm2.modules.foundations.vip.model.VipModel;
   import com.mz.core.logging.Log;
   import nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.foundations.angelFund.model.AngelFundModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.event.WealthChangeEvent;
   
   public class FuncOpenAutoCtrl implements IDispose, IObserver
   {
      
      private static var funcBtnObj:Object;
       
      
      private var ui:Component;
      
      private var stcVo:StcFunctionVo;
      
      public function FuncOpenAutoCtrl(param1:int, param2:Component)
      {
         super();
         stcVo = StcMgr.ins.getFunctionVo(param1);
         if(stcVo && stcVo.kind == 1)
         {
            this.ui = param2;
            validate();
            ObserverMgr.ins.regObserver(this);
         }
      }
      
      public static function updateFuncBtnNew(param1:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         funcBtnObj = {};
         var _loc3_:Array = StcMgr.ins.getFunctionTable().array;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc6_] as StcFunctionVo;
            if(_loc4_.icon_symbol && _loc4_.icon_symbol != "0" && _loc4_.level <= PlayerModel.ins.level)
            {
               _loc5_ = String(_loc4_.icon_symbol).split(":");
               funcBtnObj[_loc4_.id.toString()] = int(_loc5_[0]);
               _loc2_ = 1;
               while(_loc2_ < _loc5_.length)
               {
                  funcBtnObj[_loc5_[_loc2_]] = int(_loc5_[0]);
                  _loc2_++;
               }
            }
            _loc6_++;
         }
         if(param1)
         {
            ObserverMgr.ins.sendNotice("MSG_UPDATE_FUNCTION_NEW");
         }
      }
      
      public static function getFuncStateType(param1:int) : int
      {
         if(Boolean(funcBtnObj) == false)
         {
            updateFuncBtnNew(false);
         }
         return int(funcBtnObj[param1.toString()]);
      }
      
      public static function updateFuncBtnStateTip(param1:int, param2:View) : void
      {
         var _loc3_:int = 0;
         if(param2.hasOwnProperty("txt") && param2.hasOwnProperty("imgNew") && param2.hasOwnProperty("imgHot"))
         {
            _loc3_ = getFuncStateType(param1);
            if(_loc3_ == 0)
            {
               param2.visible = false;
            }
            else
            {
               param2.visible = true;
               if(_loc3_ == 1)
               {
                  (param2["txt"] as Label).text = "New";
                  (param2["imgNew"] as Image).visible = true;
                  (param2["imgHot"] as Image).visible = false;
               }
               else
               {
                  (param2["txt"] as Label).text = "Hot";
                  (param2["imgNew"] as Image).visible = false;
                  (param2["imgHot"] as Image).visible = true;
               }
            }
         }
      }
      
      public static function checkFuncBtnNew(param1:int, param2:Component, param3:int = 0) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = getFuncStateType(param1);
         if(_loc5_ > 0)
         {
            if(param2.getChildByName("FuncRedPointNewUI") == null)
            {
               _loc4_ = new RedPointNewUI();
               updateFuncBtnStateTip(param1,_loc4_);
               if(param3 == 1)
               {
                  _loc4_.x = 100;
                  _loc4_.y = -4;
               }
               else
               {
                  _loc4_.x = -6;
                  _loc4_.y = -4;
               }
               _loc4_.name = "FuncRedPointNewUI";
               param2.addChild(_loc4_);
            }
         }
      }
      
      public static function hideFuncBtnNew(param1:Component) : void
      {
         if(param1.getChildByName("FuncRedPointNewUI") != null)
         {
            param1.removeChild(param1.getChildByName("FuncRedPointNewUI"));
         }
      }
      
      public static function checkFuncTabNew(param1:Array, param2:Tab) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _loc4_ = 0;
         while(_loc4_ < param2.items.length)
         {
            _loc3_ = param2.items[_loc4_] as Button;
            if(_loc3_ && param1.length > 0)
            {
               checkFuncBtnNew(param1[_loc4_],_loc3_);
            }
            _loc4_++;
         }
      }
      
      public static function checkOpen(param1:int) : Boolean
      {
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:Number = NaN;
         var _loc10_:Number = NaN;
         if(ClientConfig.firstBattle == 1)
         {
            return false;
         }
         if(EnvConfig.ins.useServer || true)
         {
            if(param1 == 13310)
            {
               if(NewYear2016Service.ins.isOpenTimeOne() == false)
               {
                  return false;
               }
            }
            else
            {
               if(param1 == 13320)
               {
                  return ValentineService.ins.getOpenStatus();
               }
               if(param1 == 900500 || param1 == 13110 || param1 == 13332)
               {
                  if(!NpcFuncService.ins.isOpenTime(param1))
                  {
                     return false;
                  }
               }
               else if(param1 == 13400)
               {
                  _loc7_ = NpcFuncService.ins.getOpenTimeVo(13400);
                  if(_loc7_ && _loc7_.startTime < ServerTimer.ins.second && _loc7_.endTime > ServerTimer.ins.second)
                  {
                     if(_loc7_.startTime - ServerTimer.ins.openServerTimeZero <= 1209600)
                     {
                        return false;
                     }
                  }
                  else
                  {
                     return false;
                  }
               }
               else
               {
                  if(param1 == 13330)
                  {
                     return LanternService.ins.getOpenStatus();
                  }
                  if(param1 == 60721)
                  {
                     if(EnvConfig.ins.vipType != 2)
                     {
                        return false;
                     }
                     if(NpcFuncService.ins.getVo(60721).count == 0)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60731)
                  {
                     if(QihooService.ins.isAllGet)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60741)
                  {
                     if(DuowanService.ins.hadGet)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60751)
                  {
                     if(SougouService.ins.hadGet1)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60752)
                  {
                     if(SougouService.ins.hadGet2)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60760)
                  {
                     if(NpcFuncService.ins.getVo(60760).extra == true)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 60510)
                  {
                     if(NpcFuncService.ins.getVo(60510).extra == true || EnvConfig.ins.ptId == 592)
                     {
                        return false;
                     }
                  }
                  else if(param1 == 13333)
                  {
                     if(!NpcFuncService.ins.isOpenTime(13333))
                     {
                        return false;
                     }
                  }
                  else
                  {
                     if(param1 == 13386)
                     {
                        return TowerService.ins.isOpenTime_all();
                     }
                     if(param1 == 13355)
                     {
                        if(Day51Service.ins.isEventOpen() == false)
                        {
                           return false;
                        }
                     }
                     else
                     {
                        if(param1 == 9900004)
                        {
                           if(OlmpicSelCountryModel.ins.isOpen())
                           {
                              return true;
                           }
                           return false;
                        }
                        _loc9_ = ActivityModel.ins.getForeshowFuncIds();
                        _loc8_ = _loc9_.indexOf(param1);
                        if(_loc8_ >= 0)
                        {
                           _loc6_ = StcMgr.ins.getFunctionVo(60777);
                           if(_loc6_ == null)
                           {
                              return false;
                           }
                           if(PlayerModel.ins.level >= _loc6_.level && _loc6_.canOpen)
                           {
                              return true;
                           }
                           return false;
                        }
                     }
                  }
               }
            }
            _loc6_ = StcMgr.ins.getFunctionVo(param1);
            if(_loc6_ && (_loc6_.kind == 1 || _loc6_.kind == 2))
            {
               _loc3_ = PlayerModel.ins.level;
               if(_loc6_.canOpen == false)
               {
                  return false;
               }
               if(_loc3_ < _loc6_.level)
               {
                  return false;
               }
               if(_loc6_.id == 60540)
               {
                  if(EnvConfig.ins.vipType != 2)
                  {
                     if(EnvConfig.ins.vipType != 1)
                     {
                        if(ServerTimer.ins.second < ServerTimer.ins.openServerTimeZero + TimeUtils.countDayToSecond(3))
                        {
                           return false;
                        }
                     }
                  }
               }
               if(_loc6_.id == 60100 && ServerTimer.ins.openServerTimeZero + TimeUtils.countDayToSecond(3) < ServerTimer.ins.second)
               {
                  return false;
               }
               if(_loc6_.id == 13100 && SevenDaysService.ins.isDead)
               {
                  return false;
               }
               if(_loc6_.id == 13300 && (FourteenDaysService.ins.isDead || FourteenDaysService.ins.isNotOpen))
               {
                  return false;
               }
               if(_loc6_.id == 60200 && VipModel.ins.canGetFirstChargeReward == false)
               {
                  return false;
               }
               if(_loc6_.id == 60520 && VipModel.ins.canGetFavoriteReward == false)
               {
                  return false;
               }
               if(_loc6_.id == 90001 && VipModel.ins.canGetGameLikeReward == false)
               {
                  return false;
               }
               if(_loc6_.id == 90001)
               {
                  Log.info("这个是点赞功能，canGetGameLikeReward：" + VipModel.ins.canGetGameLikeReward);
               }
               if(_loc6_.id == 60763)
               {
                  _loc11_ = ServerTimer.ins.second;
                  _loc12_ = AbilityRankModel.ins.activityStartTime + TimeUtils.countDayToSecond(7 + int(DefindConsts.CHONGJI_OPENTIME)) - 3605;
                  if(_loc11_ >= _loc12_)
                  {
                     return false;
                  }
               }
               if(_loc6_.id == 60560)
               {
                  _loc11_ = ServerTimer.ins.second;
                  _loc5_ = OpActivityStaticDataModel.ins.getActivityOpenTime(1);
                  _loc4_ = OpActivityStaticDataModel.ins.getActivityOpenTime(2);
                  if(_loc5_ || _loc4_)
                  {
                     if(_loc5_ && _loc4_)
                     {
                        _loc2_ = Math.min(_loc5_.startTm,_loc4_.startTm);
                        _loc10_ = Math.max(_loc5_.endTm,_loc4_.endTm);
                     }
                     else
                     {
                        if(_loc5_)
                        {
                           _loc2_ = _loc5_.startTm;
                           _loc10_ = _loc5_.endTm;
                        }
                        if(_loc4_)
                        {
                           _loc2_ = _loc4_.startTm;
                           _loc10_ = _loc4_.endTm;
                        }
                     }
                     if(_loc11_ < _loc2_ || _loc11_ >= _loc10_)
                     {
                        return false;
                     }
                     NpcFuncService.ins.changeCount(60560,1);
                  }
                  else
                  {
                     return false;
                  }
               }
               if(param1 == 13350)
               {
                  return LuckTreeService.ins.isEventOpen();
               }
               if(param1 == 900600)
               {
                  return QuestionModel.ins.isOpen;
               }
               if(param1 == 13376)
               {
                  if(DragonBoatService.ins.isOpenTime() == false)
                  {
                     return false;
                  }
               }
               if(_loc6_.id == 60800)
               {
                  if(DialModel.getIns(60800).isEventOpen())
                  {
                     return true;
                  }
                  return false;
               }
               if(_loc6_.id == 60810)
               {
                  if(DialModel.getIns(60810).isEventOpen())
                  {
                     return true;
                  }
                  return false;
               }
               if(_loc6_.id == 900400)
               {
                  if(AngelFundModel.ins.isEventOpen())
                  {
                     AngelFundModel.ins.refreshRedPoint();
                     return true;
                  }
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function getOpenLevel(param1:int) : int
      {
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(param1);
         if(_loc2_)
         {
            return _loc2_.level;
         }
         return 1;
      }
      
      public static function showOpenLevelTip(param1:int) : void
      {
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(param1);
         if(_loc2_ && (_loc2_.kind == 1 || _loc2_.kind == 2))
         {
            AlertUtil.float(_loc2_.descString + LocaleMgr.ins.getStr(30100044,[_loc2_.level]));
         }
      }
      
      public static function getOpenLevelTipString(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:StcFunctionVo = StcMgr.ins.getFunctionVo(param1);
         if(_loc3_ && (_loc3_.kind == 1 || _loc3_.kind == 2))
         {
            _loc2_ = _loc3_.descString + LocaleMgr.ins.getStr(30100044,[_loc3_.level]);
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.ui = null;
      }
      
      public function validate() : void
      {
         this.ui.setVisibleList("STC_FUNC_OPEN",checkOpen(this.stcVo.id));
      }
      
      public function getFocusNotices() : Array
      {
         return ["wealthChange"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("wealthChange" === _loc4_)
         {
            _loc3_ = param2 as WealthChangeEvent;
            if(_loc3_.wealthType == 1010)
            {
               validate();
            }
         }
      }
   }
}
