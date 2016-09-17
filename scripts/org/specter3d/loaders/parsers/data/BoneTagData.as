package org.specter3d.loaders.parsers.data
{
   public class BoneTagData
   {
       
      
      private var _modelId:String;
      
      private var _modelType:int;
      
      private var _boneTags:Array;
      
      private var _actions:Array;
      
      public function BoneTagData()
      {
         _actions = [];
         super();
      }
      
      public function get boneTags() : Array
      {
         return _boneTags;
      }
      
      public function get assetType() : String
      {
         return "skeletonBoneTag";
      }
      
      public function set boneTags(param1:Array) : void
      {
         _boneTags = param1;
      }
      
      public function get actions() : Array
      {
         return _actions;
      }
      
      public function set actions(param1:Array) : void
      {
         _actions = param1;
      }
      
      public function get modelId() : String
      {
         return _modelId;
      }
      
      public function set modelId(param1:String) : void
      {
         _modelId = param1;
      }
      
      public function get modelType() : int
      {
         return _modelType;
      }
      
      public function set modelType(param1:int) : void
      {
         _modelType = param1;
      }
      
      public function dispose() : void
      {
         _boneTags && _loc1_;
         _actions && _loc1_;
         _boneTags = null;
         _actions = null;
      }
   }
}
