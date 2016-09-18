package nslm2.modules.funnies.duowan
{
   import flash.events.EventDispatcher;
   import proto.DuowanNewerCardInfoData;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.DuowanNewerCardReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.DuowanNewerCardRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class DuowanService extends EventDispatcher
   {
      
      public static const EVT_getReward:String = "EVT_getReward";
      
      private static var _ins:nslm2.modules.funnies.duowan.DuowanService;
       
      
      public var hadGet:Boolean;
      
      public function DuowanService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.duowan.DuowanService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.duowan.DuowanService();
         }
         return _ins;
      }
      
      public function init(param1:DuowanNewerCardInfoData) : void
      {
         if(param1)
         {
            hadGet = param1.newercard;
         }
         else
         {
            hadGet = false;
         }
         this.countNpcFunc();
      }
      
      private function countNpcFunc() : void
      {
         NpcFuncService.ins.changeCount(60741,!!hadGet?0:1);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      public function server_duowanNewerCard() : void
      {
         var _loc1_:DuowanNewerCardReq = new DuowanNewerCardReq();
         ServerEngine.ins.send(7424,_loc1_,server_newerCard_cpl);
      }
      
      private function server_newerCard_cpl(param1:DuowanNewerCardRes, param2:ServerEvent) : void
      {
         this.hadGet = true;
         var _loc3_:Array = WealthUtil.costStrToArr(DefindConsts.YY_NEW);
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         countNpcFunc();
         this.dispatchEvent(new Event("EVT_getReward"));
      }
   }
}
