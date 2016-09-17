package game.ui.treasures.runeBag
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.ComboBox;
   import morn.core.components.Button;
   import game.ui.treasures.render.OptionListRenderUI;
   
   public class RuneBatchComposePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="375" height="324">
			  <PanelBgS3 btnCloseStyle="1" width="372" height="322" y="0" x="1"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="20,20,20,20" left="13" right="13" bottom="60" top="33" x="12.5"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="116.5" y="43"/>
			  <List x="40.5" y="77" repeatX="4" repeatY="2" spaceY="14" spaceX="22" var="list_type">
			    <OptionListRender name="render" runtime="game.ui.treasures.render.OptionListRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="115.5" y="154"/>
			  <ComboBox labels="label1,label2" x="51" y="194" var="comb_level" style="Combobox普通" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" sizeGrid="5,1,30,1" width="150"/>
			  <Button label="\l30600206" y="273" style="按钮大绿" x="128" var="btn_ok" labelMargin="20" centerX="0"/>
			  <Label text="符文类型" autoSize="left" x="87.5" y="49" style="加底标题" width="200" align="center"/>
			  <Label text="\l30600201" autoSize="left" x="162" y="160" style="加底标题"/>
			  <Image skin="png.uiTreasure.一键合成" x="126" y="273" mouseChildren="false" mouseEnabled="false"/>
			</PopModuleView>;
       
      
      public var list_type:List = null;
      
      public var comb_level:ComboBox = null;
      
      public var btn_ok:Button = null;
      
      public function RuneBatchComposePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.treasures.render.OptionListRenderUI"] = OptionListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
