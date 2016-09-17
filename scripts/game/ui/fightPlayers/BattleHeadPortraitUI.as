package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.List;
   import nslm2.modules.dungeons.HeadPortraitRender;
   
   public class BattleHeadPortraitUI extends View
   {
      
      protected static var uiView:XML = <View width="510" height="120">
			  <List repeatX="5" spaceX="20" var="list_headPortrait" x="0" y="3">
			    <HeadPortraitRender name="render" runtime="nslm2.modules.dungeons.HeadPortraitRender"/>
			  </List>
			</View>;
       
      
      public var list_headPortrait:List = null;
      
      public function BattleHeadPortraitUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["nslm2.modules.dungeons.HeadPortraitRender"] = HeadPortraitRender;
         super.createChildren();
         createView(uiView);
      }
   }
}
