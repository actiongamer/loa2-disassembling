package nslm2.modules.footstones.notices
{
   public class BottomMsgVo
   {
      
      public static const MSG_NEW_BOTTOM_MSG:String = "msg_new_bottom_msg";
      
      public static const KIND:String = "kind";
       
      
      public var kind:int;
      
      public var dataArr:Array;
      
      public var configVo:nslm2.modules.footstones.notices.BottomMsgConfigVo;
      
      public var forceShowCount:int = -1;
      
      public function BottomMsgVo(param1:int, param2:*, param3:int = -1)
      {
         dataArr = [];
         super();
         this.kind = param1;
         this.dataArr = [param2];
         this.forceShowCount = param3;
      }
      
      public function get data() : *
      {
         return dataArr[0];
      }
   }
}
