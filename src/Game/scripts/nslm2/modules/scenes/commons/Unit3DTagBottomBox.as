package nslm2.modules.scenes.commons
{
   import org.specter3d.display.Specter3D;
   import away3d.containers.ObjectContainer3DIgnoreTransform;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import org.specter3d.configs.Specter3DConfig;
   
   public class Unit3DTagBottomBox extends Specter3D
   {
      
      public static const SHADOW_URL:String = "battle/texture/yingzi.png";
       
      
      public var unit3d:nslm2.modules.scenes.commons.Unit3DBase;
      
      public var boxIngoreRoScale:ObjectContainer3DIgnoreTransform;
      
      public var shadowTag3D:Image3D;
      
      public function Unit3DTagBottomBox(param1:Specter3DConfig = null)
      {
         super(param1);
         boxIngoreRoScale = new ObjectContainer3DIgnoreTransform();
         boxIngoreRoScale.ignoreRotation = true;
         boxIngoreRoScale.ignoreScale = true;
         this.addChild(boxIngoreRoScale);
      }
      
      public function showShadow() : void
      {
         if(shadowTag3D == null)
         {
            shadowTag3D = new Image3D("battle/texture/yingzi.png",128,128,0);
            shadowTag3D.blendMode = "layer";
            shadowTag3D.ignoreCameraRotation = true;
            boxIngoreRoScale.addChild(shadowTag3D);
            shadowTag3D.scaleX = 1.6;
            shadowTag3D.scaleY = 0.5;
         }
      }
      
      public function hideShadow() : void
      {
         if(shadowTag3D)
         {
            shadowTag3D.dispose();
            shadowTag3D = null;
         }
      }
      
      override public function dispose() : void
      {
         hideShadow();
         if(boxIngoreRoScale)
         {
            boxIngoreRoScale.dispose();
            boxIngoreRoScale = null;
         }
         super.dispose();
      }
   }
}
