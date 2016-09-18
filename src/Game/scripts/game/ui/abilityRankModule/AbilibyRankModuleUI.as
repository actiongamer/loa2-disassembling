package game.ui.abilityRankModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.abilityRankModule.render.AbilityRankListRenderUI;
   
   public class AbilibyRankModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="816" height="551">
			  <PanelBg x="7" y="-1" width="803" height="551"/>
			  <Image skin="png.uiAbilityRank.1" x="18" y="35"/>
			  <Image skin="png.uiAbilityRank.3" x="-149" y="-146"/>
			  <Image skin="png.uiAbilityRank.2" x="50" y="118"/>
			  <Label text="\l60763007 " autoSize="none" x="285" y="50" style="渐变1" width="177" height="22" align="left" size="18"/>
			  <Label text="\l60763008 " autoSize="none" x="285" y="80" style="渐变1" width="138" height="22" align="left" size="18"/>
			  <Label text="2016.2.20 00:00至 2016.2.20 00：00" autoSize="none" x="380" y="52" style="渐变1" width="462" height="22" align="left" size="16" var="txt_openTime"/>
			  <Label text="2016.2.20 00:00至 2016.2.20 00：00" autoSize="none" x="380" y="82" style="渐变1" width="462" height="22" align="left" size="16" var="txt_getRwdTime"/>
			  <Label text="\l60763001 " autoSize="none" x="103" y="125" style="加底标题" width="65" height="22" align="center"/>
			  <Label text="\l60763002 " autoSize="none" x="193" y="125" style="加底标题" width="67" height="22" align="center"/>
			  <Label text="\l60763003 " autoSize="none" x="293" y="125" style="加底标题" width="103" height="22" align="center"/>
			  <Label text="\l60763004 " autoSize="none" x="398" y="125" style="加底标题" width="177" height="22" align="center"/>
			  <Label text="\l60763005 " autoSize="none" x="596" y="125" style="加底标题" width="199" height="22" align="left" var="txt_superTitle"/>
			  <Label text="\l60763009 " autoSize="none" x="126" y="510" style="普通说明" width="96" height="20"/>
			  <Label text="1000000" autoSize="none" x="220" y="510" style="普通绿色" width="96" height="20" var="txt_condition"/>
			  <Label text="\l60763010 " autoSize="none" x="348" y="510" style="普通说明" width="96" height="20"/>
			  <Label text="1000000" autoSize="none" x="431" y="510" style="普通绿色" width="187" height="20" var="txt_myValue"/>
			  <Button label="\l60763013 " x="666" y="504" style="按钮中绿" var="btn_get"/>
			  <PageBarS2 x="367" y="457" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="82" y="149" repeatY="6" spaceY="3" var="list_rank">
			    <AbilityRankListRender name="render" runtime="game.ui.abilityRankModule.render.AbilityRankListRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_openTime:Label = null;
      
      public var txt_getRwdTime:Label = null;
      
      public var txt_superTitle:Label = null;
      
      public var txt_condition:Label = null;
      
      public var txt_myValue:Label = null;
      
      public var btn_get:Button = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var list_rank:List = null;
      
      public function AbilibyRankModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.abilityRankModule.render.AbilityRankListRenderUI"] = AbilityRankListRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
