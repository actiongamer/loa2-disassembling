package game.ui.battlefield.BattlefieldFightResult
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultLeftRenderUI;
   import game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultRightRenderUI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class BattlefieldFightResultModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-2" y="2" width="804" height="551" btnCloseStyle="0"/>
			  <Image skin="png.a5.comps.img_block" x="1" y="31" var="img_bg" autoSize="true" width="801" height="518"/>
			  <BattlefieldFightResultLeftRender x="0" y="1" var="render_left" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultLeftRenderUI"/>
			  <BattlefieldFightResultRightRender x="397" y="1" var="render_right" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultRightRenderUI"/>
			  <Image skin="png.uiBattlefields.img_vs" x="326" y="24"/>
			  <Button label="\l10900033" x="341" style="按钮大黄" y="465" var="btn_leave"/>
			  <Label text="名字" x="301" y="506" width="198" height="18" var="txt_autoLeave" align="center" style="普通说明"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var render_left:BattlefieldFightResultLeftRenderUI = null;
      
      public var render_right:BattlefieldFightResultRightRenderUI = null;
      
      public var btn_leave:Button = null;
      
      public var txt_autoLeave:Label = null;
      
      public function BattlefieldFightResultModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultLeftRenderUI"] = BattlefieldFightResultLeftRenderUI;
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultRightRenderUI"] = BattlefieldFightResultRightRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
