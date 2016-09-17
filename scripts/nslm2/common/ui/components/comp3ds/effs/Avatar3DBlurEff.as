package nslm2.common.ui.components.comp3ds.effs
{
   import org.specter3d.display.avatar2.AvatarBody3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.entities.Mesh;
   import flash.geom.Vector3D;
   import away3d.materials.ColorMaterial;
   import org.specter3d.context.AppGlobalContext;
   import com.greensock.TweenLite;
   
   public class Avatar3DBlurEff
   {
       
      
      public var avatar:AvatarBody3D;
      
      public var avatarBox:ObjectContainer3D;
      
      private var _blur_Interval:uint = 0;
      
      private var _blur_objectIndex:int = 0;
      
      private var _blur_objectPool:Vector.<Mesh>;
      
      public function Avatar3DBlurEff(param1:AvatarBody3D, param2:ObjectContainer3D)
      {
         super();
         this.avatar = param1;
         this.avatarBox = param2;
      }
      
      public function blurEffect(param1:Vector3D) : void
      {
         vec = param1;
         if(_blur_Interval == 3)
         {
            onComplete = function():void
            {
               if(blurMesh)
               {
                  blurMesh.visible = false;
               }
            };
            _blur_Interval = 0;
            if(!_blur_objectPool)
            {
               _blur_objectPool = new Vector.<Mesh>(9);
            }
            var _colorMaterial:ColorMaterial = null;
            if(_blur_objectIndex > _blur_objectPool.length - 1)
            {
               _blur_objectIndex = 0;
            }
            var blurMesh:Mesh = _blur_objectPool[_blur_objectIndex];
            if(blurMesh == null)
            {
               blurMesh = this.avatar.bodyClone;
               blurMesh.animator = null;
               blurMesh.castsShadows = false;
               _colorMaterial = new ColorMaterial(13421721);
               _colorMaterial.alphaPremultiplied = true;
               _colorMaterial.alphaBlending = true;
               _colorMaterial.alpha = 0.3;
               _colorMaterial.blendMode = "layer";
               blurMesh.material = _colorMaterial;
            }
            else
            {
               _colorMaterial = blurMesh.material as ColorMaterial;
               _colorMaterial.alpha = 0.3;
            }
            blurMesh.visible = true;
            blurMesh.position = vec;
            blurMesh.scaleX = this.avatar.scaleX;
            blurMesh.scaleY = this.avatar.scaleY;
            blurMesh.scaleZ = this.avatar.scaleZ;
            blurMesh.rotationX = this.avatarBox.rotationX;
            blurMesh.rotationY = this.avatarBox.rotationY;
            blurMesh.rotationZ = this.avatarBox.rotationZ;
            AppGlobalContext.stage3d.addChild(blurMesh);
            _blur_objectPool[_blur_objectIndex] = blurMesh;
            TweenLite.to(_colorMaterial,0.5,{
               "alpha":0,
               "onComplete":onComplete
            });
            _blur_objectIndex = Number(_blur_objectIndex) + 1;
         }
         _blur_Interval = Number(_blur_Interval) + 1;
      }
   }
}
