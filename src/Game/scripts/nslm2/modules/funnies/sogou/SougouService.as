package nslm2.modules.funnies.sogou
{
   import flash.events.EventDispatcher;
   import proto.SougouRewardInfoData;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.SougouGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.SougouGetRewardRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import proto.SougouInputGetRewardReq;
   import proto.SougouInputGetRewardRes;
   
   public class SougouService extends EventDispatcher
   {
      
      public static const EVT_getReward:String = "EVT_getReward";
      
      private static var _ins:nslm2.modules.funnies.sogou.SougouService;
       
      
      public var isFromSougouGameDating:Boolean;
      
      public var isFromSougouInput:Boolean;
      
      public var hadGet1:Boolean;
      
      public var hadGet2:Boolean;
      
      public function SougouService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.sogou.SougouService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.sogou.SougouService();
         }
         return _ins;
      }
      
      public function init(param1:SougouRewardInfoData) : void
      {
         if(param1)
         {
            hadGet1 = param1.downloadreward;
            hadGet2 = param1.inputreward;
         }
         else
         {
            hadGet1 = false;
            hadGet2 = false;
         }
         countNpcFunc();
      }
      
      private function countNpcFunc() : void
      {
         NpcFuncService.ins.changeCount(60751,isFromSougouGameDating && hadGet1 == false?1:0);
         NpcFuncService.ins.changeCount(60752,isFromSougouInput && hadGet2 == false?1:0);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      private function countNpcFunc1() : void
      {
         NpcFuncService.ins.changeCount(60751,isFromSougouGameDating && hadGet1 == false?1:0);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      private function countNpcFunc2() : void
      {
         NpcFuncService.ins.changeCount(60752,isFromSougouInput && hadGet2 == false?1:0);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      public function server_sougouGetReward() : void
      {
         var _loc1_:SougouGetRewardReq = new SougouGetRewardReq();
         ServerEngine.ins.send(7423,_loc1_,server_getReward1_cpl);
      }
      
      private function server_getReward1_cpl(param1:SougouGetRewardRes, param2:ServerEvent) : void
      {
         this.hadGet1 = true;
         var _loc3_:Array = WealthUtil.costStrToArr(DefindConsts.SOUGOU_DOWNLOAD);
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         countNpcFunc1();
         this.dispatchEvent(new Event("EVT_getReward"));
      }
      
      public function server_sougouInputGetReward() : void
      {
         var _loc1_:SougouInputGetRewardReq = new SougouInputGetRewardReq();
         ServerEngine.ins.send(7422,_loc1_,server_getReward2_cpl);
      }
      
      private function server_getReward2_cpl(param1:SougouInputGetRewardRes, param2:ServerEvent) : void
      {
         this.hadGet2 = true;
         var _loc3_:Array = WealthUtil.costStrToArr(DefindConsts.SOUGOU_INPUT);
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         countNpcFunc2();
         this.dispatchEvent(new Event("EVT_getReward"));
      }
   }
}
