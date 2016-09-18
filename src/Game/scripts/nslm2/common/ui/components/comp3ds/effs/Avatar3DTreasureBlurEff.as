package nslm2.common.ui.components.comp3ds.effs
{
   import org.specter3d.display.avatar2.Avatar3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.entities.Mesh;
   import flash.geom.Vector3D;
   import away3d.materials.ColorMaterial;
   import com.greensock.TweenLite;
   
   public class Avatar3DTreasureBlurEff
   {
       
      
      public var avatar:Avatar3D;
      
      public var avatarBox:ObjectContainer3D;
      
      private var _blur_Interval:uint = 0;
      
      private var _blur_objectIndex:int = 0;
      
      private var _blur_objectPool:Vector.<Mesh>;
      
      public function Avatar3DTreasureBlurEff(param1:Avatar3D, param2:ObjectContainer3D)
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
            if(blurMesh != null)
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
            avatarBox.addChild(blurMesh);
            _blur_objectPool[_blur_objectIndex] = blurMesh;
            var sx:Number = blurMesh.scaleX * 0.5;
            var sy:Number = blurMesh.scaleY * 0.5;
            var sz:Number = blurMesh.scaleZ * 0.5;
            TweenLite.to(_colorMaterial,0.5,{
               "alpha":0,
               "onComplete":onComplete
            });
            _blur_objectIndex = Number(_blur_objectIndex) + 1;
         }
         _blur_Interval = Number(_blur_Interval) + 1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(_blur_objectPool)
         {
            _loc1_ = _blur_objectPool.length;
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = _blur_objectPool[_loc3_];
               if(_loc2_)
               {
                  TweenLite.killTweensOf(_loc2_);
                  if(_loc2_.material)
                  {
                     TweenLite.killTweensOf(_loc2_.material);
                  }
                  _loc2_.dispose();
                  _loc2_ = null;
               }
               _loc3_++;
            }
            _blur_objectPool = null;
         }
      }
   }
}
