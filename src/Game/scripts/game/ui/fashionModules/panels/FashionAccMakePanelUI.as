package game.ui.fashionModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.icons.SkillRenderS5UI;
   import morn.core.components.Button;
   import game.ui.fashionAcc.FashionAccMaterialRenderUI;
   import game.ui.commons.icons.LotteryRenderS4UI;
   
   public class FashionAccMakePanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="485">
			  <Image skin="png.uiFashionUpgrade.打造界面.img_makeBg" x="351" y="21" var="img_grid"/>
			  <Box x="351" y="18" var="box_skill">
			    <Image skin="png.uiRoleTeam.右框" sizeGrid="20,20,20,20" width="338" height="44"/>
			    <Label x="48" y="4" style="普通说明" width="284" height="37" size="12" align="left" var="txt_skillNum" text="111111111111\n1111" multiline="true" wordWrap="true"/>
			    <SkillRenderS5 x="10" y="6" var="skillRender" runtime="game.ui.commons.icons.SkillRenderS5UI"/>
			  </Box>
			  <Button label="\l31200000" x="465" y="356" style="按钮大绿" var="btn_make"/>
			  <FashionAccMaterialRender var="pieceRender0" x="370" y="136" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <FashionAccMaterialRender x="581" var="pieceRender1" y="136" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <LotteryRenderS4 x="487" y="394" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Label text="\l31210013" autoSize="none" x="352" y="-25" style="普通说明" width="336" height="20" align="center"/>
			  <Label text="\l109003014" autoSize="none" x="352" y="-3" style="普通说明" width="336" height="20" align="center"/>
			</PanelView>;
       
      
      public var img_grid:Image = null;
      
      public var box_skill:Box = null;
      
      public var txt_skillNum:Label = null;
      
      public var skillRender:SkillRenderS5UI = null;
      
      public var btn_make:Button = null;
      
      public var pieceRender0:FashionAccMaterialRenderUI = null;
      
      public var pieceRender1:FashionAccMaterialRenderUI = null;
      
      public var costRender:LotteryRenderS4UI = null;
      
      public function FashionAccMakePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.SkillRenderS5UI"] = SkillRenderS5UI;
         viewClassMap["game.ui.fashionAcc.FashionAccMaterialRenderUI"] = FashionAccMaterialRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
