package game.ui.roleTeam.panel
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Panel;
   import game.ui.roleTeam.TeamInfoViewUI;
   import game.ui.roleTeam.render.YuanJunHeroListRenderUI;
   
   public class YuanJunPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="813" height="541">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" x="229" y="-7" sizeGrid="10,10,10,10" width="304" height="448"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="306" y="-4"/>
			  <Label text="\l30100029\l" autoSize="none" x="97" y="-32" style="重要提示橘黄" width="568" height="18" align="center" var="txt_title"/>
			  <Label text="当前缘分总数" autoSize="none" x="216" y="373" style="重要提示橘黄" width="330" height="18" align="center" var="txt_bottomtxt"/>
			  <Button label="返  回" x="336" style="按钮中黄" y="397" var="btn_back"/>
			  <Button label="缘分效果" y="397" style="按钮中绿" x="336" var="btn_yuafen"/>
			  <List x="130" y="76" var="list_yuanjun">
			    <YuanJunHeroListRender name="item0" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			    <YuanJunHeroListRender y="93" name="item1" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			    <YuanJunHeroListRender y="185" name="item2" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			    <YuanJunHeroListRender x="435" name="item3" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			    <YuanJunHeroListRender x="435" y="93" name="item4" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			    <YuanJunHeroListRender x="435" y="185" name="item5" runtime="game.ui.roleTeam.render.YuanJunHeroListRenderUI"/>
			  </List>
			  <Label autoSize="none" x="216" y="2" style="人名2不随品质变化" width="330" height="18" align="center" var="txt_des" text="上阵英雄"/>
			  <Box x="238" y="25" var="box_yuafenDetail">
			    <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" sizeGrid="10,10,10,10" width="260" height="332" x="0" y="0"/>
			    <Panel width="286" height="323" var="panel_yuanfen" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" x="0" y="4"/>
			  </Box>
			  <TeamInfoView x="234" y="16" var="pane_team" runtime="game.ui.roleTeam.TeamInfoViewUI"/>
			  <Box x="533" y="-25" var="box_yuanjunTrain">
			    <Button skin="png.uiRoleTeam.援军" x="31" stateNum="1" var="btn_yuanjunTrain" labelMargin="0,20,0,0"/>
			    <Label text="\l30815000" autoSize="none" y="47" style="随品质变化" width="126" align="center" var="txt_name" mouseEnabled="false" mouseChildren="false" multiline="false" wordWrap="false"/>
			  </Box>
			</FadeView>;
       
      
      public var txt_title:Label = null;
      
      public var txt_bottomtxt:Label = null;
      
      public var btn_back:Button = null;
      
      public var btn_yuafen:Button = null;
      
      public var list_yuanjun:List = null;
      
      public var txt_des:Label = null;
      
      public var box_yuafenDetail:Box = null;
      
      public var panel_yuanfen:Panel = null;
      
      public var pane_team:TeamInfoViewUI = null;
      
      public var box_yuanjunTrain:Box = null;
      
      public var btn_yuanjunTrain:Button = null;
      
      public var txt_name:Label = null;
      
      public function YuanJunPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleTeam.TeamInfoViewUI"] = TeamInfoViewUI;
         viewClassMap["game.ui.roleTeam.render.YuanJunHeroListRenderUI"] = YuanJunHeroListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
