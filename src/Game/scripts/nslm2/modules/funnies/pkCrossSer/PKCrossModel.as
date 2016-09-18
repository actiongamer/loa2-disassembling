package nslm2.modules.funnies.pkCrossSer
{
   import flash.events.EventDispatcher;
   import proto.CrossArenaInfoRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.PKCrossCheerModule;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import proto.SwapActionInfo;
   import proto.CrossArenaCheerInfoRes;
   import nslm2.nets.sockets.ServerEngine;
   
   public class PKCrossModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.funnies.pkCrossSer.PKCrossModel;
       
      
      public var info:CrossArenaInfoRes;
      
      public var lastFightLayer:int = -1;
      
      public var addScore:int;
      
      public var addCoin:int;
      
      public var cheer_swapActions:Array;
      
      public var cheerInfo:CrossArenaCheerInfoRes;
      
      public function PKCrossModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.pkCrossSer.PKCrossModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.pkCrossSer.PKCrossModel();
         }
         return _ins;
      }
      
      public function updateCheerAwardRedPoint() : void
      {
         var _loc3_:* = null;
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",6);
         PKCrossCheerModule.img_red1.visible = false;
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(cheerInfo.myCheerExp >= _loc2_.condition1count)
            {
               _loc3_ = getSwapInfo(_loc2_.id);
               if(_loc3_)
               {
                  if(_loc3_.count < _loc2_.limit_count)
                  {
                     PKCrossCheerModule.img_red1.visible = true;
                  }
               }
               else
               {
                  PKCrossCheerModule.img_red1.visible = true;
               }
            }
         }
      }
      
      public function getSwapInfo(param1:int) : SwapActionInfo
      {
         if(cheer_swapActions)
         {
            var _loc4_:int = 0;
            var _loc3_:* = cheer_swapActions;
            for each(var _loc2_ in cheer_swapActions)
            {
               if(_loc2_.id == param1)
               {
                  return _loc2_;
               }
            }
            return null;
         }
         return null;
      }
      
      public function get isFinalFighter() : Boolean
      {
         return info.finalRank > 0;
      }
      
      public function reqCheerInfo(param1:Function) : void
      {
         handler = param1;
         onCheerInfoRet = function(param1:CrossArenaCheerInfoRes):void
         {
            cheerInfo = param1;
            if(handler is Function)
            {
               handler();
            }
         };
         ServerEngine.ins.send(4318,null,onCheerInfoRet);
      }
   }
}
