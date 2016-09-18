package nslm2.modules.battles.heroAwakenRoad.view
{
   import game.ui.heroAwakenRoad.BuyFightCountUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class BuyFightCountView extends BuyFightCountUI
   {
       
      
      private var global_price:Array;
      
      private var already_buy:int;
      
      public function BuyFightCountView()
      {
         super();
         numBar.addEventListener("evt_numbar_value_change",numBar_change);
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30121010);
         this.alert.contentYesHandler = yesHandler;
         already_buy = TimePriceUtil.curTimes(13);
         var _loc3_:int = VipModel.ins.getVipValue(11280);
         var _loc2_:int = _loc3_ - already_buy;
         _loc2_ = _loc2_ < 0?0:_loc2_;
         if(_loc2_)
         {
            numBar.init(1,_loc3_ - already_buy,1);
            txt_buyCnt.color = 458496;
            txt_buyCnt.text = "(" + _loc2_ + "/" + _loc3_ + ")";
         }
         else
         {
            numBar.init(0,0,0);
            txt_buyCnt.color = 16723968;
            txt_buyCnt.text = "(0/" + _loc3_ + ")";
         }
         txt_get.text = LocaleMgr.ins.getStr(30121012,[1,TimePriceUtil.curTimePriceVo(13).count]);
         if(PlayerModel.ins.vip < 15)
         {
            txt_vip.text = LocaleMgr.ins.getStr(30121034,[PlayerModel.ins.vip + 1,int(VipModel.ins.getVipValue(11280,PlayerModel.ins.vip + 1))]);
         }
         else
         {
            txt_vip.text = "";
         }
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = this.numBar.nowNum;
         _loc5_ = 1;
         while(_loc5_ <= _loc4_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(13,already_buy + _loc5_).count;
            _loc5_++;
         }
         var _loc3_:WealthVo = WealthUtil.needVo(3,0,_loc2_);
         txt_get.text = LocaleMgr.ins.getStr(30121012,[_loc4_,_loc2_]);
      }
      
      private function yesHandler() : void
      {
         var _loc1_:int = this.numBar.nowNum;
         if(_loc1_)
         {
            TimePriceUtil.buyTimes(13,_loc1_,buySuccessHanlder);
         }
         this.alert.onYes();
      }
      
      private function buySuccessHanlder() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(50200002) + "+" + this.numBar.nowNum);
         HeroAwakenRoadModel.ins.leftCount = HeroAwakenRoadModel.ins.leftCount + this.numBar.nowNum;
         NpcFuncService.ins.changeCount(30121,HeroAwakenRoadModel.ins.leftCount);
      }
   }
}
