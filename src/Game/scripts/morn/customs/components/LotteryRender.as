package morn.customs.components
{
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.Item;
   import nslm2.common.event.WealthChangeEvent;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.bag.itemModuels.LackItemIdFatal;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.logging.Log;
   
   public class LotteryRender extends WealthRender
   {
       
      
      protected var _isHad:Boolean;
      
      protected var _lotteryVo:StcLotteryVo;
      
      public var spareCost:WealthVo;
      
      public var cost:WealthVo;
      
      public function LotteryRender()
      {
         super();
      }
      
      public function get isHad() : Boolean
      {
         return _isHad;
      }
      
      public function isShowSpareCost() : Boolean
      {
         return wealthVo == spareCost;
      }
      
      public function get lotteryVo() : StcLotteryVo
      {
         return _lotteryVo;
      }
      
      public function set lotteryVo(param1:StcLotteryVo) : void
      {
         if(_lotteryVo == param1)
         {
            return;
         }
         this._lotteryVo = param1;
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            spareCost = WealthVo.parseCostStr(_lotteryVo.spare_cost_res);
            cost = WealthVo.parseCostStr(_lotteryVo.cost_res);
            validate();
         }
         else
         {
            cost = null;
            spareCost = null;
            .super.dataSource = null;
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function set lotteryId(param1:uint) : void
      {
         if(_lotteryVo == null || _lotteryVo.id != 0 && _lotteryVo.id != param1)
         {
            if(param1 > 0)
            {
               this.lotteryVo = StcMgr.ins.getLotteryVo(param1);
            }
            else
            {
               cost = null;
               spareCost = null;
               .super.dataSource = null;
               ObserverMgr.ins.unregObserver(this);
            }
         }
      }
      
      override protected function validateObserver() : void
      {
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is WealthVo)
         {
            .super.dataSource = param1;
         }
         else
         {
            this.lotteryId = int(param1);
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         if(wealthVo != null && lotteryVo == null)
         {
            super.handleNotices(param1,param2);
         }
         else
         {
            var _loc6_:* = param1;
            if("msg_item_num_change" !== _loc6_)
            {
               if("wealthChange" === _loc6_)
               {
                  _loc4_ = param2 as WealthChangeEvent;
                  if(this.spareCost.kind == _loc4_.wealthType || this.cost.kind == _loc4_.wealthType)
                  {
                     this.validateTxtNum();
                  }
                  this.validate();
               }
            }
            else
            {
               _loc3_ = param2 as Item;
               _loc5_ = _loc3_.itemId;
               if(this.spareCost.sid == _loc5_ || cost.sid == _loc5_)
               {
                  this.validate();
               }
            }
         }
      }
      
      protected function validate() : void
      {
         if(spareCost.kind > 0)
         {
            if(spareCost.count <= PlayerModel.ins.getCountByWealthVo(spareCost))
            {
               if(this.ref_txt_num)
               {
                  this.ref_txt_num.color = 16775367;
               }
               this._isHad = true;
               .super.dataSource = spareCost;
            }
            else
            {
               validateCost();
            }
         }
         else
         {
            validateCost();
         }
      }
      
      override protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               ref_img_icon.smoothing = true;
               var _loc1_:* = wealthVo.kind;
               if(20 !== _loc1_)
               {
                  if(2121 !== _loc1_)
                  {
                     if(30 !== _loc1_)
                     {
                        if(0 !== _loc1_)
                        {
                           this.ref_img_icon.url = UrlLib.itemIcon(wealthVo.kind);
                        }
                        else
                        {
                           this.ref_img_icon.url = null;
                        }
                     }
                     else if(wealthVo.hero)
                     {
                        this.ref_img_icon.url = HeroInfoUtil.getHeadIconUrlByHeroBaseInfo(wealthVo.hero.baseInfo);
                     }
                     else if(wealthVo.sid > 0)
                     {
                        this.ref_img_icon.url = HeroInfoUtil.getHeadIconUrl(null,wealthVo.sid);
                     }
                     else
                     {
                        Log.fatal(this,"stcNpcVo is null when sid==" + wealthVo.sid);
                     }
                  }
                  addr107:
               }
               if(wealthVo.stcItemVo)
               {
                  this.ref_img_icon.url = UrlLib.itemIcon(wealthVo.stcItemVo.icon);
               }
               else
               {
                  new LackItemIdFatal(this,wealthVo.sid);
               }
               §§goto(addr107);
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      protected function validateCost() : void
      {
         if(cost.kind > 0)
         {
            if(cost.count <= PlayerModel.ins.getCountByWealthVo(cost))
            {
               if(this.ref_txt_num)
               {
                  this.ref_txt_num.color = 16775367;
               }
               this._isHad = true;
            }
            else
            {
               if(this.ref_txt_num)
               {
                  this.ref_txt_num.color = 16723968;
               }
               this._isHad = false;
            }
            .super.wealthVo = cost;
         }
         else
         {
            Log.fatal(this,"lottery的cost_res错误",this.lotteryVo.id);
         }
      }
   }
}
