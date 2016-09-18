package away3d.animators
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   import away3d.animators.nodes.AnimationNodeBase;
   import flash.utils.Dictionary;
   
   public class AnimationSetBase extends NamedAssetBase implements IAsset
   {
       
      
      private var _usesCPU:Boolean;
      
      private var _animations:Vector.<AnimationNodeBase>;
      
      private var _animationNames:Vector.<String>;
      
      private var _animationDictionary:Dictionary;
      
      public function AnimationSetBase()
      {
         _animations = new Vector.<AnimationNodeBase>();
         _animationNames = new Vector.<String>();
         _animationDictionary = new Dictionary(true);
         super();
      }
      
      protected function findTempReg(param1:Vector.<String>, param2:String = null) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         while(true)
         {
            _loc3_ = "vt" + _loc4_;
            if(param1.indexOf(_loc3_) == -1 && param2 != _loc3_)
            {
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      protected function findTempReg2(param1:Vector.<String>, param2:Array = null) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         while(true)
         {
            _loc3_ = "vt" + _loc4_;
            if(param1.indexOf(_loc3_) == -1 && param2.indexOf(_loc3_) == -1)
            {
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get usesCPU() : Boolean
      {
         return _usesCPU;
      }
      
      public function resetGPUCompatibility() : void
      {
         _usesCPU = false;
      }
      
      public function cancelGPUCompatibility() : void
      {
         _usesCPU = true;
      }
      
      public function get assetType() : String
      {
         return "animationSet";
      }
      
      public function get animations() : Vector.<AnimationNodeBase>
      {
         return _animations;
      }
      
      public function get animationNames() : Vector.<String>
      {
         return _animationNames;
      }
      
      public function hasAnimation(param1:String) : Boolean
      {
         return _animationDictionary[param1] != null;
      }
      
      public function getAnimation(param1:String) : AnimationNodeBase
      {
         return _animationDictionary[param1];
      }
      
      public function addAnimation(param1:AnimationNodeBase) : void
      {
         if(_animationDictionary[param1.name])
         {
            return;
         }
         _animationDictionary[param1.name] = param1;
         _animations.push(param1);
         _animationNames.push(param1.name);
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _animationDictionary;
         for(var _loc1_ in _animationDictionary)
         {
            (_animationDictionary[_loc1_] as AnimationNodeBase).dispose();
            delete _animationDictionary[_loc1_];
         }
         _animations.length = 0;
         _animationNames.length = 0;
      }
      
      protected function get animationDictionary() : Dictionary
      {
         return _animationDictionary;
      }
   }
}
