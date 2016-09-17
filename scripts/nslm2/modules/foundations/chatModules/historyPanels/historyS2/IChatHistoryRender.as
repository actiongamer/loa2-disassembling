package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import com.mz.core.interFace.IDisplayObject;
   import proto.PublicTalkNotify;
   
   public interface IChatHistoryRender extends IDisplayObject
   {
       
      
      function set vo(param1:PublicTalkNotify) : void;
      
      function get showChannelName() : Boolean;
      
      function set showChannelName(param1:Boolean) : void;
   }
}
