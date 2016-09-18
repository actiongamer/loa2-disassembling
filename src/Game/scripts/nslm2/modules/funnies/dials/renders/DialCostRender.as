package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialCostRenderUI;
   import proto.StaticZhuanPanCostModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class DialCostRender extends DialCostRenderUI
   {
       
      
      private var _costModel:StaticZhuanPanCostModel;
      
      private var _oriSpareCost:WealthVo;
      
      private var _oriCost:WealthVo;
      
      public function DialCostRender()
      {
         super();
      }
      
      public function set costModel(param1:StaticZhuanPanCostModel) : void
      {
         _lotteryVo = new StcLotteryVo();
         _costModel = param1 as StaticZhuanPanCostModel;
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            spareCost = WealthVo.parseCostStr(_costModel.costsup);
            _oriSpareCost = spareCost;
            cost = WealthVo.parseCostStr(_costModel.cost);
            _oriCost = cost;
            validate();
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function setTimes(param1:int) : void
      {
         spareCost = _oriSpareCost.clone();
         spareCost.count = spareCost.count * param1;
         cost = _oriCost.clone();
         cost.count = cost.count * param1;
         validate();
      }
   }
}
