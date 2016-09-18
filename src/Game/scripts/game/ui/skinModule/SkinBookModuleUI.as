package game.ui.skinModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   import game.ui.skinModule.render.SkinBookSuitRenderUI;
   import game.ui.skinModule.render.SkinBookTitleRenderUI;
   import game.ui.skinModule.render.WealthRenderS9ForSkinUI;
   
   public class SkinBookModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="818" height="569">
			  <PanelBg x="7" y="7" width="804" height="551"/>
			  <Image skin="png.uiSkinMain.img_blackBg" x="333" y="36" var="img_blackBg2" scaleX="-1"/>
			  <Image skin="png.uiSkinMain.img_blackBg" x="485" y="36" var="img_blackBg"/>
			  <Image skin="jpg.uiSkin.img_bg" x="89" y="35" var="img_bg" alpha="0.2"/>
			  <Image skin="png.uiSkin.img_upbg" x="124" y="142"/>
			  <SkinBookPageBar x="63" y="59" var="pageBarUI" runtime="game.ui.skinModule.SkinBookPageBarUI"/>
			  <List x="24" y="90" repeatY="3" spaceY="15" var="list_title">
			    <SkinBookTitleRender name="render" runtime="game.ui.skinModule.render.SkinBookTitleRenderUI"/>
			  </List>
			  <Image skin="png.uiSkin.img_downbg" x="163" y="325"/>
			  <Image skin="png.uiSkin.img_rightline" x="609" y="16"/>
			  <Image skin="png.uiSkin.img_leftline" x="113" y="26"/>
			  <Image skin="png.uiSkin.img_arrow" x="315" y="309"/>
			  <List x="177" y="183" centerX="-31" repeatX="4" spaceX="54" var="list_skins">
			    <WealthRenderS9ForSkin name="render" runtime="game.ui.skinModule.render.WealthRenderS9ForSkinUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="628" y="71"/>
			  <Label text="\l999900501" autoSize="none" x="630" y="75" style="加底标题" width="158" height="20" align="center" var="txt_talent_title"/>
			  <Label text="\l999900502" autoSize="none" x="306" y="74" style="渐变1" width="158" height="27" align="center" var="txt_suittitle"/>
			  <Label text="\l999900500" autoSize="none" x="307" y="108" style="加底标题" width="158" height="20" align="center" var="txt_desc"/>
			  <Label autoSize="none" x="218" y="377" style="加底标题" width="317" height="20" align="center" var="txt_title" text="医者仁心" size="13"/>
			  <List x="164" y="405" repeatY="2" spaceY="5" var="list_suit" width="422" height="45">
			    <SkinBookSuitRender name="render" runtime="game.ui.skinModule.render.SkinBookSuitRenderUI"/>
			  </List>
			  <List x="639" y="117" repeatY="11" var="list_prop" width="93" height="212" spaceY="5">
			    <RolePropPhaseUpRenderS2 name="render" x="0" y="0" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_blackBg2:Image = null;
      
      public var img_blackBg:Image = null;
      
      public var img_bg:Image = null;
      
      public var pageBarUI:game.ui.skinModule.SkinBookPageBarUI = null;
      
      public var list_title:List = null;
      
      public var list_skins:List = null;
      
      public var txt_talent_title:Label = null;
      
      public var txt_suittitle:Label = null;
      
      public var txt_desc:Label = null;
      
      public var txt_title:Label = null;
      
      public var list_suit:List = null;
      
      public var list_prop:List = null;
      
      public function SkinBookModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.skinModule.SkinBookPageBarUI"] = game.ui.skinModule.SkinBookPageBarUI;
         viewClassMap["game.ui.skinModule.render.SkinBookSuitRenderUI"] = SkinBookSuitRenderUI;
         viewClassMap["game.ui.skinModule.render.SkinBookTitleRenderUI"] = SkinBookTitleRenderUI;
         viewClassMap["game.ui.skinModule.render.WealthRenderS9ForSkinUI"] = WealthRenderS9ForSkinUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
