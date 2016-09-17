package nslm2.common.ui.components.debug3d
{
   import morn.core.components.View;
   import morn.core.components.CheckBox;
   
   public class DebugBooleanParamRender extends View
   {
      
      public static const KEY_UseBloom:String = "UseBloom";
       
      
      public var cb:CheckBox;
      
      public var bindTarget:Object;
      
      public var bindParam:String;
      
      public function DebugBooleanParamRender()
      {
         super();
      }
      
      public function bind(param1:Object, param2:String, param3:String = null) : void
      {
         if(param3 == null)
         {
            param3 = param2;
         }
         this.bindTarget = param1;
         this.bindParam = param2;
         cb = new CheckBox("png.comp.checkbox",param3);
         this.addChild(cb);
         cb.selected = bindTarget[bindParam];
         cb.clickHandler = cb_click;
      }
      
      private function cb_click() : void
      {
         bindTarget[bindParam] = this.cb.selected;
      }
   }
}
