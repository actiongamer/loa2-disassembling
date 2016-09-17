package nslm2.modules.roleInfos.vo
{
   import proto.HeroInfo;
   
   public class RoleInfoModuleParam
   {
       
      
      public var heroInfo:HeroInfo;
      
      public var subPanelId:int;
      
      public var isFake:Boolean;
      
      public var isFromGrowUpPanel:Boolean;
      
      public function RoleInfoModuleParam()
      {
         super();
      }
      
      public function init(param1:HeroInfo, param2:int, param3:Boolean = false, param4:Boolean = false) : RoleInfoModuleParam
      {
         this.heroInfo = param1;
         this.subPanelId = param2;
         this.isFake = param3;
         this.isFromGrowUpPanel = param4;
         return this;
      }
   }
}
