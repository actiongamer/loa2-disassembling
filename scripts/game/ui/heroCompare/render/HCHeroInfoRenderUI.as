package game.ui.heroCompare.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class HCHeroInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="157" height="650">
			  <HCCellRender x="0" y="277" var="cellTupo" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="0" y="616" var="cellFashion" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="0" y="585" var="cellHorse" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="0" y="554" var="cellMilitaryRank" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="1" y="459" var="cellBaowu" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="0" y="339" var="cellYuanfen" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <HCCellRender x="0" y="308" var="cellJieshu" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <List x="1" y="67" repeatY="7" var="listBaseInfo">
			    <HCCellRender name="render" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  </List>
			  <List x="0" y="401" repeatY="2" var="listEquipInfo">
			    <HCCellRender name="render" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  </List>
			  <HCCellRender x="0" y="370" var="cellEquip" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  <List x="0" y="492" var="listBaowuInfo" repeatY="2">
			    <HCCellRender name="render" runtime="game.ui.heroCompare.render.HCCellRenderUI"/>
			  </List>
			</View>;
       
      
      public var cellTupo:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellFashion:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellHorse:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellMilitaryRank:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellBaowu:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellYuanfen:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var cellJieshu:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var listBaseInfo:List = null;
      
      public var listEquipInfo:List = null;
      
      public var cellEquip:game.ui.heroCompare.render.HCCellRenderUI = null;
      
      public var listBaowuInfo:List = null;
      
      public function HCHeroInfoRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroCompare.render.HCCellRenderUI"] = game.ui.heroCompare.render.HCCellRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
