package game.ui.chapters.eliteDungeon
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class EliteInvadeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="341" height="121">
			  <Image skin="png.uiChapter.dungeonMap.img_invadeBg" x="0" y="0"/>
			  <List x="89" y="7" repeatX="2" spaceX="4" var="list_monsters">
			    <EliteInvadeMonsterRender name="render" runtime="game.ui.chapters.eliteDungeon.EliteInvadeMonsterRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_monsters:List = null;
      
      public function EliteInvadeRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.eliteDungeon.EliteInvadeMonsterRenderUI"] = EliteInvadeMonsterRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
