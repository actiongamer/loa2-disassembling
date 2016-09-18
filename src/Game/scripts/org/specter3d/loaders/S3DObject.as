package org.specter3d.loaders
{
   import away3d.animators.nodes.AnimationNodeBase;
   import org.specter3d.loaders.parsers.data.BoneTagData;
   import away3d.entities.Mesh;
   import away3d.entities.Entity;
   import away3d.animators.AnimationSetBase;
   import away3d.animators.data.Skeleton;
   import away3d.animators.data.SkeletonPose;
   import away3d.core.base.Geometry;
   
   public final dynamic class S3DObject
   {
       
      
      public var refCount:int = 0;
      
      public var animationNodes:Vector.<AnimationNodeBase>;
      
      public var textureUrlV:Vector.<String>;
      
      public var boneTag:BoneTagData;
      
      public function S3DObject()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(animationNodes)
         {
            while(animationNodes.length)
            {
               animationNodes.pop().dispose();
            }
            animationNodes.length = 0;
         }
         if(textureUrlV)
         {
            textureUrlV.length = 0;
         }
         boneTag = null;
         if(hasOwnProperty("mesh"))
         {
            (this["mesh"] as Mesh).dispose();
         }
         if(hasOwnProperty("entity"))
         {
            (this["entity"] as Entity).dispose();
         }
         if(hasOwnProperty("animationSet"))
         {
            (this["animationSet"] as AnimationSetBase).dispose();
         }
         if(hasOwnProperty("animationState"))
         {
            this["animationSet"] = null;
         }
         if(hasOwnProperty("skeleton"))
         {
            (this["skeleton"] as Skeleton).dispose();
         }
         if(hasOwnProperty("skeletonPose"))
         {
            (this["skeletonPose"] as SkeletonPose).dispose();
         }
         if(hasOwnProperty("geometry"))
         {
            (this["geometry"] as Geometry).dispose();
         }
      }
   }
}
