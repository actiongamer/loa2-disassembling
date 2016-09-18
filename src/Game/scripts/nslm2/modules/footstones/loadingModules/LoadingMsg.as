package nslm2.modules.footstones.loadingModules
{
   public class LoadingMsg
   {
      
      public static const LOADING_BAR_INIT:String = "LOADING_BAR_INIT";
      
      public static const LOADING_BAR_ADD_PROGRESS:String = "LOADING_BAR_ADD_PROGRESS";
      
      public static const LOADING_BAR_SET_PROGRESS:String = "LOADING_BAR_SET_PROGRESS";
      
      public static const LOADING_BAR_CPL:String = "LOADING_BAR_CPL";
      
      public static const INIT_TOTAL:int = 100;
      
      public static const ASSET_LOADING_PROCESS:int = 30;
      
      public static const KIND_SCENE:int = 1;
      
      public static const KIND_POP:int = 2;
       
      
      public var id:int;
      
      public var kind:int;
      
      public var info:String;
      
      public var val:Number;
      
      public var autoAdd:Boolean;
      
      public function LoadingMsg(param1:int, param2:int, param3:Number = 0, param4:String = null, param5:Boolean = true)
      {
         super();
         this.id = param1;
         this.kind = param2;
         this.val = param3;
         this.info = param4;
         this.autoAdd = param5;
      }
   }
}
