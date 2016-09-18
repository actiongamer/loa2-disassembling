package nslm2.modules.foundations.activities
{
   import game.ui.activities.render.ActivityProgressRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import proto.ActivityReward;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import game.ui.commons.icons.WealthRenderS5UI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Label;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import com.mz.core.configs.ClientConfig;
   import proto.ActivityProgress;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.LabelUtils;
   import com.mz.core.event.MzEvent;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Button;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import morn.customs.expands.MornExpandUtil;
   
   public class ActivityProgressRender extends ActivityProgressRenderUI implements IObserver
   {
       
      
      private var btnEff:BmcSpriteSheet;
      
      public function ActivityProgressRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : ActivityInfoVo
      {
         return this.dataSource as ActivityInfoVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc21_:Boolean = false;
         var _loc16_:* = null;
         var _loc12_:Boolean = false;
         var _loc17_:Boolean = false;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc22_:Boolean = false;
         var _loc6_:* = null;
         var _loc19_:* = null;
         var _loc23_:int = 0;
         var _loc14_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc18_:int = 0;
         var _loc11_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc13_:Boolean = false;
         .super.dataSource = param1;
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            switchEventListeners(true);
            _loc7_ = ActivityModel.ins.getReward(this.vo.activityId,this.vo.staticActivityReward.id);
            _loc3_ = WealthUtil.costStrToArr(this.vo.staticActivityReward.reward,false);
            _loc3_.sort(WealthUtil.rewardSortFun);
            this.list_reward.repeatX = _loc3_.length;
            this.list_reward.dataSource = _loc3_;
            if(ActivityUtil.isExChangeEvent(this.vo.staticActivityReward))
            {
               _loc5_ = WealthUtil.costStrToArr(this.vo.staticActivityReward.pay).sortOn("sid");
               if(int(this.vo.staticActivityReward.discount) != 0)
               {
                  this.list_cost.itemRender = ActivityCostRender;
               }
               else
               {
                  this.list_cost.itemRender = WealthRenderS5UI;
               }
               this.list_cost.repeatX = _loc5_.length;
               this.list_cost.dataSource = _loc5_;
               this.img_arrow.x = 55 + this.list_cost.width - 54;
               this.list_reward.x = 110 + this.list_cost.width - 54;
               this.box_exchange.width = 192 + this.list_cost.width - 54 - 44;
               this.img_arrow.visible = true;
               this.list_cost.visible = true;
               this.box_exchange.y = 15;
               this.box_exchange.x = 170 - (this.list_cost.width - 54 - 44 + (this.list_reward.repeatX - 1) * 60) / 2;
               this.txt_condAndProgress.text = this.vo.staticActivityReward.rewardCondition;
               _loc9_ = ActivityUtil.getProgressStr(this.vo);
               this.txt_progress.text = LocaleMgr.ins.getStr(999001102) + _loc9_;
               this.txt_progress.visible = true;
               this.txt_vip.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999001103),[Uint64Util.toInt(this.vo.staticActivityReward.__function[0].para2)]);
               this.txt_vip.visible = false;
               _loc21_ = false;
               if(ActivityUtil.isOldExChangeEvent(this.vo.staticActivityReward))
               {
                  if(ActivityUtil.isExChangeEventWithVipCondition(this.vo.staticActivityReward))
                  {
                     if(ActivityUtil.isVipExChangeEventAvail(this.vo))
                     {
                        _loc7_.status = 2;
                        _loc21_ = true;
                     }
                     this.txt_vip.visible = true;
                  }
                  else
                  {
                     this.txt_vip.visible = false;
                     if(ActivityUtil.isExChangeEventWithChargeCondition(this.vo.staticActivityReward))
                     {
                        if(ActivityUtil.isChargeExChangeEventAvail(this.vo))
                        {
                           _loc7_.status = 2;
                           _loc21_ = true;
                        }
                     }
                     else if(_loc7_.status != 3)
                     {
                        _loc7_.status = 2;
                        _loc21_ = true;
                     }
                  }
               }
               _loc12_ = false;
               _loc17_ = false;
               var _loc25_:int = 0;
               var _loc24_:* = list_cost.cells;
               for each(var _loc20_ in list_cost.cells)
               {
                  _loc2_ = _loc20_.dataSource as WealthVo;
                  if(_loc2_.kind == 20)
                  {
                     if(_loc20_.getChildByName("count"))
                     {
                        _loc16_ = _loc20_.getChildByName("count") as Label;
                     }
                     else
                     {
                        _loc16_ = new Label();
                        _loc16_.name = "count";
                     }
                     _loc4_ = PlayerModel.ins.getCountByWealthVo(_loc2_);
                     _loc16_.text = TextFieldUtil.htmlText("(" + _loc4_ + ")",new TextFormat(null,null,_loc2_.showCount > _loc4_?16723968:458496));
                     if(_loc7_.status == 2 && _loc2_.showCount > _loc4_)
                     {
                        _loc7_.status = 1;
                     }
                     _loc16_.align = "center";
                     _loc16_.width = _loc20_.width;
                     _loc16_.y = _loc20_.y + 46;
                     _loc20_.addChild(_loc16_);
                     _loc12_ = true;
                  }
                  else
                  {
                     if(_loc20_.getChildByName("count"))
                     {
                        _loc16_ = _loc20_.getChildByName("count") as Label;
                        _loc16_.dispose();
                        _loc16_ = null;
                     }
                     if(_loc2_.kind == 3 || _loc2_.kind == 4)
                     {
                        _loc17_ = true;
                     }
                  }
                  if(_loc17_ && _loc12_ == false && _loc7_.status == 1)
                  {
                     _loc22_ = true;
                  }
                  if(_loc20_ is ActivityCostRender)
                  {
                     if(ClientConfig.isChineseLang())
                     {
                        (_loc20_ as ActivityCostRender).txt_discount.text = LocaleMgr.ins.getStr(13300007,[((100 - int(this.vo.staticActivityReward.discount)) / 10).toFixed(1)]);
                     }
                     else
                     {
                        (_loc20_ as ActivityCostRender).txt_discount.text = LocaleMgr.ins.getStr(13300007,[this.vo.staticActivityReward.discount]);
                     }
                  }
               }
            }
            else
            {
               this.img_arrow.visible = false;
               this.list_cost.visible = false;
               this.box_exchange.x = 158;
               this.list_reward.x = 0;
               this.txt_condAndProgress.text = this.vo.staticActivityReward.rewardCondition + "\n" + ActivityUtil.getProgressStr(this.vo);
               this.txt_progress.visible = false;
               this.txt_vip.visible = false;
            }
            _loc6_ = ActivityModel.ins.getReward(this.vo.activityId,this.vo.staticActivityReward.id);
            _loc19_ = _loc6_.progress[0];
            if(_loc19_.kind == 5007 || _loc19_.kind == 5008 || _loc19_.kind == 1029)
            {
               _loc23_ = Uint64Util.toInt(vo.staticActivityReward.__function[0].para2);
               _loc14_ = Uint64Util.toInt(_loc19_.para2);
               _loc8_ = _loc23_;
               _loc14_ = _loc14_ > _loc8_?_loc8_:Number(_loc14_);
               if(_loc7_.status != 3)
               {
                  if(_loc14_ < _loc8_)
                  {
                     _loc7_.status = 1;
                  }
                  else if(_loc22_)
                  {
                     _loc7_.status = 2;
                  }
               }
               txt_condAndProgress.text = txt_condAndProgress.text + ("\n" + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000187) + "(" + LocaleConsts.getNumberAbbr3(_loc14_.toString(),3) + "/" + LocaleConsts.getNumberAbbr3(_loc8_.toString(),2) + ")\n",LabelUtils.getCountNeedColor(_loc14_,_loc8_)));
            }
            else if(vo.staticActivityReward.kind == 2)
            {
               _loc18_ = Uint64Util.toInt(vo.staticActivityReward.__function[0].para1);
               _loc11_ = Uint64Util.toInt(_loc19_.para1);
               _loc15_ = _loc18_;
               _loc11_ = _loc11_ > _loc15_?_loc15_:Number(_loc11_);
               if(_loc5_ && (_loc11_ >= _loc15_ || _loc15_ == 0))
               {
                  _loc13_ = true;
                  var _loc27_:int = 0;
                  var _loc26_:* = _loc5_;
                  for each(var _loc10_ in _loc5_)
                  {
                     if(PlayerModel.ins.getCountByWealthVo(_loc10_) < _loc10_.showCount)
                     {
                        _loc13_ = false;
                     }
                  }
                  if(_loc7_.status != 3)
                  {
                     if(_loc13_)
                     {
                        _loc7_.status = 2;
                     }
                     else
                     {
                        _loc7_.status = 1;
                     }
                  }
               }
               else if(_loc7_.status != 3)
               {
                  if(_loc11_ < _loc15_)
                  {
                     _loc7_.status = 1;
                  }
                  else if(_loc22_)
                  {
                     _loc7_.status = 2;
                  }
               }
               if(_loc15_ != 0)
               {
                  txt_condAndProgress.text = txt_condAndProgress.text + ("\n" + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000187) + "(" + LocaleConsts.getNumberAbbr3(_loc11_.toString(),3) + "/" + LocaleConsts.getNumberAbbr3(_loc15_.toString(),2) + ")\n",LabelUtils.getCountNeedColor(_loc11_,_loc15_)));
               }
            }
            else if(ActivityUtil.isExChangeEvent(this.vo.staticActivityReward) && _loc21_)
            {
               if(_loc5_)
               {
                  _loc13_ = true;
                  var _loc29_:int = 0;
                  var _loc28_:* = _loc5_;
                  for each(_loc10_ in _loc5_)
                  {
                     if(PlayerModel.ins.getCountByWealthVo(_loc10_) < _loc10_.showCount)
                     {
                        _loc13_ = false;
                     }
                  }
                  if(_loc7_.status != 3)
                  {
                     if(_loc13_)
                     {
                        _loc7_.status = 2;
                     }
                     else
                     {
                        _loc7_.status = 1;
                     }
                  }
               }
            }
            if(_loc19_.kind == 1000)
            {
               this.txt_condAndProgress.width = 417;
            }
            else
            {
               this.txt_condAndProgress.width = 136;
            }
            if(this.txt_vip.visible == true)
            {
               this.txt_condAndProgress.y = 29;
            }
            else
            {
               this.txt_condAndProgress.commitMeasure();
               this.txt_condAndProgress.centerY = 0;
            }
            refreshBtn(_loc7_.status);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
            switchEventListeners(false);
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ActivityModel.ins.addEventListener("evtRewardCpl",onRewardCpl);
         }
         else
         {
            ActivityModel.ins.removeEventListener("evtRewardCpl",onRewardCpl);
         }
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
         var _loc2_:ActivityInfoVo = param1.data as ActivityInfoVo;
         if(_loc2_.activityId == this.vo.activityId && _loc2_.staticActivityReward == this.vo.staticActivityReward)
         {
            if(!ActivityUtil.isExChangeEvent(this.vo.staticActivityReward) || ActivityUtil.isComplete(_loc2_))
            {
               refreshBtn(3);
            }
         }
      }
      
      private function refreshBtn(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
               if(ActivityModel.ins.getOpenModuleId(this.vo.activityId) == 0)
               {
                  this.btn_reward.mouseEnabled = false;
                  this.btn_reward.style = "按钮大绿";
                  this.btn_reward.filters = [FilterUtil.grayFilter()];
                  this.btn_reward.label = LocaleMgr.ins.getStr(60500005);
               }
               else
               {
                  this.btn_reward.mouseEnabled = true;
                  this.btn_reward.style = "按钮大黄";
                  this.btn_reward.filters = null;
                  this.btn_reward.label = LocaleMgr.ins.getStr(12101001);
               }
               this.btn_reward.visible = true;
               this.img_gotReward.visible = false;
               break;
            case 1:
               this.btn_reward.mouseEnabled = true;
               this.btn_reward.style = "按钮大绿";
               this.btn_reward.visible = true;
               this.img_gotReward.visible = false;
               this.btn_reward.filters = null;
               if(ActivityUtil.isExChangeEvent(this.vo.staticActivityReward))
               {
                  this.btn_reward.label = LocaleMgr.ins.getStr(999000190);
               }
               else
               {
                  this.btn_reward.label = LocaleMgr.ins.getStr(60500004);
               }
               break;
            case 2:
               if(ActivityUtil.isExChangeEvent(this.vo.staticActivityReward))
               {
                  this.btn_reward.label = LocaleMgr.ins.getStr(999000191);
                  this.btn_reward.mouseEnabled = false;
                  this.btn_reward.style = "按钮大绿";
                  this.btn_reward.filters = [FilterUtil.grayFilter()];
                  this.img_gotReward.visible = false;
                  this.btn_reward.visible = true;
                  break;
               }
               this.btn_reward.visible = false;
               this.img_gotReward.visible = true;
               this.btn_reward.filters = [FilterUtil.grayFilter()];
               this.btn_reward.label = LocaleMgr.ins.getStr(41300087);
               break;
         }
         showOrHideBtnEffect(param1);
      }
      
      private function showOrHideBtnEffect(param1:int) : void
      {
         if(param1 == 2)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = -8;
               btnEff.y = -10;
               this.btn_reward.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if(this.btn_reward === _loc5_)
         {
            _loc3_ = ActivityModel.ins.getReward(this.vo.activityId,this.vo.staticActivityReward.id);
            if(_loc3_.status == 1 && !ActivityUtil.isOldExChangeEvent(this.vo.staticActivityReward))
            {
               _loc2_ = ActivityModel.ins.getOpenModuleId(this.vo.activityId);
               if(FuncOpenAutoCtrl.checkOpen(_loc2_) == false)
               {
                  FuncOpenAutoCtrl.showOpenLevelTip(_loc2_);
                  return;
               }
               _loc5_ = _loc2_;
               if(41400 !== _loc5_)
               {
                  if(40408 !== _loc5_)
                  {
                     if(30120 !== _loc5_)
                     {
                        if(11900 !== _loc5_)
                        {
                           ModuleMgr.ins.showModule(_loc2_,null,ModuleMgr.ins.popLayer.curModuleId);
                        }
                        else
                        {
                           ModuleMgr.ins.closeModule(60500);
                           NpcFuncRef.ins.execHandler(11900);
                        }
                     }
                     else
                     {
                        _loc4_ = new RoleInfoModuleParam();
                        _loc4_.init(HeroModel.ins.playerHero,30120);
                        ModuleMgr.ins.showModule(30810,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
                     }
                  }
                  else
                  {
                     ChapterModel.ins.chapterType = 2;
                     ModuleMgr.ins.showModule(40400);
                  }
               }
               else
               {
                  ModuleMgr.ins.closeModule(60500);
                  NpcFuncRef.ins.execHandler(41400);
               }
            }
            else if(ActivityUtil.isExChangeEvent(this.vo.staticActivityReward))
            {
               ModuleMgr.ins.showModule(60550,this.vo,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               ActivityService.ins.getReward(this.vo);
            }
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 60500)
            {
               this.dataSource = this.vo;
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
