package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import proto.BaoWu;
   import nslm2.modules.bag.itemModuels.ItemMsg;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class TreasureLinkHandler extends LinkHandlerBase
   {
       
      
      public function TreasureLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc2_:String = this.evtContent[0];
         var _loc3_:ByteArray = Base64.decodeToByteArray(_loc2_);
         BaUtil.uncompress(_loc3_);
         var _loc4_:BaoWu = new BaoWu();
         _loc4_.readFromSlice(_loc3_,0);
         var _loc1_:ItemMsg = ItemMsg.createByBaowu(_loc4_);
         ObserverMgr.ins.sendNotice("msg_tooltip_click",_loc1_);
      }
   }
}
