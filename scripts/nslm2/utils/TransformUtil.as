package nslm2.utils
{
   import flash.geom.Vector3D;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Point;
   import org.specter3d.display.Specter3D;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.utils.MathUtil;
   import away3d.containers.ObjectContainer3D;
   import flash.display.DisplayObjectContainer;
   import org.specter3d.context.AppGlobalContext;
   import flash.display.BitmapData;
   import org.specter3d.loaders.parsers.data.ShareBitmapData;
   import flash.geom.Rectangle;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.loaders.parsers.data.ImageObject;
   import morn.core.utils.NumberUtil;
   import flash.geom.Matrix;
   import org.specter3d.display.Specter3DStage;
   import away3d.cameras.lenses.PerspectiveLens;
   import org.specter3d.camera.Specter3DCameraController;
   import away3d.core.base.Object3D;
   import flash.display.DisplayObject;
   
   public class TransformUtil
   {
      
      public static const defaultBgLayerZ:int = 7000;
      
      public static const cameraBattleNormalRo:Vector3D = new Vector3D(20,0,0);
      
      public static const cameraPos2a:Vector3D = new Vector3D(-755,324,-1575);
      
      public static const cameraRo2a:Vector3D = new Vector3D(0,35,0);
      
      public static const cameraPos2:Vector3D = new Vector3D(-1088,303,-1144);
      
      public static const cameraRo2:Vector3D = new Vector3D(0,45,0);
      
      public static var scene45roX:Number = 23.03;
      
      public static var scta:Number;
      
      public static var lastCameraRoX:Number;
       
      
      public function TransformUtil()
      {
         super();
      }
      
      public static function countBgScale(param1:Boolean, param2:int) : Number
      {
         return !!param1?countBgScaleBoss(param2):Number(countBgScaleNormal(param2));
      }
      
      public static function countBgScaleNormal(param1:int) : Number
      {
         return 0.312312962741069 * param1 / 1000;
      }
      
      public static function countBgScaleBoss(param1:int) : Number
      {
         return 0.65825221108022 * param1 / 1000;
      }
      
      public static function ui2dTo3d(param1:int, param2:int, param3:int = 0) : Vector3D
      {
         var _loc4_:Vector3D = new Vector3D(param1 - UIMgr.gameWidth / 2,-(param2 - UIMgr.gameHeight / 2),param3);
         return _loc4_;
      }
      
      public static function fight2Dto3DByPoi(param1:Point) : Vector3D
      {
         return fight2Dto3D(param1.x,param1.y);
      }
      
      public static function setBattleOri(param1:Specter3D, param2:AvatarBody3D, param3:UnitVo) : void
      {
         var _loc4_:int = param3.rotation;
         var _loc5_:int = MathUtil.abs360(_loc4_);
         if(param3.body_stcModel3DVo.mirror == 0)
         {
            if(_loc5_ >= 270 || _loc5_ <= 90)
            {
               param2.scaleX = Math.abs(param2.scaleX);
            }
            else
            {
               param2.scaleX = -Math.abs(param2.scaleX);
            }
         }
         param1.setRotation(_loc4_);
         if(param3.isBossScene)
         {
            if(!param3.isAttack)
            {
               param2.scaleX = Math.abs(param2.scaleX);
            }
         }
      }
      
      public static function fight2Dto3D(param1:int, param2:int) : Vector3D
      {
         return new Vector3D(param1,0,param2);
      }
      
      public static function mouse3Dto2D(param1:ObjectContainer3D) : Vector3D
      {
         var _loc2_:Vector3D = (param1.scenePosition as Vector3D).clone();
         _loc2_.y = _loc2_.y + 1000 / TransformUtil.cameraTan2;
         return _loc2_;
      }
      
      public static function getWidthCeilSize(param1:Number) : Number
      {
         return Math.ceil(param1 / 256) * 256;
      }
      
      public static function getHeightCeilSize(param1:Number) : Number
      {
         return Math.ceil(param1 / 256) * 256;
      }
      
      public static function poi3Dto2D(param1:Vector3D) : Point
      {
         return new Point(param1.x,param1.y);
      }
      
      public static function stage3Dto2D(param1:Vector3D, param2:DisplayObjectContainer) : Vector3D
      {
         var _loc5_:* = null;
         var _loc3_:Vector3D = new Vector3D();
         var _loc4_:Vector3D = new Vector3D();
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.z = param1.z;
         _loc3_ = AppGlobalContext.stage3d.view3d.camera.inverseSceneTransform.transformVector(_loc3_);
         _loc4_ = AppGlobalContext.stage3d.view3d.camera.lens.matrix.transformVector(_loc3_);
         _loc4_.x = _loc4_.x / _loc4_.w;
         _loc4_.y = -_loc4_.y / _loc4_.w;
         _loc4_.z = _loc3_.z;
         _loc4_.x = (_loc4_.x + 1) * AppGlobalContext.stage3d.view3d.width / 2 + UIMgr.root.x + AppGlobalContext.stage3d.view3d.x;
         _loc4_.y = (_loc4_.y + 1) * AppGlobalContext.stage3d.view3d.height / 2 + UIMgr.root.y + AppGlobalContext.stage3d.view3d.y;
         if(param2 != null)
         {
            _loc5_ = param2.globalToLocal(new Point(_loc4_.x,_loc4_.y));
            _loc4_.x = _loc5_.x;
            _loc4_.y = _loc5_.y;
         }
         return _loc4_;
      }
      
      public static function fillBitmap(param1:BitmapData, param2:int, param3:int) : BitmapData
      {
         var _loc4_:BitmapData = new ShareBitmapData(param2,param3,true,65280);
         _loc4_.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point());
         return _loc4_;
      }
      
      public static function validateBmdByUrl(param1:String, param2:Boolean = false, param3:String = null) : void
      {
         var _loc5_:* = null;
         if(param3 == null)
         {
            param3 = "default_group";
         }
         var _loc4_:BitmapData = AssetLib.getBitmapData(param1);
         if(_loc4_ != null)
         {
            _loc5_ = validateBmd(_loc4_,param2);
            if(_loc5_ != _loc4_)
            {
               if(_loc4_ is ShareBitmapData)
               {
                  (_loc4_ as ShareBitmapData).dispose_real();
               }
               AssetLib.putAsset(AssetLib.operationUrlByVersion(param1),new ImageObject(_loc5_),param3);
            }
         }
      }
      
      public static function validateBmd(param1:BitmapData, param2:Boolean = false) : BitmapData
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         _loc4_ = NumberUtil.ceilPow2up(param1.width);
         _loc3_ = NumberUtil.ceilPow2up(param1.height);
         if(_loc4_ != param1.width || _loc3_ != param1.height)
         {
            _loc6_ = new BitmapData(_loc4_,_loc3_,true,0);
            if(param2)
            {
               _loc6_.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point((_loc6_.width - param1.width) / 2,(_loc6_.height - param1.height) / 2));
            }
            else
            {
               _loc5_ = new Matrix();
               _loc5_.scale(_loc4_ / param1.width,_loc3_ / param1.height);
               _loc6_.draw(param1,_loc5_,null,null,null,true);
            }
            return _loc6_;
         }
         return param1;
      }
      
      public static function nextPoi3D(param1:Vector3D, param2:Vector3D, param3:Number) : Vector3D
      {
         var _loc5_:ObjectContainer3D = new ObjectContainer3D();
         var _loc4_:ObjectContainer3D = new ObjectContainer3D();
         _loc5_.addChild(_loc4_);
         _loc5_.position = param1;
         _loc5_.rotationX = param2.x;
         _loc5_.rotationY = param2.y;
         _loc5_.rotationZ = param2.z;
         _loc4_.z = param3;
         return _loc4_.scenePosition;
      }
      
      public static function cameraToBattlePerspective1(param1:int = 0) : void
      {
         Specter3DStage.DEAFULT_TITLE_ANGLE = 0;
         AppGlobalContext.stage3d.camera3d.lens = new PerspectiveLens(16);
         AppGlobalContext.stage3d.camera3d.position = new Vector3D(param1,1461,-3193);
         AppGlobalContext.stage3d.camera3d.rotationX = cameraBattleNormalRo.x;
         AppGlobalContext.stage3d.camera3d.rotationY = cameraBattleNormalRo.y;
      }
      
      public static function cameraToBattlePerspective2a(param1:int = 0) : void
      {
         Specter3DStage.DEAFULT_TITLE_ANGLE = 0;
         AppGlobalContext.stage3d.camera3d.lens = new PerspectiveLens(33);
         AppGlobalContext.stage3d.camera3d.position = new Vector3D(param1 + cameraPos2a.x,cameraPos2a.y,cameraPos2a.z);
         AppGlobalContext.stage3d.camera3d.rotationX = cameraRo2a.x;
         AppGlobalContext.stage3d.camera3d.rotationY = cameraRo2a.y;
         AppGlobalContext.stage3d.camera3d.rotationZ = cameraRo2a.z;
      }
      
      public static function cameraToBattlePerspective2(param1:int = 0) : void
      {
         Specter3DStage.DEAFULT_TITLE_ANGLE = 0;
         AppGlobalContext.stage3d.camera3d.lens = new PerspectiveLens(33);
         AppGlobalContext.stage3d.camera3d.position = new Vector3D(param1 + cameraPos2.x,cameraPos2.y,cameraPos2.z);
         AppGlobalContext.stage3d.camera3d.rotationX = cameraRo2.x;
         AppGlobalContext.stage3d.camera3d.rotationY = cameraRo2.y;
         AppGlobalContext.stage3d.camera3d.rotationZ = cameraRo2.z;
      }
      
      public static function cameraToSceneBattle() : void
      {
         Specter3DStage.DEAFULT_TITLE_ANGLE = 0;
         AppGlobalContext.stage3d.camera3d.lens = AppGlobalContext.stage3d.orthographicLens;
         AppGlobalContext.stage3d.camera3d.position = new Vector3D(0,0,-1000);
         AppGlobalContext.stage3d.camera3d.rotationX = 0;
         AppGlobalContext.stage3d.cameraController = new Specter3DCameraController(AppGlobalContext.stage3d.camera3d,null,Specter3DStage.DEAFULT_TITLE_ANGLE,1000);
      }
      
      public static function cameraToScene45(param1:int = 12) : void
      {
         lastCameraRoX = AppGlobalContext.stage3d.camera3d.rotationX;
         scta = Specter3DStage.DEAFULT_TITLE_ANGLE;
         Specter3DStage.DEAFULT_TITLE_ANGLE = param1;
         AppGlobalContext.stage3d.camera3d.lens = AppGlobalContext.stage3d.orthographicLens;
         AppGlobalContext.stage3d.cameraController = new Specter3DCameraController(AppGlobalContext.stage3d.camera3d,null,Specter3DStage.DEAFULT_TITLE_ANGLE,3800);
      }
      
      public static function synchroPosRo(param1:Object3D, param2:Object3D) : void
      {
         param1.position = param2.position;
         param1.rotationX = param2.rotationX;
         param1.rotationY = param2.rotationY;
         param1.rotationZ = param2.rotationZ;
      }
      
      public static function tran2DTo3DByPoi(param1:Point) : Vector3D
      {
         return tran2DTo3D(param1.x,param1.y);
      }
      
      public static function tran2DTo3D(param1:int, param2:int) : Vector3D
      {
         return new Vector3D(param1,0,-param2 * (1 / TransformUtil.cameraSin));
      }
      
      public static function scene45ChangeDeep(param1:Vector3D, param2:int) : void
      {
         param1.y = param1.y + -param2 * cameraSin;
         param1.z = param1.z + param2 * cameraCos;
      }
      
      public static function ro3Dto2D(param1:Number) : Number
      {
         return -(param1 + 90);
      }
      
      public static function ro2Dto3D(param1:Number) : Number
      {
         return -param1 - 90;
      }
      
      public static function get cameraTan2() : Number
      {
         return Math.tan((90 - scene45roX) * 3.14159265358979 / 180);
      }
      
      public static function get cameraSin() : Number
      {
         return Math.sin(scene45roX * 3.14159265358979 / 180);
      }
      
      public static function get cameraCos() : Number
      {
         return Math.cos(scene45roX * 3.14159265358979 / 180);
      }
      
      public static function uiPanel2dTo3d(param1:DisplayObject, param2:int, param3:int, param4:int = 0) : Vector3D
      {
         var _loc5_:Vector3D = new Vector3D(param2 - param1.width / 2,-(param3 - param1.height / 2),param4);
         return _loc5_;
      }
   }
}
