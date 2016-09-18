package nslm2.modules.funnies.secretExplore
{
   import proto.GetSwapActionsReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   
   public class SEScoreRedChecker
   {
       
      
      private var _ids:Array;
      
      private var stcVoArr:Array;
      
      public function SEScoreRedChecker()
      {
         super();
      }
      
      public function get service() : SEModel
      {
         return SEModel.ins;
      }
      
      public function go() : void
      {
         server_getSwapActions(this.stcIdArr);
      }
      
      private function server_getSwapActions(param1:Array) : void
      {
         _ids = param1;
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = param1;
         ServerEngine.ins.send(8007,_loc2_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc7_:* = _ids;
         for each(var _loc2_ in _ids)
         {
            _loc6_ = new SwapActionInfo();
            _loc6_.id = _loc2_;
            service.swapActionInfos.put(_loc6_.id,new SEScoreVo(_loc6_.id,_loc6_));
         }
         if(param1 && param1.info)
         {
            _loc4_ = param1.info.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = param1.info[_loc5_];
               SEScoreVo(service.swapActionInfos.getValue(_loc3_.id)).info.count = _loc3_.count;
               _loc5_++;
            }
         }
         service.swapActionInfos.array.sortOn("sid",16);
         SEModel.ins.checkScoreCanGet();
      }
      
      private function countLevelArr(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = param1[_loc6_];
            _loc5_ = _loc2_.conditionLevel;
            if(_loc3_.indexOf(_loc5_) == -1)
            {
               _loc3_.push(_loc5_);
            }
            _loc6_++;
         }
         _loc3_.sort(16);
         return _loc3_;
      }
      
      private function get stcIdArr() : Array
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         this.stcVoArr = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",8);
         var _loc3_:Array = countLevelArr(stcVoArr);
         if(PlayerModel.ins.level <= _loc3_[0])
         {
            _loc5_ = _loc3_[0];
            _loc3_[0];
         }
         else
         {
            _loc4_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc2_ = _loc3_[_loc7_];
               if(PlayerModel.ins.level >= _loc3_[_loc7_])
               {
                  _loc5_ = _loc3_[_loc7_];
                  _loc7_++;
                  continue;
               }
               break;
            }
         }
         var _loc6_:Array = [];
         _loc4_ = this.stcVoArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc1_ = stcVoArr[_loc7_];
            if(_loc1_.conditionLevel == _loc5_)
            {
               _loc6_.push(_loc1_.id);
            }
            _loc7_++;
         }
         return _loc6_;
      }
   }
}
