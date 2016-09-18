package nslm2.modules.footstones.textLinks.handlers
{
   public class LinkHandlerBase
   {
       
      
      public var evtContent:Array;
      
      public function LinkHandlerBase()
      {
         super();
      }
      
      public function init(param1:Array) : void
      {
         this.evtContent = param1;
      }
      
      public function exec() : void
      {
      }
   }
}
