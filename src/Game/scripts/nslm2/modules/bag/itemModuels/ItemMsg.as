package nslm2.modules.bag.itemModuels
{
   import proto.Item;
   import proto.BaoWu;
   import com.netease.protobuf.UInt64;
   
   public class ItemMsg
   {
       
      
      public var playerId:UInt64;
      
      public var itemId:UInt64;
      
      public var stcItemId:int;
      
      public var item:Item;
      
      public var baowu:BaoWu;
      
      public function ItemMsg(param1:UInt64 = null, param2:UInt64 = null, param3:int = 0)
      {
         super();
         this.playerId = param1;
         this.itemId = param2;
         this.stcItemId = param3;
      }
      
      public static function createByItem(param1:Item) : ItemMsg
      {
         var _loc2_:ItemMsg = new ItemMsg();
         _loc2_.item = param1;
         return _loc2_;
      }
      
      public static function createByBaowu(param1:BaoWu) : ItemMsg
      {
         var _loc2_:ItemMsg = new ItemMsg();
         _loc2_.baowu = param1;
         return _loc2_;
      }
   }
}
