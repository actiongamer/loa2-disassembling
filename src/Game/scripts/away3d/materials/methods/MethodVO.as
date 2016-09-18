package away3d.materials.methods
{
   public class MethodVO
   {
       
      
      public var vertexConstantsOffset:int;
      
      public var vertexData:Vector.<Number>;
      
      private var _fragmentData:Vector.<Number>;
      
      public var texturesIndex:int;
      
      public var secondaryTexturesIndex:int;
      
      public var vertexConstantsIndex:int;
      
      public var secondaryVertexConstantsIndex:int;
      
      private var _fragmentConstantsIndex:int;
      
      public var secondaryFragmentConstantsIndex:int;
      
      public var useMipmapping:Boolean;
      
      public var useSmoothTextures:Boolean;
      
      public var repeatTextures:Boolean;
      
      public var needsProjection:Boolean;
      
      public var needsView:Boolean;
      
      private var _needsNormals:Boolean;
      
      public var needsTangents:Boolean;
      
      public var needsUV:Boolean;
      
      public var needsSecondaryUV:Boolean;
      
      public var needsGlobalVertexPos:Boolean;
      
      public var needsGlobalFragmentPos:Boolean;
      
      public var numLights:int;
      
      public var useLightFallOff:Boolean;
      
      public function MethodVO()
      {
         super();
      }
      
      public final function get needsNormals() : Boolean
      {
         return _needsNormals;
      }
      
      public final function set needsNormals(param1:Boolean) : void
      {
         _needsNormals = param1;
      }
      
      public function reset() : void
      {
         vertexConstantsOffset = 0;
         texturesIndex = -1;
         vertexConstantsIndex = -1;
         fragmentConstantsIndex = -1;
         useMipmapping = true;
         useSmoothTextures = true;
         repeatTextures = false;
         needsProjection = false;
         needsView = false;
         needsNormals = false;
         needsTangents = false;
         needsUV = false;
         needsSecondaryUV = false;
         needsGlobalVertexPos = false;
         needsGlobalFragmentPos = false;
         numLights = 0;
         useLightFallOff = false;
      }
      
      public final function get fragmentData() : Vector.<Number>
      {
         return _fragmentData;
      }
      
      public final function set fragmentData(param1:Vector.<Number>) : void
      {
         _fragmentData = param1;
      }
      
      public final function get fragmentConstantsIndex() : int
      {
         return _fragmentConstantsIndex;
      }
      
      public final function set fragmentConstantsIndex(param1:int) : void
      {
         _fragmentConstantsIndex = param1;
      }
   }
}
