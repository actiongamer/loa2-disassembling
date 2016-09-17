package nslm2.common.ui.components.debug3d
{
   import morn.core.components.VBox;
   import away3d.lights.DirectionalLight;
   import away3d.materials.lightpickers.StaticLightPicker;
   import morn.core.components.CheckBox;
   import away3d.containers.ObjectContainer3D;
   import flash.events.Event;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.ConfigUtil;
   
   public class DirectionalLightParamBox extends VBox
   {
      
      public static const COLOR:String = "color";
      
      public static const AMBIENTCOLOR:String = "ambientColor";
      
      public static const AMBIENT:String = "ambient";
      
      public static const DIFFUSE:String = "diffuse";
      
      public static const SPECULAR:String = "specular";
       
      
      public var target:DirectionalLight;
      
      public var lightPicker:StaticLightPicker;
      
      public var cb_enabled:CheckBox;
      
      public var debugTransform:nslm2.common.ui.components.debug3d.Object3DParams;
      
      public var debug_color:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public var debug_ambientColor:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public var debug_ambient:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public var debug_diffuse:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public var debug_specular:nslm2.common.ui.components.debug3d.Param3DRender;
      
      private var lightParent:ObjectContainer3D;
      
      private var lights:Array;
      
      private var $cb:CheckBox;
      
      public function DirectionalLightParamBox()
      {
         super();
      }
      
      public function bind(param1:DirectionalLight, param2:StaticLightPicker, param3:String = "light") : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         target = param1;
         lightPicker = param2;
         cb_enabled = new CheckBox("png.comp.checkbox","可用");
         $cb = new CheckBox("png.comp.checkbox","可用");
         $cb.selected = true;
         $cb.addEventListener("click",cb_click);
         this.addChild($cb);
         debugTransform = new nslm2.common.ui.components.debug3d.Object3DParams(param3);
         _loc5_ = new nslm2.common.ui.components.debug3d.Object3DParams(param3);
         _loc5_.bind(this.target);
         this.addChild(_loc5_);
         debug_color = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_.paramType = "color";
         _loc4_.bind(this.target,"color");
         this.addChild(_loc4_);
         debug_ambientColor = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_.paramType = "color";
         _loc4_.bind(this.target,"ambientColor");
         this.addChild(_loc4_);
         debug_ambient = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_.paramType = "scale";
         _loc4_.bind(this.target,"ambient");
         this.addChild(_loc4_);
         debug_diffuse = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_.paramType = "scale";
         _loc4_.bind(this.target,"diffuse");
         this.addChild(_loc4_);
         debug_specular = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc4_.paramType = "scale";
         _loc4_.bind(this.target,"specular");
         this.addChild(_loc4_);
         lightParent = this.target.parent;
      }
      
      private function cb_click(param1:Event) : void
      {
         var _loc2_:int = ArrayUtil.indexOf(lightPicker.lights,this.target);
         if($cb.selected)
         {
            if(_loc2_ == -1)
            {
               lightPicker.lights.push(this.target);
               lightPicker.lights = lightPicker.lights;
            }
         }
         else if(_loc2_ > -1)
         {
            ArrayUtil.removeItem(lightPicker.lights,this.target);
            lightPicker.lights = lightPicker.lights;
         }
      }
      
      public function exportConfig() : Object
      {
         var _loc1_:Object = {};
         _loc1_["transform"] = ConfigUtil.toTransfrom(this.target);
         _loc1_["color"] = this.target.color.toString(16);
         _loc1_["ambientColor"] = this.target.ambientColor.toString(16);
         _loc1_["ambient"] = this.target.ambient;
         _loc1_["diffuse"] = this.target.diffuse;
         _loc1_["specular"] = this.target.specular;
         return _loc1_;
      }
   }
}
