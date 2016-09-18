package nslm2.modules.footstones.moduleBases
{
   import morn.customs.components.ModuleViewBase;
   
   public class ModuleInfoVo
   {
      
      public static const MODULE_ID:String = "moduleId";
      
      public static const PARENT_MODULE_ID:String = "parentModuleId";
       
      
      public var moduleId:uint;
      
      public var configVo:nslm2.modules.footstones.moduleBases.ModuleConfigVo;
      
      public var module:ModuleViewBase;
      
      public var isShow:Boolean = false;
      
      public var disposeWhenClose:Boolean = true;
      
      public var parentModuleId:int;
      
      public var task:nslm2.modules.footstones.moduleBases.ShowModuleTask;
      
      public var param;
      
      public var historyParam;
      
      public var state:int;
      
      public var phase:int;
      
      public function ModuleInfoVo()
      {
         super();
      }
   }
}
