package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.facebook.FBInviteListRenderUI;
   import nslm2.modules.globalModules.facebook.view.FBSelectedFriendsListRender;
   
   public class RegRuntime_FaceBook
   {
       
      
      public function RegRuntime_FaceBook()
      {
         super();
         View.runtimeClassMap[FBInviteListRenderUI] = FBSelectedFriendsListRender;
      }
   }
}
