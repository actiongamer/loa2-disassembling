package game.ui.treasures.inlay
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import morn.customs.components.GCircle;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.treasures.render.BigTreasureRenderUI;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   import game.ui.treasures.render.RuneHoleListRenderUI;
   import game.ui.treasures.render.RuneListBigRenderUI;
   
   public class InlayViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470">
			  <Image skin="png.uiTreasure.左底" x="410" y="0" width="149" height="470"/>
			  <Image skin="jpg.uiTreasure.镶嵌-背景图" y="0" x="0" width="408" height="470"/>
			  <Image skin="png.uiTreasure.镶嵌-大圈圈" x="56" y="72"/>
			  <Image skin="png.uiTreasure.镶嵌-翻页底" x="415" y="425"/>
			  <Box x="22" y="14" var="box_lansuo" visible="false">
			    <Image skin="png.uiTreasure.强化连锁" y="2"/>
			    <ClipList value="0" clipWidth="10" align="center" url="png.a5.comps.clipList.clipList_S3" x="32" y="46" var="lianSuoLvl" width="10" height="13"/>
			    <GCircle fillAlpha="0" x="3" width="63" height="74" var="liansuoArea" lineAlpha="0" lineColor="0" y="0" buttonMode="true"/>
			  </Box>
			  <List x="417" y="13" repeatX="2" repeatY="5" spaceX="15" spaceY="21" var="list_rune">
			    <RuneListBigRender name="render" buttonMode="true" runtime="game.ui.treasures.render.RuneListBigRenderUI"/>
			  </List>
			  <Button label="一键拆除" y="413" style="按钮大黄" x="223" var="btn_removeAll" labelMargin="23"/>
			  <PageBarS1 x="435" y="432" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Button label="一键打孔" y="413" style="按钮大绿" x="79" var="btn_openAll" labelMargin="20"/>
			  <Image skin="png.uiTreasure.镶嵌-框" x="173" y="182" var="img_centerBg"/>
			  <List x="17" y="49" var="list_runeHole">
			    <RuneHoleListRender x="118" y="265" name="item2" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			    <RuneHoleListRender x="230" y="76" name="item3" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			    <RuneHoleListRender y="200" name="item1" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			    <RuneHoleListRender x="230" y="200" name="item4" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			    <RuneHoleListRender name="item0" y="73" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			    <RuneHoleListRender x="118" name="item5" runtime="game.ui.treasures.render.RuneHoleListRenderUI"/>
			  </List>
			  <Image skin="png.uiTreasure.竖线" x="407" y="0" height="470"/>
			  <Label autoSize="none" x="15" y="257" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14"/>
			  <Image skin="png.uiTreasure.一键拆除" x="226" y="414" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiTreasure.一键打孔" x="81" y="414" mouseEnabled="false" mouseChildren="false"/>
			  <BigTreasureRender x="178" y="187" var="centerRender" runtime="game.ui.treasures.render.BigTreasureRenderUI"/>
			  <RecycleAlertRender x="220" y="0" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			</FadeView>;
       
      
      public var box_lansuo:Box = null;
      
      public var lianSuoLvl:ClipList = null;
      
      public var liansuoArea:GCircle = null;
      
      public var list_rune:List = null;
      
      public var btn_removeAll:Button = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public var btn_openAll:Button = null;
      
      public var img_centerBg:Image = null;
      
      public var list_runeHole:List = null;
      
      public var txt_treasureName:Label = null;
      
      public var centerRender:BigTreasureRenderUI = null;
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public function InlayViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.treasures.render.BigTreasureRenderUI"] = BigTreasureRenderUI;
         viewClassMap["game.ui.treasures.render.RuneHoleListRenderUI"] = RuneHoleListRenderUI;
         viewClassMap["game.ui.treasures.render.RuneListBigRenderUI"] = RuneListBigRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
