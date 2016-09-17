package nslm2.modules.foundations.shop
{
   import game.ui.shopModules.BuyStaminaUI;
   import nslm2.modules.foundations.TimePriceUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import flash.geom.Point;
   import morn.core.handlers.Handler;
   import nslm2.modules.foundations.playerHeaders.PlayerHeaderWealthRender;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   
   public class BuyStamina extends BuyStaminaUI
   {
       
      
      private var staLabel:Label;
      
      public function BuyStamina(param1:String)
      {
         super();
         var _loc2_:int = VipModel.ins.getVipValue(10020);
         var _loc3_:int = PlayerModel.ins.buyTimesLib[1];
         this.txt_title.text = param1;
         this.txt_prompt.text = LocaleMgr.ins.getStr(10400001);
         this.txt_prompt2.text = LocaleMgr.ins.getStr(10400002,[_loc2_ - _loc3_,_loc2_]);
         this.renderFrom.wealthVo = TimePriceUtil.curTimePriceVo(1);
         this.renderTo.wealthVo = WealthUtil.createWealthVo(2,0,int(DefindConsts.STAMINA_BUYING_COUNT));
         addChild(new VipHintBox(10020,this.txt_viphint.x - 20,this.txt_viphint.y + 15));
         AlertUtil.comfirm(this,alertBuyAddStaminaYes,null,null,null,null,0,false);
         ObserverMgr.ins.sendNotice("changeTitle",LocaleMgr.ins.getStr(999000369));
      }
      
      private function alertBuyAddStaminaYes() : void
      {
         TimePriceUtil.buyTimes(1,1,overHandler,10020);
         ObserverMgr.ins.unregObserver(GlobalRef.playerHeader_icon_stamina as WealthRender);
      }
      
      private function overHandler() : void
      {
         var _loc2_:int = PlayerModel.ins.buyTimesLib[1];
         var _loc1_:int = VipModel.ins.getVipValue(10020);
         if(this.renderFrom.wealthVo.showCount != TimePriceUtil.curTimePriceVo(1).showCount)
         {
            new FloatZoomInEffCtrl(this.renderFrom);
         }
         this.renderFrom.wealthVo = TimePriceUtil.curTimePriceVo(1);
         this.renderTo.wealthVo = WealthUtil.createWealthVo(2,0,int(DefindConsts.STAMINA_BUYING_COUNT));
         this.txt_prompt.text = LocaleMgr.ins.getStr(10400001);
         this.txt_prompt2.text = LocaleMgr.ins.getStr(10400002,[_loc1_ - _loc2_,_loc1_]);
         AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(999000370) + "+" + int(DefindConsts.STAMINA_BUYING_COUNT),new TextFormat(null,null,16046112)),this.localToGlobal(new Point(this.width / 2 + 34,this.height / 2)),-1,new Handler(addCpl),GlobalRef.playerHeader_icon_stamina.localToGlobal(new Point()),1);
      }
      
      private function addCpl() : void
      {
         (GlobalRef.playerHeader_icon_stamina as PlayerHeaderWealthRender).txt_num.text = PlayerModel.ins.stamina + "/" + PlayerModel.ins.staminaMax;
         ObserverMgr.ins.regObserver(GlobalRef.playerHeader_icon_stamina as WealthRender);
      }
   }
}
