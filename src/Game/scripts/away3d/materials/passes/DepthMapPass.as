package away3d.materials.passes
{
   import away3d.textures.Texture2DBase;
   import §away3d:arcane§.invalidateShaderProgram;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.Context3D;
   
   public class DepthMapPass extends MaterialPassBase
   {
       
      
      private var _data:Vector.<Number>;
      
      private var _alphaThreshold:Number = 0;
      
      private var _alphaMask:Texture2DBase;
      
      public function DepthMapPass()
      {
         super();
         _data = Vector.<Number>([1,255,65025,16581375,0.00392156862745098,0.00392156862745098,0.00392156862745098,0,0,0,0,0]);
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
         _data[8] = _alphaThreshold;
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
         _loc1_ = "m44 vt1, vt0, vc0\t\t\nmul op, vt1, vc4\n";
         if(_alphaThreshold > 0)
         {
            _numUsedTextures = 1;
            _numUsedStreams = 2;
            _loc1_ = _loc1_ + "mov v0, vt1\nmov v1, va1\n";
         }
         else
         {
            _numUsedTextures = 0;
            _numUsedStreams = 1;
            _loc1_ = _loc1_ + "mov v0, vt1\n";
         }
         return _loc1_;
      }
      
      override function getFragmentCode(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:String = !!_repeat?"wrap":"clamp";
         if(_smooth)
         {
            _loc4_ = !!_mipmap?"linear,miplinear":"linear";
         }
         else
         {
            _loc4_ = !!_mipmap?"nearest,mipnearest":"nearest";
         }
         param1 = "div ft2, v0, v0.w\t\t\nmul ft0, fc0, ft2.z\t\nfrc ft0, ft0\t\t\t\nmul ft1, ft0.yzww, fc1\t\n";
         if(_alphaThreshold > 0)
         {
            var _loc5_:* = _alphaMask.format;
            if("compressed" !== _loc5_)
            {
               if("compressedAlpha" !== _loc5_)
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
            param1 = param1 + ("tex ft3, v1, fs0 <2d," + _loc4_ + "," + _loc3_ + _loc2_ + ">\n" + "sub ft3.w, ft3.w, fc2.x\n" + "kil ft3.w\n");
         }
         param1 = param1 + "sub oc, ft0, ft1\t\t\n";
         return param1;
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         if(_alphaThreshold > 0)
         {
            param1.activateUVBuffer(1,param2);
         }
         var _loc4_:Context3D = param2._context3D;
         _loc4_.setProgramConstantsFromMatrix("vertex",0,param1.modelViewProjection,true);
         param1.activateVertexBuffer(0,param2);
         _loc4_.drawTriangles(param1.getIndexBuffer(param2),0,param1.numTriangles);
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         super.activate(param1,param2,param3,param4);
         if(_alphaThreshold > 0)
         {
            param1.setTextureAt(0,_alphaMask.getTextureForStage3D(param1));
            param1._context3D.setProgramConstantsFromVector("fragment",0,_data,3);
         }
         else
         {
            param1._context3D.setProgramConstantsFromVector("fragment",0,_data,2);
         }
      }
   }
}
