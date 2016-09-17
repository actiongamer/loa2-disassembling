package game.ui.teamPKCS
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Label;
   
   public class TPKCChangeOrderUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="810" height="550">
			  <PanelBg x="0" y="0" width="810" height="550"/>
			  <Image skin="png.comp.image" x="5" y="29" width="800" height="516" var="img_bg"/>
			  <Image skin="png.uiTeamPKCS.img_order_vs" x="9" y="27"/>
			  <TPKCBlueRender x="7" y="141" var="s0" runtime="game.ui.teamPKCS.TPKCBlueRenderUI"/>
			  <TPKRedRender x="410" y="141" var="e0" runtime="game.ui.teamPKCS.TPKRedRenderUI"/>
			  <FightValueBox x="21" y="40" var="zl_left" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <FightValueBox x="615" y="40" var="zl_right" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Label text="普通说明\n普通说明" autoSize="none" x="15" y="78" style="普通说明" size="16" leading="5" var="txt_left"/>
			  <Label text="普通说明普明\n普通说明" autoSize="none" x="631" y="78" style="普通说明" size="16" leading="5" align="right" width="166" height="54" var="txt_right"/>
			  <TPKCBlueRender x="7" y="222" var="s1" runtime="game.ui.teamPKCS.TPKCBlueRenderUI"/>
			  <TPKRedRender x="410" y="222" var="e1" runtime="game.ui.teamPKCS.TPKRedRenderUI"/>
			  <TPKCBlueRender x="7" y="303" var="s2" runtime="game.ui.teamPKCS.TPKCBlueRenderUI"/>
			  <TPKRedRender x="410" y="303" var="e2" runtime="game.ui.teamPKCS.TPKRedRenderUI"/>
			  <TPKCBlueRender x="7" y="384" var="s3" runtime="game.ui.teamPKCS.TPKCBlueRenderUI"/>
			  <TPKRedRender x="410" y="384" var="e3" runtime="game.ui.teamPKCS.TPKRedRenderUI"/>
			  <TPKCBlueRender x="7" y="465" var="s4" runtime="game.ui.teamPKCS.TPKCBlueRenderUI"/>
			  <TPKRedRender x="410" y="465" var="e4" runtime="game.ui.teamPKCS.TPKRedRenderUI"/>
			  <Label text="普通说明" autoSize="none" x="291" y="113" style="普通说明" width="233" height="20" align="center" var="txt_tips"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var s0:game.ui.teamPKCS.TPKCBlueRenderUI = null;
      
      public var e0:game.ui.teamPKCS.TPKRedRenderUI = null;
      
      public var zl_left:FightValueBoxUI = null;
      
      public var zl_right:FightValueBoxUI = null;
      
      public var txt_left:Label = null;
      
      public var txt_right:Label = null;
      
      public var s1:game.ui.teamPKCS.TPKCBlueRenderUI = null;
      
      public var e1:game.ui.teamPKCS.TPKRedRenderUI = null;
      
      public var s2:game.ui.teamPKCS.TPKCBlueRenderUI = null;
      
      public var e2:game.ui.teamPKCS.TPKRedRenderUI = null;
      
      public var s3:game.ui.teamPKCS.TPKCBlueRenderUI = null;
      
      public var e3:game.ui.teamPKCS.TPKRedRenderUI = null;
      
      public var s4:game.ui.teamPKCS.TPKCBlueRenderUI = null;
      
      public var e4:game.ui.teamPKCS.TPKRedRenderUI = null;
      
      public var txt_tips:Label = null;
      
      public function TPKCChangeOrderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.teamPKCS.TPKCBlueRenderUI"] = game.ui.teamPKCS.TPKCBlueRenderUI;
         viewClassMap["game.ui.teamPKCS.TPKRedRenderUI"] = game.ui.teamPKCS.TPKRedRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
