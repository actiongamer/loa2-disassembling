package game.ui.newYears.charmStar.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS14UI;
   import morn.customs.components.ClipList;
   import game.ui.newYears.charmStar.render.CharmShopRenderUI;
   
   public class CharmShopViewUI extends View
   {
      
      protected static var uiView:XML = <View width="768" height="498">
			  <Image skin="png.uiCharmStar.背景图" x="0" y="0" width="768" height="498"/>
			  <Image skin="png.uiCharmStar.下透明底" y="439" width="590" height="52" x="92"/>
			  <Image skin="png.uiCharmStar.img_person" var="img_role2" x="-429" y="-188"/>
			  <Box x="168" y="18">
			    <List y="73" repeatX="2" repeatY="3" spaceX="15" spaceY="7" var="list_sales" x="2">
			      <CharmShopRender x="0" y="0" name="render" runtime="game.ui.newYears.charmStar.render.CharmShopRenderUI"/>
			    </List>
			    <PageBarS2 x="204" y="439" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			    <Label text="\l999003120" style="渐变1" width="577" height="50" bold="true" leading="-1" multiline="true" wordWrap="true" align="left" size="16" var="clearTimeTxt"/>
			    <WealthRenderS14 x="479" y="40" scale="0.55" var="renderPoint" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			    <ClipList value="739" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="514" y="48" var="cb_score"/>
			    <Label text="活动时间" autoSize="none" y="51" style="普通说明" width="393" var="txt_cd" align="left" multiline="true" wordWrap="true" height="19"/>
			  </Box>
			  <Image skin="png.uiCharmStar.边光" x="752" y="27"/>
			</View>;
       
      
      public var img_role2:Image = null;
      
      public var list_sales:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var clearTimeTxt:Label = null;
      
      public var renderPoint:WealthRenderS14UI = null;
      
      public var cb_score:ClipList = null;
      
      public var txt_cd:Label = null;
      
      public function CharmShopViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         viewClassMap["game.ui.newYears.charmStar.render.CharmShopRenderUI"] = CharmShopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
