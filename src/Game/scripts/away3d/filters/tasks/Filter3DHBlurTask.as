package away3d.filters.tasks
{
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   
   public class Filter3DHBlurTask extends Filter3DTaskBase
   {
      
      private static var MAX_AUTO_SAMPLES:int = 15;
       
      
      private var _amount:uint;
      
      private var _data:Vector.<Number>;
      
      private var _stepSize:int = 1;
      
      private var _realStepSize:Number;
      
      public function Filter3DHBlurTask(param1:uint, param2:int = -1)
      {
         super();
         _amount = param1;
         _data = Vector.<Number>([0,0,0,1]);
         this.stepSize = param2;
      }
      
      public function get amount() : uint
      {
         return _amount;
      }
      
      public function set amount(param1:uint) : void
      {
         if(param1 == _amount)
         {
            return;
         }
         _amount = param1;
         invalidateProgram3D();
         updateBlurData();
         calculateStepSize();
      }
      
      public function get stepSize() : int
      {
         return _stepSize;
      }
      
      public function set stepSize(param1:int) : void
      {
         if(param1 == _stepSize)
         {
            return;
         }
         _stepSize = param1;
         calculateStepSize();
         invalidateProgram3D();
         updateBlurData();
      }
      
      override protected function getFragmentCode() : String
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc1_:int = 1;
         _loc2_ = "mov ft0, v0\t\nsub ft0.x, v0.x, fc0.x\n";
         _loc2_ = _loc2_ + "tex ft1, ft0, fs0 <2d,linear,clamp>\n";
         _loc3_ = _realStepSize;
         while(_loc3_ <= _amount)
         {
            _loc2_ = _loc2_ + "add ft0.x, ft0.x, fc0.y\t\ntex ft2, ft0, fs0 <2d,linear,clamp>\nadd ft1, ft1, ft2 \n";
            _loc1_++;
            _loc3_ = _loc3_ + _realStepSize;
         }
         _loc2_ = _loc2_ + "mul oc, ft1, fc0.z";
         _data[2] = 1 / _loc1_;
         return _loc2_;
      }
      
      override public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         param1.context3D.setProgramConstantsFromVector("fragment",0,_data,1);
      }
      
      override protected function updateTextures(param1:Stage3DProxy) : void
      {
         super.updateTextures(param1);
         updateBlurData();
      }
      
      private function updateBlurData() : void
      {
         var _loc1_:Number = 1 / _textureWidth;
         _data[0] = _amount * 0.5 * _loc1_;
         _data[1] = _realStepSize * _loc1_;
      }
      
      private function calculateStepSize() : void
      {
         _realStepSize = _stepSize > 0?_stepSize:_amount > MAX_AUTO_SAMPLES?_amount / MAX_AUTO_SAMPLES:1;
      }
   }
}
