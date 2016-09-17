package nslm2.modules.funnies.xunleiGifts.services
{
   import proto.XunleiJinzuanInfoNotify;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.XunleiJinzuanGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.XunleiJinzuanGetRewardRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class XunLeiGiftService
   {
      
      public static const LV_MAX:int = 7;
      
      private static var _ins:nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService;
       
      
      public var vipLvDataSource:Array;
      
      public var vipLvStcRewardArr:Vector.<Array>;
      
      public var info:XunleiJinzuanInfoNotify;
      
      public function XunLeiGiftService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(7440,infoNotify);
      }
      
      public static function get ins() : nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService();
         }
         return _ins;
      }
      
      public function init(param1:XunleiJinzuanInfoNotify) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(vipLvStcRewardArr == null)
         {
            vipLvDataSource = [];
            vipLvStcRewardArr = new Vector.<Array>();
            _loc3_ = 7;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               vipLvDataSource.push(_loc4_ + 1);
               _loc2_ = DefindConsts["XUNLEI_GOLD_DIAMOND_LV" + (_loc4_ + 1)];
               vipLvStcRewardArr.push(WealthUtil.costStrToArr(_loc2_));
               _loc4_++;
            }
         }
         info = param1;
         reCountNpcFunc();
      }
      
      private function infoNotify(param1:XunleiJinzuanInfoNotify) : void
      {
         this.init(param1);
      }
      
      private function reCountNpcFunc() : void
      {
         if(this.info.viplevel > 0 && this.info.canget)
         {
            NpcFuncService.ins.changeCount(60767,1);
            NpcFuncService.ins.changeCount(60766,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(60767,0);
            NpcFuncService.ins.changeCount(60766,0);
         }
      }
      
      public function server_xunleiJinzuanGetReward(param1:uint, param2:Function) : void
      {
         var _loc3_:XunleiJinzuanGetRewardReq = new XunleiJinzuanGetRewardReq();
         ServerEngine.ins.send(7439,_loc3_,new Handler(server_getReward_cpl,[param2]));
      }
      
      private function server_getReward_cpl(param1:*, param2:XunleiJinzuanGetRewardRes, param3:ServerEvent) : void
      {
         this.info.viplevel = param2.rellevel;
         this.info.canget = false;
         FloatUtil.showGetItemsDisplayPanel(this.vipLvStcRewardArr[param2.rellevel - 1]);
         reCountNpcFunc();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
   }
}
