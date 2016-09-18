package game.ui.shenYuans
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.ProgressBar;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class ShenYuanRewardPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400" centerX="0">
			  <Box x="52" y="-60" var="con_nomal">
			    <Button skin="png.uiShenYuan.chest.btn_chest" x="150" y="162" stateNum="1" var="btn_normal_get" centerX="0"/>
			    <Box var="box_title">
			      <Image skin="png.uiShenYuan.img_select_bg"/>
			      <Image skin="png.uiShenYuan.img_select_bg2" x="134" y="41"/>
			      <Label text="领取宝箱" autoSize="left" x="196" y="49" style="普通说明" width="100" height="44" size="24" bold="true" color="0xaf9259"/>
			    </Box>
			  </Box>
			  <Box x="67" y="-102" var="con_secret" centerX="0">
			    <Image skin="png.uiShenYuan.chest.img_bg2" centerX="0" x="0"/>
			    <Label text="\l41500117" autoSize="none" x="20" y="49" style="普通说明" width="351" height="18" centerX="0" align="center"/>
			    <List x="59.75" y="70" repeatX="5" centerX="0" var="list_items">
			      <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			    </List>
			    <Box x="67.25" y="398" centerX="0">
			      <Button label="\l41500136" style="按钮大绿" var="btn_secret_get"/>
			      <Button label="离开" x="146" style="按钮大红" var="btn_quit"/>
			    </Box>
			    <Box x="72" y="468" centerX="0">
			      <ProgressBar skin="png.a5.comps.progresses.progress_S9" y="32" var="bar_luck"/>
			      <TreasureBoxBaseRender x="133" var="btn_box0" y="3" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			      <Label text="100/100" autoSize="none" x="108" y="31" style="普通说明" width="89" height="20" align="center" var="txt_curr"/>
			      <Label text="50" autoSize="none" x="133" y="46" style="普通说明" var="txt_half" width="28" height="20" align="center"/>
			      <Label text="100" autoSize="none" x="269" y="46" style="普通说明" width="42" height="20" align="center" var="txt_full"/>
			      <TreasureBoxBaseRender x="268" var="btn_box1" y="3" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    </Box>
			    <Label text="\l41500132" autoSize="none" x="20.5" y="438" style="普通说明" width="351" height="18" centerX="0" align="center"/>
			    <Label text="腾讯用户首次8折" autoSize="none" x="190" y="373" style="渐变绿" width="160" height="25" align="center" var="txt_firstBuy" font="Microsoft YaHei" visible="false" centerX="70"/>
			    <Label text="\l999000742" autoSize="none" x="20.5" y="18" style="渐变1" width="351" centerX="0" align="center"/>
			  </Box>
			</FadeView>;
       
      
      public var con_nomal:Box = null;
      
      public var btn_normal_get:Button = null;
      
      public var box_title:Box = null;
      
      public var con_secret:Box = null;
      
      public var list_items:List = null;
      
      public var btn_secret_get:Button = null;
      
      public var btn_quit:Button = null;
      
      public var bar_luck:ProgressBar = null;
      
      public var btn_box0:TreasureBoxBaseRenderUI = null;
      
      public var txt_curr:Label = null;
      
      public var txt_half:Label = null;
      
      public var txt_full:Label = null;
      
      public var btn_box1:TreasureBoxBaseRenderUI = null;
      
      public var txt_firstBuy:Label = null;
      
      public function ShenYuanRewardPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
