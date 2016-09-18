package com.junkbyte.console.core
{
   import com.junkbyte.console.KeyBind;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import com.junkbyte.console.Console;
   
   public class KeyBinder extends ConsoleCore
   {
       
      
      private var _pass:String;
      
      private var _passInd:int;
      
      private var _binds:Object;
      
      private var _warns:uint;
      
      public function KeyBinder(param1:Console, param2:String)
      {
         this._binds = {};
         super(param1);
         this._pass = param2 == ""?null:param2;
         param1.cl.addCLCmd("keybinds",this.printBinds,"List all keybinds used");
      }
      
      public function bindKey(param1:KeyBind, param2:Function, param3:Array = null) : void
      {
         if(this._pass && (!param1.useKeyCode && param1.key.charAt(0) == this._pass.charAt(0)))
         {
            report("Error: KeyBind [" + param1.key + "] is conflicting with Console password.",9);
            return;
         }
         if(param2 == null)
         {
            delete this._binds[param1.key];
            if(!config.quiet)
            {
               report("Unbined key " + param1.key + ".",-1);
            }
         }
         else
         {
            this._binds[param1.key] = [param2,param3];
            if(!config.quiet)
            {
               report("Bined key " + param1.key + " to a function.",-1);
            }
         }
      }
      
      public function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:KeyBind = null;
         var _loc2_:String = String.fromCharCode(param1.charCode);
         if(this._pass != null && _loc2_ && _loc2_ == this._pass.substring(this._passInd,this._passInd + 1))
         {
            this._passInd++;
            if(this._passInd >= this._pass.length)
            {
               this._passInd = 0;
               if(this.canTrigger())
               {
                  if(console.visible && !console.panels.mainPanel.visible)
                  {
                     console.panels.mainPanel.visible = true;
                  }
                  else
                  {
                     console.visible = !console.visible;
                  }
                  console.panels.mainPanel.moveBackSafePosition();
               }
               else if(this._warns < 3)
               {
                  this._warns++;
                  report("Password did not trigger because you have focus on an input TextField.",8);
               }
            }
         }
         else
         {
            this._passInd = 0;
            _loc3_ = new KeyBind(param1.keyCode,param1.shiftKey,param1.ctrlKey,param1.altKey);
            this.tryRunKey(_loc3_.key);
            if(_loc2_)
            {
               _loc3_ = new KeyBind(_loc2_,param1.shiftKey,param1.ctrlKey,param1.altKey);
               this.tryRunKey(_loc3_.key);
            }
         }
      }
      
      private function printBinds(... rest) : void
      {
         var _loc3_:* = null;
         report("Key binds:",-2);
         var _loc2_:uint = 0;
         for(_loc3_ in this._binds)
         {
            _loc2_++;
            report(_loc3_,-2);
         }
         report("--- Found " + _loc2_,-2);
      }
      
      private function tryRunKey(param1:String) : void
      {
         var _loc2_:Array = this._binds[param1];
         if(_loc2_)
         {
            if(this.canTrigger())
            {
               (_loc2_[0] as Function).apply(null,_loc2_[1]);
            }
            else if(this._warns < 3)
            {
               this._warns++;
               report("Key bind [" + param1 + "] did not trigger because you have focus on an input TextField.",8);
            }
         }
      }
      
      private function canTrigger() : Boolean
      {
         var txt:TextField = null;
         try
         {
            if(console.stage && console.stage.focus is TextField)
            {
               txt = console.stage.focus as TextField;
               if(txt.type == TextFieldType.INPUT)
               {
                  return false;
               }
            }
         }
         catch(err:Error)
         {
         }
         return true;
      }
   }
}
