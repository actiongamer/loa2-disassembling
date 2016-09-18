package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import proto.Item;
   import nslm2.modules.bag.itemModuels.ItemMsg;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ItemLinkHandler extends LinkHandlerBase
   {
       
      
      public function ItemLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc3_:String = this.evtContent[0];
         var _loc4_:ByteArray = Base64.decodeToByteArray(_loc3_);
         BaUtil.uncompress(_loc4_);
         var _loc1_:Item = new Item();
         _loc1_.readFromSlice(_loc4_,0);
         var _loc2_:ItemMsg = ItemMsg.createByItem(_loc1_);
         ObserverMgr.ins.sendNotice("msg_tooltip_click",_loc2_);
      }
   }
}
