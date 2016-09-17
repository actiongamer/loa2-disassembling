package nslm2.common.ui.components.comp3ds.lightAndShadows
{
   import com.mz.core.interFace.IDispose;
   import away3d.containers.ObjectContainer3D;
   import away3d.lights.DirectionalLight;
   import away3d.materials.lightpickers.StaticLightPicker;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.HBox;
   import nslm2.common.ui.components.debug3d.DirectionalLightParamBox;
   import nslm2.modules.logModules.tests.LightEntity;
   
   public class LightAndShadowCtrl implements IDispose
   {
      
      public static const KEY:String = "LightAndShadowCtrl";
       
      
      public var lightNum:int = 2;
      
      protected var layer3D:ObjectContainer3D;
      
      public var lightArr:Vector.<DirectionalLight>;
      
      private var _lightPicker:StaticLightPicker;
      
      private var _debugBox:HBox;
      
      private var paramBoxArr:Vector.<DirectionalLightParamBox>;
      
      public var lightEntiyArr:Vector.<LightEntity>;
      
      public function LightAndShadowCtrl(param1:ObjectContainer3D, param2:int = 2)
      {
         super();
         this.lightNum = param2;
         this.layer3D = param1;
         this.initLight();
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         paramBoxArr = null;
         this._lightPicker = null;
         var _loc1_:int = this.lightArr.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.lightArr[_loc2_].dispose();
            _loc2_++;
         }
         lightArr = null;
      }
      
      public function get lightPicker() : StaticLightPicker
      {
         if(_lightPicker == null)
         {
            _lightPicker = new StaticLightPicker(ArrayUtil.vectorToArr(lightArr));
         }
         return _lightPicker;
      }
      
      protected function initLight() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.lightArr = new Vector.<DirectionalLight>();
         var _loc2_:int = lightNum;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.createLight();
            this.configLight(_loc1_,_loc3_);
            this.lightArr.push(_loc1_);
            _loc3_++;
         }
      }
      
      protected function createLight() : DirectionalLight
      {
         var _loc1_:* = null;
         _loc1_ = new DirectionalLight(0,0,1);
         return _loc1_;
      }
      
      protected function configLight(param1:DirectionalLight, param2:int) : void
      {
         switch(int(param2))
         {
            case 0:
               param1.rotationX = 51;
               param1.rotationY = -294;
               param1.rotationZ = 0;
               param1.color = 16772795;
               param1.ambientColor = 16777215;
               param1.ambient = 0.51;
               param1.diffuse = 0.91;
               param1.specular = 0.1;
               break;
            case 1:
               param1.rotationX = 0;
               param1.rotationY = 250;
               param1.rotationZ = -40;
               param1.color = 16777215;
               param1.ambientColor = 16777215;
               param1.ambient = 0.1;
               param1.diffuse = 0.7;
               param1.specular = 0.1;
               break;
            case 2:
               param1.rotationX = 0;
               param1.rotationY = 247;
               param1.rotationZ = 30;
               param1.color = 16777215;
               param1.ambientColor = 16777215;
               param1.ambient = 0;
               param1.diffuse = 0.3;
               param1.specular = 0.1;
         }
      }
      
      public function get debugBox() : HBox
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         if(_debugBox == null)
         {
            _debugBox = new HBox();
            paramBoxArr = new Vector.<DirectionalLightParamBox>();
            _loc3_ = this.lightArr.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc1_ = this.lightArr[_loc4_];
               _loc2_ = new DirectionalLightParamBox();
               paramBoxArr.push(_loc2_);
               _loc2_.bind(_loc1_,lightPicker,"light" + (_loc4_ + 1));
               _debugBox.addChild(_loc2_);
               _loc4_++;
            }
         }
         return _debugBox;
      }
      
      public function initLightEntity() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(lightEntiyArr == null)
         {
            _loc3_ = this.lightArr.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.lightArr[_loc4_];
               _loc1_ = new LightEntity(_loc2_);
               this.layer3D.addChild(_loc1_);
               _loc4_++;
            }
         }
      }
      
      public function exportConfig() : Object
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc3_:int = this.paramBoxArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.paramBoxArr[_loc4_];
            if(_loc2_.cb_enabled.selected)
            {
               _loc1_.push(_loc2_.exportConfig());
            }
            _loc4_++;
         }
         return _loc1_;
      }
   }
}
