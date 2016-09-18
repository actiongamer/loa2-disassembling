package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.cheer.CheerAwardViewUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.GetSwapActionsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSwapActionsRes;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class CheerAwardView extends CheerAwardViewUI implements IObserver
   {
       
      
      private var stcvos:Array;
      
      public function CheerAwardView()
      {
         super();
         stcvos = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",6);
         this.list_award.itemRender = CheerAwardRender;
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["OPT_FINAL_CHEER_SWAPACTION"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_FINAL_CHEER_SWAPACTION" === _loc3_)
         {
            reqData();
         }
      }
      
      public function reqData() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < stcvos.length)
         {
            _loc1_.push(stcvos[_loc3_].id);
            _loc3_++;
         }
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = _loc1_;
         ServerEngine.ins.send(8007,_loc2_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         if(param1)
         {
            PKCrossModel.ins.cheer_swapActions = param1.info;
         }
         stcvos.sortOn("id");
         this.list_award.dataSource = stcvos;
         PKCrossModel.ins.updateCheerAwardRedPoint();
      }
   }
}
