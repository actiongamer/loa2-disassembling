package morn.core.components
{
   import flash.utils.Dictionary;
   import morn.editor.core.IRender;
   import morn.customs.components.Accordion;
   import com.mz.core.logging.Log;
   
   public class View extends Box
   {
      
      public static var xmlMap:Object = {};
      
      protected static var uiClassMap:Object = {
         "Box":Box,
         "Button":Button,
         "CheckBox":CheckBox,
         "Clip":Clip,
         "ComboBox":ComboBox,
         "Component":Component,
         "HScrollBar":HScrollBar,
         "HSlider":HSlider,
         "Image":Image,
         "Label":Label,
         "LinkButton":LinkButton,
         "List":List,
         "Panel":Panel,
         "ProgressBar":ProgressBar,
         "RadioButton":RadioButton,
         "RadioGroup":RadioGroup,
         "ScrollBar":ScrollBar,
         "Slider":Slider,
         "Tab":Tab,
         "TextArea":TextArea,
         "TextInput":TextInput,
         "View":View,
         "ViewStack":ViewStack,
         "VScrollBar":VScrollBar,
         "VSlider":VSlider,
         "HBox":HBox,
         "VBox":VBox,
         "Tree":Tree
      };
      
      public static var viewClassMap:Object = {};
      
      public static var runtimeClassMap:Dictionary = new Dictionary();
       
      
      public function View()
      {
         super();
      }
      
      public static function createComp(param1:XML, param2:Component = null, param3:View = null) : Component
      {
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         param2 = param2 || getCompInstance(param1);
         param2.comXml = param1;
         _loc9_ = 0;
         _loc8_ = param1.children().length();
         while(_loc9_ < _loc8_)
         {
            _loc4_ = param1.children()[_loc9_];
            if(param2 is IRender && _loc4_.@name == "subRender")
            {
               Accordion(param2).subRender = _loc4_;
            }
            else if(param2 is IRender && _loc4_.@name == "render")
            {
               IRender(param2).itemRender = _loc4_;
            }
            else
            {
               param2.addChild(createComp(_loc4_,null,param3));
            }
            _loc9_++;
         }
         if(param2.hasOwnProperty("style") && param1.attribute("style").length() > 0)
         {
            param2["style"] = String(param1.@style);
         }
         var _loc11_:int = 0;
         var _loc10_:* = param1.attributes();
         for each(var _loc5_ in param1.attributes())
         {
            _loc7_ = _loc5_.name().toString();
            if(_loc7_ != "style")
            {
               _loc6_ = _loc5_;
               if(param2.hasOwnProperty(_loc7_))
               {
                  param2[_loc7_] = _loc6_ == "true"?true:_loc6_ == "false"?false:_loc6_;
               }
               else if(_loc7_ == "var" && param3 && param3.hasOwnProperty(_loc6_))
               {
                  param2.xmlVar = _loc6_;
                  param3[_loc6_] = param2;
               }
            }
         }
         if(param2 is IItem)
         {
            IItem(param2).initItems();
         }
         return param2;
      }
      
      protected static function getCompInstance(param1:XML) : Component
      {
         var _loc2_:String = param1.@runtime;
         var _loc3_:Class = !!_loc2_?getCompClass(_loc2_):uiClassMap[param1.name()];
         if(_loc3_)
         {
            return new _loc3_();
         }
         Log.fatal(View,"getCompInstance no class",_loc2_);
         return null;
      }
      
      public static function getCompClass(param1:String) : Class
      {
         var _loc2_:Dictionary = runtimeClassMap;
         var _loc3_:Class = viewClassMap[param1];
         if(runtimeClassMap[_loc3_])
         {
            return runtimeClassMap[_loc3_];
         }
         return _loc3_;
      }
      
      public static function registerComponent(param1:String, param2:Class) : void
      {
         uiClassMap[param1] = param2;
      }
      
      public static function registerViewRuntime(param1:String, param2:Class) : void
      {
         viewClassMap[param1] = param2;
      }
      
      protected function createView(param1:XML) : void
      {
         createComp(param1,this,this);
      }
      
      protected function loadUI(param1:String) : void
      {
         var _loc2_:XML = xmlMap[param1];
         if(_loc2_)
         {
            createView(_loc2_);
         }
      }
      
      public function reCreate(param1:Component = null) : void
      {
         param1 = param1 || this;
         var _loc2_:Object = param1.dataSource;
         if(param1 is Box)
         {
            Box(param1).removeAllChild();
         }
         createComp(param1.comXml,param1,this);
         param1.dataSource = _loc2_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
