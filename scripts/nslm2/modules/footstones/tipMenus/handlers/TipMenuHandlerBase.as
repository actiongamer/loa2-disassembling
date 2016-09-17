package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
   import nslm2.modules.footstones.tipMenus.TipMenuRender;
   import morn.core.handlers.Handler;
   
   public class TipMenuHandlerBase
   {
       
      
      public var configVo:TipMenuConfigVo;
      
      public var data;
      
      public var render:TipMenuRender;
      
      public var handlerExec;
      
      public var handlerCpl;
      
      public function TipMenuHandlerBase()
      {
         super();
      }
      
      public function init(param1:TipMenuConfigVo, param2:*, param3:TipMenuRender) : void
      {
         this.configVo = param1;
         this.data = param2;
         this.render = param3;
      }
      
      public function addHandlers(param1:* = null, param2:* = null) : TipMenuHandlerBase
      {
         this.handlerExec = param1;
         this.handlerCpl = param2;
         return this;
      }
      
      public function exec() : void
      {
         var _loc1_:* = undefined;
         if(handlerExec)
         {
            _loc1_ = this.handlerExec;
            this.handlerExec = null;
            Handler.execute(_loc1_,[this.configVo,data]);
         }
      }
      
      protected function execHandlerCpl(param1:Array = null) : void
      {
         var _loc2_:* = undefined;
         if(handlerCpl)
         {
            _loc2_ = this.handlerCpl;
            this.handlerCpl = null;
            if(param1 != null)
            {
               param1 = [this.configVo,data].concat(param1);
            }
            else
            {
               param1 = [this.configVo,data];
            }
            Handler.execute(_loc2_,param1);
         }
      }
   }
}
