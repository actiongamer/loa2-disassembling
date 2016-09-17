package common.findPath
{
   class PathNode
   {
      
      public static const ORDER:String = "order";
       
      
      public var order:int;
      
      public var x:int;
      
      public var y:int;
      
      public var value:int;
      
      public var block:Boolean;
      
      public var open:Boolean;
      
      public var value_g:int;
      
      public var value_h:int;
      
      public var value_f:int;
      
      public var nodeparent:common.findPath.PathNode;
      
      function PathNode(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:int, param8:int, param9:int, param10:common.findPath.PathNode)
      {
         super();
         this.order = param1;
         this.x = param2;
         this.y = param3;
         this.value = param4;
         this.block = param5;
         this.open = param6;
         this.value_g = param7;
         this.value_h = param8;
         this.value_f = param9;
         this.nodeparent = param10;
      }
   }
}
