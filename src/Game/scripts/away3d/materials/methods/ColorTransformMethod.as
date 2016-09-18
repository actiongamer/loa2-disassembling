package away3d.materials.methods
{
   import flash.geom.ColorTransform;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.core.managers.Stage3DProxy;
   
   public class ColorTransformMethod extends EffectMethodBase
   {
       
      
      private var _colorTransform:ColorTransform;
      
      public function ColorTransformMethod()
      {
         super();
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         _colorTransform = param1;
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:String = "";
         if(param2)
         {
            _loc4_ = param2.getFreeFragmentConstant();
            _loc5_ = param2.getFreeFragmentConstant();
            if(_loc4_ != null || _loc5_ != null)
            {
               param1.fragmentConstantsIndex = _loc4_.index * 4;
               _loc6_ = _loc6_ + ("mul " + param3 + ", " + param3.toString() + ", " + _loc4_ + "\n" + "add " + param3 + ", " + param3.toString() + ", " + _loc5_ + "\n");
            }
         }
         return _loc6_;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = 0.00392156862745098;
         var _loc3_:int = param1.fragmentConstantsIndex;
         if(_loc3_ != -1)
         {
            _loc4_ = param1.fragmentData;
            if(_loc4_)
            {
               _loc4_[_loc3_] = _colorTransform.redMultiplier;
               _loc4_[_loc3_ + 1] = _colorTransform.greenMultiplier;
               _loc4_[_loc3_ + 2] = _colorTransform.blueMultiplier;
               _loc4_[_loc3_ + 3] = _colorTransform.alphaMultiplier;
               _loc4_[_loc3_ + 4] = _colorTransform.redOffset * _loc5_;
               _loc4_[_loc3_ + 5] = _colorTransform.greenOffset * _loc5_;
               _loc4_[_loc3_ + 6] = _colorTransform.blueOffset * _loc5_;
               _loc4_[_loc3_ + 7] = _colorTransform.alphaOffset * _loc5_;
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
