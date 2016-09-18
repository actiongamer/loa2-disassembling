package nslm2.modules.foundations.mall.service
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.MallListRes;
   import nslm2.modules.foundations.mall.model.MallModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.MallBuyReq;
   
   public class MallService
   {
      
      private static var _ins:nslm2.modules.foundations.mall.service.MallService;
       
      
      public function MallService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.mall.service.MallService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.mall.service.MallService();
         }
         return _ins;
      }
      
      public function getMallData(param1:Function) : void
      {
         ServerEngine.ins.send(3043,null,param1);
      }
      
      public function requestUpdateMallData() : void
      {
         ServerEngine.ins.send(3043,null,updateMallData);
      }
      
      private function updateMallData(param1:MallListRes) : void
      {
         MallModel.ins.updateMallData(param1);
         ObserverMgr.ins.sendNotice("mall_notice_update_info",false);
      }
      
      public function buy(param1:int, param2:int, param3:Function) : void
      {
         MallModel.ins.crtBuyItemCnt = param2;
         var _loc4_:MallBuyReq = new MallBuyReq();
         _loc4_.id = param1;
         _loc4_.num = param2;
         ServerEngine.ins.send(3044,_loc4_,param3);
      }
   }
}
