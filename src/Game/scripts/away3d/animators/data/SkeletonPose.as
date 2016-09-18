package away3d.animators.data
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   
   public class SkeletonPose extends NamedAssetBase implements IAsset
   {
       
      
      public var jointPoses:Vector.<away3d.animators.data.JointPose>;
      
      public function SkeletonPose(param1:int = 0)
      {
         super();
         if(param1 > 0)
         {
            jointPoses = new Vector.<away3d.animators.data.JointPose>(param1);
         }
         else
         {
            jointPoses = new Vector.<away3d.animators.data.JointPose>();
         }
      }
      
      public function get numJointPoses() : uint
      {
         return jointPoses.length;
      }
      
      public function get assetType() : String
      {
         return "skeletonPose";
      }
      
      public function jointPoseFromName(param1:String) : away3d.animators.data.JointPose
      {
         var _loc2_:int = jointPoseIndexFromName(param1);
         if(_loc2_ != -1)
         {
            return jointPoses[_loc2_];
         }
         return null;
      }
      
      public function jointPoseIndexFromName(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = jointPoses;
         for each(var _loc2_ in jointPoses)
         {
            if(_loc2_.name == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function clone() : SkeletonPose
      {
         var _loc5_:* = 0;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:SkeletonPose = new SkeletonPose();
         var _loc4_:uint = this.jointPoses.length;
         _loc5_ = uint(0);
         while(_loc5_ < _loc4_)
         {
            _loc3_ = new away3d.animators.data.JointPose();
            _loc1_ = this.jointPoses[_loc5_];
            _loc3_.name = _loc1_.name;
            _loc3_.copyFrom(_loc1_);
            _loc2_.jointPoses[_loc5_] = _loc3_;
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         jointPoses.length = 0;
      }
   }
}
