package game.ui.teamGuajiScenes.mini
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class TeamGuajiMiniPanelUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="273" height="130">
			  <Box var="box_content">
			    <Image skin="png.a5.commonImgs.img_miniBg" x="0" y="0" width="273" height="130"/>
			    <Label text="挂机中" autoSize="none" x="25" y="6" style="渐变1" width="217" height="22" align="left" size="14" var="txt_status"/>
			    <Label text="\l41210129 " autoSize="left" x="24" y="29" style="普通说明" height="20"/>
			    <Label text="\l41210130 " autoSize="left" x="24" y="51" style="普通说明" language="en" lgx="24,24" lgy="72,51"/>
			    <Label text="123" autoSize="none" x="84" y="30" style="普通绿色" var="txt_stamina" language="en" lgx="140,84" lgy="30,30"/>
			    <List x="99" y="53" repeatX="3" spaceX="4" var="list_reward" language="en" lgx="99,99" lgy="74,53">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Box x="24" y="72" buttonMode="true" var="box_seeMore" language="en" lgx="24,24" lgy="93,72">
			      <Label text="\l41210131 " autoSize="none" style="重要提示绿" selectable="false" underline="true" buttonMode="true" mouseChildren="false" mouseEnabled="false" var="txt_link"/>
			    </Box>
			    <Label text="\l41210605" autoSize="left" x="98" y="51" style="普通说明" var="txt_empty" language="en" lgx="120,98" lgy="72,51"/>
			    <Label autoSize="left" x="113" y="29" style="普通说明" var="txt_guajiTime" text="预计可挂机时间" language="en" lgx="24,113" lgy="50,29"/>
			    <Label text="\l41210118" autoSize="none" x="24" y="6" style="不足禁止红" width="217" height="22" align="left" var="txt_rest"/>
			  </Box>
			  <Box x="246" y="2" var="box_mini">
			    <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_mini"/>
			    <Image skin="png.a5.commonImgs.img_suofang" x="12" y="12" anchorX=".5" anchorY=".5" var="img_suofang" mouseEnabled="false"/>
			  </Box>
			</StaticModuleView>;
       
      
      public var box_content:Box = null;
      
      public var txt_status:Label = null;
      
      public var txt_stamina:Label = null;
      
      public var list_reward:List = null;
      
      public var box_seeMore:Box = null;
      
      public var txt_link:Label = null;
      
      public var txt_empty:Label = null;
      
      public var txt_guajiTime:Label = null;
      
      public var txt_rest:Label = null;
      
      public var box_mini:Box = null;
      
      public var btn_mini:Button = null;
      
      public var img_suofang:Image = null;
      
      public function TeamGuajiMiniPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
