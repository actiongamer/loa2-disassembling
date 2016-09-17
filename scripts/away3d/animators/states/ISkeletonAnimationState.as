package away3d.animators.states
{
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.data.Skeleton;
   
   public interface ISkeletonAnimationState extends IAnimationState
   {
       
      
      function getSkeletonPose(param1:Skeleton) : SkeletonPose;
   }
}
