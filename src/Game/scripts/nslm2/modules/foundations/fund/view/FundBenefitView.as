package nslm2.modules.foundations.fund.view
{
   import game.ui.fundModule.view.FundBenefitViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.fund.model.FundModel;
   import nslm2.mgrs.stcMgrs.vos.StcOpenFundVo;
   import nslm2.modules.foundations.fund.vo.FundVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.fund.consts.FundConsts;
   import com.greensock.TweenLite;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class FundBenefitView extends FundBenefitViewUI implements IObserver
   {
       
      
      private var model:FundModel;
      
      private var dataArr:Array;
      
      private var curCanGetId:uint;
      
      public function FundBenefitView()
      {
         model = FundModel.ins;
         dataArr = [];
         super();
         this.img_icon.skin = UrlLib.getFundImg("img_icon");
         this.img_v2ad1.skin = UrlLib.getFundImg("img_v2ad1");
         this.img_v2ad2.skin = UrlLib.getFundImg("img_v2ad2");
         this.img_v2ad3.skin = UrlLib.getFundImg("img_v2ad3");
         this.img_v2ad4.skin = UrlLib.getFundImg("img_v2ad4");
         ObserverMgr.ins.regObserver(this);
         this.box_link.addEventListener("click",toFundViewHandler);
         refreshView();
      }
      
      private function refreshView() : void
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         if(model.allcount < 10000)
         {
            this.list_allCount.dataSource = [model.allcount % 10000 / 1000,model.allcount % 1000 / 100,model.allcount % 100 / 10,model.allcount % 10];
         }
         else
         {
            this.list_allCount.dataSource = [9,9,9,9];
         }
         var _loc3_:Array = model.getWelfareArr().sortOn("id",16);
         this.curCanGetId = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc4_ = new FundVo();
            _loc4_.id = _loc2_.id;
            _loc4_.rewardtype = _loc2_.rewardtype;
            _loc4_.level = _loc2_.level;
            _loc4_.count = _loc2_.count;
            _loc4_.reward = _loc2_.reward;
            if(model.getwelfare.indexOf(_loc4_.id) == -1)
            {
               if(_loc4_.count <= model.allcount)
               {
                  _loc4_.status = 0;
               }
               else
               {
                  _loc4_.status = 1;
               }
            }
            else
            {
               _loc4_.status = 2;
            }
            if(_loc4_.count > model.allcount && curCanGetId == 0)
            {
               curCanGetId = _loc4_.id;
            }
            dataArr.push(_loc4_);
         }
         this.list_welfare.dataSource = dataArr.sortOn(["status","id"],16);
         if(model.getwelfare.length > 0)
         {
            if(model.getwelfare.sort(16)[model.getwelfare.length - 1] < _loc3_[_loc3_.length - 1].id)
            {
               _loc2_ = StcMgr.ins.getOpenFundVo(curCanGetId);
               _loc1_ = WealthUtil.parseCostStr(_loc2_.reward);
               if(_loc1_.kind != 20)
               {
                  this.label_nextReward.text = this.label_nextReward.text + (_loc1_.showName + "x" + _loc1_.showCount);
               }
               else
               {
                  this.label_nextReward.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000267),[_loc1_.stcItemVo.id]);
               }
            }
            else
            {
               this.label_nextReward.visible = false;
            }
         }
         else
         {
            _loc1_ = WealthUtil.parseCostStr(_loc2_.reward);
            if(_loc1_.kind != 20)
            {
               this.label_nextReward.text = this.label_nextReward.text + (_loc1_.showName + "x" + _loc1_.showCount);
            }
            else
            {
               this.label_nextReward.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000267),[_loc1_.stcItemVo.id]);
            }
         }
      }
      
      protected function toFundViewHandler(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice(FundConsts.JUMP_TO_FUND_VIEW);
      }
      
      public function getFocusNotices() : Array
      {
         return ["RefreshWelfareList",FundConsts.REFRESH_WELFARE_VIEW];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("RefreshWelfareList" !== _loc3_)
         {
            if(FundConsts.REFRESH_WELFARE_VIEW === _loc3_)
            {
               refreshView();
            }
         }
         else
         {
            TweenLite.delayedCall(0.2,refresh,[list_welfare.selectedIndex]);
         }
      }
      
      public function refresh(param1:int) : void
      {
         (dataArr[param1] as FundVo).status = 2;
         new ListRemoveItemTweenEffect(this.list_welfare,param1,dataArr.sortOn(["status","id"],16)).set_duration(0.3).set_Removeduration(0.2).exec();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
