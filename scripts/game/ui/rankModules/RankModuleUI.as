package game.ui.rankModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import morn.core.components.Button;
   
   public class RankModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="0" y="0" width="800" height="550"/>
			  <Image skin="png.a5.bgs.panelBgs.img_bgS1" x="10" y="39" sizeGrid="18,18,18,18" width="213" height="500"/>
			  <Image skin="png.a5.bgs.panelBgs.img_bgS1" x="226" y="39" sizeGrid="18,18,18,18" width="560" height="500"/>
			  <Image skin="png.uiRankModule.底图" x="234" y="47"/>
			  <Image skin="png.uiRankModule.排名底" x="243" y="37" var="img_pmd"/>
			  <Image skin="png.uiRankModule.搜索框" x="628" y="500" var="txt_desc"/>
			  <Image skin="png.uiRankModule.底" x="233" y="197" var="b0"/>
			  <Image skin="png.uiRankModule.底" x="233" y="261" var="b1"/>
			  <Image skin="png.uiRankModule.底" x="233" y="325" var="b2"/>
			  <Image skin="png.uiRankModule.底" x="234" y="391" var="b3"/>
			  <Image skin="png.uiRankModule.底" x="233" y="453" var="b4"/>
			  <PageBarS2 x="434" y="502" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="234" y="165" repeatY="10" spaceY="2" var="list_items">
			    <RankListRender name="render" runtime="game.ui.rankModules.RankListRenderUI"/>
			  </List>
			  <List x="18" y="47" repeatY="5" spaceY="5" var="bangdanname" buttonMode="true">
			    <RankNameRender name="render" var="Name" runtime="game.ui.rankModules.RankNameRenderUI"/>
			  </List>
			  <Label text="普通说明" autoSize="left" x="322" y="101" style="普通说明" var="txt_rankinfoprompt"/>
			  <Image skin="png.uiRankModule.底" x="235" y="134"/>
			  <RankTitleInfo x="233" y="134" var="head_value" runtime="game.ui.rankModules.RankTitleInfoUI"/>
			  <TextInput x="627" y="502" width="118" height="18" var="txt_descPrompt" mouseEnabled="false" mouseChildren="false" style="普通灰色" autoSize="left" margin="4,0"/>
			  <TextInput x="629" y="501" width="171" height="21" var="txt_searchname" mouseEnabled="true" mouseChildren="true" style="普通灰色"/>
			  <Button skin="png.uiRankModule.btn_search" x="757" y="505" stateNum="1" var="btn_search"/>
			  <Label text=" 我的公会：我的公会名称" x="556" y="53" style="普通说明" var="txt_myrankinfo2" align="right" width="196" height="20"/>
			  <Label text="998" x="258" y="53" style="普通说明" var="txt_myrankinfo1" align="left" width="191" height="20"/>
			  <Image skin="png.uiRankModule.排名底" x="38" y="467"/>
			  <Label text="普通说明" autoSize="left" x="74" y="483" style="普通说明" var="txt_frame_propt" align="left"/>
			</PopModuleView>;
       
      
      public var img_pmd:Image = null;
      
      public var txt_desc:Image = null;
      
      public var b0:Image = null;
      
      public var b1:Image = null;
      
      public var b2:Image = null;
      
      public var b3:Image = null;
      
      public var b4:Image = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var list_items:List = null;
      
      public var bangdanname:List = null;
      
      public var §Name\x02§:game.ui.rankModules.RankNameRenderUI = null;
      
      public var txt_rankinfoprompt:Label = null;
      
      public var head_value:game.ui.rankModules.RankTitleInfoUI = null;
      
      public var txt_descPrompt:TextInput = null;
      
      public var txt_searchname:TextInput = null;
      
      public var btn_search:Button = null;
      
      public var txt_myrankinfo2:Label = null;
      
      public var txt_myrankinfo1:Label = null;
      
      public var txt_frame_propt:Label = null;
      
      public function RankModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.rankModules.RankListRenderUI"] = RankListRenderUI;
         viewClassMap["game.ui.rankModules.RankNameRenderUI"] = game.ui.rankModules.RankNameRenderUI;
         viewClassMap["game.ui.rankModules.RankTitleInfoUI"] = game.ui.rankModules.RankTitleInfoUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
