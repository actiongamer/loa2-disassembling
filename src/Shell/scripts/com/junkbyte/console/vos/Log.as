package com.junkbyte.console.vos
{
   import flash.utils.ByteArray;
   
   public class Log
   {
       
      
      public var text:String;
      
      public var ch:String;
      
      public var priority:int;
      
      public var repeat:Boolean;
      
      public var html:Boolean;
      
      public var next:com.junkbyte.console.vos.Log;
      
      public var prev:com.junkbyte.console.vos.Log;
      
      public function Log(param1:String, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this.text = param1;
         this.ch = param2;
         this.priority = param3;
         this.repeat = param4;
         this.html = param5;
      }
      
      public function toBytes() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeUTF(this.text);
         _loc1_.writeUTF(this.ch);
         _loc1_.writeInt(this.priority);
         _loc1_.writeBoolean(this.repeat);
         return _loc1_;
      }
      
      public function plainText() : String
      {
         return this.text.replace(/<.*?>/g,"");
      }
      
      public function toString() : String
      {
         return "[" + this.ch + "] " + this.plainText();
      }
      
      public function clone() : com.junkbyte.console.vos.Log
      {
         return new com.junkbyte.console.vos.Log(this.text,this.ch,this.priority,this.repeat,this.html);
      }
   }
}
