package nslm2.modules.footstones.assistantModules.vos
{
   public class AssistantShopSetVo
   {
       
      
      private var _shopVoObj:Object;
      
      public function AssistantShopSetVo()
      {
         _shopVoObj = {};
         super();
      }
      
      public function get shopVoObj() : Object
      {
         return _shopVoObj;
      }
      
      public function set shopVoObj(param1:Object) : void
      {
         _shopVoObj = param1;
      }
   }
}
