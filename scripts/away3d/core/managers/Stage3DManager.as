package away3d.core.managers
{
   import flash.utils.Dictionary;
   import flash.display.Stage;
   import com.mz.core.configs.EnvConfig;
   
   public class Stage3DManager
   {
      
      private static var _instances:Dictionary;
      
      private static var _stageProxies:Vector.<away3d.core.managers.Stage3DProxy>;
      
      private static var _numStageProxies:uint = 0;
       
      
      private var _stage:Stage;
      
      public function Stage3DManager(param1:Stage, param2:Stage3DManagerSingletonEnforcer)
      {
         super();
         if(!param2)
         {
            throw new Error("This class is a multiton and cannot be instantiated manually. Use Stage3DManager.getInstance instead.");
         }
         _stage = param1;
         if(!_stageProxies)
         {
            _stageProxies = new Vector.<away3d.core.managers.Stage3DProxy>(_stage.stage3Ds.length,true);
         }
      }
      
      public static function getInstance(param1:Stage) : Stage3DManager
      {
         var _loc2_:* = param1;
         var _loc3_:* = (_instances || new Dictionary())[_loc2_] || new Stage3DManager(param1,new Stage3DManagerSingletonEnforcer());
         (_instances || new Dictionary())[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      public function getStage3DProxy(param1:uint, param2:Boolean = false) : away3d.core.managers.Stage3DProxy
      {
         if(!_stageProxies[param1])
         {
            _numStageProxies = Number(_numStageProxies) + 1;
            _stageProxies[param1] = new away3d.core.managers.Stage3DProxy(param1,_stage.stage3Ds[param1],this,param2);
         }
         return _stageProxies[param1];
      }
      
      function removeStage3DProxy(param1:away3d.core.managers.Stage3DProxy) : void
      {
         _numStageProxies = Number(_numStageProxies) - 1;
         _stageProxies[param1.stage3DIndex] = null;
      }
      
      public function getFreeStage3DProxy(param1:Boolean = false) : away3d.core.managers.Stage3DProxy
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _stageProxies.length;
         while(_loc3_ < _loc2_)
         {
            if(!_stageProxies[_loc3_])
            {
               getStage3DProxy(_loc3_,param1);
               _stageProxies[_loc3_].width = _stage.stageWidth;
               _stageProxies[_loc3_].height = _stage.stageHeight - EnvConfig.ins.shellY;
               return _stageProxies[_loc3_];
            }
            _loc3_++;
         }
         throw new Error("Too many Stage3D instances used!");
      }
      
      public function get hasFreeStage3DProxy() : Boolean
      {
         return _numStageProxies < _stageProxies.length?true:false;
      }
      
      public function get numProxySlotsFree() : uint
      {
         return _stageProxies.length - _numStageProxies;
      }
      
      public function get numProxySlotsUsed() : uint
      {
         return _numStageProxies;
      }
      
      public function get numProxySlotsTotal() : uint
      {
         return _stageProxies.length;
      }
   }
}

class Stage3DManagerSingletonEnforcer
{
    
   
   function Stage3DManagerSingletonEnforcer()
   {
      super();
   }
}
