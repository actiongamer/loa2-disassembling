package away3d.animators
{
   import away3d.materials.passes.MaterialPassBase;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.Context3D;
   import away3d.animators.nodes.SkeletonClipNode;
   import org.specter3d.loaders.AssetLib;
   
   public class SkeletonAnimationSet extends AnimationSetBase implements IAnimationSet
   {
       
      
      private var _jointsPerVertex:uint;
      
      public function SkeletonAnimationSet(param1:uint = 4)
      {
         super();
         _jointsPerVertex = param1;
      }
      
      public function get jointsPerVertex() : uint
      {
         return _jointsPerVertex;
      }
      
      public function getAGALVertexCode(param1:MaterialPassBase, param2:Vector.<String>, param3:Vector.<String>) : String
      {
         var _loc11_:* = 0;
         var _loc17_:* = null;
         var _loc9_:* = 0;
         var _loc8_:uint = param2.length;
         var _loc6_:uint = param1.numUsedVertexConstants;
         var _loc4_:uint = _loc6_ + 1;
         var _loc5_:uint = _loc6_ + 2;
         var _loc14_:String = "va" + param1.numUsedStreams;
         var _loc18_:String = "va" + (param1.numUsedStreams + 1);
         var _loc16_:Array = [_loc14_ + ".x",_loc14_ + ".y",_loc14_ + ".z",_loc14_ + ".w"];
         var _loc15_:Array = [_loc18_ + ".x",_loc18_ + ".y",_loc18_ + ".z",_loc18_ + ".w"];
         var _loc12_:String = findTempReg(param3);
         var _loc13_:String = findTempReg(param3,_loc12_);
         var _loc10_:String = "dp4";
         var _loc7_:String = "";
         _loc11_ = uint(0);
         while(_loc11_ < _loc8_)
         {
            _loc17_ = param2[_loc11_];
            _loc9_ = uint(0);
            while(_loc9_ < _jointsPerVertex)
            {
               _loc7_ = _loc7_ + (_loc10_ + " " + _loc12_ + ".x, " + _loc17_ + ", vc[" + _loc16_[_loc9_] + "+" + _loc6_ + "]\t\t\n" + _loc10_ + " " + _loc12_ + ".y, " + _loc17_ + ", vc[" + _loc16_[_loc9_] + "+" + _loc4_ + "]    \t\n" + _loc10_ + " " + _loc12_ + ".z, " + _loc17_ + ", vc[" + _loc16_[_loc9_] + "+" + _loc5_ + "]\t\t\n" + "mov " + _loc12_ + ".w, " + _loc17_ + ".w\t\t\n" + "mul " + _loc12_ + ", " + _loc12_ + ", " + _loc15_[_loc9_] + "\n");
               if(_loc9_ == 0)
               {
                  _loc7_ = _loc7_ + ("mov " + _loc13_ + ", " + _loc12_ + "\n");
               }
               else
               {
                  _loc7_ = _loc7_ + ("add " + _loc13_ + ", " + _loc13_ + ", " + _loc12_ + "\n");
               }
               _loc9_++;
            }
            _loc10_ = "dp3";
            _loc7_ = _loc7_ + ("mov " + param3[_loc11_] + ", " + _loc13_ + "\n");
            _loc11_++;
         }
         return _loc7_;
      }
      
      public function activate(param1:Stage3DProxy, param2:MaterialPassBase) : void
      {
      }
      
      public function deactivate(param1:Stage3DProxy, param2:MaterialPassBase) : void
      {
         var _loc4_:uint = param2.numUsedStreams;
         var _loc3_:Context3D = param1._context3D;
         _loc3_.setVertexBufferAt(_loc4_,null);
         _loc3_.setVertexBufferAt(_loc4_ + 1,null);
      }
      
      public function getAGALFragmentCode(param1:MaterialPassBase, param2:String) : String
      {
         return "";
      }
      
      public function getAGALUVCode(param1:MaterialPassBase, param2:String, param3:String) : String
      {
         return "mov " + param3 + "," + param2 + "\n";
      }
      
      public function doneAGALCode(param1:MaterialPassBase) : void
      {
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = animationDictionary;
         for(var _loc2_ in animationDictionary)
         {
            _loc1_ = animationDictionary[_loc2_];
            AssetLib.costS3dRefCount(_loc1_.url);
            delete animationDictionary[_loc2_];
         }
         animations.length = 0;
         animationNames.length = 0;
      }
   }
}
