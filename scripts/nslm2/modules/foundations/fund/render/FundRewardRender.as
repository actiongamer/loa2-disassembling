package nslm2.modules.foundations.fund.render
{
   import game.ui.fundModule.render.FundRewardRenderUI;
   import nslm2.modules.foundations.fund.model.FundModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.fund.vo.FundVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.WealthUtil;
   import com.greensock.TweenLite;
   import game.ui.commons.icons.WealthRenderS9UI;
   import nslm2.modules.foundations.fund.service.FundService;
   import proto.OpenFundGetWelfareRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.OpenFundGetFundRewardRes;
   import nslm2.modules.foundations.fund.consts.FundConsts;
   
   public class FundRewardRender extends FundRewardRenderUI
   {
       
      
      private var model:FundModel;
      
      private var btnEff:BmcSpriteSheet;
      
      public function FundRewardRender()
      {
         model = FundModel.ins;
         super();
      }
      
      public function get vo() : FundVo
      {
         return this.dataSource as FundVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            if(this.vo.rewardtype == 100)
            {
               if(model.getrewards.indexOf(this.vo.id) == -1)
               {
                  this.btn_canGet.visible = true;
                  this.img_gotReward.visible = false;
                  if(this.vo.level <= PlayerModel.ins.level && model.hasfund)
                  {
                     this.btn_canGet.label = LocaleMgr.ins.getStr(999000261);
                     this.btn_canGet.disabled = false;
                     this.vo.status = 0;
                  }
                  else
                  {
                     this.btn_canGet.label = LocaleMgr.ins.getStr(999000262);
                     this.btn_canGet.disabled = true;
                     this.vo.status = 1;
                  }
               }
               else
               {
                  this.btn_canGet.visible = false;
                  this.img_gotReward.visible = true;
                  this.vo.status = 2;
               }
               this.label_aim.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000263),[this.vo.level]);
               this.label_process.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000264),[PlayerModel.ins.level,this.vo.level]);
               this.label_process.color = LabelUtils.getCountNeedColor(PlayerModel.ins.level,this.vo.level);
            }
            else
            {
               if(model.getwelfare.indexOf(this.vo.id) == -1)
               {
                  this.btn_canGet.visible = true;
                  this.img_gotReward.visible = false;
                  if(this.vo.count <= model.allcount)
                  {
                     this.btn_canGet.label = LocaleMgr.ins.getStr(999000261);
                     this.btn_canGet.disabled = false;
                     this.vo.status = 0;
                  }
                  else
                  {
                     this.btn_canGet.label = LocaleMgr.ins.getStr(999000262);
                     this.btn_canGet.disabled = true;
                     this.vo.status = 1;
                  }
               }
               else
               {
                  this.btn_canGet.visible = false;
                  this.img_gotReward.visible = true;
                  this.vo.status = 2;
               }
               this.label_aim.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000265),[this.vo.count]);
               this.label_process.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000266),[model.allcount,this.vo.count]);
               this.label_process.color = LabelUtils.getCountNeedColor(model.allcount,this.vo.count);
            }
            _loc2_ = WealthUtil.costStrToArr(this.vo.reward);
            this.list_item.dataSource = _loc2_;
            this.list_item.repeatX = _loc2_.length;
            if(_loc2_.length > 1)
            {
               var _loc3_:* = 87 + 70 * (_loc2_.length - 1);
               label_process.x = _loc3_;
               label_aim.x = _loc3_;
            }
            TweenLite.delayedCall(0.01,hide);
            this.btn_canGet.clickHandler = getRewardHandler;
            showOrHideBtnEffect();
         }
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(this.vo.status == 0)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = this.btn_canGet.x - 9;
               btnEff.y = this.btn_canGet.y - 10;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function hide() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = list_item.cells;
         for each(var _loc1_ in list_item.cells)
         {
            _loc1_.txt_name.visible = false;
         }
      }
      
      private function getRewardHandler() : void
      {
         if(this.vo.rewardtype == 100)
         {
            FundService.ins.getFundReward(this.vo.id,fundRewardCplHandler);
         }
         else
         {
            FundService.ins.getWelfare(this.vo.id,welfareCplHandler);
         }
      }
      
      private function welfareCplHandler(param1:OpenFundGetWelfareRes) : void
      {
         FloatUtil.showGetItemsDisplayPanel(this.list_item.dataSource as Array);
         this.btn_canGet.visible = false;
         this.img_gotReward.visible = true;
         this.vo.status = 2;
         ObserverMgr.ins.sendNotice("RefreshWelfareList");
         if(model.getwelfare.indexOf(this.vo.id) == -1)
         {
            model.getwelfare.push(this.vo.id);
         }
         showOrHideBtnEffect();
      }
      
      private function fundRewardCplHandler(param1:OpenFundGetFundRewardRes) : void
      {
         FloatUtil.showGetItemsDisplayPanel(this.list_item.dataSource as Array);
         this.btn_canGet.visible = false;
         this.img_gotReward.visible = true;
         this.vo.status = 2;
         ObserverMgr.ins.sendNotice(FundConsts.REFRESH_FUND_LIST);
         if(model.getrewards.indexOf(this.vo.id) == -1)
         {
            model.getrewards.push(this.vo.id);
         }
         showOrHideBtnEffect();
      }
   }
}
