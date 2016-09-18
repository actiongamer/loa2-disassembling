package game.ui.militaryRankInfos
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.customs.components.Accordion;
   import game.ui.commons.props.FightValueBoxUI;
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import game.ui.militaryRankInfos.render.MilitaryRenderUI;
   import game.ui.playerTitle.render.PlayerTitleListRenderUI;
   import game.ui.playerTitle.render.PlayerTitlePropRenderUI;
   import game.ui.playerTitle.render.PlayerTitlesRenderUI;
   
   public class MilitaryModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="0" y="0" width="803" height="554"/>
			  <Tab labels="军衔,称号" x="29" y="38" style="TAB短" var="tabBar"/>
			  <Box x="4" y="61" var="box_military">
			    <Image skin="png.uiMilitaryRankInfo.img_bg" var="img_bg" height="488"/>
			    <Image skin="png.a5.commonImgs.分割透明底" x="154" y="385" width="474" height="82"/>
			    <List x="186" y="431" repeatX="3" repeatY="2" var="list_militaryProp">
			      <FashionPropTwoRender name="render" runtime="game.ui.fashionModules.FashionPropTwoRenderUI"/>
			    </List>
			    <Box x="323" y="394" var="box_propTitle" buttonMode="true">
			      <Image skin="png.a5.commonImgs.img_yellow"/>
			      <Label text="属性加成" x="5.5" y="7" width="142" height="18" align="center" bold="true" style="加底标题" var="txt_propTitle"/>
			    </Box>
			    <List x="50" y="6" var="list_icons" repeatX="5" width="693" height="355">
			      <MilitaryRender y="187" name="item0" x="62" runtime="game.ui.militaryRankInfos.render.MilitaryRenderUI"/>
			      <MilitaryRender x="174" name="item1" y="0" runtime="game.ui.militaryRankInfos.render.MilitaryRenderUI"/>
			      <MilitaryRender x="275" y="187" name="item2" runtime="game.ui.militaryRankInfos.render.MilitaryRenderUI"/>
			      <MilitaryRender x="378" name="item3" y="0" runtime="game.ui.militaryRankInfos.render.MilitaryRenderUI"/>
			      <MilitaryRender x="488" y="187" name="item4" runtime="game.ui.militaryRankInfos.render.MilitaryRenderUI"/>
			    </List>
			    <Box x="741" y="1" var="box_btn_right">
			      <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="468" sizeGrid="0,20,0,20" var="img_rightBg" smoothing="true"/>
			      <Button skin="png.a5.btns.btn_longBar" x="13" y="199" stateNum="3" var="btn_rightArrow"/>
			    </Box>
			    <Box x="52" y="1" scaleX="-1" var="box_btn_left">
			      <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="468" sizeGrid="0,20,0,20" var="img_leftBg" smoothing="true"/>
			      <Button skin="png.a5.btns.btn_longBar" x="13" y="199" stateNum="3" var="btn_leftArrow"/>
			    </Box>
			  </Box>
			  <Box x="15" y="60" var="box_title">
			    <Image skin="png.uiPlayerTitle.右框" x="533" y="1"/>
			    <Image skin="png.a5.bgs.panelBgs.img_frameS1" sizeGrid="14,18,14,14" width="771" height="477" var="img_grid" x="0" y="0"/>
			    <Image skin="png.a5.comps.img_block" x="209" y="2" var="img_funBg" width="560" height="474"/>
			    <Image skin="png.uiPlayerTitle.下框透明底" x="204" y="350"/>
			    <Image skin="png.uiPlayerTitle.称号总览底" x="7" y="3"/>
			    <Image skin="png.uiPlayerTitle.称号总览" x="69" y="11"/>
			    <Accordion y="42" var="acc_title" x="0">
			      <PlayerTitleListRender x="8" name="render" runtime="game.ui.playerTitle.render.PlayerTitleListRenderUI"/>
			      <List y="26" name="subRender" spaceY="-6" x="0" repeatY="5">
			        <PlayerTitlesRender name="render" runtime="game.ui.playerTitle.render.PlayerTitlesRenderUI"/>
			      </List>
			    </Accordion>
			    <Button label="激活" skin="png.a5.btns.btn_big_S3" x="244" y="432" stateNum="1" var="btn_active"/>
			    <Label text="\l30400203" autoSize="none" x="223" y="362" style="加底标题" letterSpacing="3" width="342" align="center" height="20"/>
			    <Label text="需要等级：50（已达成）" autoSize="none" x="245" y="385" style="普通说明" width="300" height="20" var="label_needLvl"/>
			    <Label text="需要道具：大黄丹x5（0/2）" autoSize="none" x="245" y="407" style="普通说明" width="300" height="24" var="label_needitem"/>
			    <Label text="有效期30天" autoSize="none" x="376" y="440" style="普通说明" width="158" height="20" var="label_availperiod" align="left"/>
			    <Image skin="png.a5.comps.img_block" x="666" y="61" var="img_curTitle" anchorX="0.5" anchorY="0.5"/>
			    <Image skin="png.a5.bgs.panelBgs.img_powerBg" x="572" y="91" var="img_fightBg"/>
			    <FightValueBox x="591" y="113" var="box_fightValue" runtime="game.ui.commons.props.FightValueBoxUI"/>
			    <Image skin="png.uiPlayerTitle.分割线" x="565" y="328"/>
			    <Label text="描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字" autoSize="none" x="587" y="364" style="普通说明" width="164" height="83" var="label_desc" multiline="true" wordWrap="true" leading="1"/>
			    <Box x="593" y="151" var="box_propTitle2">
			      <Image skin="png.a5.commonImgs.角色-红底"/>
			      <Label text="\l30400209" autoSize="none" x="4" y="3" style="普通说明" width="138" height="20" var="label_propTitle" align="center" bold="true" color="0xfc6b0a" letterSpacing="2"/>
			    </Box>
			    <List x="577" y="183" repeatY="5" spaceY="6" var="list_prop">
			      <PlayerTitlePropRender name="render" runtime="game.ui.playerTitle.render.PlayerTitlePropRenderUI"/>
			    </List>
			  </Box>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var box_military:Box = null;
      
      public var img_bg:Image = null;
      
      public var list_militaryProp:List = null;
      
      public var box_propTitle:Box = null;
      
      public var txt_propTitle:Label = null;
      
      public var list_icons:List = null;
      
      public var box_btn_right:Box = null;
      
      public var img_rightBg:Image = null;
      
      public var btn_rightArrow:Button = null;
      
      public var box_btn_left:Box = null;
      
      public var img_leftBg:Image = null;
      
      public var btn_leftArrow:Button = null;
      
      public var box_title:Box = null;
      
      public var img_grid:Image = null;
      
      public var img_funBg:Image = null;
      
      public var acc_title:Accordion = null;
      
      public var btn_active:Button = null;
      
      public var label_needLvl:Label = null;
      
      public var label_needitem:Label = null;
      
      public var label_availperiod:Label = null;
      
      public var img_curTitle:Image = null;
      
      public var img_fightBg:Image = null;
      
      public var box_fightValue:FightValueBoxUI = null;
      
      public var label_desc:Label = null;
      
      public var box_propTitle2:Box = null;
      
      public var label_propTitle:Label = null;
      
      public var list_prop:List = null;
      
      public function MilitaryModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.fashionModules.FashionPropTwoRenderUI"] = FashionPropTwoRenderUI;
         viewClassMap["game.ui.militaryRankInfos.render.MilitaryRenderUI"] = MilitaryRenderUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitleListRenderUI"] = PlayerTitleListRenderUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitlePropRenderUI"] = PlayerTitlePropRenderUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitlesRenderUI"] = PlayerTitlesRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
