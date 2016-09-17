package nslm2.common.ui.components.comps2d
{
   import com.mz.core.interFace.IDispose;
   import flash.text.TextField;
   import morn.core.components.Component;
   import flash.events.FocusEvent;
   
   public class TextPromptBind implements IDispose
   {
       
      
      public var txt:TextField;
      
      public var prompt:Component;
      
      public function TextPromptBind(param1:TextField, param2:Component)
      {
         super();
         this.txt = param1;
         this.prompt = param2;
         this.prompt.mouseEvent = false;
         this.txt.addEventListener("focusIn",onFocusIn);
         this.txt.addEventListener("focusOut",onFocusOut);
         this.validate();
      }
      
      private function onFocusIn(param1:FocusEvent) : void
      {
         prompt.visible = false;
      }
      
      private function onFocusOut(param1:FocusEvent) : void
      {
         if(this.txt.text.length <= 0)
         {
            prompt.visible = true;
         }
      }
      
      public function validate() : void
      {
         if(this.txt.text.length > 0)
         {
            prompt.visible = false;
         }
         else
         {
            prompt.visible = true;
         }
      }
      
      public function dispose() : void
      {
         this.txt.removeEventListener("focusIn",onFocusIn);
         this.txt.removeEventListener("focusOut",onFocusOut);
         this.txt = null;
         this.prompt = null;
      }
   }
}
