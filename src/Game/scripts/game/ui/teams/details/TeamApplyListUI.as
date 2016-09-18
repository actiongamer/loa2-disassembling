package game.ui.teams.details
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   
   public class TeamApplyListUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="644" height="422" var="box_lines">
			  <PanelBgS3 width="644" height="422" showTabLine="true" x="0" y="0"/>
			  <VBox x="20" y="129" space="34">
			    <Image skin="png.uiTeams.公会排行底" width="604" height="30"/>
			    <Image skin="png.uiTeams.公会排行底" width="604" height="30" y="419"/>
			    <Image skin="png.uiTeams.公会排行底" width="604" height="30"/>
			    <Image skin="png.uiTeams.公会排行底" width="604" height="30" y="30"/>
			  </VBox>
			  <VBox x="20" y="96" align="left" space="30">
			    <Image skin="png.a5.commonImgs.列表分割线" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="10" y="10" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="20" y="20" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="30" y="30" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="40" y="40" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="50" y="50" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="60" y="60" width="604"/>
			    <Image skin="png.a5.commonImgs.列表分割线" x="70" y="70" width="604"/>
			  </VBox>
			  <List x="21" y="99" repeatY="8" spaceY="2" var="list">
			    <TeamApplyRender name="render" runtime="game.ui.teams.details.TeamApplyRenderUI"/>
			  </List>
			  <Button label="一键拒绝" buttonMode="true" labelFont="FZZHB" x="433" y="378" var="btn_refuseAll" style="按钮中红"/>
			  <Button label="一键通过" buttonMode="true" labelFont="FZZHB" x="527" y="378" var="btn_agreeAll" style="按钮中绿"/>
			  <PageBarS2 x="227" y="377" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="1/3" autoSize="none" x="107" y="44" style="普通说明" width="85" height="18" var="txt_count" align="left"/>
			  <Label text="当前队伍人数:" autoSize="none" x="18" y="44" style="小标题" width="85" height="18" var="txt_countTip" align="right"/>
			  <Image skin="png.uiTeams.排行标题头" x="20" y="68" width="604" height="28"/>
			  <Label text="名字" autoSize="none" x="55" y="75" style="下划线黄色" width="96" height="18" var="txt_listTitle1" align="center"/>
			  <Label text="等级" autoSize="none" x="159" y="75" style="下划线黄色" width="96" height="18" var="txt_listTitle2" align="center"/>
			  <Label text="公会" autoSize="none" x="258" y="75" style="下划线黄色" width="96" height="18" var="txt_listTitle3" align="center"/>
			  <Label text="战力" autoSize="none" x="376" y="75" style="下划线黄色" width="96" height="18" var="txt_listTitle4" align="center"/>
			  <Label text="操作" autoSize="none" x="500" y="75" style="下划线黄色" width="96" height="20" var="txt_listTitle5" align="center"/>
			</PopModuleView>;
       
      
      public var box_lines:PopModuleView = null;
      
      public var list:List = null;
      
      public var btn_refuseAll:Button = null;
      
      public var btn_agreeAll:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_count:Label = null;
      
      public var txt_countTip:Label = null;
      
      public var txt_listTitle1:Label = null;
      
      public var txt_listTitle2:Label = null;
      
      public var txt_listTitle3:Label = null;
      
      public var txt_listTitle4:Label = null;
      
      public var txt_listTitle5:Label = null;
      
      public function TeamApplyListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teams.details.TeamApplyRenderUI"] = TeamApplyRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
