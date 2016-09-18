package game.ui.roleTeam.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   
   public class SelectYuanJunHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="435" height="109">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" width="438" height="109" sizeGrid="40,40,40,40" x="-1" y="-1"/>
			  <Image skin="png.uiRoleTeam.线条" x="77" y="31" width="343" height="2"/>
			  <Label text="防御型" autoSize="left" x="185" y="13" style="重要提示橘黄" width="64" height="18" var="txt_type" isHtml="true"/>
			  <Label text="普罗米修斯啦+1" autoSize="left" x="75" y="13" style="重要提示橘黄" width="109" height="18" var="txt_name"/>
			  <Box x="14" y="22">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6"/>
			    <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  </Box>
			  <Label text="Lv.51" autoSize="left" x="240" y="13" style="重要提示橘黄" width="52" height="18" var="txt_lvl" lgx="240,240,240,240,240,240,240,250" language="fr" lgy="13,13,13,13,13,13,13,13"/>
			  <Label text="可以激活缘分" autoSize="left" x="75" y="37" style="随品质变化" width="182" height="18" var="txt_yuanfen"/>
			  <Button label="上 阵" x="313" style="按钮中绿" y="53" var="btn_select"/>
			  <List x="86" y="56" repeatX="2" repeatY="2" spaceX="-17" spaceY="2" var="list_yuanfen">
			    <YuanFenTxtRender name="render" runtime="game.ui.roleTeam.render.YuanFenTxtRenderUI"/>
			  </List>
			  <Label text="Lv.51" autoSize="left" x="314" y="13" style="重要提示橘黄" width="102" height="18" var="txt_group"/>
			  <Image skin="png.a5.comps.img_block" x="15" y="22" anchorX="0.5" anchorY="0.5" var="img_group" autoSize="false" smoothing="true" mouseEnabled="true" mouseChildren="false" width="20" height="20"/>
			</WealthRender>;
       
      
      public var txt_type:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_yuanfen:Label = null;
      
      public var btn_select:Button = null;
      
      public var list_yuanfen:List = null;
      
      public var txt_group:Label = null;
      
      public var img_group:Image = null;
      
      public function SelectYuanJunHeroRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleTeam.render.YuanFenTxtRenderUI"] = YuanFenTxtRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
