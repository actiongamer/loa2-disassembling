package nslm2.modules.funnies.newYears.lantern2016.service
{
   import com.mz.core.utils.DictHash;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.ServerTimer;
   import proto.LanternShopReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class LanternService
   {
      
      private static var _ins:nslm2.modules.funnies.newYears.lantern2016.service.LanternService;
      
      public static const SHOW_EFF:String = "show_eff";
      
      public static const REFRESH_BUY_LIST:String = "refresh_buy_list";
       
      
      public var dict:DictHash;
      
      public var angelArr:Array;
      
      public function LanternService()
      {
         super();
         dict = new DictHash();
         dict.put(128000,83070);
         dict.put(122000,83080);
         dict.put(101400,83090);
         angelArr = [128000,122000,101400];
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.lantern2016.service.LanternService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.lantern2016.service.LanternService();
         }
         return _ins;
      }
      
      public function getOpenStatus() : Boolean
      {
         if(NpcFuncService.ins.getOpenTimeVo(13330) && NpcFuncService.ins.getOpenTimeVo(13330).startTime < ServerTimer.ins.second && NpcFuncService.ins.getOpenTimeVo(13330).endTime > ServerTimer.ins.second)
         {
            return true;
         }
         return false;
      }
      
      public function buySales(param1:uint, param2:uint, param3:* = null) : void
      {
         var _loc4_:LanternShopReq = new LanternShopReq();
         _loc4_.id = param1;
         _loc4_.num = param2;
         ServerEngine.ins.send(6257,_loc4_,param3);
      }
   }
}
