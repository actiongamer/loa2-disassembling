package away3d.materials.compilation
{
   import away3d.materials.methods.MethodVO;
   
   public class MethodDependencyCounter
   {
       
      
      private var _projectionDependencies:uint;
      
      private var _normalDependencies:uint;
      
      private var _viewDirDependencies:uint;
      
      private var _uvDependencies:uint;
      
      private var _secondaryUVDependencies:uint;
      
      private var _globalPosDependencies:uint;
      
      private var _tangentDependencies:uint;
      
      private var _usesGlobalPosFragment:Boolean = false;
      
      private var _numPointLights:uint;
      
      private var _lightSourceMask:uint;
      
      public function MethodDependencyCounter()
      {
         super();
      }
      
      public function reset() : void
      {
         _projectionDependencies = 0;
         _normalDependencies = 0;
         _viewDirDependencies = 0;
         _uvDependencies = 0;
         _secondaryUVDependencies = 0;
         _globalPosDependencies = 0;
         _tangentDependencies = 0;
         _usesGlobalPosFragment = false;
      }
      
      public function setPositionedLights(param1:uint, param2:uint) : void
      {
         _numPointLights = param1;
         _lightSourceMask = param2;
      }
      
      public function includeMethodVO(param1:MethodVO) : void
      {
         if(param1.needsProjection)
         {
            _projectionDependencies = _projectionDependencies + 1;
         }
         if(param1.needsGlobalVertexPos)
         {
            _globalPosDependencies = _globalPosDependencies + 1;
            if(param1.needsGlobalFragmentPos)
            {
               _usesGlobalPosFragment = true;
            }
         }
         else if(param1.needsGlobalFragmentPos)
         {
            _globalPosDependencies = _globalPosDependencies + 1;
            _usesGlobalPosFragment = true;
         }
         if(param1.needsNormals)
         {
            _normalDependencies = _normalDependencies + 1;
         }
         if(param1.needsTangents)
         {
            _tangentDependencies = _tangentDependencies + 1;
         }
         if(param1.needsView)
         {
            _viewDirDependencies = _viewDirDependencies + 1;
         }
         if(param1.needsUV)
         {
            _uvDependencies = _uvDependencies + 1;
         }
         if(param1.needsSecondaryUV)
         {
            _secondaryUVDependencies = _secondaryUVDependencies + 1;
         }
      }
      
      public function get tangentDependencies() : uint
      {
         return _tangentDependencies;
      }
      
      public function get usesGlobalPosFragment() : Boolean
      {
         return _usesGlobalPosFragment;
      }
      
      public function get projectionDependencies() : uint
      {
         return _projectionDependencies;
      }
      
      public function get normalDependencies() : uint
      {
         return _normalDependencies;
      }
      
      public function get viewDirDependencies() : uint
      {
         return _viewDirDependencies;
      }
      
      public function get uvDependencies() : uint
      {
         return _uvDependencies;
      }
      
      public function get secondaryUVDependencies() : uint
      {
         return _secondaryUVDependencies;
      }
      
      public function get globalPosDependencies() : uint
      {
         return _globalPosDependencies;
      }
      
      public function addWorldSpaceDependencies(param1:Boolean) : void
      {
         if(_viewDirDependencies > 0)
         {
            _globalPosDependencies = _globalPosDependencies + 1;
         }
         if(_numPointLights > 0 && _lightSourceMask & 1)
         {
            _globalPosDependencies = _globalPosDependencies + 1;
            if(param1)
            {
               _usesGlobalPosFragment = true;
            }
         }
      }
   }
}
