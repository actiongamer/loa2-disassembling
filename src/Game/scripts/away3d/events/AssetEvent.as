package away3d.events
{
   import flash.events.Event;
   
   public class AssetEvent extends Event
   {
      
      public static const ASSET_COMPLETE:String = "assetComplete";
      
      public static const ENTITY_COMPLETE:String = "entityComplete";
      
      public static const MESH_COMPLETE:String = "meshComplete";
      
      public static const GEOMETRY_COMPLETE:String = "geometryComplete";
      
      public static const SKELETON_COMPLETE:String = "skeletonComplete";
      
      public static const SKELETON_POSE_COMPLETE:String = "skeletonPoseComplete";
      
      public static const CONTAINER_COMPLETE:String = "containerComplete";
      
      public static const TEXTURE_COMPLETE:String = "textureComplete";
      
      public static const MATERIAL_COMPLETE:String = "materialComplete";
      
      public static const ANIMATION_SET_COMPLETE:String = "animationSetComplete";
      
      public static const ANIMATION_STATE_COMPLETE:String = "animationStateComplete";
      
      public static const ANIMATION_NODE_COMPLETE:String = "animationNodeComplete";
      
      public static const STATE_TRANSITION_COMPLETE:String = "stateTransitionComplete";
      
      public static const SEGMENT_SET_COMPLETE:String = "segmentSetComplete";
      
      public static const ASSET_RENAME:String = "assetRename";
      
      public static const ASSET_CONFLICT_RESOLVED:String = "assetConflictResolved";
       
      
      private var _asset;
      
      private var _prevName:String;
      
      public function AssetEvent(param1:String, param2:* = null, param3:String = null)
      {
         super(param1);
         _asset = param2;
         if(_asset && _asset.hasOwnProperty("name"))
         {
            _prevName = param3 || (!!_asset?_asset.name:null);
         }
      }
      
      public function get asset() : *
      {
         return _asset;
      }
      
      public function get assetPrevName() : String
      {
         return _prevName;
      }
      
      override public function clone() : Event
      {
         return new AssetEvent(type,asset,assetPrevName);
      }
   }
}
