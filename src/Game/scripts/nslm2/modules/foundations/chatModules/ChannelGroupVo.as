package nslm2.modules.foundations.chatModules
{
   public class ChannelGroupVo
   {
      
      public static const ID:String = "id";
      
      public static const NAME:String = "name";
      
      public static const CHANNELARR:String = "channelArr";
       
      
      public var id:int;
      
      public var name:String;
      
      private var _channelArr:Array;
      
      private var _sendChannelId:int = -789;
      
      public function ChannelGroupVo(param1:int, param2:String, param3:Array, param4:int = -789)
      {
         super();
         this.id = param1;
         this.name = param2;
         this.channelArr = param3;
         this.sendChannelId = param4;
      }
      
      public function get sendChannelId() : int
      {
         if(id == 1008 && ChatModel.isPeakSportsBool)
         {
            return 8;
         }
         return _sendChannelId;
      }
      
      public function set sendChannelId(param1:int) : void
      {
         _sendChannelId = param1;
      }
      
      public function get channelArr() : Array
      {
         if(id == 1008 && ChatModel.isPeakSportsBool)
         {
            return [8,44];
         }
         return _channelArr;
      }
      
      public function set channelArr(param1:Array) : void
      {
         _channelArr = param1;
      }
   }
}
