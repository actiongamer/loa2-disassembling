package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS7UI;
   
   public class RoleTupoSubBarUI extends View
   {
      
      protected static var uiView:XML = <View width="554" height="130">
			  <Image skin="png.a5.commonImgs.分割透明底" x="40" y="-29"/>
			  <Image skin="png.a5.commonImgs.img_tianfuBg" x="482" y="-80" width="150" mouseEnabled="false" mouseChildren="false" var="img_unlockbg"/>
			  <Label x="457" stroke="0x0" y="-73" var="txt_unlock" text="\l30100014" style="普通绿色" width="200" align="center" buttonMode="true"/>
			  <Label text="（伤害减免提高15%）" bold="false" stroke="0x0" var="txt_desc2" y="-54" x="444" align="center" width="224" size="13" style="随品质变化"/>
			  <Image skin="png.a5.commonImgs.img_arrowRight2" x="261" y="-148" visible="false"/>
			  <Box x="107" y="-1" var="box_need" width="340">
			    <List repeatX="4" var="list_need" spaceX="15" x="35.5">
			      <RoleTupoNeedRender name="render" runtime="game.ui.roleInfos.tupos.RoleTupoNeedRenderUI"/>
			    </List>
			  </Box>
			  <Box x="293.5" y="70" var="box_tupoBtns">
			    <Button label="\l30100006" stateNum="1" buttonMode="true" var="btn_tupo" style="按钮大绿"/>
			    <LotteryRenderS7 x="-1" y="39" var="render_needItem" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_yellow" x="199.5" y="-30"/>
			  <Label text="\l8081" bold="false" stroke="0x0" y="-24" x="176" align="center" width="200" size="13" style="随品质变化" height="20"/>
			  <Box x="89" var="box_heroCost" bottom="5" y="60">
			    <RoleTupoNeedRender x="107" y="8" var="render_hero" runtime="game.ui.roleInfos.tupos.RoleTupoNeedRenderUI"/>
			    <Image skin="png.a5.commonImgs.img_yellow" width="106" height="28"/>
			    <Label text="\l30600202" bold="false" stroke="0x0" y="6" x="22" align="center" width="62" size="13" style="随品质变化" height="20"/>
			  </Box>
			</View>;
       
      
      public var img_unlockbg:Image = null;
      
      public var txt_unlock:Label = null;
      
      public var txt_desc2:Label = null;
      
      public var box_need:Box = null;
      
      public var list_need:List = null;
      
      public var box_tupoBtns:Box = null;
      
      public var btn_tupo:Button = null;
      
      public var render_needItem:LotteryRenderS7UI = null;
      
      public var box_heroCost:Box = null;
      
      public var render_hero:game.ui.roleInfos.tupos.RoleTupoNeedRenderUI = null;
      
      public function RoleTupoSubBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleTupoNeedRenderUI"] = game.ui.roleInfos.tupos.RoleTupoNeedRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
