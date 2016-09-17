package game.ui.guildModules.GuildDisplayView
{
   import morn.core.components.View;
   
   public class GuildDisplayViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <CreateShowView x="0" y="-1" var="createShow" runtime="game.ui.guildModules.GuildDisplayView.CreateShowViewUI"/>
			  <JoinShowView x="388" y="-1" var="joinShow" runtime="game.ui.guildModules.GuildDisplayView.JoinShowViewUI"/>
			  <Image skin="png.uiGuildModule.show.创建底图文字" x="29" y="19"/>
			  <Image skin="png.uiGuildModule.show.加入底图文字" x="421" y="19"/>
			</View>;
       
      
      public var createShow:game.ui.guildModules.GuildDisplayView.CreateShowViewUI = null;
      
      public var joinShow:game.ui.guildModules.GuildDisplayView.JoinShowViewUI = null;
      
      public function GuildDisplayViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildModules.GuildDisplayView.CreateShowViewUI"] = game.ui.guildModules.GuildDisplayView.CreateShowViewUI;
         viewClassMap["game.ui.guildModules.GuildDisplayView.JoinShowViewUI"] = game.ui.guildModules.GuildDisplayView.JoinShowViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
