package away3d.animators.nodes
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   
   public class AnimationNodeBase extends NamedAssetBase implements IAsset
   {
       
      
      protected var _stateClass:Class;
      
      private var _url:String;
      
      public function AnimationNodeBase()
      {
         super();
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set url(param1:String) : void
      {
         if(_url != param1)
         {
            _url = param1;
         }
      }
      
      public function get stateClass() : Class
      {
         return _stateClass;
      }
      
      public function dispose() : void
      {
      }
      
      public function get assetType() : String
      {
         return "animationNode";
      }
   }
}
