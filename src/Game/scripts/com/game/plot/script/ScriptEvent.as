package com.game.plot.script
{
   import flash.events.Event;
   
   public class ScriptEvent extends Event
   {
      
      public static const SCRIPT_START:String = "script_start";
      
      public static const SCRIPT_OVER:String = "script_over";
      
      public static const SCRIPT_UPDATE:String = "script_update";
       
      
      public var _script:com.game.plot.script.IScript;
      
      public function ScriptEvent(param1:String, param2:com.game.plot.script.IScript)
      {
         _script = param2;
         super(param1,false,false);
      }
   }
}
