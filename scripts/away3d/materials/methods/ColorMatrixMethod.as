package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.core.managers.Stage3DProxy;
   
   public class ColorMatrixMethod extends EffectMethodBase
   {
       
      
      private var _data:Vector.<Number>;
      
      private var _matrix:Array;
      
      public function ColorMatrixMethod(param1:Array)
      {
         super();
         if(param1.length != 20)
         {
            throw new Error("Matrix length must be 20!");
         }
         _matrix = param1;
      }
      
      public function get colorMatrix() : Array
      {
         return _matrix;
      }
      
      public function set colorMatrix(param1:Array) : void
      {
         _matrix = param1;
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc6_:String = "";
         var _loc4_:ShaderRegisterElement = param2.getFreeFragmentConstant();
         param2.getFreeFragmentConstant();
         param2.getFreeFragmentConstant();
         param2.getFreeFragmentConstant();
         var _loc5_:ShaderRegisterElement = param2.getFreeFragmentConstant();
         param1.fragmentConstantsIndex = _loc4_.index * 4;
         _loc6_ = _loc6_ + ("m44 " + param3 + ", " + param3 + ", " + _loc4_ + "\n" + "add " + param3 + ", " + param3 + ", " + _loc5_ + "\n");
         return _loc6_;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc4_:Array = _matrix;
         var _loc3_:int = param1.fragmentConstantsIndex;
         var _loc5_:Vector.<Number> = param1.fragmentData;
         _loc5_[_loc3_] = _loc4_[0];
         _loc5_[_loc3_ + 1] = _loc4_[1];
         _loc5_[_loc3_ + 2] = _loc4_[2];
         _loc5_[_loc3_ + 3] = _loc4_[3];
         _loc5_[_loc3_ + 4] = _loc4_[5];
         _loc5_[_loc3_ + 5] = _loc4_[6];
         _loc5_[_loc3_ + 6] = _loc4_[7];
         _loc5_[_loc3_ + 7] = _loc4_[8];
         _loc5_[_loc3_ + 8] = _loc4_[10];
         _loc5_[_loc3_ + 9] = _loc4_[11];
         _loc5_[_loc3_ + 10] = _loc4_[12];
         _loc5_[_loc3_ + 11] = _loc4_[13];
         _loc5_[_loc3_ + 12] = _loc4_[15];
         _loc5_[_loc3_ + 13] = _loc4_[16];
         _loc5_[_loc3_ + 14] = _loc4_[17];
         _loc5_[_loc3_ + 15] = _loc4_[18];
         _loc5_[_loc3_ + 16] = _loc4_[4];
         _loc5_[_loc3_ + 17] = _loc4_[9];
         _loc5_[_loc3_ + 18] = _loc4_[14];
         _loc5_[_loc3_ + 19] = _loc4_[19];
      }
   }
}
