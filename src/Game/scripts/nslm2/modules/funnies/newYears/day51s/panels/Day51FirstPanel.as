package nslm2.modules.funnies.newYears.day51s.panels
{
   import game.ui.newYears.day51s.panels.Day51FirstPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.utils.WealthUtil;
   import nslm2.common.uiEffects.IconFlyEff;
   import com.greensock.TweenLite;
   import proto.MineSweepPanelRes;
   import proto.MineSweepInfo;
   import nslm2.modules.funnies.newYears.day51s.services.Day51DigVo;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.MapUtils;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51RewardIcon;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.StaticMineSweepRewardItemModel;
   import com.game.shared.motion.viewMotion.MotionLineFixTimeParam;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class Day51FirstPanel extends Day51FirstPanelUI implements IViewStackPage, IObserver
   {
      
      public static const HELP_TIP_SHOW_KEY:String = "day51.HELP_TIP_SHOW_KEY";
      
      public static const NO_SHOW_KEY_ONE_KEY:String = "Day51.NO_SHOW_KEY_ONE_KEY";
      
      public static const NO_SHOW_KEY_RESET:String = "Day51.NO_SHOW_KEY_ONE_KEY";
       
      
      private var cdCtrl:TextCDCtrlS2;
      
      private var iconFlayEffArr:Array;
      
      private var remainCplTime:int;
      
      public function Day51FirstPanel()
      {
         iconFlayEffArr = [];
         super();
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(15);
         this.cdCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,textCDCpl);
         if(_loc1_)
         {
            this.cdCtrl.start(_loc1_.endTm);
         }
         this.btn_do1.label = LocaleMgr.ins.getStr(133550004);
         this.btn_do10.label = LocaleMgr.ins.getStr(133550005);
         this.btn_help.label = LocaleMgr.ins.getStr(9113360);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_help_tip.text = LocaleMgr.ins.getStr(133550016);
         this.box_help_tip.mouseEvent = false;
         this.box_help_tip.visible = LocalData.insCurPlayer.load("day51.HELP_TIP_SHOW_KEY",true);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000444) + " " + TimeUtils.hisCNWithDay(param1);
      }
      
      private function textCDCpl() : void
      {
         this.txt_cd.text = LocaleMgr.ins.getStr(10000024);
         ObserverMgr.ins.sendNotice("MSG_DAY51_SWITCH_TIME_OVER",15);
      }
      
      public function get service() : Day51Service
      {
         return Day51Service.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.mouseEvent = true;
         txt_cpl_tip1.visible = false;
         ObserverMgr.ins.regObserver(this);
         this.render_cost.wealthVo = WealthUtil.createCountItemVo(83230);
         this.render_cost2.wealthVo = WealthUtil.countVo(36);
         refreshOneKeyPrice();
         this.costRender10.wealthVo = WealthUtil.createWealthVo(service.infoRes.diaType,0,this.service.priceMode.resetPrice);
         this.refreshUI();
         this.countDigAllMustHaveNot();
      }
      
      public function viewStackOut() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         ObserverMgr.ins.unregObserver(this);
         if(iconFlayEffArr)
         {
            _loc2_ = iconFlayEffArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = iconFlayEffArr[_loc3_];
               _loc1_.forceStop();
               _loc3_++;
            }
         }
         iconFlayEffArr = [];
         TweenLite.killDelayedCallsTo(this.showCplTip);
         TweenLite.killDelayedCallsTo(this.flyItem2);
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         viewStackOut();
         super.dispose();
      }
      
      private function refreshUI() : void
      {
         refreshScore();
         this.refreshRemain();
         refreshDigList();
         refreshBest();
         refreshOneKeyPrice();
      }
      
      private function refreshDigList(param1:MineSweepPanelRes = null) : void
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(param1 == null)
         {
            param1 = this.service.infoRes.panel;
         }
         var _loc2_:Array = createEmptyDigVoList();
         var _loc6_:int = param1.info.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1.info[_loc7_];
            _loc4_ = _loc5_.y * 8 + _loc5_.x;
            _loc3_ = _loc2_[_loc4_];
            _loc3_.info = _loc5_;
            _loc7_++;
         }
         this.list_reward.dataSource = _loc2_;
      }
      
      private function createEmptyDigVoList() : Array
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc3_:int = 64;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new Day51DigVo();
            _loc2_.x = _loc4_ % 8;
            _loc2_.y = Math.floor(_loc4_ / 8);
            _loc1_.push(_loc2_);
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function refreshBest() : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc3_:int = this.service.infoRes.panel.bestItem.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.service.infoRes.panel.bestItem[_loc5_];
            _loc2_ = WealthUtil.parseCostStr(this.service.getRewardById(_loc4_).item);
            if(_loc2_)
            {
               _loc1_.push(_loc2_);
            }
            _loc5_++;
         }
         this.list_bag.dataSource = _loc1_;
      }
      
      private function refreshScore() : void
      {
         this.txt_score.text = LocaleMgr.ins.getStr(13350007) + ":" + this.service.infoRes.panel.myScore;
      }
      
      private function refreshRemain(param1:int = -1) : void
      {
         this.txt_bagName.text = LocaleMgr.ins.getStr(133550001,[param1 == -1?this.service.remainDigCount:int(param1)]);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_help !== _loc3_)
         {
            if(this.btn_do1 !== _loc3_)
            {
               if(this.btn_do10 === _loc3_)
               {
                  if(service.infoRes.diaType == 3)
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(133550015,[this.service.priceMode.resetPrice]),btn_reset_yes,null,"Day51.NO_SHOW_KEY_ONE_KEY");
                  }
                  else
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(133550025,[this.service.priceMode.resetPrice]),btn_reset_yes,null,"Day51.NO_SHOW_KEY_ONE_KEY");
                  }
               }
            }
            else if(this.costRender1.spareCost.isEnough)
            {
               btn_oneKey_yes();
            }
            else if(service.infoRes.diaType == 3)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(133550014,[this.service.oneKeyPrice]),btn_oneKey_yes,null,"Day51.NO_SHOW_KEY_ONE_KEY");
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(133550024,[this.service.oneKeyPrice]),btn_oneKey_yes,null,"Day51.NO_SHOW_KEY_ONE_KEY");
            }
         }
         else
         {
            LocalData.insCurPlayer.save("day51.HELP_TIP_SHOW_KEY",false);
            this.box_help_tip.visible = false;
            ModuleMgr.ins.showModule(13360,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function btn_oneKey_yes() : void
      {
         service.server_mineSweepOneKey_cpl(server_mineSweepOneKey_cpl);
      }
      
      private function btn_reset_yes() : void
      {
         service.server_mineSweepReset(server_mineSweepReset_cpl);
      }
      
      private function server_mineSweepOneKey_cpl(param1:MineSweepPanelRes) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         refreshScore();
         refreshRemain(0);
         var _loc4_:int = param1.info.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.info[_loc5_];
            _loc2_ = this.list_reward.cells[MapUtils.xyToIndex(_loc3_.x,_loc3_.y,8)] as Day51RewardIcon;
            if(_loc2_.vo.info == null)
            {
               _loc2_.vo.info = _loc3_;
               _loc2_.dataSource = _loc2_.vo;
               digOne(_loc3_);
            }
            _loc5_++;
         }
         digCpl();
         refreshOneKeyPrice();
      }
      
      private function countDigMustHaveNot(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         _loc3_ = this.getCellByXY(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Day51DigVo = _loc3_.vo;
         if(_loc4_.info)
         {
            if(_loc4_.info.isNumber == true)
            {
               this.countDigRoundMustHaveNot(_loc4_.x,_loc4_.y);
            }
            countDigRoundMustHaveNot(_loc4_.x - 1,_loc4_.y - 1);
            countDigRoundMustHaveNot(_loc4_.x,_loc4_.y - 1);
            countDigRoundMustHaveNot(_loc4_.x + 1,_loc4_.y - 1);
            countDigRoundMustHaveNot(_loc4_.x + 1,_loc4_.y);
            countDigRoundMustHaveNot(_loc4_.x + 1,_loc4_.y + 1);
            countDigRoundMustHaveNot(_loc4_.x,_loc4_.y + 1);
            countDigRoundMustHaveNot(_loc4_.x - 1,_loc4_.y + 1);
            countDigRoundMustHaveNot(_loc4_.x - 1,_loc4_.y);
         }
      }
      
      private function countDigAllMustHaveNot() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.list_reward.commitMeasure();
         var _loc2_:int = this.list_reward.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list_reward.cells[_loc3_] as Day51RewardIcon;
            this.countDigRoundMustHaveNot(_loc1_.vo.x,_loc1_.vo.y);
            _loc3_++;
         }
      }
      
      private function countDigRoundMustHaveNot(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         _loc3_ = this.getCellByXY(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:Day51DigVo = _loc3_.vo;
         if(_loc5_.info && _loc5_.info.isNumber == true)
         {
            _loc4_ = 0;
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x - 1,_loc5_.y - 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x,_loc5_.y - 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x + 1,_loc5_.y - 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x + 1,_loc5_.y);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x + 1,_loc5_.y + 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x,_loc5_.y + 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x - 1,_loc5_.y + 1);
            _loc4_ = _loc4_ + checkDigHaveItem(_loc5_.x - 1,_loc5_.y);
            _loc6_ = _loc5_.info.id - _loc4_;
            if(_loc6_ == 0)
            {
               checkDigMustHaveNot(_loc5_.x - 1,_loc5_.y - 1);
               checkDigMustHaveNot(_loc5_.x,_loc5_.y - 1);
               checkDigMustHaveNot(_loc5_.x + 1,_loc5_.y - 1);
               checkDigMustHaveNot(_loc5_.x + 1,_loc5_.y);
               checkDigMustHaveNot(_loc5_.x + 1,_loc5_.y + 1);
               checkDigMustHaveNot(_loc5_.x,_loc5_.y + 1);
               checkDigMustHaveNot(_loc5_.x - 1,_loc5_.y + 1);
               checkDigMustHaveNot(_loc5_.x - 1,_loc5_.y);
            }
         }
      }
      
      private function checkDigHaveItem(param1:int, param2:int) : int
      {
         var _loc3_:* = null;
         _loc3_ = this.getCellByXY(param1,param2);
         if(_loc3_)
         {
            if(_loc3_.vo.info && _loc3_.vo.info.isNumber == false)
            {
               return 1;
            }
         }
         return 0;
      }
      
      private function refreshOneKeyPrice() : void
      {
         var _loc3_:int = service.getNullDigCount();
         var _loc2_:int = Math.min(service.infoRes.resetInfo.maxTimes,_loc3_);
         var _loc1_:StcLotteryVo = new StcLotteryVo();
         _loc1_.spare_cost_res = WealthUtil.toWealthStr(20,service.infoRes.resetInfo.item,_loc2_);
         _loc1_.cost_res = WealthUtil.toWealthStr(service.infoRes.diaType,0,_loc2_ * service.infoRes.resetInfo.diamond);
         service.oneKeyPrice = _loc2_ * service.infoRes.resetInfo.diamond;
         this.costRender1.lotteryVo = _loc1_;
      }
      
      private function checkDigMustHaveNot(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         _loc3_ = this.getCellByXY(param1,param2);
         if(_loc3_)
         {
            if(_loc3_.vo.info == null && _loc3_.vo.mustHaveNot == false)
            {
               _loc3_.vo.mustHaveNot = true;
               _loc3_.dataSource = _loc3_.vo;
               return;
            }
         }
      }
      
      private function getCellByXY(param1:int, param2:int) : Day51RewardIcon
      {
         if(param1 >= 0 && param1 < 8 && param2 >= 0 && param2 < 8)
         {
            return this.list_reward.cells[MapUtils.xyToIndex(param1,param2,8)] as Day51RewardIcon;
         }
         return null;
      }
      
      private function server_mineSweepReset_cpl() : void
      {
         this.refreshUI();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_DAY51_SCORE_CHANGE","MSG_DAY51_DIG","MSG_DAY51_ALL_ITEM_CPL"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if("MSG_DAY51_SCORE_CHANGE" !== _loc5_)
         {
            if("MSG_DAY51_DIG" !== _loc5_)
            {
               if("MSG_DAY51_ALL_ITEM_CPL" === _loc5_)
               {
                  digCpl();
                  refreshOneKeyPrice();
               }
            }
            else
            {
               this.refreshRemain();
               _loc4_ = param2 as MineSweepInfo;
               _loc3_ = this.list_reward.cells[MapUtils.xyToIndex(_loc4_.x,_loc4_.y,8)] as Day51RewardIcon;
               _loc3_.vo.info = _loc4_;
               _loc3_.dataSource = _loc3_.vo;
               digOne(_loc4_);
               countDigMustHaveNot(_loc4_.x,_loc4_.y);
               refreshOneKeyPrice();
            }
         }
         else
         {
            this.refreshScore();
         }
      }
      
      private function digOne(param1:MineSweepInfo) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         if(param1.isNumber == false)
         {
            _loc2_ = this.list_reward.cells[MapUtils.xyToIndex(param1.x,param1.y,8)] as Day51RewardIcon;
            _loc3_ = new BmcSpriteSheet();
            _loc3_.x = _loc2_.width / 2 + 8;
            _loc3_.y = _loc2_.height / 2;
            _loc3_.setAnchor(0.5,0.5);
            _loc3_.setScaleXY(0.3,0.3);
            _loc3_.init(5002,1,"all",false);
            _loc2_.addChild(_loc3_);
            _loc5_ = this.service.getRewardById(param1.id);
            _loc4_ = WealthUtil.parseCostStr(_loc5_.item);
            flyItem(param1,_loc2_,_loc4_.kind == 36);
         }
      }
      
      public function flyItem(param1:MineSweepInfo, param2:Day51RewardIcon, param3:Boolean) : void
      {
         TweenLite.delayedCall(1.6,this.flyItem2,[param1,param2,param3]);
      }
      
      public function flyItem2(param1:MineSweepInfo, param2:Day51RewardIcon, param3:Boolean) : void
      {
         var _loc4_:* = null;
         if(param3)
         {
            _loc4_ = IconFlyEff.createFlyTo(param2.wealthRender.ref_img_icon,this.render_cost.ref_img_icon);
            _loc4_.set_scaleTo(0.2);
         }
         else
         {
            _loc4_ = IconFlyEff.createFlyToBag(param2.wealthRender.ref_img_icon);
         }
         _loc4_.animType = "LINE_FIX_TIME";
         _loc4_.flyParam = new MotionLineFixTimeParam(30);
         _loc4_.set_speed(ClientConfig.frameRate * 20 * 2);
         iconFlayEffArr.push(_loc4_);
         _loc4_.exec();
      }
      
      private function digCpl() : void
      {
         this.txt_cpl_tip1.visible = true;
         remainCplTime = 3;
         this.mouseEvent = false;
         showCplTip();
      }
      
      private function showCplTip() : void
      {
         if(remainCplTime <= 0)
         {
            this.mouseEvent = true;
            this.txt_cpl_tip1.visible = false;
            this.refreshUI();
         }
         else
         {
            this.txt_cpl_tip1.text = LocaleMgr.ins.getStr(133550010,[remainCplTime]);
            remainCplTime = Number(remainCplTime) - 1;
            TweenLite.killDelayedCallsTo(this.showCplTip);
            TweenLite.delayedCall(1,showCplTip);
         }
      }
   }
}
