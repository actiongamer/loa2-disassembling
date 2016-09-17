package game.ui.fashionModules.panels
{
   import morn.customs.components.PanelView;
   import game.ui.fashionAcc.FashionAccMaterialRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.icons.SkillRenderS5UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.fashionModules.FashionCostRenderUI;
   
   public class FashionAccRefreshPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="485">
			  <Image skin="png.a5.commonImgs.分割透明底" x="293" y="291" width="474" height="82"/>
			  <FashionAccMaterialRender x="483" var="pieceRenderCenter" y="39" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <Label y="151" style="二级框标题" width="71" height="18" size="12" align="left" text="\l30106004" multiline="true" wordWrap="true" x="305"/>
			  <Box x="384" y="147" var="box_skill">
			    <Image skin="png.uiRoleTeam.右框" sizeGrid="20,20,20,20" width="338" height="44"/>
			    <Label x="48" y="4" style="普通说明" width="284" height="37" size="12" align="left" var="txt_skillNum" text="111111111111\n1111" multiline="true" wordWrap="true"/>
			    <SkillRenderS5 x="10" y="6" var="skillRender" runtime="game.ui.commons.icons.SkillRenderS5UI"/>
			  </Box>
			  <Button label="\l31200001" x="471" style="按钮大绿" var="btn_make" y="246"/>
			  <Label y="300" style="二级框标题" width="71" height="18" size="12" align="left" text="\l109003016" multiline="true" wordWrap="true" x="324"/>
			  <List x="413" y="301" repeatX="2" spaceX="20" var="list_cost">
			    <FashionCostRender name="render" runtime="game.ui.fashionModules.FashionCostRenderUI"/>
			  </List>
			  <Label text="\l31200011" autoSize="none" x="372" y="6" style="普通说明" width="312" height="32" align="center" multiline="true" wordWrap="true"/>
			  <Label text="\l109003015" autoSize="none" x="372" y="385" style="二级框标题" width="312" height="32" align="center" size="12" multiline="true" wordWrap="true"/>
			</PanelView>;
       
      
      public var pieceRenderCenter:FashionAccMaterialRenderUI = null;
      
      public var box_skill:Box = null;
      
      public var txt_skillNum:Label = null;
      
      public var skillRender:SkillRenderS5UI = null;
      
      public var btn_make:Button = null;
      
      public var list_cost:List = null;
      
      public function FashionAccRefreshPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS5UI"] = SkillRenderS5UI;
         viewClassMap["game.ui.fashionAcc.FashionAccMaterialRenderUI"] = FashionAccMaterialRenderUI;
         viewClassMap["game.ui.fashionModules.FashionCostRenderUI"] = FashionCostRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
