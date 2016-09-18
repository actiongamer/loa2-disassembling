package game.ui.fashionAcc
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.commons.icons.SkillRenderS5UI;
   import game.ui.commons.icons.WealthRenderS14UI;
   
   public class FashionAccMakeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="614" height="484">
			  <PanelBgS3 x="4" y="3" width="607" height="481" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.123" x="16" y="69"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.打造亮底" x="236" y="391"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.黄底 2" x="39" y="78"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.文字底" x="83" y="43"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.低1" x="248" y="71" var="img_grid"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.配饰" x="94" y="81"/>
			  <Label text="\l31200011" autoSize="none" x="172" y="48" style="普通说明" width="272" height="20" align="center"/>
			  <PageBarS2 x="53" y="388" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="35" y="110" repeatX="3" repeatY="4" spaceX="7" spaceY="10" var="list_acc">
			    <WealthRenderS14 name="render" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			  </List>
			  <Button label="打造" x="366" y="412" style="按钮大绿" var="btn_make"/>
			  <FashionAccMaterialRender x="271" y="192" var="pieceRender0" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <FashionAccMaterialRender x="482" y="192" var="pieceRender1" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <Tab labels="标 签,标 签" x="18" y="44" style="TAB短" var="tabBar"/>
			  <LotteryRenderS4 x="388" y="450" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <FashionAccMaterialRender x="374" y="117" var="pieceRenderCenter" runtime="game.ui.fashionAcc.FashionAccMaterialRenderUI"/>
			  <Label x="253" y="265" style="普通说明" width="329" height="18" size="12" align="center" var="txt_selectHint" text="\l31200007" multiline="true" wordWrap="true" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.01" y="192" x="384" var="img_iconCenter"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.img_plus" x="404" y="211" var="img_plus" mouseChildren="false" mouseEnabled="false" scale="1.2"/>
			  <Box x="248" y="70" var="box_skill">
			    <Image skin="png.uiRoleTeam.右框" sizeGrid="20,20,20,20" width="338" height="44"/>
			    <Label x="48" y="4" style="普通说明" width="284" height="37" size="12" align="left" var="txt_skillNum" text="111111111111\n1111" multiline="true" wordWrap="true"/>
			    <SkillRenderS5 x="10" y="6" var="skillRender" runtime="game.ui.commons.icons.SkillRenderS5UI"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_grid:Image = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_acc:List = null;
      
      public var btn_make:Button = null;
      
      public var pieceRender0:game.ui.fashionAcc.FashionAccMaterialRenderUI = null;
      
      public var pieceRender1:game.ui.fashionAcc.FashionAccMaterialRenderUI = null;
      
      public var tabBar:Tab = null;
      
      public var costRender:LotteryRenderS4UI = null;
      
      public var pieceRenderCenter:game.ui.fashionAcc.FashionAccMaterialRenderUI = null;
      
      public var txt_selectHint:Label = null;
      
      public var img_iconCenter:Image = null;
      
      public var img_plus:Image = null;
      
      public var box_skill:Box = null;
      
      public var txt_skillNum:Label = null;
      
      public var skillRender:SkillRenderS5UI = null;
      
      public function FashionAccMakeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.SkillRenderS5UI"] = SkillRenderS5UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         viewClassMap["game.ui.fashionAcc.FashionAccMaterialRenderUI"] = game.ui.fashionAcc.FashionAccMaterialRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
