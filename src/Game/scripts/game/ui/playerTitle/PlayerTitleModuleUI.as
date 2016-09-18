package game.ui.playerTitle
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.customs.components.Accordion;
   import morn.core.components.Tab;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.playerTitle.render.PlayerTitleListRenderUI;
   import game.ui.playerTitle.render.PlayerTitlePropRenderUI;
   import game.ui.playerTitle.render.PlayerTitlesRenderUI;
   
   public class PlayerTitleModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="-1" y="0" width="804" height="551"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="17" y="60" sizeGrid="14,18,14,14" width="771" height="477" var="img_grid"/>
			  <Image skin="png.a5.comps.img_block" x="226" y="62" var="img_funBg" width="560" height="474"/>
			  <Image skin="png.uiPlayerTitle.下框透明底" x="221" y="410"/>
			  <Image skin="png.uiPlayerTitle.称号总览底" x="24" y="63"/>
			  <Image skin="png.uiPlayerTitle.称号总览" x="86" y="71"/>
			  <Image skin="png.a5.bgs.panelBgs.img_powerBg" x="589" y="151"/>
			  <Accordion x="17" y="102" var="acc_title">
			    <PlayerTitleListRender x="8" name="render" runtime="game.ui.playerTitle.render.PlayerTitleListRenderUI"/>
			    <List y="26" name="subRender" spaceY="-6" x="0" repeatY="5">
			      <PlayerTitlesRender name="render" runtime="game.ui.playerTitle.render.PlayerTitlesRenderUI"/>
			    </List>
			  </Accordion>
			  <Tab labels="称号" x="29" y="36" selectedIndex="1" style="TAB短" var="tabBar"/>
			  <Image skin="png.uiPlayerTitle.右框" x="550" y="61"/>
			  <Button label="激活" skin="png.a5.btns.btn_big_S3" x="352" y="470" stateNum="1" var="btn_active"/>
			  <Label text="激活条件" autoSize="none" x="380" y="423" style="加底标题" letterSpacing="3"/>
			  <Label text="需要等级：50（已达成）" autoSize="none" x="262" y="445" style="普通说明" width="138" height="20" var="label_needLvl"/>
			  <Label text="需要道具：大黄丹x5（0/2）" autoSize="none" x="408" y="445" style="普通说明" width="158" height="20" var="label_needitem"/>
			  <Label text="有效期30天" autoSize="none" x="329" y="509" style="普通说明" width="158" height="20" var="label_availperiod" align="center"/>
			  <Image skin="png.a5.comps.img_block" x="683.5" y="121" var="img_curTitle" anchorX="0.5" anchorY="0.5"/>
			  <FightValueBox x="608" y="173" var="box_fightValue" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Image skin="png.uiPlayerTitle.分割线" x="582" y="388"/>
			  <Label text="描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字描述的文字" autoSize="none" x="604" y="424" style="普通说明" width="164" height="83" var="label_desc" multiline="true" wordWrap="true" leading="1"/>
			  <Box x="610" y="211" var="box_propTitle">
			    <Image skin="png.a5.commonImgs.角色-红底"/>
			    <Label text="陆行鸟加成" autoSize="none" x="4" y="3" style="普通说明" width="138" height="20" var="label_propTitle" align="center" bold="true" color="0xfc6b0a" letterSpacing="2"/>
			  </Box>
			  <List x="594" y="243" repeatY="5" spaceY="6" var="list_prop">
			    <PlayerTitlePropRender name="render" runtime="game.ui.playerTitle.render.PlayerTitlePropRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_grid:Image = null;
      
      public var img_funBg:Image = null;
      
      public var acc_title:Accordion = null;
      
      public var tabBar:Tab = null;
      
      public var btn_active:Button = null;
      
      public var label_needLvl:Label = null;
      
      public var label_needitem:Label = null;
      
      public var label_availperiod:Label = null;
      
      public var img_curTitle:Image = null;
      
      public var box_fightValue:FightValueBoxUI = null;
      
      public var label_desc:Label = null;
      
      public var box_propTitle:Box = null;
      
      public var label_propTitle:Label = null;
      
      public var list_prop:List = null;
      
      public function PlayerTitleModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitleListRenderUI"] = PlayerTitleListRenderUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitlePropRenderUI"] = PlayerTitlePropRenderUI;
         viewClassMap["game.ui.playerTitle.render.PlayerTitlesRenderUI"] = PlayerTitlesRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
