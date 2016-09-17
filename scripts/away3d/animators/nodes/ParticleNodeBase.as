package away3d.animators.nodes
{
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.animators.data.ParticleProperties;
   import away3d.animators.ParticleAnimationSet;
   
   public class ParticleNodeBase extends AnimationNodeBase
   {
       
      
      protected var _mode:uint;
      
      private var _priority:int;
      
      protected var _dataLength:uint = 3;
      
      protected var _oneData:Vector.<Number>;
      
      var dataOffset:uint;
      
      public function ParticleNodeBase(param1:String, param2:uint, param3:uint, param4:int = 1)
      {
         super();
         switch(int(param2))
         {
            case 0:
               param1 = param1 + "Global";
               break;
            case 1:
               param1 = param1 + "LocalStatic";
               break;
            case 2:
               param1 = param1 + "LocalDynamic";
         }
         this.name = param1;
         _mode = param2;
         _priority = param4;
         _dataLength = param3;
         _oneData = new Vector.<Number>(_dataLength,true);
      }
      
      public final function get mode() : uint
      {
         return _mode;
      }
      
      public function get priority() : int
      {
         return _priority;
      }
      
      public function get dataLength() : int
      {
         return _dataLength;
      }
      
      public function get oneData() : Vector.<Number>
      {
         return _oneData;
      }
      
      public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         return "";
      }
      
      public function getAGALFragmentCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         return "";
      }
      
      public function getAGALUVCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         return "";
      }
      
      function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
      }
      
      function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
      }
   }
}
