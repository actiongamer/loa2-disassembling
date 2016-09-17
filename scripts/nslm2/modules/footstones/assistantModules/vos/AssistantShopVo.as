package nslm2.modules.footstones.assistantModules.vos
{
   public class AssistantShopVo
   {
       
      
      public var shopId:int;
      
      private var _assistantShopVoObj:Object;
      
      public function AssistantShopVo()
      {
         _assistantShopVoObj = {};
         super();
      }
      
      public function get assistantShopVoObj() : Object
      {
         return _assistantShopVoObj;
      }
      
      public function set assistantShopVoObj(param1:Object) : void
      {
         _assistantShopVoObj = param1;
      }
   }
}
