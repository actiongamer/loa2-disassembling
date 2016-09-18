package nslm2.modules.funnies.newYears.valentine2016.service
{
   import com.mz.core.utils.DictHash;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.ServerTimer;
   import proto.ValentineSendFlowerReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ValentineShopReq;
   
   public class ValentineService
   {
      
      private static var _ins:nslm2.modules.funnies.newYears.valentine2016.service.ValentineService;
      
      public static const SHOW_EFF:String = "show_eff";
      
      public static const REFRESH_BUY_LIST:String = "refresh_buy_list";
      
      public static const RESET_BUY_LIST:String = "reset_buy_list";
       
      
      public var dict:DictHash;
      
      public var angelArr:Array;
      
      public function ValentineService()
      {
         super();
         dict = new DictHash();
         dict.put(128000,83070);
         dict.put(122000,83080);
         dict.put(101400,83090);
         angelArr = [128000,122000,101400];
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.valentine2016.service.ValentineService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.valentine2016.service.ValentineService();
         }
         return _ins;
      }
      
      public function getOpenStatus() : Boolean
      {
         if(NpcFuncService.ins.getOpenTimeVo(13320) && NpcFuncService.ins.getOpenTimeVo(13320).startTime < ServerTimer.ins.second && NpcFuncService.ins.getOpenTimeVo(13320).endTime > ServerTimer.ins.second)
         {
            return true;
         }
         return false;
      }
      
      public function sendFlower(param1:uint, param2:uint, param3:* = null) : void
      {
         var _loc4_:ValentineSendFlowerReq = new ValentineSendFlowerReq();
         _loc4_.heroId = param1;
         _loc4_.num = param2;
         ServerEngine.ins.send(6240,_loc4_,param3);
      }
      
      public function buySales(param1:uint, param2:uint, param3:* = null) : void
      {
         var _loc4_:ValentineShopReq = new ValentineShopReq();
         _loc4_.id = param1;
         _loc4_.num = param2;
         ServerEngine.ins.send(6241,_loc4_,param3);
      }
   }
}
