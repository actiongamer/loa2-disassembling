package away3d.materials.passes
{
   import away3d.textures.Texture2DBase;
   import §away3d:arcane§.invalidateShaderProgram;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.geom.Vector3D;
   
   public class DistanceMapPass extends MaterialPassBase
   {
       
      
      private var _fragmentData:Vector.<Number>;
      
      private var _vertexData:Vector.<Number>;
      
      private var _alphaThreshold:Number;
      
      private var _alphaMask:Texture2DBase;
      
      public function DistanceMapPass()
      {
         super();
         _fragmentData = Vector.<Number>([1,255,65025,16581375,0.00392156862745098,0.00392156862745098,0.00392156862745098,0,0,0,0,0]);
         _vertexData = new Vector.<Number>(4,true);
         _vertexData[3] = 1;
         _numUsedVertexConstants = 9;
      }
      
      public function get alphaThreshold() : Number
      {
         return _alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 == _alphaThreshold)
         {
            return;
         }
         if(param1 == 0 || _alphaThreshold == 0)
         {
            invalidateShaderProgram();
         }
         _alphaThreshold = param1;
         _fragmentData[8] = _alphaThreshold;
      }
      
      public function get alphaMask() : Texture2DBase
      {
         return _alphaMask;
      }
      
      public function set alphaMask(param1:Texture2DBase) : void
      {
         _alphaMask = param1;
      }
      
      override function getVertexCode() : String
      {
         var _loc1_:* = null;
         _loc1_ = "m44 vt7, vt0, vc0\t\t\nmul op, vt7, vc4\t\t\nm44 vt1, vt0, vc5\t\t\nsub v0, vt1, vc9\t\t\n";
         if(_alphaThreshold > 0)
         {
            _loc1_ = _loc1_ + "mov v1, va1\n";
            _numUsedTextures = 1;
            _numUsedStreams = 2;
         }
         else
         {
            _numUsedTextures = 0;
            _numUsedStreams = 1;
         }
         return _loc1_;
      }
      
      override function getFragmentCode(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:String = !!_repeat?"wrap":"clamp";
         if(_smooth)
         {
            _loc5_ = !!_mipmap?"linear,miplinear":"linear";
         }
         else
         {
            _loc5_ = !!_mipmap?"nearest,mipnearest":"nearest";
         }
         _loc4_ = "dp3 ft2.z, v0.xyz, v0.xyz\t\nmul ft0, fc0, ft2.z\t\nfrc ft0, ft0\t\t\t\nmul ft1, ft0.yzww, fc1\t\n";
         if(_alphaThreshold > 0)
         {
            var _loc6_:* = _alphaMask.format;
            if("compressed" !== _loc6_)
            {
               if("compressedAlpha" !== _loc6_)
               {
                  _loc3_ = "";
               }
               else
               {
                  _loc3_ = "dxt5,";
               }
            }
            else
            {
               _loc3_ = "dxt1,";
            }
            _loc4_ = _loc4_ + ("tex ft3, v1, fs0 <2d," + _loc5_ + "," + _loc3_ + _loc2_ + ">\n" + "sub ft3.w, ft3.w, fc2.x\n" + "kil ft3.w\n");
         }
         _loc4_ = _loc4_ + "sub oc, ft0, ft1\t\t\n";
         return _loc4_;
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         var _loc4_:Vector3D = param3.scenePosition;
         _vertexData[0] = _loc4_.x;
         _vertexData[1] = _loc4_.y;
         _vertexData[2] = _loc4_.z;
         _vertexData[3] = 1;
         param2._context3D.setProgramConstantsFromMatrix("vertex",5,param1.sceneTransform,true);
         param2._context3D.setProgramConstantsFromVector("vertex",9,_vertexData,1);
         if(_alphaThreshold > 0)
         {
            param1.activateUVBuffer(1,param2);
         }
         super.render(param1,param2,param3);
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         super.activate(param1,param2,param3,param4);
         var _loc5_:Number = param2.lens.far;
         _loc5_ = 1 / (2 * _loc5_ * _loc5_);
         _fragmentData[0] = 1 * _loc5_;
         _fragmentData[1] = 255 * _loc5_;
         _fragmentData[2] = 65025 * _loc5_;
         _fragmentData[3] = 16581375 * _loc5_;
         if(_alphaThreshold > 0)
         {
            param1.setTextureAt(0,_alphaMask.getTextureForStage3D(param1));
            param1._context3D.setProgramConstantsFromVector("fragment",0,_fragmentData,3);
         }
         else
         {
            param1._context3D.setProgramConstantsFromVector("fragment",0,_fragmentData,2);
         }
      }
   }
}
