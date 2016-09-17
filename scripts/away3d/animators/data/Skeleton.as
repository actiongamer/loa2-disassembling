package away3d.animators.data
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   
   public class Skeleton extends NamedAssetBase implements IAsset
   {
       
      
      public var joints:Vector.<away3d.animators.data.SkeletonJoint>;
      
      public function Skeleton()
      {
         super();
         joints = new Vector.<away3d.animators.data.SkeletonJoint>();
      }
      
      public function get numJoints() : uint
      {
         return joints.length;
      }
      
      public function jointFromName(param1:String) : away3d.animators.data.SkeletonJoint
      {
         var _loc2_:int = jointIndexFromName(param1);
         if(_loc2_ != -1)
         {
            return joints[_loc2_];
         }
         return null;
      }
      
      public function jointIndexFromName(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = joints;
         for each(var _loc2_ in joints)
         {
            if(_loc2_.name == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function dispose() : void
      {
         joints.length = 0;
      }
      
      public function get assetType() : String
      {
         return "skeleton";
      }
   }
}
