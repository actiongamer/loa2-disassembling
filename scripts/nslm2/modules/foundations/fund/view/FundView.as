package nslm2.modules.foundations.fund.view
{
   import game.ui.fundModule.view.FundViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.fund.model.FundModel;
   import nslm2.modules.foundations.fund.service.FundService;
   import nslm2.modules.foundations.fund.consts.FundConsts;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.fund.vo.FundVo;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcOpenFundVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FundView extends FundViewUI implements IObserver
   {
       
      
      private var model:FundModel;
      
      private var dataArr:Array;
      
      public function FundView()
      {
         var _loc3_:* = null;
         model = FundModel.ins;
         dataArr = [];
         super();
         this.img_icon.skin = UrlLib.getFundImg("img_icon");
         this.img_v1ad1.skin = UrlLib.getFundImg("img_v1ad1");
         this.img_v1ad2.skin = UrlLib.getFundImg("img_v1ad2");
         this.img_v2ad2.skin = UrlLib.getFundImg("img_v2ad2");
         this.img_v1ad3.skin = UrlLib.getFundImg("img_v1ad3");
         ObserverMgr.ins.regObserver(this);
         if(PlayerModel.ins.vip >= 2 && !model.hasfund)
         {
            this.btn_buy.disabled = false;
         }
         else
         {
            this.btn_buy.disabled = true;
         }
         this.btn_buy.clickHandler = buyFund;
         this.chargeRes.dataSource = WealthUtil.parseCostStr("3:0:1000");
         var _loc2_:Array = model.getFundArr().sortOn("id",16);
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            _loc3_ = new FundVo();
            _loc3_.id = _loc1_.id;
            _loc3_.rewardtype = _loc1_.rewardtype;
            _loc3_.level = _loc1_.level;
            _loc3_.count = _loc1_.count;
            _loc3_.reward = _loc1_.reward;
            if(model.getrewards.indexOf(_loc3_.id) == -1)
            {
               if(_loc3_.count <= PlayerModel.ins.level)
               {
                  _loc3_.status = 0;
               }
               else
               {
                  _loc3_.status = 1;
               }
            }
            else
            {
               _loc3_.status = 2;
            }
            dataArr.push(_loc3_);
         }
         this.list_fund.dataSource = dataArr.sortOn(["status","id"],16);
         this.label_curvip.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000268),[PlayerModel.ins.vip]);
      }
      
      private function buyFund() : void
      {
         FundService.ins.buyFund(buyCpl);
      }
      
      private function buyCpl() : void
      {
         model.hasfund = true;
         this.btn_buy.disabled = true;
         this.list_fund.scrollTo(0);
         this.list_fund.dataSource = dataArr.sortOn(["status","id"],16);
      }
      
      public function getFocusNotices() : Array
      {
         return [FundConsts.REFRESH_FUND_LIST];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if(FundConsts.REFRESH_FUND_LIST === _loc3_)
         {
            TweenLite.delayedCall(0.2,refresh,[list_fund.selectedIndex]);
         }
      }
      
      public function refresh(param1:int) : void
      {
         (dataArr[param1] as FundVo).status = 2;
         new ListRemoveItemTweenEffect(this.list_fund,param1,dataArr.sortOn(["status","id"],16)).set_duration(0.3).set_Removeduration(0.2).exec();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
