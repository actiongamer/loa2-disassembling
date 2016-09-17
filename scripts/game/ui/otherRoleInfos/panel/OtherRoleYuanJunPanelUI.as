package game.ui.otherRoleInfos.panel
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Panel;
   import game.ui.roleTeam.TeamInfoViewUI;
   import game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI;
   
   public class OtherRoleYuanJunPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="813" height="541">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" x="229" y="-7" sizeGrid="10,10,10,10" width="304" height="448"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="306" y="-4"/>
			  <Label text="\l30100029\l" autoSize="none" x="182.5" y="-29" style="重要提示橘黄" width="400" height="18" align="center" var="txt_title"/>
			  <Label text="当前缘分总数" autoSize="none" x="216" y="373" style="重要提示橘黄" width="330" height="18" align="center" var="txt_bottomtxt"/>
			  <Button label="返  回" x="336" style="按钮中蓝" y="397" var="btn_back"/>
			  <List x="130" y="67" var="list_yuanjun">
			    <OtherRoleYuanJunRender x="0" name="item0" y="0" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			    <OtherRoleYuanJunRender x="0" name="item1" y="102" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			    <OtherRoleYuanJunRender x="0" name="item2" y="204" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			    <OtherRoleYuanJunRender x="432" name="item3" y="0" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			    <OtherRoleYuanJunRender x="432" name="item4" y="102" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			    <OtherRoleYuanJunRender x="432" name="item5" y="204" runtime="game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"/>
			  </List>
			  <Button label="缘分效果" y="397" style="按钮中红" x="336" var="btn_yuafen"/>
			  <Box x="238" y="25" var="box_yuafenDetail">
			    <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" sizeGrid="10,10,10,10" width="260" height="332" x="0" y="0"/>
			    <Panel width="286" height="323" var="panel_yuanfen" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" x="0" y="4"/>
			  </Box>
			  <Label autoSize="none" x="216" y="2" style="人名2不随品质变化" width="330" height="18" align="center" var="txt_des" text="上阵英雄"/>
			  <TeamInfoView x="234" y="16" var="pane_team" runtime="game.ui.roleTeam.TeamInfoViewUI"/>
			</FadeView>;
       
      
      public var txt_title:Label = null;
      
      public var txt_bottomtxt:Label = null;
      
      public var btn_back:Button = null;
      
      public var list_yuanjun:List = null;
      
      public var btn_yuafen:Button = null;
      
      public var box_yuafenDetail:Box = null;
      
      public var panel_yuanfen:Panel = null;
      
      public var txt_des:Label = null;
      
      public var pane_team:TeamInfoViewUI = null;
      
      public function OtherRoleYuanJunPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI"] = OtherRoleYuanJunRenderUI;
         viewClassMap["game.ui.roleTeam.TeamInfoViewUI"] = TeamInfoViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
