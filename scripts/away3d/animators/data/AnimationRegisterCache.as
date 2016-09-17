package away3d.animators.data
{
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import flash.utils.Dictionary;
   import away3d.animators.nodes.AnimationNodeBase;
   import flash.geom.Matrix3D;
   
   public class AnimationRegisterCache extends ShaderRegisterCache
   {
       
      
      public var positionAttribute:ShaderRegisterElement;
      
      public var uvAttribute:ShaderRegisterElement;
      
      public var positionTarget:ShaderRegisterElement;
      
      public var scaleAndRotateTarget:ShaderRegisterElement;
      
      public var velocityTarget:ShaderRegisterElement;
      
      public var vertexTime:ShaderRegisterElement;
      
      public var vertexLife:ShaderRegisterElement;
      
      public var vertexZeroConst:ShaderRegisterElement;
      
      public var vertexOneConst:ShaderRegisterElement;
      
      public var vertexTwoConst:ShaderRegisterElement;
      
      public var uvTarget:ShaderRegisterElement;
      
      public var colorAddTarget:ShaderRegisterElement;
      
      public var colorMulTarget:ShaderRegisterElement;
      
      public var colorAddVary:ShaderRegisterElement;
      
      public var colorMulVary:ShaderRegisterElement;
      
      public var varyTime:ShaderRegisterElement;
      
      public var fragmentTime:ShaderRegisterElement;
      
      public var fragmentLife:ShaderRegisterElement;
      
      public var colorTarget:ShaderRegisterElement;
      
      public var uvVar:ShaderRegisterElement;
      
      public var fragmentZeroConst:ShaderRegisterElement;
      
      public var fragmentOneConst:ShaderRegisterElement;
      
      public var rotationRegisters:Vector.<ShaderRegisterElement>;
      
      public var needFragmentAnimation:Boolean;
      
      public var needUVAnimation:Boolean;
      
      public var sourceRegisters:Vector.<String>;
      
      public var targetRegisters:Vector.<String>;
      
      private var indexDictionary:Dictionary;
      
      public var hasUVNode:Boolean;
      
      public var needVelocity:Boolean;
      
      public var hasBillboard:Boolean;
      
      public var hasColorMulNode:Boolean;
      
      public var hasColorAddNode:Boolean;
      
      public var vertexDuration:ShaderRegisterElement;
      
      public var vertexConstantData:Vector.<Number>;
      
      public var fragmentConstantData:Vector.<Number>;
      
      private var _numVertexConstant:int;
      
      private var _numFragmentConstant:int;
      
      public function AnimationRegisterCache()
      {
         indexDictionary = new Dictionary(true);
         vertexConstantData = new Vector.<Number>();
         fragmentConstantData = new Vector.<Number>();
         super();
      }
      
      public function get hasColorNode() : Boolean
      {
         return hasColorMulNode || hasColorAddNode;
      }
      
      override public function reset() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         super.reset();
         rotationRegisters = new Vector.<ShaderRegisterElement>();
         positionAttribute = getRegisterFromString(sourceRegisters[0]);
         scaleAndRotateTarget = getRegisterFromString(targetRegisters[0]);
         addVertexTempUsages(scaleAndRotateTarget,1);
         _loc2_ = 1;
         while(_loc2_ < targetRegisters.length)
         {
            rotationRegisters.push(getRegisterFromString(targetRegisters[_loc2_]));
            addVertexTempUsages(rotationRegisters[_loc2_ - 1],1);
            _loc2_++;
         }
         scaleAndRotateTarget = new ShaderRegisterElement(scaleAndRotateTarget.regName,scaleAndRotateTarget.index,5);
         vertexZeroConst = getFreeVertexConstant();
         vertexZeroConst = new ShaderRegisterElement(vertexZeroConst.regName,vertexZeroConst.index,0);
         vertexOneConst = new ShaderRegisterElement(vertexZeroConst.regName,vertexZeroConst.index,1);
         vertexTwoConst = new ShaderRegisterElement(vertexZeroConst.regName,vertexZeroConst.index,2);
         if(needFragmentAnimation && hasColorNode)
         {
            fragmentZeroConst = getFreeFragmentConstant();
            fragmentZeroConst = new ShaderRegisterElement(fragmentZeroConst.regName,fragmentZeroConst.index,0);
            fragmentOneConst = new ShaderRegisterElement(fragmentZeroConst.regName,fragmentZeroConst.index,1);
            varyTime = getFreeVarying();
            fragmentTime = new ShaderRegisterElement(varyTime.regName,varyTime.index,0);
            fragmentLife = new ShaderRegisterElement(varyTime.regName,varyTime.index,1);
         }
         positionTarget = getFreeVertexVectorTemp();
         addVertexTempUsages(positionTarget,1);
         positionTarget = new ShaderRegisterElement(positionTarget.regName,positionTarget.index,5);
         if(needVelocity)
         {
            velocityTarget = getFreeVertexVectorTemp();
            addVertexTempUsages(velocityTarget,1);
            velocityTarget = new ShaderRegisterElement(velocityTarget.regName,velocityTarget.index,5);
            vertexTime = new ShaderRegisterElement(velocityTarget.regName,velocityTarget.index,3);
            vertexLife = new ShaderRegisterElement(positionTarget.regName,positionTarget.index,3);
         }
         else
         {
            _loc1_ = getFreeVertexVectorTemp();
            addVertexTempUsages(_loc1_,1);
            vertexTime = new ShaderRegisterElement(_loc1_.regName,_loc1_.index,0);
            vertexLife = new ShaderRegisterElement(_loc1_.regName,_loc1_.index,1);
         }
      }
      
      public function setShadedTarget(param1:String) : void
      {
         colorTarget = getRegisterFromString(param1);
         addFragmentTempUsages(colorTarget,1);
      }
      
      public function setUVSourceAndTarget(param1:String, param2:String) : void
      {
         uvVar = getRegisterFromString(param2);
         uvAttribute = getRegisterFromString(param1);
         uvTarget = new ShaderRegisterElement(positionTarget.regName,positionTarget.index,4);
      }
      
      public function setRegisterIndex(param1:AnimationNodeBase, param2:int, param3:int) : void
      {
         var _loc5_:* = param1;
         var _loc6_:* = indexDictionary[_loc5_] || new Vector.<int>(9,true);
         indexDictionary[_loc5_] = _loc6_;
         var _loc4_:Vector.<int> = _loc6_;
         _loc4_[param2] = param3;
      }
      
      public function getRegisterIndex(param1:AnimationNodeBase, param2:int) : int
      {
         return indexDictionary[param1][param2];
      }
      
      public function getRegisterIndexVectror(param1:AnimationNodeBase) : Vector.<int>
      {
         return indexDictionary[param1];
      }
      
      public function getInitCode() : String
      {
         var _loc3_:int = 0;
         var _loc2_:int = sourceRegisters.length;
         var _loc1_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _loc1_ + ("mov " + targetRegisters[_loc3_] + "," + sourceRegisters[_loc3_] + "\n");
            _loc3_++;
         }
         _loc1_ = _loc1_ + ("mov " + positionTarget.toString() + "," + vertexZeroConst.toString() + "\n");
         if(needVelocity)
         {
            _loc1_ = _loc1_ + ("mov " + velocityTarget.toString() + "," + vertexZeroConst.toString() + "\n");
         }
         if(needFragmentAnimation && hasColorNode)
         {
            _loc1_ = _loc1_ + ("mov " + varyTime.toString() + ".zw," + vertexZeroConst.toString() + "\n");
         }
         return _loc1_;
      }
      
      public function getCombinationCode() : String
      {
         return "add " + scaleAndRotateTarget.toString() + "," + scaleAndRotateTarget.toString() + "," + positionTarget.toString() + "\n";
      }
      
      public function initColorRegisters() : String
      {
         var _loc1_:String = "";
         if(hasColorMulNode)
         {
            colorMulTarget = getFreeVertexVectorTemp();
            addVertexTempUsages(colorMulTarget,1);
            colorMulVary = getFreeVarying();
            _loc1_ = _loc1_ + ("mov " + colorMulTarget + "," + vertexOneConst + "\n");
         }
         if(hasColorAddNode)
         {
            colorAddTarget = getFreeVertexVectorTemp();
            addVertexTempUsages(colorAddTarget,1);
            colorAddVary = getFreeVarying();
            _loc1_ = _loc1_ + ("mov " + colorAddTarget + "," + vertexZeroConst + "\n");
         }
         return _loc1_;
      }
      
      public function getColorPassCode() : String
      {
         var _loc1_:String = "";
         if(needFragmentAnimation && (hasColorAddNode || hasColorMulNode))
         {
            if(hasColorMulNode)
            {
               _loc1_ = _loc1_ + ("mov " + colorMulVary + "," + colorMulTarget + "\n");
            }
            if(hasColorAddNode)
            {
               _loc1_ = _loc1_ + ("mov " + colorAddVary + "," + colorAddTarget + "\n");
            }
         }
         return _loc1_;
      }
      
      public function getColorCombinationCode(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:String = "";
         if(needFragmentAnimation && (hasColorAddNode || hasColorMulNode))
         {
            _loc2_ = getRegisterFromString(param1);
            addFragmentTempUsages(_loc2_,1);
            if(hasColorMulNode)
            {
               _loc3_ = _loc3_ + ("mul " + _loc2_ + "," + _loc2_ + "," + colorMulVary + "\n");
            }
            if(hasColorAddNode)
            {
               _loc3_ = _loc3_ + ("add " + _loc2_ + "," + _loc2_ + "," + colorAddVary + "\n");
            }
         }
         return _loc3_;
      }
      
      private function getRegisterFromString(param1:String) : ShaderRegisterElement
      {
         var _loc2_:Array = param1.split(/(\d+)/);
         return new ShaderRegisterElement(_loc2_[0],_loc2_[1]);
      }
      
      public function get numVertexConstant() : int
      {
         return _numVertexConstant;
      }
      
      public function get numFragmentConstant() : int
      {
         return _numFragmentConstant;
      }
      
      public function setDataLength() : void
      {
         _numVertexConstant = _numUsedVertexConstants - _vertexConstantOffset;
         _numFragmentConstant = _numUsedFragmentConstants - _fragmentConstantOffset;
         vertexConstantData.length = _numVertexConstant * 4;
         fragmentConstantData.length = _numFragmentConstant * 4;
      }
      
      public function setVertexConst(param1:int, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:int = (param1 - _vertexConstantOffset) * 4;
         _loc6_++;
         vertexConstantData[_loc6_] = param2;
         _loc6_++;
         vertexConstantData[_loc6_] = param3;
         _loc6_++;
         vertexConstantData[_loc6_] = param4;
         vertexConstantData[_loc6_] = param5;
      }
      
      public function setVertexConstFromVector(param1:int, param2:Vector.<Number>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = (param1 - _vertexConstantOffset) * 4;
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_++;
            vertexConstantData[_loc3_] = param2[_loc4_];
            _loc4_++;
         }
      }
      
      public function setVertexConstFromMatrix(param1:int, param2:Matrix3D) : void
      {
         var _loc3_:Vector.<Number> = param2.rawData;
         var _loc4_:int = (param1 - _vertexConstantOffset) * 4;
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[0];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[4];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[8];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[12];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[1];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[5];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[9];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[13];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[2];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[6];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[10];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[14];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[3];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[7];
         _loc4_++;
         vertexConstantData[_loc4_] = _loc3_[11];
         vertexConstantData[_loc4_] = _loc3_[15];
      }
      
      public final function setFragmentConst(param1:int, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:int = (param1 - _fragmentConstantOffset) * 4;
         _loc6_++;
         fragmentConstantData[_loc6_] = param2;
         _loc6_++;
         fragmentConstantData[_loc6_] = param3;
         _loc6_++;
         fragmentConstantData[_loc6_] = param4;
         fragmentConstantData[_loc6_] = param5;
      }
   }
}
