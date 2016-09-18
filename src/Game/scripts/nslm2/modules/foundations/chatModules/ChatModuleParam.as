package nslm2.modules.foundations.chatModules
{
   public class ChatModuleParam
   {
       
      
      public var moduleId:int;
      
      public var defaultShow:Boolean;
      
      public var isBattle:Boolean;
      
      public var channelGroupId:int;
      
      public function ChatModuleParam()
      {
         super();
      }
      
      public static function init(param1:int, param2:Boolean, param3:Boolean = false, param4:int = 1000) : ChatModuleParam
      {
         var _loc5_:ChatModuleParam = new ChatModuleParam();
         _loc5_.moduleId = param1;
         _loc5_.defaultShow = param2;
         _loc5_.isBattle = param3;
         _loc5_.channelGroupId = param4;
         return _loc5_;
      }
   }
}
