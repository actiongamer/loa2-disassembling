package nslm2.modules.bag
{
   import com.netease.protobuf.UInt64;
   
   public class RenderSellState
   {
       
      
      public var isSell:Boolean;
      
      public var waitingSellIdArr:Vector.<UInt64>;
      
      public function RenderSellState(param1:Boolean, param2:Vector.<UInt64>)
      {
         super();
         this.isSell = param1;
         this.waitingSellIdArr = param2;
      }
   }
}
