package nslm2.modules.foundations.sevenDays.view
{
   import game.ui.sevenDayModule.view.HalfPriceViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.sevenDays.vo.SevenDaysVo;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class HalfPriceView extends HalfPriceViewUI implements IObserver
   {
       
      
      private var item:SevenDaysVo;
      
      private var model:SevenDaysModel;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      private var textCdCtrl2:TextCDCtrlS2;
      
      private var btnEff:BmcSpriteSheet;
      
      public function HalfPriceView()
      {
         item = SevenDaysModel.ins.currentDayRewardVo;
         model = SevenDaysModel.ins;
         super();
         refresh();
         ObserverMgr.ins.regObserver(this);
         textCdCtrl = new TextCDCtrlS2(this.end_time,textCDFormat,txtCDCtrl_cpl);
         textCdCtrl2 = new TextCDCtrlS2(this.reward_end_time,textCDFormat2,txtCDCtrl_cpl2);
         textCdCtrl.start(model.endTime);
         textCdCtrl2.start(model.rewardEndTime);
         this.img_bg.skin = UrlLib.sevenDayHalfPrice();
         this.event_period.text = LocaleMgr.ins.getStr(13100501,[TimeUtils.getShortTimeStr(model.startTime),TimeUtils.getShortTimeStr(model.endTime)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.end_time.text = LocaleMgr.ins.getStr(999000360);
      }
      
      private function txtCDCtrl_cpl2() : void
      {
         this.reward_end_time.text = LocaleMgr.ins.getStr(999000360);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100502) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function textCDFormat2(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100503) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function refresh() : void
      {
         var _loc1_:* = null;
         if(model.currentDay > -1 || model.currentDay < 7)
         {
            this.img_goods.visible = true;
            this.img_goods.skin = UrlLib.sevenDayGoodsIcon(2,model.currentDay + 1);
            if(model.currentDay == 1)
            {
               this.img_goods.y = 204;
            }
            else
            {
               this.img_goods.y = 254;
            }
         }
         else
         {
            this.img_goods.visible = false;
         }
         if(model.currentDay > -1 || model.currentDay < 7)
         {
            titleTxt.text = LocaleMgr.ins.getStr(999902100);
         }
         item = SevenDaysModel.ins.currentDayRewardVo;
         var _loc4_:StcShopVo = StcMgr.ins.getShopVo(int(item.sdStcVO.shop_id));
         var _loc3_:WealthVo = WealthVo.parseCostStr(_loc4_.sell_res);
         item_id.color = ColorLib.qualityColor(_loc3_.quality);
         item_id.text = _loc3_.showName;
         if(_loc3_.sid != 0)
         {
            _loc1_ = NPCPropConsts.ins.getEquipProp(_loc3_.sid);
         }
         if(_loc1_)
         {
            this.item_desc.text = LocaleMgr.ins.getStr(1000 + _loc1_.propId).replace(new RegExp(/ /g),"") + " +" + int(_loc1_.value);
         }
         else
         {
            this.item_desc.text = "x" + _loc3_.showCount;
         }
         rest_num.text = LocaleMgr.ins.getStr(13100601,[item.halfPriceLimit - item.halfPriceBought,item.halfPriceLimit]);
         var _loc2_:int = Math.min(item.sdStcVO.shop_limit_num - item.myHalfPriceBought,item.halfPriceLimit - item.halfPriceBought);
         this.label_myBuyCount.text = LocaleMgr.ins.getStr(13100605,[TextFieldUtil.htmlText2(_loc2_ + "/" + item.sdStcVO.shop_limit_num,_loc2_ > 0?458496:16723968)]);
         switch(int(item.halfPriceStatus) - 1)
         {
            case 0:
               buy_button.disabled = false;
               buy_button.clickHandler = buy;
               break;
            case 1:
               buy_button.disabled = true;
               break;
            case 2:
               buy_button.disabled = true;
         }
         render_prize.dataSource = WealthUtil.parseCostStr(_loc4_.curr_res);
         txt_cost.value = WealthUtil.parseCostStr(_loc4_.curr_res).showCount;
         showOrHideBtnEffect();
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(!buy_button.disabled)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = buy_button.x - 46 + 4 + 33;
               btnEff.y = buy_button.y - 25 + 4 + 11;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function buy() : void
      {
         ModuleMgr.ins.showModule(13101,item,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function buyErr(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function buyCpl() : void
      {
         showOrHideBtnEffect();
         SevenDaysModel.ins.hasHalfPrice = false;
         ObserverMgr.ins.sendNotice("sevenday_notice_update_red_point","do not minus");
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(StcMgr.ins.getShopVo(int(item.sdStcVO.shop_id)).sell_res));
         var _loc1_:* = item.halfPriceBought + 1;
         item.halfPriceBought++;
         rest_num.text = LocaleMgr.ins.getStr(13100601,[item.halfPriceLimit - _loc1_,item.halfPriceLimit]);
      }
      
      public function getFocusNotices() : Array
      {
         return ["sevenday_notice_update_shop"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("sevenday_notice_update_shop" === _loc3_)
         {
            refresh();
         }
      }
   }
}
