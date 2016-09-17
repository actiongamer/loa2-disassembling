package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GPKQuestPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="346" height="408">
			  <PanelBgS3 x="0" y="0" width="346" height="408" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.comp.image" x="14" y="35" width="320" height="316" var="img_bg"/>
			  <Button label="按钮" x="133" y="363" style="按钮中绿" var="btn_get"/>
			  <Image skin="png.uiGuildPKCrossSer.img_q0" x="17" y="54"/>
			  <Label text="加底标题" autoSize="none" x="22" y="56" style="加底标题" var="title_0" width="206" height="20"/>
			  <Label text="普通说明" autoSize="none" x="23" y="78" style="普通说明" width="262" height="51" var="txt_0" multiline="true" wordWrap="true"/>
			  <Image skin="png.uiGuildPKCrossSer.img_q0" x="17" y="133"/>
			  <Label text="加底标题" autoSize="none" x="22" y="135" style="加底标题" var="title_1" width="204" height="20"/>
			  <Label text="普通说明" autoSize="none" x="23" y="157" style="普通说明" width="292" height="32" var="txt_1" multiline="true" wordWrap="true"/>
			  <Image skin="png.uiGuildPKCrossSer.img_q0" x="17" y="212"/>
			  <Label text="加底标题" autoSize="none" x="22" y="214" style="加底标题" var="title_2" width="208" height="19"/>
			  <Label text="普通说明" autoSize="none" x="23" y="238" style="普通说明" width="295" height="19" var="txt_2"/>
			  <Label text="普通说明" autoSize="none" x="23" y="189" style="普通说明" width="292" height="19" var="txt_cd"/>
			  <List x="79" y="273" repeatX="3" spaceX="20" var="list_item">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_finished" x="243" y="44" var="img_st"/>
			  <Label text="\l50700020" autoSize="none" x="22" y="328" style="普通说明" width="301" height="19" var="txt_sm"/>
			  <Box x="-2" y="19" var="img_diff">
			    <Image skin="png.uiGuildPKCrossSer.img_q1"/>
			    <Label y="19" style="渐变2" width="30" height="20" rotation="-30" mouseEnabled="false" mouseChildren="false" size="14" var="powerTxt" align="center" x="5"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_get:Button = null;
      
      public var title_0:Label = null;
      
      public var txt_0:Label = null;
      
      public var title_1:Label = null;
      
      public var txt_1:Label = null;
      
      public var title_2:Label = null;
      
      public var txt_2:Label = null;
      
      public var txt_cd:Label = null;
      
      public var list_item:List = null;
      
      public var img_st:Image = null;
      
      public var txt_sm:Label = null;
      
      public var img_diff:Box = null;
      
      public var powerTxt:Label = null;
      
      public function GPKQuestPanelUI()
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
