package game.ui.recommendHero.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class RecoHeroGroupRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="740" height="230">
			  <Image skin="png.uiRecommendHero.img_renderBg" x="0" y="1" width="740" height="227" smoothing="true" sizeGrid="10,0,10,0"/>
			  <Image skin="png.uiRecommendHero.img_flag" x="520" y="-1"/>
			  <Image skin="png.a5.commonImgs.img_splitLine" x="12" y="124" width="499"/>
			  <Label text="推荐阵容1&#xD;" autoSize="none" x="533" y="18" style="加底标题" width="185" height="41" wordWrap="true" align="center" bold="true" size="15" var="txt_name"/>
			  <Label text="可激活缘分总数" autoSize="none" x="545" y="55" style="普通说明" width="119" wordWrap="true" align="center" bold="false" height="19"/>
			  <Label autoSize="none" x="662" y="52" style="普通绿色" width="53" wordWrap="true" align="left" bold="true" height="22" var="txt_totalYuanfenCnt" text="23" size="16"/>
			  <Label text="可激活缘分总数可激活缘分总数可激活缘分总数可激活缘分总数可激活缘分总数可激活缘分总数&#xD;" autoSize="none" x="550" y="82" style="普通说明" width="155" wordWrap="true" align="left" bold="false" height="95" indent="25" var="txt_desc"/>
			  <Label text="上阵：" autoSize="none" x="25" y="44" style="渐变2" align="center" width="100" language="en" lgx="10,25" lgy="44,44"/>
			  <Label text="援军：" autoSize="none" x="25" y="156" style="渐变2" align="center" width="100" language="en" lgx="10,25" lgy="156,156"/>
			  <List x="74" y="20" repeatX="4" spaceX="2" var="list_teamHero">
			    <RecoTeamHeroRender name="render" runtime="game.ui.recommendHero.render.RecoTeamHeroRenderUI"/>
			  </List>
			  <List x="90" y="140" repeatX="5" spaceX="40" var="list_yuanjun" language="en" lgx="105,90" lgy="140,140">
			    <RecoYuanjunHeroRender name="render" runtime="game.ui.recommendHero.render.RecoYuanjunHeroRenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_totalYuanfenCnt:Label = null;
      
      public var txt_desc:Label = null;
      
      public var list_teamHero:List = null;
      
      public var list_yuanjun:List = null;
      
      public function RecoHeroGroupRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recommendHero.render.RecoTeamHeroRenderUI"] = RecoTeamHeroRenderUI;
         viewClassMap["game.ui.recommendHero.render.RecoYuanjunHeroRenderUI"] = RecoYuanjunHeroRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
