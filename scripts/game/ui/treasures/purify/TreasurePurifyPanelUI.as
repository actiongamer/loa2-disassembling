package game.ui.treasures.purify
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.RadioGroup;
   import morn.core.components.List;
   import game.ui.treasures.comp.TreasurePurifyRenderUI;
   import game.ui.treasures.comp.TreasureRemouldPropRenderUI;
   
   public class TreasurePurifyPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView mouseEnabled="true" mouseChildren="true" width="558" height="470">
			  <Image skin="png.uiTreasure.强化-名字底" x="195.5" y="-4"/>
			  <Label autoSize="none" x="85" y="11" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14" centerX="0"/>
			  <Box x="144" y="177" var="box_notavail">
			    <Image skin="png.uiTreasure2.装备-升星-提示文字bj" x="3"/>
			    <Label text="\l30616008" autoSize="none" y="4" style="普通说明" size="17" width="286" height="25" align="center" color="0xff3000" var="label_hint1" x="0"/>
			  </Box>
			  <Image skin="png.uiTreasure.下透明框" x="1" y="371" mouseChildren="false" mouseEnabled="false"/>
			  <Box x="-5" y="14" var="box_operation">
			    <Image skin="png.uiTreasure2.重铸 洗炼.重铸原属性" y="191"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.左上角背景" x="17" visible="false"/>
			    <Button label="\l30615004" x="144" y="409" style="按钮大绿" labelMargin="20,0,0,0" var="btn_action"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.手" x="145" y="409" mouseChildren="false" mouseEnabled="false"/>
			    <Button label="\l30615006" x="300" y="409" style="按钮大黄" labelMargin="0,0,-34,0" var="btn_save"/>
			    <Image skin="png.uiTreasure.强化" x="302" y="410" mouseChildren="false" mouseEnabled="false"/>
			    <LotteryRenderS4 x="257" y="382" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			    <RadioGroup x="28" y="10" var="check_function" visible="false">
			      <CheckBox label="洗练" selected="false" style="CheckBox普通" name="item0"/>
			      <CheckBox label="\l30615004" x="73" selected="true" style="CheckBox普通" name="item1"/>
			    </RadioGroup>
			    <Image skin="png.uiTreasure2.重铸 洗炼.重铸新属性" x="321" y="190"/>
			    <Label text="\l30615005" autoSize="none" x="190" y="382"/>
			    <Box x="34" y="239" var="box_remould">
			      <List repeatY="4" spaceY="8" var="list_remouldOld">
			        <TreasureRemouldPropRender name="render" runtime="game.ui.treasures.comp.TreasureRemouldPropRenderUI"/>
			      </List>
			      <List x="324" y="3" repeatY="4" spaceY="8" var="list_remouldNew">
			        <TreasureRemouldPropRender name="render" runtime="game.ui.treasures.comp.TreasureRemouldPropRenderUI"/>
			      </List>
			    </Box>
			    <Box x="26" y="245" var="box_purify">
			      <List width="164" height="110" repeatY="4" spaceY="8" var="list_purifyOld">
			        <TreasurePurifyRender name="render" runtime="game.ui.treasures.comp.TreasurePurifyRenderUI"/>
			      </List>
			      <List x="321" y="1" width="164" height="110" repeatY="4" spaceY="8" var="list_purifyNew">
			        <TreasurePurifyRender name="render" runtime="game.ui.treasures.comp.TreasurePurifyRenderUI"/>
			      </List>
			    </Box>
			    <Image skin="png.uiTreasure2.img_arrow" x="263" y="343" rotation="-90"/>
			    <Label text="\l30615002" autoSize="none" x="86" y="214" style="普通说明" width="82" height="20" align="center"/>
			    <Label text="\l30615003" autoSize="none" x="407" y="214" style="普通说明" width="82" height="20" align="center"/>
			    <Label autoSize="none" x="337" y="383" labelFilterKind="101" width="157" height="22" align="left" text="拥有" style="普通绿色" var="txt_has"/>
			  </Box>
			  <Label autoSize="none" x="200" labelFilterKind="101" width="157" height="22" align="center" text="\l30609002" style="重要提示黄" var="txt_rule" y="360" underline="true"/>
			</FadeView>;
       
      
      public var txt_treasureName:Label = null;
      
      public var box_notavail:Box = null;
      
      public var label_hint1:Label = null;
      
      public var box_operation:Box = null;
      
      public var btn_action:Button = null;
      
      public var btn_save:Button = null;
      
      public var costRender:LotteryRenderS4UI = null;
      
      public var check_function:RadioGroup = null;
      
      public var box_remould:Box = null;
      
      public var list_remouldOld:List = null;
      
      public var list_remouldNew:List = null;
      
      public var box_purify:Box = null;
      
      public var list_purifyOld:List = null;
      
      public var list_purifyNew:List = null;
      
      public var txt_has:Label = null;
      
      public var txt_rule:Label = null;
      
      public function TreasurePurifyPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.treasures.comp.TreasurePurifyRenderUI"] = TreasurePurifyRenderUI;
         viewClassMap["game.ui.treasures.comp.TreasureRemouldPropRenderUI"] = TreasureRemouldPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
