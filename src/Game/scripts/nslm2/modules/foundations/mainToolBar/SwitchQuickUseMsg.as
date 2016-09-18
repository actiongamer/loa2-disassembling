package nslm2.modules.foundations.mainToolBar
{
   import com.netease.protobuf.UInt64;
   
   public class SwitchQuickUseMsg
   {
       
      
      public var itemId:UInt64;
      
      public var vis:Boolean;
      
      public function SwitchQuickUseMsg(param1:UInt64, param2:Boolean)
      {
         super();
         this.itemId = param1;
         this.vis = param2;
      }
   }
}
