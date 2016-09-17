package nslm2.modules.funnies.busyActivity.dragonBoats.funnys
{
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import flash.geom.Point;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.StaticDragonBoatMakeModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.LocalData;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.TimeUtils;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.MM2Util;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.MapKey32ValueString;
   import nslm2.utils.WealthUtil;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   
   public class DragonBoatFunnyPanel extends DragonBoatFunnyPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var productRenderOriPoi:Vector.<Point>;
      
      private var productRenders:Vector.<nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender>;
      
      private var curProductRender:nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender;
      
      public function DragonBoatFunnyPanel()
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         productRenderOriPoi = new Vector.<Point>();
         productRenders = new Vector.<nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender>();
         super();
         productRenders.push(this.render_product_0);
         productRenders.push(this.render_product_1);
         productRenders.push(this.render_product_2);
         curProductRender = this.render_product_0 as nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender;
         var _loc1_:int = productRenders.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = productRenders[_loc3_];
            _loc2_.buttonMode = true;
            _loc2_.addEventListener("click",productRender_onClick);
            productRenderOriPoi.push(new Point(_loc2_.x,_loc2_.y));
            if(this.service.stcModel.makeModeArr && this.service.stcModel.makeModeArr[_loc3_])
            {
               _loc2_.vo = this.service.stcModel.makeModeArr[_loc3_];
            }
            _loc3_++;
         }
         curProductRender.switchEffect(true);
         this.cb_autoBuy.label = LocaleMgr.ins.getStr(13376011);
         this.txt_reward_preview_title.text = LocaleMgr.ins.getStr(13376031);
         this.txt_score_tip.text = LocaleMgr.ins.getStr(13350007);
         this.txt_tip_right1.text = LocaleMgr.ins.getStr(13376015);
         this.txt_title_reward.text = LocaleMgr.ins.getStr(13376013);
         this.txt_tip4.text = LocaleMgr.ins.getStr(13376014);
         this.btn_getReward.label = LocaleMgr.ins.getStr(13376013);
         render_need.wealthVo = WealthUtil.countVo(20,83270);
         this.checkCanGetFreeReward();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get service() : DragonBoatService
      {
         return DragonBoatService.ins;
      }
      
      public function get myScore() : int
      {
         return this.service.myScore;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = param1;
         if(this.btn_doAll !== _loc6_)
         {
            if(this.btn_getReward !== _loc6_)
            {
               if(this.cb_autoBuy !== _loc6_)
               {
                  if(this.btn_arrow0 !== _loc6_)
                  {
                     if(this.btn_arrow1 !== _loc6_)
                     {
                        if(this.btn_arrow2 !== _loc6_)
                        {
                           if(addBtn === _loc6_)
                           {
                              _loc5_ = StcMgr.ins.getShopVo(13376001);
                              if(_loc5_)
                              {
                                 ModuleMgr.ins.showModule(60320,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
                              }
                           }
                        }
                     }
                     addr75:
                     _loc4_ = this.productRenders.indexOf(this.curProductRender);
                     _loc4_++;
                     if(_loc4_ >= this.productRenders.length)
                     {
                        _loc4_ = 0;
                     }
                     this.productRender_onClickTarget(this.productRenders[_loc4_]);
                  }
                  §§goto(addr75);
               }
               else
               {
                  LocalData.insCurPlayer.save("DragonBoatService.KEY_AUTO_BUY",this.cb_autoBuy.selected);
               }
            }
            else
            {
               this.service.protos.server_DRAGON_BOAT_GET_MATERIALS(server_DRAGON_BOAT_GET_MATERIALS_cpl);
            }
         }
         else
         {
            _loc3_ = this.curProductRender.vo;
            if(_loc3_)
            {
               if(_loc3_.cookNum > 0 && this.service.getNumByMakeId(_loc3_.id) >= _loc3_.cookNum)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(13376027));
               }
               else
               {
                  ModuleMgr.ins.showModule(13383,[curProductRender.vo,this.cb_autoBuy.selected],ModuleMgr.ins.popLayer.curModuleId);
               }
            }
         }
      }
      
      private function server_DRAGON_BOAT_GET_MATERIALS_cpl() : void
      {
         FloatUtil.showGetItemsDisplayPanel([this.render_freeReward.wealthVo]);
         refreshFreeReward();
      }
      
      private function checkCanGetFreeReward() : void
      {
         var _loc1_:* = 0;
         var _loc2_:uint = ServerTimer.ins.curtimeZero + TimeUtils.countDayToSecond(this.service.stcModel.getMaterialModel.getTime1 / 24);
         if(ServerTimer.ins.second < _loc2_)
         {
            TimerManager.ins.doOnce((_loc2_ + 1 - ServerTimer.ins.second) * 1000,checkCanGetFreeReward_start);
         }
         else
         {
            _loc1_ = uint(ServerTimer.ins.curtimeZero + TimeUtils.countDayToSecond(1));
            TimerManager.ins.doOnce((_loc1_ + 1 - ServerTimer.ins.second) * 1000,checkCanGetFreeReward_start);
         }
      }
      
      private function checkCanGetFreeReward_start() : void
      {
         this.service.protos.server_DRAGON_BOAT_ALL_INFO(server_DRAGON_BOAT_ALL_INFO_cpl);
      }
      
      private function server_DRAGON_BOAT_ALL_INFO_cpl() : void
      {
         if(this.visible)
         {
            refreshUI();
         }
         checkCanGetFreeReward();
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(DragonBoatService.ins.timeKind_funny);
         if(_loc1_)
         {
            this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.ymdhisCN(_loc1_.startTm) + " - " + TimeUtils.ymdhisCN(_loc1_.endTm);
         }
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function refreshUI() : void
      {
         refreshScore();
         this.cb_autoBuy.selected = LocalData.insCurPlayer.load("DragonBoatService.KEY_AUTO_BUY",false);
         this.refreshCurProduct();
         MM2Util.rewardBtnState(this.btn_doAll,this.service.getFreeRewardState());
         this.btn_doAll.label = LocaleMgr.ins.getStr(13376012);
         this.refreshRedPoi();
         this.refreshFreeReward();
      }
      
      private function refreshRedPoi() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = this.productRenders.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.productRenders[_loc3_];
            _loc2_.redPoiUI.visible = this.service.productRedDict[_loc2_.vo.id];
            _loc3_++;
         }
      }
      
      private function refreshScore() : void
      {
         this.txt_score.text = this.myScore.toString();
      }
      
      private function refreshCurProduct() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc1_:StaticDragonBoatMakeModel = this.curProductRender.vo;
         if(_loc1_)
         {
            if(_loc1_.cookNum > 0)
            {
               this.txt_product_cout.visible = true;
               _loc2_ = this.service.getNumByMakeId(_loc1_.id);
               _loc3_ = _loc1_.cookNum;
               this.txt_product_cout.text = LocaleMgr.ins.getStr(13376010) + ": " + TextFieldUtil.htmlText2(_loc2_ + "/" + _loc3_,LabelUtils.getExchangeAvailColor(_loc2_,_loc3_));
            }
            else
            {
               this.txt_product_cout.visible = false;
            }
            this.txt_product_score.text = LocaleMgr.ins.getStr(13376026,[_loc1_.cookScore.toString()]);
            var _loc7_:* = _loc1_.id;
            if(83320 !== _loc7_)
            {
               if(83330 !== _loc7_)
               {
                  if(83340 === _loc7_)
                  {
                     this.tipsTxt.text = LocaleMgr.ins.getStr(999902837);
                  }
               }
               else
               {
                  this.tipsTxt.text = LocaleMgr.ins.getStr(999902836);
               }
            }
            else
            {
               this.tipsTxt.text = LocaleMgr.ins.getStr(999902835);
            }
            this.list_meterial.repeatX = _loc1_.cookMaterialVoArr.length;
            this.list_meterial.array = _loc1_.cookMaterialVoArr;
            this.list_meterial.doResize();
            _loc4_ = StcMgr.ins.getItemVo(_loc1_.id);
            _loc5_ = 0;
            while(_loc5_ < service.infoRes.drops.length)
            {
               _loc6_ = service.infoRes.drops[_loc5_] as MapKey32ValueString;
               if(_loc6_ && _loc6_.key == _loc1_.id)
               {
                  this.list_reward_preview.array = WealthUtil.parseCostStrToArr(_loc6_.value);
               }
               _loc5_++;
            }
         }
      }
      
      private function refreshFreeReward() : void
      {
         this.render_freeReward.wealthVo = WealthUtil.parseCostStr(this.service.stcModel.getMaterialModel.item);
         MM2Util.rewardBtnState(btn_getReward,this.service.infoRes.panel.canGet == 1?2:3);
      }
      
      private function productRender_onClick(param1:Event) : void
      {
         this.productRender_onClickTarget(param1.currentTarget as nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender);
      }
      
      private function productRender_onClickTarget(param1:nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         curProductRender.switchEffect(false);
         curProductRender = param1;
         curProductRender.switchEffect(true);
         var _loc2_:int = this.productRenders.indexOf(curProductRender);
         var _loc3_:int = this.productRenders.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.productRenders[(_loc2_ + _loc5_) % _loc3_];
            _loc4_.tweenTo(this.productRenderOriPoi[_loc5_]);
            _loc5_++;
         }
         this.refreshCurProduct();
      }
      
      public function getFocusNotices() : Array
      {
         return ["DragonBoatService.MSG_SWITCH_CB_AUTO_BUY","DragonBoatService.MSG_CHANGE_COOK_COUNT","MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if("DragonBoatService.MSG_SWITCH_CB_AUTO_BUY" !== _loc4_)
         {
            if("DragonBoatService.MSG_CHANGE_COOK_COUNT" !== _loc4_)
            {
               if("MSG_NPC_FUNC_VO_CHANGE" === _loc4_)
               {
                  _loc3_ = param2 as int;
                  if(_loc3_ == 13377)
                  {
                     this.refreshRedPoi();
                  }
               }
            }
            else
            {
               this.refreshScore();
               this.refreshCurProduct();
            }
         }
         else
         {
            this.cb_autoBuy.selected = Boolean(param2);
            LocalData.insCurPlayer.save("DragonBoatService.KEY_AUTO_BUY",this.cb_autoBuy.selected);
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(checkCanGetFreeReward_start);
         viewStackOut();
         super.dispose();
      }
   }
}
