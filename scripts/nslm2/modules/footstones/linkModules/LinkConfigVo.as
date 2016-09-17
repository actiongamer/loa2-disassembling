package nslm2.modules.footstones.linkModules
{
   public class LinkConfigVo
   {
       
      
      public var kind:int;
      
      public var handlerClass:Class;
      
      public function LinkConfigVo(param1:int, param2:Class)
      {
         super();
         this.kind = param1;
         this.handlerClass = param2;
      }
   }
}
