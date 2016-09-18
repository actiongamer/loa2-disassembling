package game.ui.dialModule.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.dialModule.renders.DialCostRenderUI;
   import game.ui.dialModule.renders.DialItemRenderUI;
   
   public class DialVipPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="600" height="400">
			  <Image skin="png.uiDialModules.img_dialVipBg" x="125" y="-4" var="img_bg"/>
			  <List x="190" y="62" var="list_item">
			    <DialItemRender x="98" name="item11" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="163" name="item0" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="224" y="35" name="item1" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="260" y="97" name="item2" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="260" y="161" name="item3" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="224" y="223" name="item4" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="163" y="260" name="item5" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="98" y="260" name="item6" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="37" y="223" name="item7" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender y="161" name="item8" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender y="97" name="item9" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			    <DialItemRender x="39" y="35" name="item10" runtime="game.ui.dialModule.renders.DialItemRenderUI"/>
			  </List>
			  <Image skin="png.uiDialModules.img_infoBg" x="-4" y="15" width="287"/>
			  <Label text="活动时间：" autoSize="none" x="-3" y="25" style="渐变1" width="251" height="22" align="left" size="14" var="txt_time"/>
			  <Box x="345" y="218" rotation="360" var="box_arrow">
			    <Image skin="png.uiDialModules.img_arrow" anchorX="0.5" anchorY="1.8" smoothing="true"/>
			  </Box>
			  <Button skin="png.uiDialModules.btn_superDial" x="281" y="154" labelStyle="渐变_抽奖" label="\l60800037" var="btn_one2"/>
			  <Image skin="png.uiDialModules.img_bottomBg" x="120" y="409"/>
			  <Button label="抽一次" x="212" style="按钮大绿" y="417" var="btn_one"/>
			  <Button label="抽十次" x="363" style="按钮大黄" y="417" var="btn_ten"/>
			  <DialCostRender x="383" y="449" var="render_costTen" runtime="game.ui.dialModule.renders.DialCostRenderUI"/>
			  <DialCostRender x="235" y="449" var="render_costOne" runtime="game.ui.dialModule.renders.DialCostRenderUI"/>
			  <Label text="活动时间：" autoSize="none" x="-3" y="46" style="渐变1" width="251" height="22" align="left" size="14" var="txt_60800028"/>
			</PanelView>;
       
      
      public var img_bg:Image = null;
      
      public var list_item:List = null;
      
      public var txt_time:Label = null;
      
      public var box_arrow:Box = null;
      
      public var btn_one2:Button = null;
      
      public var btn_one:Button = null;
      
      public var btn_ten:Button = null;
      
      public var render_costTen:DialCostRenderUI = null;
      
      public var render_costOne:DialCostRenderUI = null;
      
      public var txt_60800028:Label = null;
      
      public function DialVipPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.dialModule.renders.DialCostRenderUI"] = DialCostRenderUI;
         viewClassMap["game.ui.dialModule.renders.DialItemRenderUI"] = DialItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
