package nslm2.modules.funnies.qihoo
{
   import flash.events.EventDispatcher;
   import proto.Gift360LevelInfoData;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.PrivilegeWeiShiCheckReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PrivilegeWeiShiCheckRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class QihooService extends EventDispatcher
   {
      
      public static const EVT_getReward:String = "EVT_getReward";
      
      private static var _ins:nslm2.modules.funnies.qihoo.QihooService;
       
      
      public var isAllGet:Boolean;
      
      public var giftLv:Array;
      
      public var getHistory:Array;
      
      private var getLv:int;
      
      public function QihooService()
      {
         giftLv = [0,5,10,15,20];
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.qihoo.QihooService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.qihoo.QihooService();
         }
         return _ins;
      }
      
      public function init(param1:Gift360LevelInfoData) : void
      {
         if(param1 && param1.levels)
         {
            this.getHistory = param1.levels;
         }
         else
         {
            this.getHistory = [];
         }
         this.countNpcFunc();
      }
      
      public function canGet(param1:int) : Boolean
      {
         if(param1 <= PlayerModel.ins.level)
         {
            if(this.hadGet(param1))
            {
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function hadGet(param1:int) : Boolean
      {
         return getHistory.indexOf(param1) > -1;
      }
      
      public function countNpcFunc() : void
      {
         var _loc3_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Boolean = true;
         var _loc4_:int = nslm2.modules.funnies.qihoo.QihooService.ins.giftLv.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = nslm2.modules.funnies.qihoo.QihooService.ins.giftLv[_loc5_];
            if(nslm2.modules.funnies.qihoo.QihooService.ins.canGet(_loc1_))
            {
               _loc3_ = true;
            }
            if(!nslm2.modules.funnies.qihoo.QihooService.ins.hadGet(_loc1_))
            {
               _loc2_ = false;
            }
            _loc5_++;
         }
         NpcFuncService.ins.changeCount(60731,!!_loc3_?1:0);
         if(_loc2_)
         {
            if(this.isAllGet != _loc2_)
            {
               this.isAllGet = _loc2_;
               ObserverMgr.ins.sendNotice("updateIconBar");
            }
         }
      }
      
      public function server_privilegeWeiShiCheck(param1:int) : void
      {
         var _loc2_:PrivilegeWeiShiCheckReq = new PrivilegeWeiShiCheckReq();
         _loc2_.level = param1;
         getLv = param1;
         ServerEngine.ins.send(7420,_loc2_,server_shiCheck_cpl);
      }
      
      private function server_shiCheck_cpl(param1:PrivilegeWeiShiCheckRes, param2:ServerEvent) : void
      {
         var _loc4_:int = getLv;
         if(this.getHistory.indexOf(_loc4_) == -1)
         {
            getHistory.push(_loc4_);
         }
         var _loc3_:Array = WealthUtil.costStrToArr(DefindConsts.getQIHOO_LVUP(_loc4_));
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         countNpcFunc();
         this.dispatchEvent(new Event("EVT_getReward"));
      }
   }
}
