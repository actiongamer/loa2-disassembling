package game.ui.skinModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.commons.props.FightValueBoxUI;
   import game.ui.skinModule.render.SkinEquipRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import game.ui.skinModule.render.SkinListRenderUI;
   
   public class SkinModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="555">
			  <PanelBg width="803" height="554" x="2" y="3"/>
			  <Image skin="png.uiSkinMain.img_bg" x="3" y="34" var="img_bg" width="800" height="521"/>
			  <Image skin="png.uiSkinMain.img_downbg" x="14" y="435"/>
			  <Image skin="png.uiSkinMain.img_blackBg" x="476" y="35" var="img_blackBg" width="322" height="517"/>
			  <Image skin="png.uiSkinMain.img_leftline" x="533" y="39"/>
			  <PageBarS2 x="603" y="481" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="579" y="76" repeatY="3" var="list_suit" spaceY="10" selectEnable="false" width="208" height="382">
			    <SkinListRender name="render" runtime="game.ui.skinModule.render.SkinListRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_fightPowerBg" x="376" y="74"/>
			  <FightValueBox x="410" y="80" var="fightValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Image skin="png.uiSkinMain.img_listLine" x="566" y="461"/>
			  <List x="84" y="489" repeatX="3" repeatY="2" spaceX="10" var="list_fashionProp">
			    <FashionPropTwoRender name="render" runtime="game.ui.fashionModules.FashionPropTwoRenderUI"/>
			  </List>
			  <SkinEquipRender x="362" y="266" var="skinRenderRef" runtime="game.ui.skinModule.render.SkinEquipRenderUI"/>
			  <Box x="206" y="454" var="box_propTitle" buttonMode="true">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <Label text="皮肤加成(2件)" x="5.5" y="7" width="142" height="18" align="center" bold="true" style="加底标题" var="txt_propTitle"/>
			  </Box>
			  <Button stateNum="1" buttonMode="true" var="btn_skill" labelBold="false" style="按钮小黄" labelMargin="0,30,0,0" skin="png.uiSkinMain.书" label="\l999900503" x="400" y="354"/>
			  <Box x="505" y="54" var="box_btn_right">
			    <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="482" sizeGrid="0,20,0,20" var="img_rightBg" smoothing="true" x="0" y="0"/>
			    <Button skin="png.a5.btns.btn_longBar" x="13" y="213" stateNum="3" var="btn_rightArrow"/>
			  </Box>
			  <Box x="55" y="54" scaleX="-1" var="box_btn_left">
			    <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="482" sizeGrid="0,20,0,20" var="img_leftBg" smoothing="true" x="0" y="0"/>
			    <Button skin="png.a5.btns.btn_longBar" x="13" y="213" stateNum="3" var="btn_leftArrow"/>
			  </Box>
			  <Label text="pageBarS2" autoSize="none" x="589" y="261" style="渐变1" height="31" width="188" align="center" var="txt_noSkin"/>
			  <RedPoint x="456" y="370" var="redPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_blackBg:Image = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var list_suit:List = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var list_fashionProp:List = null;
      
      public var skinRenderRef:SkinEquipRenderUI = null;
      
      public var box_propTitle:Box = null;
      
      public var txt_propTitle:Label = null;
      
      public var btn_skill:Button = null;
      
      public var box_btn_right:Box = null;
      
      public var img_rightBg:Image = null;
      
      public var btn_rightArrow:Button = null;
      
      public var box_btn_left:Box = null;
      
      public var img_leftBg:Image = null;
      
      public var btn_leftArrow:Button = null;
      
      public var txt_noSkin:Label = null;
      
      public var redPoint:RedPointUI = null;
      
      public function SkinModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.fashionModules.FashionPropTwoRenderUI"] = FashionPropTwoRenderUI;
         viewClassMap["game.ui.skinModule.render.SkinEquipRenderUI"] = SkinEquipRenderUI;
         viewClassMap["game.ui.skinModule.render.SkinListRenderUI"] = SkinListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
