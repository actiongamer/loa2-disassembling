package com.junkbyte.console
{
   public class ConsoleChannel
   {
       
      
      private var _c;
      
      private var _name:String;
      
      public var enabled:Boolean = true;
      
      public function ConsoleChannel(param1:String = null, param2:Console = null)
      {
         super();
         this._name = param1;
         this._c = !!param2?param2:Cc;
      }
      
      public function add(param1:*, param2:Number = 2, param3:Boolean = false) : void
      {
         if(this.enabled)
         {
            this._c.ch(this._name,param1,param2,param3);
         }
      }
      
      public function log(... rest) : void
      {
         if(this.enabled)
         {
            this._c.logch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function info(... rest) : void
      {
         if(this.enabled)
         {
            this._c.infoch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function debug(... rest) : void
      {
         if(this.enabled)
         {
            this._c.debugch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function warn(... rest) : void
      {
         if(this.enabled)
         {
            this._c.warnch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function error(... rest) : void
      {
         if(this.enabled)
         {
            this._c.errorch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function fatal(... rest) : void
      {
         if(this.enabled)
         {
            this._c.fatalch.apply(null,[this._name].concat(rest));
         }
      }
      
      public function stack(param1:*, param2:int = -1, param3:Number = 5) : void
      {
         if(this.enabled)
         {
            this._c.stackch(this.name,param1,param2,param3);
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function clear() : void
      {
         this._c.clear(this._name);
      }
      
      public function toString() : String
      {
         return "[ConsoleChannel " + this.name + "]";
      }
   }
}
