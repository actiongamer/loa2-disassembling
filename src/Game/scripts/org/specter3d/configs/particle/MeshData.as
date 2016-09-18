package org.specter3d.configs.particle
{
   import org.specter3d.utils.Color;
   import flash.geom.ColorTransform;
   
   public class MeshData extends BaseData
   {
      
      public static const COLOR_MATERIAL:String = "color";
      
      public static const TEXTURE_MATERIAL:String = "texture";
      
      public static const SHAPE_PLANE:String = "plane";
      
      public static const SHAPE_CUBE:String = "cube";
      
      public static const SHAPE_SPHERE:String = "sphere";
      
      public static const SHAPE_CYLINDER:String = "cylinder";
      
      public static const SHAPE_EXTERNAL:String = "external";
      
      public static const AVATAR:String = "avatar";
      
      public static const TRAIL:String = "trail";
      
      public static const RIM_LIGHT:String = "rim_light";
       
      
      public var faceToCamera:Boolean = true;
      
      public var materialType:String = "color";
      
      public var blendMode:String = "add";
      
      public var textureUrl:String;
      
      public var bothSides:Boolean = false;
      
      public var repeat:Boolean = false;
      
      public var smooth:Boolean = true;
      
      public var alphaBlending:Boolean = false;
      
      public var alphaThreshold:Number = 0;
      
      public var color:uint = 16777215;
      
      public var alpha:Number = 1;
      
      public var _shapeType:String = "plane";
      
      public var depth:Number = 10;
      
      public var width:Number = 10;
      
      public var height:Number = 10;
      
      public var radius:Number = 10;
      
      public var segmentsW:Number = 1;
      
      public var segmentsH:Number = 1;
      
      public var yUp:Boolean = false;
      
      public var topRadius:Number = 10;
      
      public var bottomRadius:Number = 10;
      
      public var topClosed:Boolean = false;
      
      public var bottomClosed:Boolean = false;
      
      public var rm:Number = 1;
      
      public var gm:Number = 1;
      
      public var bm:Number = 1;
      
      public var am:Number = 1;
      
      public var ro:Number = 0;
      
      public var go:Number = 0;
      
      public var bo:Number = 0;
      
      public var ao:Number = 0;
      
      public var isGray:Boolean = false;
      
      public var url:String = "";
      
      public var usesModelTransform:Boolean = false;
      
      public var x_min:Number = 0;
      
      public var x_max:Number = 0;
      
      public var y_min:Number = 0;
      
      public var y_max:Number = 0;
      
      public var z_min:Number = 0;
      
      public var z_max:Number = 0;
      
      public var rx_min:Number = 0;
      
      public var rx_max:Number = 0;
      
      public var ry_min:Number = 0;
      
      public var ry_max:Number = 0;
      
      public var rz_min:Number = 0;
      
      public var rz_max:Number = 0;
      
      public var sx_min:Number = 1;
      
      public var sx_max:Number = 1;
      
      public var sy_min:Number = 1;
      
      public var sy_max:Number = 1;
      
      public var sz_min:Number = 1;
      
      public var sz_max:Number = 1;
      
      public var usesUVTransform:Boolean = false;
      
      public var uv_col:int = 1;
      
      public var uv_row:int = 1;
      
      public var uv_index_min:int = 0;
      
      public var uv_index_max:int = 1;
      
      public var useMask:Boolean = false;
      
      public var useSecondaryUV:Boolean = true;
      
      public var maskUrl:String = "";
      
      public var useHeatFilter:Boolean = false;
      
      public var heatFlag:int = 0;
      
      public var heatScale:Number = 0;
      
      public var x_a:Number = 0;
      
      public var y_a:Number = 0;
      
      public var z_a:Number = 0;
      
      public var x_b:Number = 100;
      
      public var y_b:Number = 0;
      
      public var z_b:Number = 0;
      
      public var fragments:int = 30;
      
      public var fadeOut:Number = 0.05;
      
      public var offset_u:Number = 0;
      
      public var offset_v:Number = 0;
      
      public var rotate_uv:Number = 0;
      
      public function MeshData()
      {
         super();
      }
      
      public function get shapeType() : String
      {
         return _shapeType;
      }
      
      public function set shapeType(param1:String) : void
      {
         _shapeType = param1;
      }
      
      public function setColor(param1:uint, param2:Number) : void
      {
         rm = Color.GetR(param1) / 255;
         gm = Color.GetG(param1) / 255;
         bm = Color.GetB(param1) / 255;
         am = param2;
      }
      
      public function getColor() : ColorTransform
      {
         return new ColorTransform(rm,gm,bm,am,ro,go,bo,ao);
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:MeshData = new MeshData();
         _loc1_.alpha = alpha;
         _loc1_.alphaBlending = alphaBlending;
         _loc1_.alphaThreshold = alphaThreshold;
         _loc1_.blendMode = blendMode;
         _loc1_.bothSides = bothSides;
         _loc1_.bottomClosed = bottomClosed;
         _loc1_.bottomRadius = bottomRadius;
         _loc1_.color = color;
         _loc1_.depth = depth;
         _loc1_.faceToCamera = faceToCamera;
         _loc1_.height = height;
         _loc1_.materialType = materialType;
         _loc1_.radius = radius;
         _loc1_.repeat = repeat;
         _loc1_.segmentsH = segmentsH;
         _loc1_.segmentsW = segmentsW;
         _loc1_.shapeType = shapeType;
         _loc1_.smooth = smooth;
         _loc1_.textureUrl = textureUrl;
         _loc1_.topClosed = topClosed;
         _loc1_.topRadius = topRadius;
         _loc1_.url = url;
         _loc1_.width = width;
         _loc1_.yUp = yUp;
         _loc1_.usesModelTransform = usesModelTransform;
         _loc1_.x_min = x_min;
         _loc1_.x_max = x_max;
         _loc1_.y_min = y_min;
         _loc1_.y_max = y_max;
         _loc1_.z_min = z_min;
         _loc1_.z_max = z_max;
         _loc1_.rx_min = rx_min;
         _loc1_.rx_max = rx_max;
         _loc1_.ry_min = ry_min;
         _loc1_.ry_max = ry_max;
         _loc1_.rz_min = rz_min;
         _loc1_.rz_max = rz_max;
         _loc1_.sx_min = sx_min;
         _loc1_.sx_max = sx_max;
         _loc1_.sy_min = sy_min;
         _loc1_.sy_max = sy_max;
         _loc1_.sz_min = sz_min;
         _loc1_.sz_max = sz_max;
         _loc1_.isGray = isGray;
         _loc1_.rm = rm;
         _loc1_.gm = gm;
         _loc1_.bm = bm;
         _loc1_.am = am;
         _loc1_.ro = ro;
         _loc1_.go = go;
         _loc1_.bo = bo;
         _loc1_.ao = ao;
         _loc1_.usesUVTransform = usesUVTransform;
         _loc1_.uv_col = uv_col;
         _loc1_.uv_row = uv_row;
         _loc1_.uv_index_min = uv_index_min;
         _loc1_.uv_index_max = uv_index_max;
         _loc1_.useMask = useMask;
         _loc1_.useSecondaryUV = useSecondaryUV;
         _loc1_.maskUrl = maskUrl;
         _loc1_.x_a = x_a;
         _loc1_.y_a = y_a;
         _loc1_.z_a = z_a;
         _loc1_.x_b = x_b;
         _loc1_.y_b = y_b;
         _loc1_.z_b = z_b;
         _loc1_.fragments = fragments;
         _loc1_.fadeOut = fadeOut;
         _loc1_.offset_u = offset_u;
         _loc1_.offset_v = offset_v;
         _loc1_.rotate_uv = rotate_uv;
         return _loc1_;
      }
   }
}
