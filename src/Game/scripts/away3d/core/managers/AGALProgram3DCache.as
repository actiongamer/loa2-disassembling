package away3d.core.managers
{
   import flash.utils.Dictionary;
   import away3d.events.Stage3DEvent;
   import flash.utils.ByteArray;
   import away3d.materials.passes.MaterialPassBase;
   import com.adobe.utils.AGALMiniAssembler;
   import away3d.debug.Debug;
   
   public class AGALProgram3DCache
   {
      
      private static var _instances:Vector.<away3d.core.managers.AGALProgram3DCache>;
      
      private static var _currentId:int;
      
      private static var _keyDic:Dictionary = new Dictionary();
       
      
      private var _stage3DProxy:away3d.core.managers.Stage3DProxy;
      
      private var _program3Ds:Dictionary;
      
      private var _ids:Dictionary;
      
      private var _usages:Array;
      
      private var _keys:Array;
      
      public function AGALProgram3DCache(param1:away3d.core.managers.Stage3DProxy, param2:AGALProgram3DCacheSingletonEnforcer)
      {
         super();
         if(!param2)
         {
            throw new Error("This class is a multiton and cannot be instantiated manually. Use Stage3DManager.getInstance instead.");
         }
         _stage3DProxy = param1;
         _program3Ds = new Dictionary();
         _ids = new Dictionary();
         _usages = [];
         _keys = [];
      }
      
      public static function getInstance(param1:away3d.core.managers.Stage3DProxy) : away3d.core.managers.AGALProgram3DCache
      {
         var _loc2_:int = param1._stage3DIndex;
         if(!_instances)
         {
            _instances = new Vector.<away3d.core.managers.AGALProgram3DCache>(8,true);
         }
         if(!_instances[_loc2_])
         {
            _instances[_loc2_] = new away3d.core.managers.AGALProgram3DCache(param1,new AGALProgram3DCacheSingletonEnforcer());
            param1.addEventListener("Context3DDisposed",onContext3DDisposed,false,0,true);
            param1.addEventListener("Context3DCreated",onContext3DDisposed,false,0,true);
            param1.addEventListener("Context3DRecreated",onContext3DDisposed,false,0,true);
         }
         return _instances[_loc2_];
      }
      
      public static function getInstanceFromIndex(param1:int) : away3d.core.managers.AGALProgram3DCache
      {
         if(!_instances[param1])
         {
            return null;
         }
         return _instances[param1];
      }
      
      private static function onContext3DDisposed(param1:Stage3DEvent) : void
      {
         var _loc2_:away3d.core.managers.Stage3DProxy = away3d.core.managers.Stage3DProxy(param1.target);
         var _loc3_:int = _loc2_._stage3DIndex;
         _instances[_loc3_].dispose();
         _instances[_loc3_] = null;
         _loc2_.removeEventListener("Context3DDisposed",onContext3DDisposed);
         _loc2_.removeEventListener("Context3DCreated",onContext3DDisposed);
         _loc2_.removeEventListener("Context3DRecreated",onContext3DDisposed);
      }
      
      private static function getKey(param1:String, param2:String) : ByteArray
      {
         var _loc3_:* = null;
         if(_keyDic[param1] == null)
         {
            _keyDic[param1] = new Dictionary();
         }
         _loc3_ = _keyDic[param1][param2];
         if(_loc3_ == null)
         {
            _loc3_ = new ByteArray();
            _loc3_.writeUTFBytes(param1);
            _loc3_.writeUTFBytes("---");
            _loc3_.writeUTFBytes(param2);
            _keyDic[param1][param2] = _loc3_;
         }
         return _loc3_;
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _program3Ds;
         for(var _loc1_ in _program3Ds)
         {
            destroyProgram(_loc1_);
         }
         _program3Ds = new Dictionary();
         _ids = new Dictionary();
         _usages = [];
         _keys = [];
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _program3Ds;
         for(var _loc1_ in _program3Ds)
         {
            destroyProgram(_loc1_);
         }
         _keys = null;
         _program3Ds = null;
         _usages = null;
      }
      
      public function setProgram3D(param1:MaterialPassBase, param2:String, param3:String) : void
      {
         var _loc6_:int = _stage3DProxy._stage3DIndex;
         var _loc7_:ByteArray = getKey(param2,param3);
         if(_program3Ds[_loc7_] == null)
         {
            _keys[_currentId] = _loc7_;
            _usages[_currentId] = 0;
            _ids[_loc7_] = _currentId;
            _currentId = _currentId + 1;
            if(_stage3DProxy._context3D.hasOwnProperty("profile") && (_stage3DProxy._context3D.profile == "standard" || _stage3DProxy._context3D.profile == "standardConstrained"))
            {
               _program3Ds[_loc7_] = new AGALMiniAssembler(Debug.active).assemble2(_stage3DProxy._context3D,2,param2,param3);
            }
            else
            {
               _program3Ds[_loc7_] = new AGALMiniAssembler(Debug.active).assemble2(_stage3DProxy._context3D,1,param2,param3);
            }
         }
         var _loc5_:int = param1._program3Dids[_loc6_];
         var _loc4_:int = _ids[_loc7_];
         if(_loc5_ != _loc4_)
         {
            if(_loc5_ >= 0)
            {
               freeProgram3D(_loc5_);
            }
            var _loc8_:* = _usages;
            var _loc9_:* = _loc4_;
            var _loc10_:* = Number(_loc8_[_loc9_]) + 1;
            _loc8_[_loc9_] = _loc10_;
         }
         param1._program3Dids[_loc6_] = _loc4_;
         param1._program3Ds[_loc6_] = _program3Ds[_loc7_];
      }
      
      public function freeProgram3D(param1:int) : void
      {
         var _loc2_:* = _usages;
         var _loc3_:* = param1;
         var _loc4_:* = Number(_loc2_[_loc3_]) - 1;
         _loc2_[_loc3_] = _loc4_;
         if(_usages[param1] == 0)
         {
            destroyProgram(_keys[param1]);
         }
      }
      
      private function destroyProgram(param1:ByteArray) : void
      {
         _program3Ds[param1].dispose();
         _program3Ds[param1] = null;
         delete _program3Ds[param1];
         _ids[param1] = -1;
      }
   }
}

class AGALProgram3DCacheSingletonEnforcer
{
    
   
   function AGALProgram3DCacheSingletonEnforcer()
   {
      super();
   }
}
