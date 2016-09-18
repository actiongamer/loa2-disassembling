package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.ProgressBar;
   
   public class GuildDungeonBloodUI extends View
   {
      
      protected static var uiView:XML = <View width="290" height="8">
			  <ProgressBar skin="png.a5.comps.progresses.progress_S3" x="0" y="0" sizeGrid="2,0,10,0" width="290" height="8" var="progressBar_blood"/>
			</View>;
       
      
      public var progressBar_blood:ProgressBar = null;
      
      public function GuildDungeonBloodUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
