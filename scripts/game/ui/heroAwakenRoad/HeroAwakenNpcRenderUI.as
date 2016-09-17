package game.ui.heroAwakenRoad
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.chapters.ChapterDropRenderUI;
   
   public class HeroAwakenNpcRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="71" height="105" buttonMode="false" mouseChildren="true" mouseEnabled="false">
			  <Box x="-74" y="-6" var="box_drop" mouseEnabled="false">
			    <Image skin="png.uiHeroAwakenRoad.img_dropBgSingleLine" var="img_dropBg" mouseEnabled="false" mouseChildren="false" x="0" y="0" width="170"/>
			    <Box x="16" y="15" var="box_content" width="155" height="36" mouseEnabled="false">
			      <Label style="普通说明" width="43" multiline="false" wordWrap="true" align="left" text="掉落：" leading="4" height="18" mouseEnabled="false" mouseChildren="false"/>
			      <List x="38" repeatY="1" var="list_drops" mouseChildren="true">
			        <ChapterDropRender name="render" runtime="game.ui.chapters.ChapterDropRenderUI"/>
			      </List>
			    </Box>
			  </Box>
			  <Label style="普通说明" var="txt_dungeonName" width="157" multiline="false" wordWrap="false" align="center" text="十二个字字字" leading="4" height="19" y="-89" x="-75" mouseEnabled="false" mouseChildren="false"/>
			  <Box var="box_star" x="-25" y="-33" mouseChildren="false" mouseEnabled="false" width="52" height="30">
			    <HeroAwakenStarRender name="render" x="23" var="star2" y="0" runtime="game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"/>
			    <HeroAwakenStarRender name="render" var="star0" x="-1" y="0" runtime="game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"/>
			    <HeroAwakenStarRender name="render" x="11" var="star1" y="2" runtime="game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"/>
			  </Box>
			</View>;
       
      
      public var box_drop:Box = null;
      
      public var img_dropBg:Image = null;
      
      public var box_content:Box = null;
      
      public var list_drops:List = null;
      
      public var txt_dungeonName:Label = null;
      
      public var box_star:Box = null;
      
      public var star2:game.ui.heroAwakenRoad.HeroAwakenStarRenderUI = null;
      
      public var star0:game.ui.heroAwakenRoad.HeroAwakenStarRenderUI = null;
      
      public var star1:game.ui.heroAwakenRoad.HeroAwakenStarRenderUI = null;
      
      public function HeroAwakenNpcRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.ChapterDropRenderUI"] = ChapterDropRenderUI;
         viewClassMap["game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"] = game.ui.heroAwakenRoad.HeroAwakenStarRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
