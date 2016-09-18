package game.ui.peakSports
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   import morn.core.components.Button;
   
   public class PeakSportsRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="454" height="510">
			  <PanelBgS3 x="0" y="0" width="454" height="510"/>
			  <Image x="12" y="35" var="bgImage" width="430" height="415"/>
			  <List x="47" y="223" repeatX="5" spaceX="5" var="rewardList1">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Label text="\l999600020" autoSize="none" x="23" y="47" style="渐变橙" width="413" height="22" align="left"/>
			  <Image skin="png.a5.commonImgs.分割线" x="27" y="178" centerX="0"/>
			  <Image skin="png.a5.commonImgs.分割线" x="21" y="319" centerX="0"/>
			  <Label text="\l999600021" autoSize="none" x="23" y="189" style="普通说明" height="22" align="left"/>
			  <Label text="\l999600022" autoSize="none" x="23" y="327" style="渐变橙" width="414" height="22" align="left"/>
			  <List x="47" y="368" repeatX="5" spaceX="5" var="rewardList2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <WealthRenderS56 x="47" y="88" var="rewardItem" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <Label text="\l999600023" autoSize="none" x="36" y="488" style="普通说明" height="20" align="center" width="382" centerX="0"/>
			  <Button label="\l11300024" style="按钮中绿" var="closeBtn" x="181" y="457" centerX="0"/>
			</PopModuleView>;
       
      
      public var bgImage:Image = null;
      
      public var rewardList1:List = null;
      
      public var rewardList2:List = null;
      
      public var rewardItem:WealthRenderS56UI = null;
      
      public var closeBtn:Button = null;
      
      public function PeakSportsRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
