package away3d.materials.methods
{
   import away3d.materials.passes.OutlinePass;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.materials.passes.MaterialPassBase;
   
   public class OutlineMethod extends EffectMethodBase
   {
       
      
      private var _outlinePass:OutlinePass;
      
      public function OutlineMethod(param1:uint = 0, param2:Number = 1, param3:Boolean = true, param4:Boolean = false)
      {
         super();
         _passes = new Vector.<MaterialPassBase>();
         _outlinePass = new OutlinePass(param1,param2,param3,param4);
         _passes.push(_outlinePass);
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsNormals = false;
      }
      
      public function get showInnerLines() : Boolean
      {
         return _outlinePass.showInnerLines;
      }
      
      public function set showInnerLines(param1:Boolean) : void
      {
         _outlinePass.showInnerLines = param1;
      }
      
      public function get outlineColor() : uint
      {
         return _outlinePass.outlineColor;
      }
      
      public function set outlineColor(param1:uint) : void
      {
         _outlinePass.outlineColor = param1;
      }
      
      public function get outlineSize() : Number
      {
         return _outlinePass.outlineSize;
      }
      
      public function set outlineSize(param1:Number) : void
      {
         _outlinePass.outlineSize = param1;
      }
      
      override function reset() : void
      {
         super.reset();
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         return "";
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _outlinePass.dispose();
      }
   }
}
