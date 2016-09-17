package game.ui.teamGuajiScenes.changeChallenges
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   
   public class GuajiChangeChallengeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="548">
			  <PanelBg x="-1" y="0" width="800" height="548"/>
			  <Image skin="jpg.uiTeamGuajis.selectLvlBg" x="4" y="30" var="img_bg"/>
			  <Image skin="png.uiTeamGuajis.路线" x="99" y="123" var="img_path"/>
			  <Button label="进入" x="337" y="488" style="按钮大绿" var="btn_enter" labelMargin="10"/>
			  <Image skin="png.a5.icons.攻击" x="346" y="490" var="img_btn_icon"/>
			  <List x="64" y="89" var="list_icons">
			    <GuajiChangeChallengeRender x="124" y="277" name="item0" var="item0" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender y="173" name="item1" var="item1" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="96" y="58" name="item2" var="item2" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="213" y="157" name="item3" var="item3" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="366" y="121" name="item4" var="item4" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="456" y="258" name="item5" var="item5" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="617" y="183" name="item6" var="item6" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="530" y="58" name="item7" var="item7" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			    <GuajiChangeChallengeRender x="381" name="item8" var="item8" runtime="game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_path:Image = null;
      
      public var btn_enter:Button = null;
      
      public var img_btn_icon:Image = null;
      
      public var list_icons:List = null;
      
      public var item0:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item1:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item2:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item3:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item4:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item5:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item6:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item7:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public var item8:game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI = null;
      
      public function GuajiChangeChallengeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI"] = game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
