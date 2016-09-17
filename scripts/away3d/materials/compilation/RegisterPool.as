package away3d.materials.compilation
{
   import flash.utils.Dictionary;
   
   class RegisterPool
   {
      
      private static const _regCompsPool:Dictionary = new Dictionary();
      
      private static const _regPool:Dictionary = new Dictionary();
       
      
      private var _persistent:Boolean;
      
      private var _regCount:int;
      
      private var _regName:String;
      
      private var _registerComponents:Array;
      
      private var _usedSingleCount:Vector.<Vector.<uint>>;
      
      private var _usedVectorCount:Vector.<uint>;
      
      private var _vectorRegisters:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      function RegisterPool(param1:String, param2:int, param3:Boolean = true)
      {
         super();
         _regName = param1;
         _regCount = param2;
         _persistent = param3;
         initRegisters(param1,param2);
      }
      
      private static function _initPool(param1:String, param2:int) : String
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:String = param1 + param2;
         if(_regPool[_loc4_] != undefined)
         {
            return _loc4_;
         }
         var _loc3_:Vector.<away3d.materials.compilation.ShaderRegisterElement> = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(param2,true);
         _regPool[_loc4_] = _loc3_;
         var _loc5_:Array = [[],[],[],[]];
         _regCompsPool[_loc4_] = _loc5_;
         _loc7_ = 0;
         while(_loc7_ < param2)
         {
            _loc3_[_loc7_] = new away3d.materials.compilation.ShaderRegisterElement(param1,_loc7_);
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc5_[_loc6_][_loc7_] = new away3d.materials.compilation.ShaderRegisterElement(param1,_loc7_,_loc6_);
               _loc6_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function addUsage(param1:away3d.materials.compilation.ShaderRegisterElement, param2:int) : void
      {
         if(param1._component > -1)
         {
            var _loc3_:* = param1.index;
            var _loc4_:* = _usedSingleCount[param1._component][_loc3_] + param2;
            _usedSingleCount[param1._component][_loc3_] = _loc4_;
         }
         else
         {
            _loc4_ = param1.index;
            _loc3_ = _usedVectorCount[_loc4_] + param2;
            _usedVectorCount[_loc4_] = _loc3_;
         }
      }
      
      public function dispose() : void
      {
         _vectorRegisters = null;
         _registerComponents = null;
         _usedSingleCount = null;
         _usedVectorCount = null;
      }
      
      public function hasRegisteredRegs() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _regCount)
         {
            if(isRegisterUsed(_loc1_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function removeUsage(param1:away3d.materials.compilation.ShaderRegisterElement) : void
      {
         if(param1._component > -1)
         {
            var _loc2_:* = _usedSingleCount[param1._component];
            var _loc3_:* = param1.index;
            var _loc4_:* = _loc2_[_loc3_] - 1;
            _loc2_[_loc3_] = _loc4_;
            if(_loc4_ < 0)
            {
               throw new Error("More usages removed than exist!");
            }
         }
         else
         {
            _loc2_ = _usedVectorCount;
            _loc3_ = param1.index;
            _loc4_ = _loc2_[_loc3_] - 1;
            _loc2_[_loc3_] = _loc4_;
            if(_loc4_ < 0)
            {
               throw new Error("More usages removed than exist!");
            }
         }
      }
      
      public function requestFreeRegComponent() : away3d.materials.compilation.ShaderRegisterElement
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _regCount)
         {
            if(_usedVectorCount[_loc2_] <= 0)
            {
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  if(_usedSingleCount[_loc1_][_loc2_] == 0)
                  {
                     if(_persistent)
                     {
                        var _loc3_:* = _usedSingleCount[_loc1_];
                        var _loc4_:* = _loc2_;
                        var _loc5_:* = Number(_loc3_[_loc4_]) + 1;
                        _loc3_[_loc4_] = _loc5_;
                     }
                     return _registerComponents[_loc1_][_loc2_];
                  }
                  _loc1_++;
               }
            }
            _loc2_++;
         }
         throw new Error("Register overflow!");
      }
      
      public function requestFreeVectorReg() : away3d.materials.compilation.ShaderRegisterElement
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _regCount)
         {
            if(!isRegisterUsed(_loc1_))
            {
               if(_persistent)
               {
                  var _loc2_:* = _usedVectorCount;
                  var _loc3_:* = _loc1_;
                  var _loc4_:* = Number(_loc2_[_loc3_]) + 1;
                  _loc2_[_loc3_] = _loc4_;
               }
               return _vectorRegisters[_loc1_];
            }
            _loc1_++;
         }
         throw new Error("Register overflow!");
      }
      
      private function initRegisters(param1:String, param2:int) : void
      {
         var _loc3_:String = RegisterPool._initPool(param1,param2);
         _vectorRegisters = RegisterPool._regPool[_loc3_];
         _registerComponents = RegisterPool._regCompsPool[_loc3_];
         _usedVectorCount = new Vector.<uint>(param2,true);
         _usedSingleCount = new Vector.<Vector.<uint>>(4,true);
         _usedSingleCount[0] = new Vector.<uint>(param2,true);
         _usedSingleCount[1] = new Vector.<uint>(param2,true);
         _usedSingleCount[2] = new Vector.<uint>(param2,true);
         _usedSingleCount[3] = new Vector.<uint>(param2,true);
      }
      
      private function isRegisterUsed(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(_usedVectorCount[param1] > 0)
         {
            return true;
         }
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            if(_usedSingleCount[_loc2_][param1] > 0)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}
