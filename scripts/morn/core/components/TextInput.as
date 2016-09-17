package morn.core.components
{
   import flash.events.TextEvent;
   import flash.events.KeyboardEvent;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   
   public class TextInput extends Label
   {
      
      public static const USER_CHANGE:String = "USER_CHANGE";
       
      
      public function TextInput(param1:String = "", param2:String = null)
      {
         super(param1,param2);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.style = "普通说明";
         mouseChildren = true;
         width = 128;
         height = 22;
         selectable = true;
         _textField.type = "input";
         _textField.autoSize = "none";
         this.isHtml = false;
         _textField.addEventListener("change",onTextFieldChange);
         _textField.addEventListener("textInput",onTextFieldTextInput);
         _textField.addEventListener("keyUp",onTextFieldKeyUp);
      }
      
      private function onTextFieldTextInput(param1:TextEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onTextFieldKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            dispatchEvent(new MzEvent("enter"));
         }
      }
      
      protected function onTextFieldChange(param1:Event) : void
      {
         text = !!_isHtml?_textField.htmlText:_textField.text;
         dispatchEvent(new MzEvent("USER_CHANGE"));
         param1.stopPropagation();
      }
      
      public function get restrict() : String
      {
         return _textField.restrict;
      }
      
      public function set restrict(param1:String) : void
      {
         _textField.restrict = param1;
      }
      
      public function get editable() : Boolean
      {
         return _textField.type == "input";
      }
      
      public function set editable(param1:Boolean) : void
      {
         _textField.type = !!param1?"input":"dynamic";
      }
      
      public function get maxChars() : int
      {
         return _textField.maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         _textField.maxChars = param1;
      }
   }
}
